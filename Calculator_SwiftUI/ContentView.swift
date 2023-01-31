//
//  ContentView.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var resultText = "0"
    @State var result = 0
    @State var number1 = 0
    @State var currentOperation: Operations = .none
    
    let stack1 : [[String : Any]] = [["name": "AC", "color": Constants.lightGrey, "width": Constants.smallButtonWidht, "textColor": Color.black],
                                     ["name": "+/-", "color": Constants.lightGrey, "width": Constants.smallButtonWidht, "textColor": Color.black],
                                     ["name": "%", "color": Constants.lightGrey, "width": Constants.smallButtonWidht, "textColor": Color.black],
                                     ["name": "÷", "color": Color.orange, "width": Constants.smallButtonWidht, "textColor": Color.white]]
    
    let stack1Array = ["AC", "+/-", "%", "÷"]
    let stack2Array = [ "7", "8", "9", "x"]
    let stack3Array = ["4", "5", "6", "-"]
    let stack4Array = ["1", "2", "3", "+"]
    let stack5Array = ["0", ",", "="]
    
    func numbers(button : String){
        
        if (result == 0) {
            result = Int(button) ?? 0
            resultText = String(result)
        }else{
            var result2 = String(result) + button
            result = Int(result2)!
            resultText = String(result)
        }
    }
    
    func calculateOperations(button : String){
        if(button == "÷"){
            number1 = result
            currentOperation = .divide
            result = 0
        }else if(button == "x"){
            number1 = result
            currentOperation = .multiply
            result = 0
        }else if(button == "-"){
            number1 = result
            currentOperation = .subtract
            result = 0
        }else if(button == "+"){
            number1 = result
            currentOperation = .add
            result = 0
        }else if(button == "="){
            switch self.currentOperation {
            case .add: self.result = number1 + result
            case .subtract: self.result = number1 - result
            case .multiply: self.result = number1 * result
            case .divide: self.result = number1 / result
            case .none:
                break
            }
            resultText = String(result)
        }else if(button == "AC"){
            result = 0
            number1 = 0
            resultText = "0"
        }else if(button == "+/-"){
            result = Int(resultText)! * -1
            resultText = String(result)
        }else if(button == "%"){
            result = Int(resultText)! / 100
            resultText = String(result)
            
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
                Text(resultText)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 85))
            }.frame(height: Constants.heightText)
            
            HStack {
                ForEach (0..<stack1Array.count) { i in
                    
                    Button(stack1Array[i])  {
                        calculateOperations(button: stack1Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor((stack1[i]["textColor"] as? Color) ?? Color.white)
                    .background((stack1[i]["color"] as? Color)!)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack {
                ForEach (0..<stack2Array.count) { i in
                    Button(stack2Array[i]) {
                        i == 3 ? calculateOperations(button: stack2Array[i]) : numbers(button: stack2Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Constants.darkGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack {
                ForEach (0..<stack3Array.count) { i in
                    Button(stack3Array[i]) {
                        i == 3 ? calculateOperations(button: stack3Array[i]) : numbers(button: stack3Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Constants.darkGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack {
                ForEach (0..<stack4Array.count) { i in
                    Button(stack4Array[i]) {
                        i == 3 ? calculateOperations(button: stack4Array[i]) : numbers(button: stack4Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Constants.darkGrey)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack (){
                ForEach (0..<stack5Array.count) { i in
                    Button() {
                        i == 2 ? calculateOperations(button: stack5Array[i]) : numbers(button: stack5Array[i])
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

