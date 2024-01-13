//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jigmet stanzin Dadul on 11/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var showAler = false
    var body: some View {
        VStack{
            Button("Aler"){
                showAler = true
            }.alert("Alert", isPresented: $showAler){
                Button("Cancel"){}
                Button("Continue"){}
            } message: {
                Button("hi", systemImage: "pencil"){
                    
                }
            }
            Text(String(showAler))
        }
    }
}

#Preview {
    ContentView()
}
