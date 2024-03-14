//
//  SettingsView.swift
//  Hike
//
//  Created by Rajat on 09/02/24.
//

import SwiftUI

struct SettingsView: View {
    var alternateAppIconName : [String] = ["AppIcon-Backpack", "AppIcon-Camera", "AppIcon-Campfire","AppIcon-MagnifyingGlass","AppIcon-Map","AppIcon-Mushroom"]
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -5) {
                        Text("Hike")
                            .font(.system(size: 60, weight: .black))
                        Text("Editior's Choice ")
                            .fontWeight(.medium)
                    }
                    Image(systemName:"laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.colorGreenLight,.colorGreenMedium,.colorGreenDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("where can you find\n perfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you actually there. The hike that you hope you to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity)
            }//: Header
            .listRowSeparator(.hidden)
            
            //MARK: App icon selector
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIconName.indices, id: \.self) { item in
                            Button(action: {
                                print("\(alternateAppIconName[item]) Pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIconName[item]) { error in
                                    if error != nil {
                                      print("failed to update app icon")
                                    } else {
                                        print("appicon updated successfully")
                                    }
                                }
                            }, label: {
                                Image("\(alternateAppIconName[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
                                    .buttonStyle(.borderless)
                            })
                        }
                    }
                }
                .padding(.top,12)
                
                Text("choose youre favourite app icon from collection above")
                    .frame(minWidth:0 ,maxWidth:.infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("copyright © All right reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(rowContent: "Hike", rowLabel: "Application", rowIcon: "apps.iphone", rowTintColor: .blue)
                
                CustomListRowView(rowContent: "iOS, iPadOS", rowLabel: "compatability", rowIcon: "info.circle", rowTintColor: .red)
                
                CustomListRowView(rowContent: "1.0", rowLabel: "Version", rowIcon: "gear", rowTintColor: .purple)
                
                CustomListRowView(rowContent: "Rajat", rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowTintColor: .mint)
                
                CustomListRowView(rowContent: "Rajat", rowLabel: "Designer", rowIcon: "paintpalette", rowTintColor: .gray)
                
                CustomListRowView(rowLabel: "website", rowIcon: "globe", rowTintColor: .pink, rowLinkLabel: "Credo Academy", rowLinkeDestination: "https://credo.academy")
            }
        }
    }
}

#Preview {
    SettingsView()
}
