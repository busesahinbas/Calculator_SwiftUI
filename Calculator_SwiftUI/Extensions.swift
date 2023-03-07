//
//  Extensions.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 3.02.2023.
//

import Foundation
import SwiftUI

public extension String {
   
   // remove the '.0' when the number is not decimal
   func removeAfterPointIfZero() -> String {
       let token = self.components(separatedBy: ".")
       
       if !token.isEmpty && token.count == 2 {
           switch token[1] {
           case "0", "00", "000", "0000", "00000", "000000":
               return token[0]
           default:
               return self
           }
       }
       return self
   }
    
    func editComma() -> String {
        let num = self.replacingOccurrences(of: ".", with: ",")
        return num
    }
    
    func editDot() -> String {
        let num = self.replacingOccurrences(of: ",", with: ".")
        return num
    }
}

extension Color {
    static func appColor(_ name: AssetsColor) -> Color? {
        switch name {
        case .darkGrey:
            return Color("darkGrey")
        case .ligtGrey:
            return Color("lightGrey")
        }
    }
}
