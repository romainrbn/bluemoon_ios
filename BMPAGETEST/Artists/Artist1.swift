//
//  Artist1.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI
import UIKit

struct Artist1: View {
    
    private var image: AnyView {
        if let origImage = UIImage(named: "vlad_logo") {
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
                
            
            Text("ARTISTE 1")
                .font(.custom("Poppins", size: 20))
                .foregroundColor(.red)
                .kerning(5.7)
            
            Image("vlad")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 232)
                .aspectRatio(contentMode: .fill)
            NavigationLink(destination: Artist1Detail()) {
                Text("PLUS D'INFOS")
                    .font(.custom("Poppins", size: 20))
                    .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                    .kerning(5.7)
            }.padding(.top, 15)
        }
    }
}

struct Artist1Detail: View {
    
    private var image: AnyView {
        if let origImage = UIImage(named: "vlad_logo") {
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
                
                Image("vlad")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 232)
                    .aspectRatio(contentMode: .fill)
                
                Text(
                    """
                    C’est avec plaisir que nous vous annonçons le premier artiste de cette nouvelle édition de la Blue Moon : Vladimir Cauchemar 💀.

                    Ce DJ français se fait remarquer en 2017 avec ses titres Aulos puis Aulos Reloaded en featuring avec 6IX9INE. Il totalise aujourd’hui plusieurs dizaines de millions d’écoutes sur Spotify et Youtube. Derrière le masque se cache aussi un producteur exceptionnel très proche de la nouvelle scène rap européenne, on lui doit récemment la co production des titres « 1000° » et « Trop Beau » de Lomepal, 7 titres sur le dernier album de Roméo Elvis « Chocolat », ou bien des collaborations avec Orelsan.

                    ▶︎ Aulos Reloaded : https://www.youtube.com/watch?v=m7jfM9A6R-k
                    ▶︎ Elévation ft. Vald :  https://www.youtube.com/watch?v=jj88i2vhdcg
                    ▶︎ (G)RAVE : https://www.youtube.com/watch?v=48SXkdr8mxU

                     Son Fast-Life Konbini : https://www.youtube.com/watch?v=jzJFBSXdZ3Y
                    
                    Retrouvez Vladimir Cauchemar le 13 février au Parc des Expositions. 🕺🎊

                    """)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
            }
        }
        
    }
}

struct Artist1_Previews: PreviewProvider {
    static var previews: some View {
        Artist1()
    }
}
