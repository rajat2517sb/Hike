//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Rajat on 09/02/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            
            Color(.colorGreenDark)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 40, height: 40)))
                .offset(y:12)
            
            Color(.colorGreenLight)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 40, height: 40)))
                .offset(y:3)
                .opacity(0.8)
            
            LinearGradient(colors: [Color(.colorGreenLight), Color(.colorGreenMedium)], startPoint: .top,
                endPoint: .bottom)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 40, height: 40)))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .previewLayout(.sizeThatFits)
        .padding()
}
