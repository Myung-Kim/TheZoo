import SwiftUI

struct AnimalSelectionDetailsView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding var animals: [Continent: [Animal]]
    let selectedContinent: Continent
    let animalIndex: Int
    @Binding var playerAnimals: [String: [Animal]]
    let playerNames: [String]
    let currentPhase: TimePeriod
    
    @State var playerName: String = ""
    @State private var showChoosePlayer1 = false
    @State private var showChoosePlayer2 = false
    @State private var showConfirmation = false
    @State private var showCaptureResult = false
    @State private var captureSuccess = false
    @State private var isCapturing = false
    
    @State private var captureResult : String = ""
    
    var body: some View {
        if animalIndex < (animals[selectedContinent]?.count ?? 0),
           let animal = animals[selectedContinent]?[animalIndex] {
            
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
                Spacer()
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
                
                Spacer()
                
                HStack {
                    
                    Button {
                        showChoosePlayer1 = true
                    } label: {
                        HStack {
                            Image(systemName: "eurosign")
                            Text("BUY")
                        }
                        .font(.title3)
                        .bold()
                        .padding(15)
                        .background(.green)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                    .buttonStyle(PressableButtonStyle())
                    .confirmationDialog("Choose player", isPresented: $showChoosePlayer1) {
                        ForEach(playerNames.indices) { i in
                            Button(playerNames[i]) {
                                playerName = playerNames[i]
                                showConfirmation = true
                            }
                        }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Choose player")
                    }
                    .alert("Confirm Purchase", isPresented: $showConfirmation) {
                        Button("Confirm", role: .none) {
                            buyAnimal()
                        }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Do you want to buy \(animal.name) for \(animal.price) coins?")
                    }

                    
                    
//                    Button {
//                        showChoosePlayer2 = true
//                    } label: {
//                        HStack {
//                            Image(systemName: "hand.pinch.fill")
//                            Text("CAPTURE")
//                        }
//                        .font(.title3)
//                        .bold()
//                        .padding(15)
//                        .background(.blue)
//                        .foregroundStyle(.white)
//                        .cornerRadius(10)
//                    }
//                    .buttonStyle(PressableButtonStyle())
//                    .confirmationDialog("Choose player", isPresented: $showChoosePlayer2) {
//                        ForEach(playerNames.indices) { i in
//                            Button(playerNames[i]) {
//                                playerName = playerNames[i]
//                                isCapturing = true
//                                attemptCapture(for: animal)
//                            }
//                        }
//                        Button("Cancel", role: .cancel) { }
//                    } message: {
//                        Text("Choose player")
//                    }
//                    .alert(isPresented: $showCaptureResult) {
//                        if captureSuccess {
//                            return Alert(title: Text("Success!"), message: Text("You captured \(animal.name)! \(captureResult)"), dismissButton: .default(Text("OK")) {
//                                let capturedAnimal = animals[selectedContinent]!.remove(at: animalIndex)
//                                playerAnimals[playerName, default: []].append(capturedAnimal)
//                                dismiss()
//                            })
//                        } else {
//                            return Alert(title: Text("Failed"), message: Text("The \(animal.name) escaped! \(captureResult)"), dismissButton: .default(Text("OK")) {
//                                dismiss()
//                            })
//                        }
//                    }
//                    .disabled(isCapturing)
//                    if isCapturing {
//                        ProgressView("Capturing...")
//                            .padding()
//                    }
                    
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: .systemGray6))
            
        }
        else {
            Text("No animals found for \(selectedContinent)")
                .foregroundColor(.gray)
                .padding()
        }
    }
    
    private func buyAnimal() {
        let boughtAnimal = animals[selectedContinent]!.remove(at: animalIndex)
        playerAnimals[playerName, default: []].append(boughtAnimal)
        dismiss()
    }
    
    private func attemptCapture(for animal: Animal) {
        // When player taps "Capture", immediately disable button or show "Capturing..." if you want
        // Then wait a bit before rolling dice
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // wait 2 seconds
            let randomValue = Int.random(in: 1...6)
            print("Capture range: \(animal.captureRange), rolled: \(randomValue)")
            captureResult = "Capture range: 1...\(animal.captureRange), rolled: \(randomValue)"
            
            if randomValue <= animal.captureRange {
                captureSuccess = true
            } else {
                captureSuccess = false
            }
            
            showCaptureResult = true // THEN show the alert
            
        }
    }

}

#Preview {
    AnimalSelectionDetailsView(
        animals: .constant([.africa: [Animal(name: "Lion", image: "lion", space: "lion_space", diet: .carnivore, region: .africa, profit: 5, captureRange: 3, price: 10, cost: 8)]]),
        selectedContinent: .africa,
        animalIndex: 0,
        playerAnimals: .constant([:]),
        playerNames: ["Anon", "Aob"],
        currentPhase: TimePeriod.past,
        playerName: "Anon"
    )
}
