import SwiftUI

struct BodyProportionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var upperArm = 0
    @State private var breast = 0
    @State private var waist = 0
    @State private var hip = 0
    @State private var thigh = 0
    @State private var isNextButtonTapped = false
    @State private var showContentView = false
    
    @Binding var userOnboarded: Bool
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    
                    Text("Body Proportions")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0, green: 0, blue: 0.7))
                        .padding(.bottom, 1)
                        .offset(x:0, y:45)
                    
                    Text("*Please select your Body Proportions")
                        .font(.headline)
                        .fontWeight(.medium)
//                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2)) // เช็คเงื่อนไขการทำงานของแต่ละค่า
                        .foregroundColor(((upperArm == 0 || breast == 0 || waist == 0 || hip == 0 || thigh == 0) && isNextButtonTapped) ? .red : Color(red: 0.2, green: 0.2, blue: 0.2)) // เช็คเงื่อนไขการทำงานของแต่ละค่า
                        .padding(.bottom)
                        .offset(x:0, y:45)
                        .scaleEffect(((upperArm == 0 || breast == 0 || waist == 0 || hip == 0 || thigh == 0) && isNextButtonTapped) ? 1.1 : 1.0) // ให้ข้อความมีการ Scale ตามเงื่อนไข
                        .animation(.easeInOut) // เพิ่ม animation
                    
                    
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Upper arm")
                                .fontWeight(.semibold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.7))
                            Spacer()
                            Picker(selection: $upperArm, label: Text("Upper arm")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Breast")
                                .fontWeight(.semibold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.7))
                            Spacer()
                            Picker(selection: $breast, label: Text("Breast")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Waist")
                                .fontWeight(.semibold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.7))
                            Spacer()
                            Picker(selection: $waist, label: Text("Waist")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Hip")
                                .fontWeight(.semibold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.7))
                            Spacer()
                            Picker(selection: $hip, label: Text("Hip")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Thigh")
                                .fontWeight(.semibold)
                                .font(.title)
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.7))
                            Spacer()
                            Picker(selection: $thigh, label: Text("Thigh")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    .padding()
                    .offset(x:0, y:65)

                    Button(action: {
                        isNextButtonTapped = true
                           if upperArm != 0 && breast != 0 && waist != 0 && hip != 0 && thigh != 0 {
                               userOnboarded = true // Update this line
                        }
                    }) {
                        Text("Next")
                            .fontWeight(.bold)
                            .frame(width: 120,height: 25)
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 0.0, green: 0.0, blue: 0.7))
                            .cornerRadius(25)
                            .padding()
                            .offset(x:0, y:120)
                    }
                }
                .padding()
            }
            .background(Color(red: 1, green: 1, blue: 1).edgesIgnoringSafeArea(.all))
        }
    }
        
}

struct BodyProportionsView_Previews: PreviewProvider {
    @State static var userOnboarded = false // Create a static state for the preview

    static var previews: some View {
        BodyProportionsView(userOnboarded: $userOnboarded) // Pass the state as a binding
    }
}


