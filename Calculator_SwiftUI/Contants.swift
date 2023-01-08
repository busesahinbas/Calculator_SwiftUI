//
//  Contants.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 3.01.2023.
//

import Foundation
import SwiftUI

internal struct Constants {
    
    static let smallButtonWidht = (UIScreen.main.bounds.size.width - (5*12)) / 4
    static let largeButtonWidht = smallButtonWidht * 2 + 12
    static let heightButton = smallButtonWidht
    static let heightFrame = UIScreen.main.bounds.size.height * 0.1
    static let heightText = UIScreen.main.bounds.size.height * 0.2
    static let darkGrey = Color(red: 0.3137254901960784, green: 0.3137254901960784, blue: 0.3137254901960784)
    static let lightGrey = Color(red: 0.8313725490196079, green: 0.8313725490196079, blue: 0.8235294117647058)
    static let buttonPadding = UIScreen.main.bounds.size.width / 100 * 3
    
}

