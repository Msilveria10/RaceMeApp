//
//  ContentView.swift
//  RaceMeApp
//
//  Created by Matt Silveria on 7/6/22.
//

import SwiftUI

struct HomeScreenView: View {

    // MARK: Properties
    
    @State var showCountDownView = false
    @State var showGameplay = GamePlayView()

    var body: some View {

        NavigationView {
            
            VStack {
                VStack {
                    
                    Text("Welcome To RaceMe!")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text("Tap the screen as many times as you can in 30 Seconds!")
                        .padding()
                        .padding()
                        .foregroundColor(.blue)
                        .font(.system(size: 24.0))
                }
                Spacer()
                Button(action: {
                    showCountDownView = true
                }) {
                    Text("PLAY")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.all,25)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .padding(.bottom,95)
                        .buttonStyle(.plain)
                    
                }
                NavigationLink("", destination: CountDownView() .navigationBarBackButtonHidden(true), isActive: $showCountDownView)
                
            }
        }
    }
    // MARK: Methods
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
