//
//  CardView.swift
//  Hike
//
//  Created by Rajat on 09/02/24.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber:Int = 1
    @State private var randomNumber:Int = 1
    @State private var isSheetPresented:Bool = false
    
    func randaomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber  = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                
                //MARK: Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button(action: {
                            print("button pressed")
                            isSheetPresented.toggle()
                            
                        }, label: {
                            CustomButtonView()
                        })
                        .sheet(isPresented: $isSheetPresented, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                }
                .padding(.horizontal, 30)
                
                //MARK: Content
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(randomNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.linear, value: randomNumber)
                }
                
                //MARK: Footer
                Button(action: {
                    print("Explore button clicked")
                    randaomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.colorGreenLight, .colorGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                )
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 340,height: 590)
    }
}

#Preview {
    CardView()
}
