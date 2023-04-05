//
//  ContentView.swift
//  SmoothDropdown
//
//  Created by Raul on 05.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var itemsExpanded = false
    var itemsCollapseColor = Color(#colorLiteral(red: 0.1462407112, green: 0.1462407112, blue: 0.1462407112, alpha: 1))

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ZStack {
                

                // #5
                MenuItem(
                    text: "PRICING",
                    offsetItem: itemsExpanded ? 140 : -60,
                    itemColor: itemsExpanded ?  itemsCollapseColor : Color(#colorLiteral(red: 0.0834152922, green: 0.0834152922, blue: 0.0834152922, alpha: 1)),
                    itemArrowIcon: "arrow.right",
                    itemArrowOffset: 94,
                    itemArrowRotation: 0,
                    itemArrowOpacity: 0.7,
                    itemIcon: "cart.fill"
                )
                .scaleEffect(itemsExpanded ? 1 : 0.80)

                // #4
                MenuItem(
                    text: "GALLERIES",
                    offsetItem: itemsExpanded ? 60 : -45,
                    itemColor: itemsExpanded ?  itemsCollapseColor : Color(#colorLiteral(red: 0.1071854457, green: 0.1071854457, blue: 0.1071854457, alpha: 1)),
                    itemArrowIcon: "arrow.right",
                    itemArrowOffset: 72,
                    itemArrowRotation: 0,
                    itemArrowOpacity: 0.7,
                    itemIcon: "photo.fill.on.rectangle.fill"
                )
                .scaleEffect(itemsExpanded ? 1 : 0.85)

                
                // #3
                MenuItem(
                    text: "CTA SECTIONS",
                    offsetItem: itemsExpanded ? -20 : -30,
                    itemColor: itemsExpanded ?  itemsCollapseColor : Color(#colorLiteral(red: 0.1353607476, green: 0.1353607476, blue: 0.1353607476, alpha: 1)),
                    itemArrowIcon: "arrow.right",
                    itemArrowOffset: 39,
                    itemArrowRotation: 0,
                    itemArrowOpacity: 0.7,
                    itemIcon: "cursorarrow.click.2"
                )
                .scaleEffect(itemsExpanded ? 1 : 0.90)

                
                // #2
                MenuItem(
                    text: "NAVBARS",
                    offsetItem: itemsExpanded ? -100 : -15,
                    itemColor: itemsExpanded ?  itemsCollapseColor : Color(#colorLiteral(red: 0.156927973, green: 0.156927973, blue: 0.156927973, alpha: 1)),
                    itemArrowIcon: "arrow.right",
                    itemArrowOffset: 94,
                    itemArrowRotation: 0,
                    itemArrowOpacity: 0.7,
                    itemIcon: "menubar.rectangle"
                )
                .scaleEffect(itemsExpanded ? 1 : 0.95)

                
                // #1
                MenuItem(
                    text: "COMPONENTS",
                    offsetItem: itemsExpanded ? -180 : 0,
                    itemColor: Color(#colorLiteral(red: 0.1777858436, green: 0.1777858436, blue: 0.1777858436, alpha: 1)),
                    itemArrowIcon: "chevron.right",
                    itemArrowOffset: 65,
                    itemArrowRotation: itemsExpanded ? 90 : 0,
                    itemArrowOpacity: 1,
                    itemIcon: "rectangle.fill.on.rectangle.fill"
                )
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 210, damping: 22)) {
                        itemsExpanded.toggle()
                    }
                }

            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuItem: View {
    var text: String
    var offsetItem: CGFloat
    var itemColor: Color
    var itemArrowIcon: String
    var itemArrowOffset: CGFloat
    var itemArrowRotation: CGFloat
    var itemArrowOpacity: CGFloat
    var itemIcon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 18) {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.07843137255, green: 0.07843137255, blue: 0.08235294118, alpha: 1)))
                .frame(width: 40, height: 40)
                .cornerRadius(8)
                .overlay {
                    Image(systemName: itemIcon)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
            
            Text(text)
                .font(.system(size: 18))
                .fontDesign(.monospaced)
                .foregroundColor(.white)
            
            Image(systemName: itemArrowIcon)
                .rotationEffect(.degrees(itemArrowRotation))
                .font(.system(size: 12))
                .offset(x: itemArrowOffset)
                .foregroundColor(.white)
                .opacity(itemArrowOpacity)
        }
        .padding(.leading, 20)
        .frame(width: 300, height: 70, alignment: .leading)
        .background(itemColor)
        .cornerRadius(8)
        .offset(x: 0, y: offsetItem)
        .shadow(color: Color.black.opacity(0.145), radius: 0, x: 0, y: -0.5)
        .shadow(color: Color.black.opacity(0.137), radius: 1.5, x: 0, y: -1.5)
        .shadow(color: Color.black.opacity(0.118), radius: 3.5, x: 0, y: -3)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -10)
    }
}
