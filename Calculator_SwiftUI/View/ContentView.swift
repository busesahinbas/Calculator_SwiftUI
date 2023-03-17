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
    @State var currentOperation: CalculateButtons = .none
    @State var manager = 0
    
    let stackArray : [[ButtonType]] = [[.operation(.AC), .operation(.sign), .operation(.percent), .calculate(.divide)],
                                       [.number(.seven), .number(.eight), .number(.nine), .calculate(.multiply)],
                                       [.number(.four), .number(.five), .number(.six), .calculate(.subtract)],
                                       [.number(.one), .number(.two), .number(.three), .calculate(.add)],
                                       [.number(.zero), .comma, .equal]]
  
    func action(for buttonType: ButtonType) {
        switch buttonType {
        case .number(let number):
            numbers(button: number.description)
        case .calculate(_):
            calculate(button: buttonType)
        case .operation(_):
            operations(button: buttonType)
        case .comma:
            comma()
        case .equal:
            calculate(button: buttonType)
        }
    }
    
    func numbers(button : String){
        if manager == 1 {
            resultText = button
            manager = 0
        }else{
            if (resultText.contains("0,")) {
                resultText += button
            }else if(resultText == "0"){
                resultText = button
            }else{
                resultText = resultText + button
            }
        }
        result = Double(resultText.editDot()) ?? 0
    }
    
    func comma () {
        if (!resultText.contains(",")) {
            resultText += ","
        }
    }
    
    func operations(button : ButtonType) {
        if(button == .operation(.AC)){
            result = 0
            number1 = 0
            resultText = "0"
        }else if (button == .operation(.sign)) {
            result = Double(resultText.editDot())! * -1
            resultText = String(result).removeAfterPointIfZero().editComma()
        }else if(button == .operation(.percent)) {
            result = Double(resultText.editDot())! / 100.0
            resultText = String(format:"%g",result).editComma()
        }
    }
    
    func calculate(button : ButtonType) {
        manager = 1
        
        if(button == .equal){
            switch self.currentOperation {
            case .add: self.result = number1 + result
            case .subtract: self.result = number1 - result
            case .multiply: self.result = number1 * result
            case .divide: self.result = number1 / result
            case .none: self.resultText = "0"
            }
            resultText = String(format:"%g",result).removeAfterPointIfZero().editComma()
            number1 = 0
            currentOperation = .none
        }else {
            guard let num = Double(resultText.editDot()) else { return }
            number1 = num
            if(button == .calculate(.divide)) {
                currentOperation = .divide
            }else if(button == .calculate(.multiply)){
                currentOperation = .multiply
            }else if(button == .calculate(.subtract)){
                currentOperation = .subtract
            }else if(button == .calculate(.add)){
                currentOperation = .add
            }
        }
        result = 0
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
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
            }.frame(height: Constants.heightText)
            
            ForEach (stackArray, id: \.self) { index in
                HStack {
                    ForEach (index, id: \.self) { i in
                        Button(i.description) {
                            action(for: i)
                        }
                        .offset(i == ButtonType.number(.zero) ? CGSize(width: -40.0, height: 0) : CGSize(width: 0, height: 0))
                        .frame(width: i.width, height: Constants.heightButton)
                        .foregroundColor(i.foregroundColor)
                        .background(i.backgroundColor)
                        .clipShape(Capsule())
                        .font(.system(size: 32))
                    }
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

