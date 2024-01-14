//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jigmet stanzin Dadul on 11/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State var correctAnswer = Int.random(in: 0...6)
    @State var showScore = false
    @State var scoreTitle = "title"
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of: ").foregroundStyle(Color(.white))
                    Text(countries[correctAnswer]).foregroundStyle(Color(.white))
                }
                
                ForEach(0..<3){ number in
                    Text("Before: \(number)")
                    Button{
                        flagTapped(number)
                        //Text("after: \(number)")
                    }label: {
                        Image(countries[number])
                    }.buttonStyle(.bordered).foregroundColor(.white).tint(.red).padding(1)
                }
            }
        }.alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(correctAnswer)")
        }
        }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...6)
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showScore = true
    }
  
    
    
}

#Preview {
    ContentView()
}
