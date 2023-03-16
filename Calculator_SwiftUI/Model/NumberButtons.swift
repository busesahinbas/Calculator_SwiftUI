//
//  NumberButtons.swift
//  Calculator_SwiftUI
//
//  Created by Buse Sahinbas on 15.03.2023.
//

import Foundation

enum NumberButtons {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
    
    var description: String {
          switch self {
          case .one:
              return "1"
          case .two:
              return "2"
          case .three:
              return "3"
          case .four:
              return "4"
          case .five:
              return "5"
          case .six:
              return "6"
          case .seven:
              return "7"
          case .eight:
              return "8"
          case .nine:
              return "9"
          case .zero:
              return "0"
          }
      }
}
