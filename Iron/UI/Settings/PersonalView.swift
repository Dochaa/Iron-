import SwiftUI
import WorkoutDataKit

struct UserData {
    var name: String = ""
    var age: Int = 0
    var gender: String = ""
    var weight: Double = 0.0
    var tall: Double = 0.0
    var upperArm: Double = 0.0
    var breast: Double = 0.0
    var waist: Double = 0.0
    var hip: Double = 0.0
    var thigh: Double = 0.0
}

class UserDataStore: ObservableObject {
    @Published var userData = UserData()
}

struct PersonalView: View {
    @State private var isEditing: Bool = false
    @EnvironmentObject var userDataStore: UserDataStore
   

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Group {
                    Text("Name")
                    TextField("Name", text: $userDataStore.userData.name)
                    
                    Text("Age")
                    TextField("Age", value: $userDataStore.userData.age, formatter: NumberFormatter())
                    
                    Text("Gender")
                    TextField("Gender", text: $userDataStore.userData.gender)
                    
                    Text("Weight")
                    TextField("Weight", value: $userDataStore.userData.weight, formatter: NumberFormatter())
                    
                    Text("Tall")
                    TextField("Tall", value: $userDataStore.userData.tall, formatter: NumberFormatter())
                }
                
                Group {
                    Text("Upper Arm")
                    TextField("Upper Arm", value: $userDataStore.userData.upperArm, formatter: NumberFormatter())
                    
                    Text("Breast")
                    TextField("Breast", value: $userDataStore.userData.breast, formatter: NumberFormatter())
                    
                    Text("Waist")
                    TextField("Waist", value: $userDataStore.userData.waist, formatter: NumberFormatter())
                    
                    Text("Hip")
                    TextField("Hip", value: $userDataStore.userData.hip, formatter: NumberFormatter())
                    
                    Text("Thigh")
                    TextField("Thigh", value: $userDataStore.userData.thigh, formatter: NumberFormatter())
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(!isEditing)
            }
            .padding(.horizontal)
            
            Button(action: toggleEdit) {
                Text(isEditing ? "Confirm" : "Edit")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 120, height: 25)
                    .foregroundColor(.white)
                    .padding()
                    .background(isEditing ? Color.green : Color.blue)
                    .cornerRadius(25)
            }
            .padding(.top)
            
        }
        .padding(.horizontal,5)
        .navigationBarTitle("Personal Information", displayMode: .inline)
    }
    
    private func toggleEdit() {
        isEditing.toggle()
        if !isEditing {
            submitForm()
        }
    }
    
    private func submitForm() {
        // Validate data and possibly submit
        guard userDataStore.userData.age > 0,
              userDataStore.userData.weight > 0,
              userDataStore.userData.tall > 0 else {
            print("Invalid data success")
            return
        }
        print("Form submitted with: \(userDataStore.userData.name), \(userDataStore.userData.age), etc.")
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView().environmentObject(UserDataStore())
        
    }
}
