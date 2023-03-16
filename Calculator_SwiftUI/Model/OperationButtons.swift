//
//  OperationButtons.swift
//  Calculator_SwiftUI
//
//  Created by Buse Sahinbas on 15.03.2023.
//

import Foundation

enum OperationButtons {
    case AC
    case sign
    case percent
    
    var description: String {
          switch self {
          case .AC:
              return "AC"
          case .sign:
              return "+/-"
          case .percent:
              return "%"
          }
      }
}
