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
    //    let playerName : String
    let playerNames : [String]
    let currentPhase : TimePeriod
    
    var body: some View {
        NavigationStack {
            //            Text("Player: \(playerName)")
            if let animalList = animals[selectedContinent] {
                List(animalList.indices, id: \.self) { index in
                    NavigationLink(destination: AnimalSelectionDetailsView(animals: $animals, selectedContinent: selectedContinent, animalIndex: index,
                                                                           playerAnimals: $playerAnimals,
                                                                           playerNames: playerNames, currentPhase: currentPhase)) {
                        Text(animalList[index].name)
                        
                    }
                                                                           .fontWeight(.bold)
                                                                           .padding()
                                                                           .frame(maxWidth: .infinity)
                                                                           .background(Color.white)
                                                                           .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                                                           .cornerRadius(10)
                    
                    
                }
                .buttonStyle(PressableButtonStyle())
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
    AnimalSelectionView(animals: .constant([:]), selectedContinent: Continent.africa, playerAnimals: .constant([:]), playerNames: ["Anon", "A2"], currentPhase: TimePeriod.past)
}
