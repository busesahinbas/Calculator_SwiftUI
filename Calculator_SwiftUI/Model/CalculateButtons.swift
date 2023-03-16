//
//  CalculateButtons.swift
//  Calculator_SwiftUI
//
//  Created by Buse Sahinbas on 15.03.2023.
//

import Foundation

enum CalculateButtons {
    case add
    case subtract
    case multiply
    case divide
    case none
    
    var description: String {
          switch self {
          case .add:
              return "+"
          case .subtract:
              return "−"
          case .multiply:
              return "x"
          case .divide:
              return "÷"
          case .none:
              return ""
          }
      }
}
