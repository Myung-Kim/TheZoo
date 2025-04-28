//
//  AnimalSelectionView.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/4/19.
//

import SwiftUI


struct AnimalSelectionView: View {
    
    @Binding var animals : [Continent: [Animal]]
    let selectedContinent: Continent
    @Binding var playerAnimals : [String: [Animal]]
    let playerName : String
    let currentPhase : TimePeriod
    
    var body: some View {
        NavigationStack {
            Text("Player: \(playerName)")
            if let animalList = animals[selectedContinent] {
                List(animalList.indices, id: \.self) { index in
                    NavigationLink(destination: AnimalSelectionDetailsView(animals: $animals, selectedContinent: selectedContinent, animalIndex: index,
                                                                           playerAnimals: $playerAnimals,
                                                                           playerName: playerName, currentPhase: currentPhase)) {
                        Text(animalList[index].name)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            } else {
                Text("No animals found for \(selectedContinent)")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .onAppear {
//            print(animals.values)
//            print("animals loaded")
        }
    }
}

#Preview {
    AnimalSelectionView(animals: .constant([:]), selectedContinent: Continent.africa, playerAnimals: .constant([:]), playerName: "Anon", currentPhase: TimePeriod.past)
}
