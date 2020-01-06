//
//  Footer.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI
import SafariServices

struct Footer: View {
    @State var showFlag: Bool = false
    
    private var countdown: AnyView {
        var dateComponents = DateComponents()
        dateComponents.year = 2020
        dateComponents.month = 2
        dateComponents.day = 13
        dateComponents.timeZone = TimeZone(abbreviation: "CET") // Japan Standard Time
        dateComponents.hour = 21
        dateComponents.minute = 0

        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let bmDate = userCalendar.date(from: dateComponents)

        
        return AnyView(
            CountDownView(referenceDate: bmDate!)
        )
        
    }
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 25) {
                
                countdown
                
                Divider()
                Text("RÉSERVATIONS")
                    .font(.custom("Poppins", size: 20))
                    .foregroundColor(.red)
                    .kerning(5.7)
                
                Button(action: {
                    self.showFlag.toggle()
                }) {
                    Text("BM.BDEESEO.FR")
                        .font(.custom("Poppins", size: 20))
                        .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                        .kerning(5.7)
                }
                
            }
            
            Divider()
//            
//            NavigationLink(destination: ConditionsView()) {
//                Text("CONDITIONS GÉNÉRALES DE VENTE")
//                    .font(.custom("Poppins", size: 12))
//                    .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
//                    .kerning(2.5)
//            }
            
            NavigationLink(destination: CreditsView()) {
                Text("CRÉDITS")
                    .font(.custom("Poppins", size: 12))
                    .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                    .kerning(3)
            }
            
            Divider()
            
            NavigationLink(destination: SponsorsView()) {
                Text("NOS PARTENAIRES")
                    .font(.custom("Poppins", size: 20))
                    .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                    .kerning(3)
            }
            
            Divider()
            
            
            HStack(spacing: 15) {
                Image("logo3")
                    .resizable()
                    .frame(width: 123, height: 100)
                Image("nrj")
                    .resizable()
                    .frame(width: 104, height: 123)
            }.padding(.bottom, 15)
            
                
        }
            
        .sheet(isPresented: $showFlag) {
            SafariView(url: URL(string: "https://bm.bdeeseo.fr"))
        }
        
        
    }
    
}

struct SponsorsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 50) {
                
                Image("nrj")
                    .resizable()
                    .frame(width: 104, height: 123)
                    .padding(.top, 30)
                
                Image("angers_logo")
                    .resizable()
                    .frame(width: 95, height: 123)
                
                Image("sono")
                    .resizable()
                    .frame(width: 200, height: 80) // 2.67 ratio
                
                Image("studio")
                    .resizable()
                    .frame(width: 123, height: 123)
                
                Spacer()
                
            }
        }
        
    }
}

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: URL?

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url!)
    }

    func updateUIViewController(_ safariViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct CreditsView: View {
    var body: some View {
        VStack {
            
            Text("App made with 💙 by Romain Rabouan with SwiftUI")
                .font(.custom("Poppins", size: 12))
                .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                .kerning(3)
                .multilineTextAlignment(.center)
            
            Text("🐉 @bde.eseo 🐉")
                .font(.custom("Poppins", size: 12))
                .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                .kerning(3)
                .padding(.top, 10)
            
            Text("Photo by Hugo Prêtre ©")
                .font(.custom("Poppins", size: 12))
                .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
                .padding(.top, 20)
            
        }
        
    }
}


struct WebSiteView: View {
    var body: some View {
        Text("site")
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
