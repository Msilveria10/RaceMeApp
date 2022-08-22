//
//  GameStart.swift
//  RaceMeApp
//
//  Created by Matt Silveria on 7/7/22.
//

import SwiftUI

struct CountDownView: View {
    
    @State var countDownTimer = 5
    @State var timerRunning = true
    @State var showTimer = true
    @State var showGameplayView = false
    @State var gameplayview = GamePlayView()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        // MARK: NAV
        
        NavigationView {
            
            VStack {
                
                Text("Game Starts in!")
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                    .bold()
                
                Text("\(countDownTimer)")
                    .font(.system(size: 100)).foregroundColor(Color.blue).bold()
                    .padding(.bottom,200)
                    .onReceive(timer) {_ in
                        if countDownTimer > 0 && timerRunning {
                            countDownTimer -= 1
                        } else {
                            timerRunning = false
                        }
                    }
            }
        }
    }
    // MARK: Methods
    
}





struct GameStart_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView()
    }
}

