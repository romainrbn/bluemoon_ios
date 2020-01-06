//
//  CountdownView.swift
//  Blue Moon
//
//  Created by Romain Rabouan on 11/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI

struct CountDownView : View {
    
    @State var nowDate: Date = Date()
    let referenceDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        Text(countDownString(from: referenceDate))
            .font(.custom("Poppins", size: 30))
            .foregroundColor(Color(red: 134/255, green: 70/255, blue: 70/255))
            .onAppear(perform: {
                _ = self.timer
            })
    }

    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02dJ %02dH %02dJ %02dS",
                      components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }

}
