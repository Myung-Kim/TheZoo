//
//  LobbyView.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/4/18.
//

import SwiftUI

struct LobbyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var numberOfPlayers = [2, 3, 4]
    @State private var selectedNumber: Int = 2
    @State private var playerNames: [String] = Array(repeating: "", count: 4) // max 4 players
    var trimmedPlayerNames: [String] {
            Array(playerNames.prefix(selectedNumber))
        }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Select number of players!")
                
                Picker("Number of Participants", selection: $selectedNumber) {
                    ForEach(numberOfPlayers, id: \.self) { number in
                        Text("\(number) person")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("Player \(index + 1) name", text: $playerNames[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disabled(index >= selectedNumber)
                            .opacity(index >= selectedNumber ? 0.5 : 1.0)
                    }
                }
                .padding(.top)
                
                NavigationLink(destination: ContentView(numberOfPlayers: $selectedNumber, playerNames: trimmedPlayerNames)) {
                    Text("Start")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}




#Preview {
    LobbyView()
}
