//
//  ViewModel.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 17.03.2023.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    
    @Published var resultText = "0"
    @Published var result : Double = 0.0
    @Published var number1 : Double = 0.0
    @Published var currentOperation: CalculateButtons = .none
    @Published var manager = 0
    @Published var stackArray : [[ButtonType]] = [[.operation(.AC), .operation(.sign), .operation(.percent), .calculate(.divide)],
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
      

    func numbers(button : String) {
        if manager == 1 {
            resultText = button
            manager = 0
        }else {
            if (resultText.contains("0,")) {
                resultText += button
            }else if(resultText == "0") {
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
        if(button == .operation(.AC)) {
            result = 0
            number1 = 0
            resultText = "0"
        }else if (button == .operation(.sign)) {
            result = Double(resultText.editDot())! * -1
            if(result == 0) {
                resultText = "0"
            }else {
                resultText = String(result).removeAfterPointIfZero().editComma()
            }
        }else if(button == .operation(.percent)) {
            result = Double(resultText.editDot())! / 100.0
            resultText = String(format:"%g",result).editComma()
        }
    }

    func calculate(button : ButtonType) {
        manager = 1
        if(button == .equal) {
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
            }else if(button == .calculate(.multiply)) {
                currentOperation = .multiply
            }else if(button == .calculate(.subtract)) {
                currentOperation = .subtract
            }else if(button == .calculate(.add)){
                currentOperation = .add
            }
        }
        result = 0
    }

}
