//
//  TapButton.swift
//  RaceMeApp
//
//  Created by Matt Silveria on 7/19/22.
//

import SwiftUI

struct GamePlayView: View {
    
    @State var counter = 0
    @State var countDownTimer = 30
    @State var timerRunning = true
    @State var showTimer = true
    @State private var animate = false
    @State var showAnimation = false
    @State var alertIsVisible = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Button(action: {self.counter += 1}) {
                Rectangle()
                    .ignoresSafeArea()
            }
            .foregroundColor(.blue)
            .buttonStyle(.plain)
            
            VStack {
                VStack {
                    Text("Timer")
                        .foregroundColor(.white)
                        .font(.system(size:35.0))
                        .bold()
                    HStack {
                    Text("\(countDownTimer)")
                        .font(.system(size: 100)).foregroundColor(Color.white).bold()
                        .padding(.bottom,200)
                        .onReceive(timer) {_ in
                            if countDownTimer > 0 && timerRunning {
                                countDownTimer -= 1
                            } else if countDownTimer == 0 {
                                alertIsVisible = true
                            } else {
                                timerRunning = false
                            }
        
                            }
                        Text("Seconds")
                            .foregroundColor(.white)
                            .font(.system(size:20))
                            .bold()
                            .padding(.bottom, 150.0)
                        
                        }
                    VStack {
                        Text("Tap Count")
                            .foregroundColor(.white)
                            .font(.system(size:20.0))
                            .bold()
                        Text("\(counter)")
                            .foregroundColor(.white)
                            .font(.system(size: 75.0))
                            .bold()
                    }
                }
                .alert(isPresented: $alertIsVisible, content: {
                    
                    return Alert(title: Text("Time is up!"),message:Text("You scored \(counter)!"), dismissButton: .default(Text("Ok")))
                })
            }
        }
    }
    
    func resetGame() {
        while alertIsVisible {
            counter = 0
            countDownTimer = 30
        }
    }
    
}






struct TapButton_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView()
    }
}
