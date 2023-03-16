//
//  AssestsColor.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 16.03.2023.
//

import Foundation
import SwiftUI

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

enum AssetsColor {
   case darkGrey
   case ligtGrey
}
