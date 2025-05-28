//
//  PlayerAnimalsView.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/4/25.
//

import SwiftUI

struct PlayerAnimalsView: View {
    @Binding var freeAnimals: [Continent: [Animal]]
    @Binding var playerAnimals: [String: [Animal]]
    let currentPlayerName: String
    
    var body: some View {
        NavigationStack {
//            Text("Player: \(currentPlayerName)")
            if let animalList = playerAnimals[currentPlayerName] {
                List(animalList.indices, id: \.self) { index in
                    NavigationLink(destination: PlayerAnimalDetailsView(freeAnimals: $freeAnimals, playerAnimals: $playerAnimals, currentPlayerName: currentPlayerName, animalIndex: index)) {
                        Text(animalList[index].name)
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                    .buttonStyle(PressableButtonStyle())
                }
            } else {
                Text("No animals found for \(currentPlayerName)")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

#Preview {
    PlayerAnimalsView(freeAnimals: .constant([:]), playerAnimals: .constant([:]), currentPlayerName: "Kim")
}
