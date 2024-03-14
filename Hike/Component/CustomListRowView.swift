//
//  CustomListRowView.swift
//  Hike
//
//  Created by Rajat on 09/02/24.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: Properties
    @State var rowContent: String? = nil
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkeDestination: String? = nil
    
    var body: some View {
        
        LabeledContent {
            //Content
            if let rowcontent = rowContent {
                Text(rowcontent)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if let rowLink = rowLinkLabel, let linkDestination = rowLinkeDestination, let destinationUrl = URL(string: linkDestination) {
                Link(rowLink, destination: destinationUrl)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
            
        } label: {
            //Label
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                }
                Text(rowLabel)
                    .fontWeight(.medium)
            }
        }//: Label
    }
}

#Preview {
    List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
        CustomListRowView(
            rowContent: nil,
            rowLabel: "Hike",
            rowIcon: "globe",
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkeDestination: "https://credo.academy"
        )
    }
}
