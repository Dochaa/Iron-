import SwiftUI
import WorkoutDataKit

struct GenderPage: View {
    @State private var isMaleTapped: Bool = false
    @State private var isFemaleTapped: Bool = false
    @State private var showGenderSelectionWarning: Bool = false
//    @Binding var gender: String
    @Binding var selection: Int
    @EnvironmentObject var userDataStore: UserDataStore
    
    //    @Binding var isNextButtonEnabled: Bool
    var body: some View {
        VStack {
            Text("Gender")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.7))
                .multilineTextAlignment(.center)
                .offset(x:0, y:-60)
            Text("* Plase select your gender")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .multilineTextAlignment(.center)
                .scaleEffect(showGenderSelectionWarning ? 1.1 : 1.0)
                .animation(.easeInOut)
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -50)
            VStack(spacing: 10) {
                Button(action: {
                    self.isMaleTapped = true
                    self.isFemaleTapped = false
                    self.showGenderSelectionWarning = false
                }) {
                    GenderSelectionCircle(label: "Male", isSelected: isMaleTapped)
                }
                
                Button(action: {
                    self.isFemaleTapped = true
                    self.isMaleTapped = false
                    self.showGenderSelectionWarning = false
                }) {
                    GenderSelectionCircle(label: "Female", isSelected: isFemaleTapped)
                }
                
                Button(action: nextButtonTapped)
                {
                        Text("Next")
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 120, height: 35)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0, green: 0, blue: 0.7))
                            .cornerRadius(25)
                            .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 60)
                    }
                
            }
            .offset(x:0, y:-10)
            .animation(.easeInOut)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 1, green: 1, blue: 1).edgesIgnoringSafeArea(.all))
    }
    func nextButtonTapped() {
        guard isMaleTapped || isFemaleTapped else {
            showGenderSelectionWarning = true
            return
        }
        
        userDataStore.userData.gender = isMaleTapped ? "Male" : "Female"
        selection = 1
    }
    
    struct GenderSelectionCircle: View {
        let label: String
        let isSelected: Bool
        
        var body: some View {
            Circle()
                .fill(isSelected ? Color(red: 0, green: 0, blue: 0.7) : Color(red: 0.95, green: 0.95, blue: 0.95))
                .frame(width: 200, height: 200)
                .overlay(
                    Text(label)
                        .foregroundColor(isSelected ? .white : .black)
                        .fontWeight(.bold)
                        .font(.title)
                )
        }
    }
    

    struct GenderPage_Preview: PreviewProvider {
        @State static var selection: Int = 0
        
        static var previews: some View {
            GenderPage( selection: $selection)
                .environmentObject(UserDataStore())
        }
    }
}
