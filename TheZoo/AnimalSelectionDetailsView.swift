import SwiftUI

struct AnimalSelectionDetailsView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding var animals: [Continent: [Animal]]
    let selectedContinent: Continent
    let animalIndex: Int
    @Binding var playerAnimals: [String: [Animal]]
    let playerName: String
    let currentPhase: TimePeriod
    
    @State private var showConfirmation = false
    @State private var showCaptureResult = false
    @State private var captureSuccess = false
    @State private var isCapturing = false
    
    @State private var captureResult : String = ""
    
    var body: some View {
        Text("Player: \(playerName)")
            .font(.title)
        if animalIndex < (animals[selectedContinent]?.count ?? 0),
           let animal = animals[selectedContinent]?[animalIndex] {
            
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
                Text("Profit: \(animal.profit)")
                Text("Capture Range: 1...\(animal.captureRange)")
                Text("Cost: \(animal.cost)")
                
                
                if currentPhase == .present {
                    // Buy Button
                    Button("Buy") {
                        showConfirmation = true
                    }
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .alert("Confirm Purchase", isPresented: $showConfirmation) {
                        Button("Confirm", role: .none) {
                            buyAnimal()
                        }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Do you want to buy \(animal.name) for \(animal.cost) coins?")
                    }
                } else if currentPhase == .past {
                    // Capture Button
                    Button("Capture") {
                        isCapturing = true
                        attemptCapture(for: animal)
                    }
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .alert(isPresented: $showCaptureResult) {
                        if captureSuccess {
                            return Alert(title: Text("Success!"), message: Text("You captured \(animal.name)! \(captureResult)"), dismissButton: .default(Text("OK")) {
                                let capturedAnimal = animals[selectedContinent]!.remove(at: animalIndex)
                                playerAnimals[playerName, default: []].append(capturedAnimal)
                                dismiss()
                            })
                        } else {
                            return Alert(title: Text("Failed"), message: Text("The \(animal.name) escaped! \(captureResult)"), dismissButton: .default(Text("OK")) {
                                dismiss()
                            })
                        }
                    }
                    .disabled(isCapturing)
                    if isCapturing {
                        ProgressView("Capturing...")
                            .padding()
                    }
                }
            }
            .padding()
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
        playerName: "Anon",
        currentPhase: TimePeriod.past
    )
}
