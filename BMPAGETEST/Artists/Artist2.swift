//
//  Artist2.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI

struct Artist2: View {
    
    private var image: AnyView {
        if let origImage = UIImage(named: "marnik_logo") {
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
            
            Text("ARTISTE 2")
                .font(.custom("Poppins", size: 20))
                .foregroundColor(.red)
                .kerning(5.7)
            
            Image("marnik")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .aspectRatio(contentMode: .fill)
            NavigationLink(destination: Artist2Detail()) {
                Text("PLUS D'INFOS")
                    .font(.custom("Poppins", size: 20))
                    .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                    .kerning(5.7)
            }.padding(.top, 15)
        }
    }
}

struct Artist2Detail: View {
    
    private var image: AnyView {
        if let origImage = UIImage(named: "marnik_logo") {
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
                
                Image("marnik")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    .aspectRatio(contentMode: .fill)
                
                Text(
                    """
                    Nous sommes fiers de vous annoncer le deuxième artiste de cette 18ème édition de la Blue Moon : Marnik 👥

                    Ce duo italien de house progressive présent à Tomorrowland à de multiples reprises et soutenu par les plus grands DJ de planète tels que Don Diablo, KSHMR, Steve Aoki ou encore DJ Snake saura faire de cette Blue Moon une édition mémorable.

                    Ils totalisent aujourd’hui des dizaines de millions d’écoutes sur Spotify.

                    Leur titre “Gam Gam”, sorti l’an dernier, a été leur plus grand succès et totalise aujourd’hui près de 30 millions d’écoutes sur Youtube.

                     Gam Gam : https://www.youtube.com/watch?v=Lu3LZmhC_DY
                     Up & Down : https://www.youtube.com/watch?v=-zjj5XAXHtw
                     Bazaar w/ KSHMR : https://www.youtube.com/watch?v=KlJAiwwGHMg

                    
                    Retrouvez Marnik le 13 février au Parc des Expositions. 🕺🎊

                    """)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
            }
        }
        
    }
}

struct Artist2_Previews: PreviewProvider {
    static var previews: some View {
        Artist2()
    }
}
