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
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3),
            ], center: .top, startRadius: 100, endRadius: 750)
            .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: .cyan, location: 0.3),
                .init(color: .clear, location: 0.3),
            ], center: .top, startRadius: 2, endRadius: 600)
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag").font(.largeTitle.bold()).foregroundStyle(.white)
                VStack(spacing: 15){
                    
                    VStack{
                        Text("Tap the flag of: ").foregroundStyle(.secondary).font(.subheadline).bold()
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.heavy))
                    }
                    
                    ForEach(0..<3){ number in
                        Button{
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 100)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 10).background(.regularMaterial)
                 .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Text("Score: ???").foregroundStyle(.white).font(.largeTitle.weight(.semibold))
                Spacer()
                Spacer()
            }.alert(scoreTitle, isPresented: $showScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("\(correctAnswer)")
            }
            .padding()
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
