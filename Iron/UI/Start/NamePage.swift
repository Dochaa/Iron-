import SwiftUI

class UserAuthentication: ObservableObject {
    var username = "" {
        willSet {
            objectWillChange.send()
        }
    }
}

struct NamePage: View {
    @State private var name: String = ""
    @StateObject var user = UserAuthentication()
    @State private var isNextButtonTapped = false // เพิ่ม state เพื่อตรวจสอบว่าปุ่ม Next ถูกกดหรือไม่

    var body: some View {
            VStack {
                Text("Name")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7))
                    .multilineTextAlignment(.center)
                    .padding(1)
                
                Text("*Plase select your name")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                   // .foregroundColor(name.isEmpty && isNextButtonTapped ? Color.red : Color.black) // เช็คค่า TextField และปุ่ม Next
                    .padding(.bottom)
                    .scaleEffect(name.isEmpty && isNextButtonTapped ? 1.1 : 1.0) // ให้ข้อความมีการ Scale ตามเงื่อนไข
                    .animation(.easeInOut) // เพิ่ม animation

                VStack {
                    TextField("Your Name", text: $name)
                        .frame(width: 300, height: 50)
                        .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(.blue))
                        .font(.title2)
                        .padding(.all)
                }
                Button(action: {
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 120, height: 25)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0.0, green: 0.0, blue: 0.7))
                        .cornerRadius(25)
                        .padding(.top)
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 1, green: 1, blue: 1).edgesIgnoringSafeArea(.all))
    }
}

struct NamePage_Previews: PreviewProvider {
    static var previews: some View {
        NamePage()
    }
}
