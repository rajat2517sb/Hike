//
//  GradientButton.swift
//  Hike
//
//  Created by Rajat on 09/02/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ? 
                LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .clipShape(Capsule())
    }
}
