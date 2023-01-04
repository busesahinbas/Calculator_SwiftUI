//
//  ContentView.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("0")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 85))
            }.frame(height: Constants.heightText)
            
            HStack {
                Button("AC") {
                    print("Button tapped!")
                }
                .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.lightGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                
                Button("+/-") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.lightGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                
                Button("%") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.lightGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))

                Button("÷") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                 .foregroundColor(Color.white)
                 .background(Color.orange)
                 .clipShape(Circle())
                 .font(.system(size: 32))
                
            }.frame(height: Constants.heightFrame)
                .padding(6)

        
            HStack {
                Button("7") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("8") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("9") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("x") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                 .foregroundColor(Color.white)
                 .background(Color.orange)
                 .font(.system(size: 32))
                 .clipShape(Circle())

            }.frame(height: Constants.heightFrame)
                .padding(6)

            
            HStack {
                Button("4") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("5") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("6") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("-") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                 .foregroundColor(Color.white)
                 .background(Color.orange)
                 .font(.system(size: 32))
                 .clipShape(Circle())

            }.frame(height: Constants.heightFrame)
                .padding(6)

           
            HStack {
                Button("1") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("2") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("3") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("+") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                 .foregroundColor(Color.white)
                 .background(Color.orange)
                 .font(.system(size: 32))
                 .clipShape(Circle())

            }.frame(height: Constants.heightFrame)
                .padding(Constants.buttonPadding)

          
            HStack (){
                Button() {
                    print("Button tapped!")
                }label: {
                    Text("0").padding(30)
                }.frame(width: Constants.largeButtonWidht, height: Constants.heightButton, alignment:Alignment.leading)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Capsule())
                    //.cornerRadius((UIScreen.main.bounds.size.width - (4*12)) / 2)
                    
                Button(",") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(Constants.darkGrey)
                    .font(.system(size: 32))
                    .clipShape(Circle())
                
                Button("=") {
                    print("Button tapped!")
                }.frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                 .foregroundColor(Color.white)
                 .background(Color.orange)
                 .font(.system(size: 32))
                 .clipShape(Circle())

            }.frame(height: Constants.heightFrame)
                .padding(.bottom, Constants.buttonPadding)
        
        }.background(Color.black)
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       //ContentView().previewDevice("iPhone SE (2nd generation)")
        ContentView()
    }
}
