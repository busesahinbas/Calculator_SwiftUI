//
//  ContentView.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    let stack1Array = ["AC", "+/-", "%", "÷"]
    let stack2Array = [ "7", "8", "9", "x"]
    let stack3Array = ["4", "5", "6", "-"]
    let stack4Array = ["1", "2", "3", "+"]
    let stack5Array = ["0", ",", "="]
    @State var testColor = Color.white
    @State var index = 0

    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
                Text("0")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 85))
            }.frame(height: Constants.heightText)
            
            HStack {
                ForEach (0..<stack1Array.count) { i in
                
                    Button(stack1Array[i]) {
                        print("Button Tapped!")
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(testColor)
                    .background(i == 3 ? Color.orange : Constants.lightGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
                //.padding(6)

        
            HStack {
                ForEach (0..<stack2Array.count) { i in
                    Button(stack2Array[i]) {
                        print("Button Tapped!")
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Constants.darkGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
                //.padding(6)

            
            HStack {
                ForEach (0..<stack3Array.count) { i in
                    Button(stack3Array[i]) {
                        print("Button Tapped!")
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Constants.darkGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
                //.padding(6)

           
            HStack {
                ForEach (0..<stack4Array.count) { i in
                    Button(stack4Array[i]) {
                        print("Button Tapped!")
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Constants.darkGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
                //.padding(Constants.buttonPadding)

          
            HStack (){
                ForEach (0..<stack5Array.count) { i in
                    Button() {
                        print("Button Tapped!")
                    }label: {
                        Text(stack5Array[i]).padding(i == 0 ? (UIScreen.main.bounds.size.width / 10) :  Constants.smallButtonWidht / 2.5)
                    }
                    .frame(width: i == 0 ? Constants.largeButtonWidht : Constants.smallButtonWidht, height: Constants.heightButton, alignment: .leading)
                    .foregroundColor(Color.white)
                    .background(i == 2 ? Color.orange : Constants.darkGrey)
                    .clipShape(Capsule())
                    .font(.system(size: 32))
                }
            }
        
        }
        .padding(.bottom, 60)
        .background(Color.black)
           
        
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       //ContentView().previewDevice("iPhone SE (2nd generation)")
        ContentView()
    }
}

