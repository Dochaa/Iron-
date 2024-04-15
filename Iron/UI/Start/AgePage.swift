import SwiftUI

struct agePage: View {
    @State private var age: Double = 1
    @State private var isNextButtonTapped: Bool = false

    var body: some View {
        VStack {
            Text("Your Age")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.7))
                .padding(.all, 1)

            VStack {
                Text("Please select your age.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .padding(.bottom)

                Text("อายุ: \(Int(age)) ปี")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 1.0))
                    .padding(.all)

                Slider(value: $age, in: 1...80, step: 1)
                    .frame(width: 320, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 20)

                Button(action: {
                    isNextButtonTapped = true
                }){
                    Text("Next")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width:120 ,height: 35)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0, green: 0, blue: 0.7))
                        .cornerRadius(25)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 1, green: 1, blue: 1).edgesIgnoringSafeArea(.all))
    }
}

struct agePage_Previews: PreviewProvider {
    static var previews: some View {
        agePage()
    }
}
