//
//  ContentView.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // Content here
                    HeaderView()
                    EditionView()
                    Player()
                        .frame(width: UIScreen.main.bounds.width, height: 282)
                    
                    Artist1()
                        .padding(.top, 30)
                    
                    
                    Divider()
                    
                    Artist2()
                        .padding(.top, 30)
                    
                    Divider()
                    
                    Artist3()
                        .padding(.top, 30)
                    
                    Footer()
                        .padding(.top, 80)
                }
            }.edgesIgnoringSafeArea(.top)
                
            .navigationBarTitle(
                Text("BLUEMOON 2K20")
                    .font(.custom("LULO CLEAN", size: 20))
            )
            
            .navigationBarHidden(true)
        }
    }
}


struct EditionView: View {
    var body: some View {
        
        VStack {
            Text("NIGHTMARE")
                .font(.custom("LeviBrush", size: 32))
            Text("EDITION")
                .font(.custom("Poppins", size: 20))
                .foregroundColor(.red)
                .kerning(5.7)
            
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
