//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jigmet stanzin Dadul on 11/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var on = true
    var body: some View {
        VStack(alignment: .center){
            HStack(alignment: .center){
                Text("one")
                Text("one")
                Text("one")
            }
            HStack(alignment: .center){
                Text("one")
                Text("one")
                Text("one")
            }
            HStack(alignment: .center){
                Text("one")
                Text("one")
                Text("one")
            }
        }
    }
}

#Preview {
    ContentView()
}
