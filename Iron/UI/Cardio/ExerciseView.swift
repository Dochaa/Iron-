import SwiftUI
import Combine
import CoreData
import WorkoutDataKit
import StoreKit
import AVKit
import HealthKit
import os.log



//Workout.create(context: self.managedObjectContext).startOrCrash()

struct ExerciseView: View {
    @State private var heartRate: Int = 0
    @State private var minutes: Int = 0
    @State private var isExercising: Bool = false
    @State private var Kcal: Int = 0
    @State private var timerSubscription: AnyCancellable?
    @State private var showStartButton: Bool = true
    @State private var showPauseButton: Bool = false
    @State private var showPlayButton: Bool = false
    @State private var showStopButton: Bool = true
    @State private var countdown: Int = 3
    @State private var showCountdown: Bool = false
    @State private var navigateToRunningView: Bool = false
    @State private var activeSheet: SheetType?
    @ObservedObject var workout: Workout
//    @ObservedObject var workoutSessionManager: WorkoutSessionManager
    

    @Environment(\.managedObjectContext) var managedObjectContext
    
    private enum SheetType: Identifiable {
        case exerciseSelector
        case finish
        var id: Self { self }
    }
    
    private let workoutTimerDurationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [.pad, .default]
        return formatter
    }()

    var body: some View {
        VStack {
            Text(" ")
                .font(.title)
                .padding()

            Spacer()

            Image(systemName: isExercising ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
                .padding()

//            Text("\(workoutSessionManager.mostRecentHeartRate ?? 0, specifier: "%.0f") BPM")
//                .font(.system(size: 24, weight: .bold))
//                .foregroundColor(.blue)
            HStack(alignment: .firstTextBaseline) {
                Text("\(heartRate) BRM".uppercased())
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.blue)
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text("\(Kcal) kcal".uppercased())
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.yellow)
            }

            Text(workoutTimerDurationFormatter.string(from: workout.safeDuration) ?? "--:--:--")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.green)


            Spacer()

            if showCountdown {
                Text("\(countdown)")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.blue)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                            if countdown > 0 {
                                countdown -= 1
                            } else {
                                timer.invalidate()
                                showCountdown = false
                                isExercising = true
//                                simulateExercise()
                                showPauseButton = true
//                                Workout.create(context: self.managedObjectContext).startOrCrash()

                            }
                        }
                    }
            } else {
                if showStartButton {
                    Button(action: {
                        showStartButton = false
                        showCountdown = true
                    }) {
                        Text("Start")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding()
                }

                HStack{
                    if showPauseButton {
                        Button(action: {
                            showPauseButton = false
                            showPlayButton = true
//                            stopExercise()
                            startExercise()
                        }) {
                            Image(systemName: isExercising ? "pause.circle":"play.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    
                    // Show play button when paused
                    if showPlayButton {
                        Button(action: {
                            showPlayButton = false
                            showPauseButton = true
                            startExercise()
                        }) {
                            Image(systemName:"play.fill" )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    if showPlayButton {
                        Button(action: {
//                            showPlayButton = false
//                            showPauseButton = true
//                            startExercise()
                            self.activeSheet = .finish
                            showStopButton = true
                        }) {
                            Image(systemName: "stop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                }
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
        .frame(maxHeight: .infinity)
        .onDisappear {
            cancelTimer()
        }

    }

    func startExercise() {
        isExercising = true
//        simulateExercise()
    }

//    func stopExercise() {
//        isExercising = false
//        minutes = 0
//        heartRate = 0
//        Kcal = 0
//        cancelTimer()
//    }

//    func simulateExercise() {
//        self.timerSubscription = Timer.TimerPublisher(interval: 1.0, runLoop: .main, mode: .default)
//            .autoconnect()
//            .sink { _ in
//                if self.isExercising {
//                    self.heartRate = Int.random(in: 80...150)
//                    self.minutes += 1
//                    self.Kcal += 1
//                } else {
//                    self.timerSubscription?.cancel()
//                }
//            }
//    }

    func cancelTimer() {
        timerSubscription?.cancel()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(workout: MockWorkoutData.metricRandom.currentWorkout)
            .mockEnvironment(weightUnit: .metric)
    }
}
