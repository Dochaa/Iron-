import SwiftUI
import WorkoutDataKit
import MapKit
import CoreLocation
import HealthKit


class LocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    var onLocationUpdate: ((CLLocation) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            lastLocation = location
            onLocationUpdate?(location)
        }
    }
}

struct RunningView: View {
    @State private var isTracking = false
    @State private var distance = Measurement(value: 0, unit: UnitLength.meters)
    @State private var pace = Measurement(value: 0, unit: UnitSpeed.kilometersPerHour)
    @State private var locationManager = LocationManager()
    @State private var heartRate = 0.0
    @State private var timeElapsed = 0.0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startTime: Date?
    @State private var activeSheet: SheetType?
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var workout: Workout
    
    private enum SheetType: Identifiable {
        case exerciseSelector
        case finish
        
        var id: Self { self }
    }
    
    var body: some View {
        VStack {
            MapView(isTracking: $isTracking, lastLocation: locationManager.lastLocation)
                .edgesIgnoringSafeArea(.all)
                .frame(maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Distance: \(distance.value, specifier: "%.2f") km")
                        .font(.headline)
                    Spacer()
                    Text("Pace: \(pace.value, specifier: "%.2f") km/h")
                        .font(.headline)
                }
                .padding()
                .offset(y: -10)
                
                HStack {
                    Text("Heart Rate: \(Int(heartRate)) bpm")
                        .font(.headline)
                    Spacer()
                    Text("Time: \(formattedTime(timeElapsed))")
                        .font(.headline)
                }
                .offset(y: -20)
                .padding()
                
                HStack {
                    Button(action: {
                        if isTracking {
                            toggleTracking()
                        } else {
                            toggleTracking()
                        }
                    }) {
                        Text(isTracking ? "Stop" : "Start")
                            .foregroundColor(.white)
                            .padding()
                            .background(isTracking ? Color.red : Color.green)
                            .cornerRadius(10)
                            .font(.headline)
                            .offset(y: -40)
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            if isTracking {
                if let startTime = startTime {
                    timeElapsed = Date().timeIntervalSince(startTime)
                }
            }
        }
    }
    
    private func toggleTracking() {
        isTracking.toggle()
        
        if isTracking {
            startTime = Date()
            distance = Measurement(value: 0, unit: UnitLength.meters)
            pace = Measurement(value: 0, unit: UnitSpeed.kilometersPerHour)
            
            locationManager.onLocationUpdate = { location in
                if let lastLocation = locationManager.lastLocation {
                    let newDistance = location.distance(from: lastLocation)
                    let timeInterval = location.timestamp.timeIntervalSince(lastLocation.timestamp)
                    let hours = timeInterval / 3600
                    let newPace = newDistance / hours
                    self.distance = Measurement(value: newDistance, unit: UnitLength.meters)
                    self.pace = Measurement(value: newPace, unit: UnitSpeed.kilometersPerHour)
                    print("\(newPace)")
                    print("check: \(newDistance),\(hours)")
                }
            }
            
            // Start HealthKit query for heart rate
            startHeartRateQuery()
        } else {
            locationManager.onLocationUpdate = nil
            timer.upstream.connect().cancel()
        }
    }
    
//    private func startHeartRateQuery() {
//        let healthStore = HKHealthStore()
//        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
//        
//        healthStore.requestAuthorization(toShare: nil, read: [heartRateType]) { success, error in
//            if success {
//                let heartRateQuery = HKObserverQuery(sampleType: heartRateType, predicate: nil) { query, completionHandler, error in
//                    self.fetchLatestHeartRateSample(completionHandler: completionHandler)
//                }
//                healthStore.execute(heartRateQuery)
//            } else {
//                print("Authorization failed for heart rate access.")
//            }
//        }
//    }
    
    private func startHeartRateQuery() {
        let share: Set = [HKObjectType.workoutType()]
        
        HealthManager.shared.requestPermissions(toShare: share, read: nil){
            print("check")
            HealthManager.shared.observerHeartRateSamples { result in
                self.heartRate = result.HeartRate
                Workout.create(context: self.managedObjectContext).startOrCrash()
                print("check\(result.HeartRate)")
            }
        }
    }

    
    private func fetchLatestHeartRateSample(completionHandler: @escaping (HKObserverQuery, HKObserverQueryCompletionHandler, Error?) -> Void) {
        let healthStore = HKHealthStore()
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else { return }
        
        let heartRateQuery = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: nil) { query, results, error in
            guard let sample = results?.first as? HKQuantitySample else {
                return
            }
            let heartRateUnit = HKUnit.count().unitDivided(by: .minute())
            self.heartRate = sample.quantity.doubleValue(for: heartRateUnit)
        }
        
        healthStore.execute(heartRateQuery)
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: time) ?? "00:00:00"
    }
}

struct MapView: UIViewRepresentable {
    @Binding var isTracking: Bool
    var lastLocation: CLLocation?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        if isTracking, let location = lastLocation {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            uiView.setRegion(region, animated: true)
        }
    }
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView(workout: MockWorkoutData.metricRandom.currentWorkout)
            .mockEnvironment(weightUnit: .metric)
    }
}
