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
        if animalIndex < (playerAnimals[currentPlayerName]?.count ?? 0),
           let animal = playerAnimals[currentPlayerName]?[animalIndex] {
            
            VStack(spacing: 20) {
                Image(animal.image) // Name of the image in your assets catalog
                    .resizable() // Makes the image resizable
                    .scaledToFit() // Maintains the aspect ratio
                    .frame(maxWidth: .infinity, maxHeight: 200)
                Image(animal.space) // Name of the image in your assets catalog
                    .resizable() // Makes the image resizable
                    .scaledToFit() // Maintains the aspect ratio
                    .frame(maxWidth: 180, maxHeight: 150)
                
            }
            .padding()
            
            VStack {
                HStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("NAME")
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(maxWidth: 150)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    HStack {
                        Spacer()
                            .frame(width: 10)
                        Text("\(animal.name)")
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                }
                
                HStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("REGION")
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(maxWidth: 150)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    HStack {
                        Spacer()
                            .frame(width: 10)
                        Text("\(animal.region.description)")
                        
                        
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                    
                }
                
                HStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("DIET")
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(maxWidth: 150)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    HStack {
                        Spacer()
                            .frame(width: 10)
                        Text("\(animal.diet.description)")
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                    
                    
                }
                
                HStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("PRICE")
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(maxWidth: 150)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    HStack {
                        Spacer()
                            .frame(width: 10)
                        Text("\(animal.price)")
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                    
                }
                
                HStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("PROFIT")
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(maxWidth: 150)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    HStack {
                        Spacer()
                            .frame(width: 10)
                        Text("\(animal.profit)")
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                    
                }
                
//                HStack {
//                    HStack {
//                        Spacer()
//                            .frame(width: 50)
//                        Text("CAPTURE RANGE")
//                    }
//                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
//                    .frame(maxWidth: 150)
//                    
//                    Spacer()
//                        .frame(width: 30)
//                    
//                    HStack {
//                        Spacer()
//                            .frame(width: 10)
//                        Text("\(animal.captureRange)")
//                    }
//                    .fontWeight(.bold)
//                    .padding()
//                    .frame(maxWidth: .infinity, maxHeight: 40)
//                    .background(Color.white)
//                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
//                    .cornerRadius(10)
//                }
                
                HStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("COST")
                    }
                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .frame(maxWidth: 150)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    HStack {
                        Spacer()
                            .frame(width: 10)
                        Text("\(animal.cost)")
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                }
                
                Button {
                    let animal = playerAnimals[currentPlayerName]!.remove(at: animalIndex)
                    freeAnimals[animal.region, default: []].append(animal)
                    dismiss()                } label: {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.left.fill")
                        Text("PUT IT BACK")
                    }
                    .font(.title3)
                    .bold()
                    .padding(15)
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                }
                .buttonStyle(PressableButtonStyle())
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: .systemGray6))
            
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
