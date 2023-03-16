//
//  ButtonType.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 8.03.2023.
//

import Foundation
import SwiftUI

enum ButtonType: CustomStringConvertible, Hashable{
    
    case number (_ number: NumberButtons)
    case calculate (_ calculate: CalculateButtons)
    case operation(_ operation: OperationButtons)
    case comma
    case equal
    
    var description: String {
        switch self {
        case .number(let number):
            return number.description
        case .operation(let operation):
            return operation.description
        case .calculate(let calculate):
            return calculate.description
        case .comma:
            return ","
        case .equal:
            return "="
        }
    }
    
    var backgroundColor : Color {
        switch self {
        case .number(_):
            return Color.appColor(.darkGrey) ?? Color.gray
        case .calculate(_):
            return Color.orange
        case .operation(_):
            return Color.appColor(.ligtGrey) ?? Color.gray
        case .comma:
            return Color.appColor(.darkGrey) ?? Color.gray
        case .equal:
            return Color.orange
        }
    }
    
    var foregroundColor : Color {
        switch self {
        case .operation(_):
            return .black
        default:
            return .white
        }
    }
    
    var width : CGFloat {
        switch self {
        case .number(.zero):
            return Constants.largeButtonWidht
        default:
            return Constants.smallButtonWidht
        }
    }
    
    var padding : CGFloat {
        switch self {
        case .number(.zero):
            return (Constants.largeButtonWidht / 30)
        default:
            return (Constants.smallButtonWidht / 5)
        }
    }
}
