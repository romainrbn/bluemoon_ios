//
//  Artist3.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI

struct Artist3: View {
    
    private var image: AnyView {
        if let origImage = UIImage(named: "oriska_logo") {
            let tintedImage = origImage.withRenderingMode(.alwaysTemplate)
            tintedImage.withTintColor(UIColor.label)
            return AnyView(
                Image(uiImage: tintedImage)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 2, height: 80)
                    .aspectRatio(contentMode: .fill)
            )
        }
        
        return AnyView(Text("error loading image"))
    }
    
    var body: some View {
        VStack {
            
            image
           
            Text("ARTISTE 3")
                .font(.custom("Poppins", size: 20))
                .foregroundColor(.red)
                .kerning(5.7)
            
            Image("oriska")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .aspectRatio(contentMode: .fill)
            NavigationLink(destination: Artist3Detail()) {
                Text("PLUS D'INFOS")
                    .font(.custom("Poppins", size: 20))
                    .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                    .kerning(5.7)
            }.padding(.top, 15)
        }
    }
}

struct Artist3Detail: View {
    private var image: AnyView {
        if let origImage = UIImage(named: "oriska_logo") {
            let tintedImage = origImage.withRenderingMode(.alwaysTemplate)
            tintedImage.withTintColor(UIColor.label)
            return AnyView(
                Image(uiImage: tintedImage)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 2, height: 80)
                    .aspectRatio(contentMode: .fill)
            )
        }
        
        return AnyView(Text("error loading image"))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                 image
                
                Image("oriska")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    .aspectRatio(contentMode: .fill)
                
                Text(
                    """
                    Et le dernier artiste présent à la Blue Moon sera… Oriska ! 🎉

                    Oriska est une DJ productrice incontournable de la scène électro féminine française.
                    Elle a été consacrée par deux fois « MEILLEURE DJ FEMININ DE L’ANNEE » lors de la prestigieuse cérémonie des NRJ DJ AWARDS à Monaco, en présence d’Afrojack, de Bob Sinclar et de Dimitri Vegas & Like Mike.
                     
                    Elle se hisse à la 13ème place mondiale et 7ème place européenne du classement “TOP 100 Djanes”.

                    ► Read Your Mind : https://www.youtube.com/watch?v=VIKqSYY7VVI
                    ► Parisian Bass : https://www.youtube.com/watch?v=C3TTjVGqgG8


                    """)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
            }
        }
        
    }
}

struct Artist3_Previews: PreviewProvider {
    static var previews: some View {
        Artist3()
    }
}
