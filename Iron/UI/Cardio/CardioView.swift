//import SwiftUI
//
//struct CardioView: View {
//    let activities = ["Running", "Walking", "Cycling", "Jumping Rope", "Swimming"]
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                ForEach(activities, id: \.self) { activity in
//                    NavigationLink(destination: getDestinationView(for: activity)) {
//                        CardView(activity: activity)
//                            .padding(.horizontal)
//                            .padding(.vertical, 8)
//                    }
//                }
//            }
////            .navigationBarTitle("", displayMode: .large)
//        }
//    }
//
//    func getDestinationView(for activity: String) -> some View {
//        switch activity {
//        case "Running":
//            return AnyView(RunningView())
//        case "Walking":
//            return AnyView(RunningView())
//        case "Cycling":
//            return AnyView(RunningView())
//        case "Swimming":
//            return AnyView(ExerciseView())
//        case "Jumping Rope":
//            return AnyView(ExerciseView())
//        default:
//            return AnyView(Text("You selected \(activity)"))
//        }
//    }
//}

//struct RunningView: View {
//    var body: some View {
//        Text("Running View")
//    }
//}

//struct WalkingView: View {
//    var body: some View {
//        Text("Walking View")
//    }
//}
//
//struct CyclingView: View {
//    var body: some View {
//        Text("Cycling View")
//    }
//}

//struct SwimmingView: View {
//    var body: some View {
//        Text("Swimming View")
//    }
//}
//
//struct JumpingRopeView: View {
//    var body: some View {
//        Text("Jumping Rope View")
//    }
//}
//
//struct CardView: View {
//    let activity: String
//
//    var body: some View {
//        VStack {
//            Image(systemName: "flame.fill")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .foregroundColor(.orange)
//
//            Text(activity)
//                .font(.title)
//                .fontWeight(.semibold)
//                .padding(.top, 8)
//        }
//        .frame(width: 150, height: 150)
//        .background(Color.blue.opacity(0.2))
//        .cornerRadius(15)
//        .shadow(radius: 5)
//    }
//}
//
//struct CardioView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardioView()
//    }
//}


