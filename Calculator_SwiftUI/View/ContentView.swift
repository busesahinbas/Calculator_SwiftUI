//
//  ContentView.swift
//  Calculator_SwiftUI
//
//  Created by Buse Şahinbaş on 17.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()
                Text(vm.resultText)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 85))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
            }.frame(height: Constants.heightText)
            
            ForEach (vm.stackArray, id: \.self) { index in
                HStack {
                    ForEach (index, id: \.self) { i in
                        Button() {
                            vm.action(for: i)
                        }label: {
                            Text(i.description)
                                .frame(width: i.width, height: Constants.heightButton)
                                .offset(i == ButtonType.number(.zero) ? CGSize(width: -40.0, height: 0) : CGSize(width: 0, height: 0))
                                .foregroundColor(i.foregroundColor)
                                .background(i.backgroundColor)
                                .clipShape(Capsule())
                                .font(.system(size: 32))
                        }
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

