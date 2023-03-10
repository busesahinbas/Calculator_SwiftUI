//
//  ContentView.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var resultText = "0"
    @State var result : Double = 0.0
    @State var number1 : Double = 0.0
    @State var currentOperation: Operations = .none
    
    let stack1 : [[String : Any]] = [["name": "AC", "color": Color.appColor(.ligtGrey) ?? Color.gray, "width": Constants.smallButtonWidht, "textColor": Color.black],
                                     ["name": "+/-", "color": Color.appColor(.ligtGrey) ?? Color.gray, "width": Constants.smallButtonWidht, "textColor": Color.black],
                                     ["name": "%", "color": Color.appColor(.ligtGrey) ?? Color.gray, "width": Constants.smallButtonWidht, "textColor": Color.black],
                                     ["name": "÷", "color": Color.orange, "width": Constants.smallButtonWidht, "textColor": Color.white]]
    
    let stack1Array = ["AC", "+/-", "%", "÷"]
    let stack2Array = [ "7", "8", "9", "x"]
    let stack3Array = ["4", "5", "6", "-"]
    let stack4Array = ["1", "2", "3", "+"]
    let stack5Array = ["0", ",", "="]
    
    func numbers(button : String){
        if (resultText == "0" || result == 0) {
            resultText = button
            result = Double(resultText.editDot()) ?? 0
        }else{
            resultText = resultText + button
            result = Double(resultText.editDot()) ?? 0
        }
    }
    
    func comma (){
        if (!resultText.contains(",")){
            resultText += ","
        }
    }
    
    func operations(button : String) {
        if(button == "AC"){
            result = 0
            number1 = 0
            resultText = "0"
        }else if(button == "+/-"){
            result = Double(resultText.editDot())! * -1
            resultText = String(result).removeAfterPointIfZero().editComma()
        }else if(button == "%"){
            result = Double(resultText.editDot())! / 100.0
            resultText = String(format:"%g",result).editComma()
        }
    }
    
    func calculate(button : String){
        if(button == "÷"){
            number1 = Double(resultText.editDot())!
            currentOperation = .divide
            result = 0
        }else if(button == "x"){
            number1 = Double(resultText.editDot())!
            currentOperation = .multiply
            result = 0
        }else if(button == "-"){
            number1 = Double(resultText.editDot())!
            currentOperation = .subtract
            result = 0
        }else if(button == "+"){
            number1 = Double(resultText.editDot())!
            currentOperation = .add
            result = 0
        }else if(button == "="){
            switch self.currentOperation {
            case .add: self.result = number1 + result
            case .subtract: self.result = number1 - result
            case .multiply: self.result = number1 * result
            case .divide: self.result = number1 / result
            case .none: self.resultText = "0"
            }
            resultText = String(format:"%g",result).removeAfterPointIfZero().editComma()
            number1 = 0
            result = 0
            currentOperation = .none
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
                ForEach (0..<stack1Array.count, id: \.self) { i in
                    
                    Button(stack1Array[i])  {
                        i == 3 ? calculate(button: stack1Array[i]) : operations(button: stack1Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor((stack1[i]["textColor"] as? Color) ?? Color.white)
                    .background((stack1[i]["color"] as? Color)!)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack {
                ForEach (0..<stack2Array.count, id: \.self) { i in
                    Button(stack2Array[i]) {
                        i == 3 ? calculate(button: stack2Array[i]) : numbers(button: stack2Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Color.appColor(.darkGrey) ?? Color.gray)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack {
                ForEach (0..<stack3Array.count, id: \.self) { i in
                    Button(stack3Array[i]) {
                        i == 3 ? calculate(button: stack3Array[i]) : numbers(button: stack3Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Color.appColor(.darkGrey) ?? Color.gray)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack {
                ForEach (0..<stack4Array.count, id: \.self) { i in
                    Button(stack4Array[i]) {
                        i == 3 ? calculate(button: stack4Array[i]) : numbers(button: stack4Array[i])
                    }
                    .frame(width: Constants.smallButtonWidht, height: Constants.heightButton)
                    .foregroundColor(Color.white)
                    .background(i == 3 ? Color.orange : Color.appColor(.darkGrey) ?? Color.gray)
                    .clipShape(Circle())
                    .font(.system(size: 32))
                }
            }
            
            HStack (){
                ForEach (0..<stack5Array.count, id: \.self) { i in
                    Button() {
                        //i == 2 ? calculate(button: stack5Array[i]) : numbers(button: stack5Array[i])
                        
                        if(i==0){
                            numbers(button: stack5Array[i])
                        }else if (i==1){
                            comma()
                        }else{
                            calculate(button: stack5Array[i])
                        }
                    }label: {
                        Text(stack5Array[i]).padding(i == 0 ? (UIScreen.main.bounds.size.width / 10) :  Constants.smallButtonWidht / 2.5)
                    }
                    .frame(width: i == 0 ? Constants.largeButtonWidht : Constants.smallButtonWidht, height: Constants.heightButton, alignment: .leading)
                    .foregroundColor(Color.white)
                    .background(i == 2 ? Color.orange : Color.appColor(.darkGrey) ?? Color.gray)
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
        ContentView()
    }
}

