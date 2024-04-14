

import SwiftUI
import WorkoutDataKit

struct PickerWorkOutAndCadioView: View {
    @State private var selectedOption: String = "WorkOut"
    private var Silde = SildeCardioView()
    private var WorkOut = WorkoutTab()
    
    var body: some View {
        VStack {
            Picker("Select Option", selection: $selectedOption) {
                Text("WorkOut").tag("WorkOut")
                Text("Cardio").tag("Cardio")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedOption == "WorkOut" {
                WorkOut
            } else if selectedOption == "Cardio" {
                Silde
            }
            
            Spacer()
        }
    }
}

#if DEBUG
struct PickerWorkOutAndCadioView_Previews: PreviewProvider {
    static var previews: some View {
        PickerWorkOutAndCadioView()
            .mockEnvironment(weightUnit: .metric)
    }
}
#endif
