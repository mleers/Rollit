//
//  ContentView.swift
//  Rollit
//
//  Created by Mitch on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    let dice: Dice
    
    let amounts = [1, 2, 3, 4, 5, 6]
    @State private var selectedAmount = 1
    
    let sides = [4, 6, 8, 10, 12, 20, 100]
    @State private var selectedSide = 6
    
    @State var results = [Int]()
            
    var body: some View {
        VStack {
            HStack {
                Text("How many dice?")
                Spacer()
            }
//                .padding(.leading, 2)
            
            Picker("Amount", selection: $selectedAmount) {
                ForEach(amounts, id: \.self) {
                    Text(String($0))
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            HStack {
                Text("How many sides?")
                Spacer()
            }
//                .padding(.leading, 2)
            
            Picker("Sides", selection: $selectedSide) {
                ForEach(sides, id: \.self) {
                    Text(String($0))
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()

            HStack {
                Button("Roll \(Image(systemName: "die.face.6"))", action: pick)
//                Button("Save Result", action: nil)
            }
            .buttonStyle(.bordered)
            
            VStack(spacing: 20) {
                ForEach(results, id: \.self) {num in
                    HStack {
                        if selectedSide == 4 || selectedSide == 6 {
                            Image(systemName: "die.face.\(num)")
                                .font(.largeTitle)
                            Text("\(num)")
                                .font(.largeTitle)
                        } else {
                            Text("\(num)")
                                .font(.largeTitle)
                        }
                    }
                }
            }
            .frame(maxHeight: 400, alignment: .leading)
            
            Spacer()
            
            VStack {
                Text("Total: \(results.reduce(0, +))")
                    .font(.title)
            }
        } // top vstack
        .padding()
    }
    
    func pick() {
        if results.isEmpty == false {
            reset()
        }
        for _ in 1...selectedAmount {
            results.append(Int.random(in: 1...selectedSide))
        }
        print(results)
    }
    
    func reset() {
        results.removeAll()
        timeRemaining = 3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dice: Dice.example)
    }
}
