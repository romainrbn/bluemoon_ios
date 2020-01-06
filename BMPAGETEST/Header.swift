//
//  Header.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI

struct BackHeaderImage: View {
    var body: some View {
        VStack {
            Image("back2")
                .resizable()
                .frame(width: 958, height: 639)
                .aspectRatio(contentMode: .fill)
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct HeaderTextInformation: View {
    
    @State var showFlag: Bool = false
    @State var sheetIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 60) {
            VStack(spacing: 30) {
                Text("BLUEMOON 2K20")
                    .foregroundColor(.black)
                    .font(.custom("LULO CLEAN", size: 500))
                    // text shrink
                    .minimumScaleFactor(0.05)
                Text("BE READY")
                    .font(.custom("Poppins", size: 20))
                    .foregroundColor(.red)
                    .kerning(5.7)
            }
            
            VStack(spacing: 30) {
                Text("13 FÉVRIER 2020")
                    .foregroundColor(.black)
                    .font(.custom("Poppins", size: 20))
                    .kerning(5.7)
                VStack {
                    Text("PARC DES EXPOSITIONS")
                        .foregroundColor(.black)
                        .font(.custom("Poppins", size: 500))
                        .kerning(5.7)
                        .minimumScaleFactor(0.03)
                    Text("ANGERS")
                        .foregroundColor(.black)
                        .font(.custom("Poppins", size: 20))
                        .kerning(5.7)
                }
                
                Spacer()
                
                if(UserDefaults.standard.object(forKey: "QRCODENUMBER") != nil) {
                    Button(action: {
                        self.showFlag.toggle()
                        self.sheetIndex = 0
                    }) {
                        Text("MON BILLET")
                            .font(.custom("Poppins", size: 18))
                            .kerning(5.7)
                            .frame(width: 280, height: 50)
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(10)
                            
                    }.padding(.bottom, 10)
                } else {
                    Button(action: {
                        self.showFlag.toggle()
                        self.sheetIndex = 1
                    }) {
                        Text("SCANNER MON BILLET")
                            .font(.custom("Poppins", size: 20))
                            .foregroundColor(Color.white)
                            .kerning(5.7)
                    }.padding(.bottom, 10)
                }
                
            }
            
            Spacer()
        }
        .padding(.top, 86)
        
        .sheet(isPresented: $showFlag) {
            if self.sheetIndex == 0 {
                MyQR()
            } else if self.sheetIndex == 1 {
                QRCodeScan()
            }
            
        }
        
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            
            BackHeaderImage()
            HeaderTextInformation()
            
        }
    }
}
