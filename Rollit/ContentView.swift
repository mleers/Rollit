//
//  ContentView.swift
//  Rollit
//
//  Created by Mitch on 1/21/23.
//

import SwiftUI

struct ContentView: View {
//    let dice: Dice
    
    var body: some View {
        NavigationView {
            NavigationLink {
                RollView(dice: Dice.example)
            } label: {
                Text("Roll dice!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
