//
//  PlayerAnimalDetailsView.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/4/25.
//

import SwiftUI

struct PlayerAnimalDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var freeAnimals : [Continent: [Animal]]
    @Binding var playerAnimals : [String: [Animal]]
    let currentPlayerName : String
    let animalIndex: Int
    
    var body: some View {
        Text("Player: \(currentPlayerName)")
        
        if animalIndex < (playerAnimals[currentPlayerName]?.count ?? 0),
           let animal = playerAnimals[currentPlayerName]?[animalIndex] {
            
            VStack(spacing: 20) {
                Image(animal.image) // Name of the image in your assets catalog
                            .resizable() // Makes the image resizable
                            .scaledToFit() // Maintains the aspect ratio
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                Image(animal.space) // Name of the image in your assets catalog
                            .resizable() // Makes the image resizable
                            .scaledToFit() // Maintains the aspect ratio
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                Text(animal.name)
                    .font(.title)
                
                Text("Region: \(animal.region.description)")
                Text("Diet: \(animal.diet.description)")
                
                Button("Return") {
                    let animal = playerAnimals[currentPlayerName]!.remove(at: animalIndex)
                    freeAnimals[animal.region, default: []].append(animal)
                    dismiss()
                }
                .font(.title)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
        else {
            Text("No animals found for \(currentPlayerName)")
                .foregroundColor(.gray)
                .padding()
        }
            
    }
}

#Preview {
    PlayerAnimalDetailsView(freeAnimals: .constant([:]), playerAnimals: .constant([:]), currentPlayerName: "Kim", animalIndex: 0)
}
