
import SwiftUI

struct WorkOutListView: View {
    @State private var isShowingExerciseMuscleGroupsView = false

    var body: some View {
        NavigationView {
            List {
                Button("Show WorkOut List") {
                    isShowingExerciseMuscleGroupsView = true
                }
            }
            .sheet(isPresented: $isShowingExerciseMuscleGroupsView) {
                ExerciseMuscleGroupsView()
            }
        }
    }
}


struct WorkOutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOutListView()
    }
}


