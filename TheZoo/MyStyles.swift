//
//  MyStyles.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/5/10.
//

//import Foundation
import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    var scaleAmount: CGFloat = 0.95

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.5), value: configuration.isPressed)
    }
}
