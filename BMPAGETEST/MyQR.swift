//
//  MyQR.swift
//  Blue Moon
//
//  Created by Romain Rabouan on 11/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI

struct MyQR: View {
    var body: some View {
        VStack(spacing: 25) {
            if UserDefaults.standard.object(forKey: "QRCODENUMBER") != nil {
                Text("BLUEMOON 2K20")
                    .foregroundColor(.black)
                    .font(.custom("LULO CLEAN", size: 500))
                    .minimumScaleFactor(0.04)
                    .padding(.top, 40)
                
                Spacer()
                
                Image(uiImage: UIImage(data: returnData(str: UserDefaults.standard.string(forKey: "QRCODENUMBER")!))!)
                    
                Text("Fais scanner ce code à l'entrée de la salle. Nous te conseillons très fortement de garder le billet initial sur toi. 💃🎊")
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
//
//                BigButton(action: {
//                    // delete
//                }, title: "Supprimer le billet", color: .red)
                
             //   Spacer()
                
                Text("© Copyright 2020 - Romain RABOUAN pour BDE ESEO")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, -10)
                Text("@bde.eseo")
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
            }
        }
    }
    
    func returnData(str: String) -> Data {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = str.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let transform = CGAffineTransform(scaleX: 3, y: 3)
        let imageOutput = image?.transformed(by: transform)
        let uiImage = UIImage(ciImage: imageOutput!)
        
        return uiImage.pngData()!
    }
}



struct BigButton: View {
    var action: () -> Void
    var title: String
    var color: Color
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(width: 180, height: 50)
                .background(color)
                .cornerRadius(15)
                .padding(.vertical, 20)
        }
    }
}
