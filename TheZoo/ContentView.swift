//
//  ContentView.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/4/8.
//

import SwiftUI

struct ContentView: View {
    // for custom back button
    @Environment(\.dismiss) private var dismiss
    
    @State private var currentRound = 1
    @State private var currentPlayer = 0
    @State private var showNews = false
    @State private var showInfoSheet = false
    @State private var currentPhase = TimePeriod.past
    @State var freeAnimals : [Continent: [Animal]] = [Continent.africa: [], Continent.europe: [], Continent.asia: [], Continent.australia: [], Continent.northAmerica: [], Continent.southAmerica: []]
    @State var playerAnimals : [String: [Animal]] = [:]
    @State private var newsList : [News] = []
    @State private var showEndGameSheet = false

    @Binding var numberOfPlayers : Int
    var playerNames : [String]
    let presentRound : Int = 4
    let futureRound : Int = 7
    let endRound : Int = 11
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.africa, playerAnimals: $playerAnimals,
                                                                    playerName: playerNames[currentPlayer], currentPhase: currentPhase)) {
                        Text("Africa")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.europe, playerAnimals: $playerAnimals,
                                                                    playerName: playerNames[currentPlayer], currentPhase: currentPhase)) {
                        Text("Europe")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.asia, playerAnimals: $playerAnimals,
                                                                    playerName: playerNames[currentPlayer], currentPhase: currentPhase)) {
                        Text("Asia")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    
                }
                HStack {
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.australia, playerAnimals: $playerAnimals,
                                                                    playerName: playerNames[currentPlayer], currentPhase: currentPhase)) {
                        Text("Australia")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.northAmerica, playerAnimals: $playerAnimals,
                                                                    playerName: playerNames[currentPlayer], currentPhase: currentPhase)) {
                        Text("North America")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.southAmerica, playerAnimals: $playerAnimals,
                                                                    playerName: playerNames[currentPlayer], currentPhase: currentPhase)) {
                        Text("South America")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
                
                Text(currentPhase.description)
                    .font(.system(size: 30))
                    .padding(15)
                    .background(.orange)
                    .cornerRadius(10)
                
                Spacer()
                
                Text("\(playerNames[currentPlayer])")
                    .font(.system(size: 30))
                    .padding(15)
                    .background(.pink)
                    .cornerRadius(10)
                
                Spacer()
                
                Text("Round: \(currentRound)")
                    .font(.system(size: 30))
                
                Spacer()
                
                ScrollView {
                    LazyHStack {
                        ForEach(playerNames, id: \.self) { name in
                            NavigationLink(destination: PlayerAnimalsView(freeAnimals: $freeAnimals, playerAnimals: $playerAnimals, currentPlayerName: name)) {
                                Text(name)
                                    .font(.title2)
                                    .padding()
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                            
                            Divider()
                        }
                    }
                }
                
                
                Spacer()
                
                Button {
                    currentPlayer += 1
                    
                    // check if going to next round
                    if currentPlayer == numberOfPlayers {
                        // show Information sheet at the end of each round
                        showInfoSheet = true
                        
                        currentRound += 1
                        currentPlayer = 0
                                                
                        // show news at each 3 round
                        if currentRound % 3 == 0 {
                            showNews = true
                        }
                        
                        
                    }
                    
                } label: {
                    Text("Next")
                        .font(.title)
                }
                .sheet(isPresented: $showInfoSheet, onDismiss: { showInfoSheet = false
                    checkPhase()}) {
                        VStack(spacing: 20) {
                            if currentPhase == .past || currentPhase == .present {
                                Text("Profits!")
                                    .font(.headline)
                                
                                ForEach(Array(playerAnimals.keys), id: \.self) { name in
                                    if let animals = playerAnimals[name] {
                                        Text("Player: \(name)")
                                        Text("Profit: \(calculateProfit(animals: animals))")
                                    }
                                }
                            } else {
                                Text("Costs!")
                                    .font(.headline)
                                
                                ForEach(Array(playerAnimals.keys), id: \.self) { name in
                                    if let animals = playerAnimals[name] {
                                        Text("Player: \(name)")
                                        Text("Cost: \(calculateCost(animals: animals))")
                                    }
                                }
                            }
                            
                            Button("Got it") {
                                showInfoSheet = false
                            }
                            .font(.title2)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        .padding()
                    }
                .fullScreenCover(isPresented: $showNews) {
                    NewsView (onDismiss: { showNews = false },
                              newsList: $newsList)
                }
                .sheet(isPresented: $showEndGameSheet) {
                    VStack(spacing: 20) {
                        Text("Game Over!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Thanks for playing 🦁🐼🐘")
                            .font(.title2)
                        
                        Button("Return to Main Menu") {
                            // Dismiss or navigate back to root
                            dismiss()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding()
                }
                
                Spacer()
            }
            
            
            
        }
        .onFirstAppear {
            // add animal cards and news cards
            seedData()

            for i in 0..<numberOfPlayers {
                playerAnimals[playerNames[i]] = []
            }
            
            print(playerNames)
            print(playerAnimals)
            print(freeAnimals)
            print("number of players: " + String(numberOfPlayers))        }
        .onAppear {
            //            print("page loaded")
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Detail Title")
        // 1
        .toolbar {
            
            // 2
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    // 3
                    print("Custom Action")
                    dismiss()
                    
                } label: {
                    // 4
                    HStack {
                        
                        Image(systemName: "chevron.backward")
                        Text("Custom Back")
                    }
                }
            }
        }
    }
    
    func checkPhase() {
        if currentRound >= endRound {
            showEndGameSheet = true
        }else if currentRound >= futureRound {
            currentPhase = TimePeriod.future
        }else if currentRound >= presentRound {
            currentPhase = TimePeriod.present
        }
    }
    
    func calculateProfit(animals: [Animal]) -> String {
        var str = ""
        let regionCount = Set(animals.map { $0.region }).count
        let sum = animals.reduce(0) { $0 + $1.profit }

        for animal in animals {
            str.append("\(animal.name)(\(animal.profit)) ")
        }
        
        if regionCount >= 3 {
            str.append(" * Bonus = \(String(sum * 2))")
            return str
        } else {
            str.append(" = \(String(sum))")
            return str
        }
    }

    func calculateCost(animals: [Animal]) -> String {
        var str = ""
        let sum = animals.reduce(0) { $0 + $1.cost }
        
        for animal in animals {
            str.append("\(animal.name)(\(animal.cost)) ")
        }
        
        str.append(" = \(String(sum))")
        return str
    }
    
    func seedData() {
        freeAnimals[Continent.africa]!.append(Animal(name: "Lion", image: "lion", space: "green_3x3", diet: Diet.carnivore, region: .africa, profit: 4, captureRange: 3, price: 4, cost: 4))
        
        freeAnimals[Continent.africa]!.append(Animal(name: "Hippo", image: "fox", space: "green_2x2", diet: Diet.omnivore, region: .africa, profit: 2, captureRange: 4, price: 4, cost: 1))
        
        freeAnimals[Continent.africa]!.append(Animal(name: "Meerkat", image: "fox", space: "green_2x2", diet: Diet.omnivore, region: .africa, profit: 3, captureRange: 5, price: 4, cost: 2))
        
        freeAnimals[Continent.europe]!.append(Animal(name: "Red Fox", image: "fox", space: "green_3x3", diet: Diet.omnivore, region: .europe, profit: 2, captureRange: 5, price: 3, cost: 2))
        
        freeAnimals[Continent.europe]!.append(Animal(name: "Red Squirrel", image: "lion", space: "green_2x2", diet: Diet.herbivore, region: .europe, profit: 1, captureRange: 5, price: 2, cost: 1))
        
        freeAnimals[Continent.europe]!.append(Animal(name: "Brown Bear", image: "lion", space: "green_2x2", diet: Diet.omnivore, region: .europe, profit: 1, captureRange: 5, price: 1, cost: 1))
        
        freeAnimals[Continent.asia]!.append(Animal(name: "Grand Panda", image: "fox", space: "green_2x2", diet: Diet.herbivore, region: .asia, profit: 3, captureRange: 3, price: 4, cost: 3))
        
        freeAnimals[Continent.asia]!.append(Animal(name: "Golden Monkey", image: "lion", space: "green_3x3", diet: Diet.omnivore, region: .asia, profit: 3, captureRange: 4, price: 4, cost: 2))
        
        freeAnimals[Continent.asia]!.append(Animal(name: "Bengal Tiger", image: "lion", space: "green_3x3", diet: Diet.carnivore, region: .asia, profit: 3, captureRange: 3, price: 5, cost: 1))
        
        freeAnimals[Continent.australia]!.append(Animal(name: "Kangaroo", image: "lion", space: "green_3x3", diet: Diet.herbivore, region: .australia, profit: 1, captureRange: 5, price: 2, cost: 1))
 
        freeAnimals[Continent.australia]!.append(Animal(name: "Platypus", image: "lion", space: "green_3x3", diet: Diet.carnivore, region: .australia, profit: 3, captureRange: 3, price: 5, cost: 1))
        
        freeAnimals[Continent.australia]!.append(Animal(name: "Koala", image: "lion", space: "green_3x3", diet: Diet.herbivore, region: .australia, profit: 3, captureRange: 3, price: 4, cost: 1))
        
        freeAnimals[Continent.northAmerica]!.append(Animal(name: "Alligator", image: "lion", space: "green_3x3", diet: Diet.carnivore, region: .northAmerica, profit: 2, captureRange: 4, price: 3, cost: 2))
        
        freeAnimals[Continent.northAmerica]!.append(Animal(name: "Polar Bear", image: "lion", space: "green_3x3", diet: Diet.carnivore, region: .northAmerica, profit: 3, captureRange: 3, price: 3, cost: 3))
        
        freeAnimals[Continent.northAmerica]!.append(Animal(name: "Bison", image: "lion", space: "green_3x3", diet: Diet.herbivore, region: .northAmerica, profit: 2, captureRange: 5, price: 4, cost: 2))
        
        freeAnimals[Continent.southAmerica]!.append(Animal(name: "Toucan", image: "lion", space: "green_3x3", diet: Diet.omnivore, region: .southAmerica, profit: 2, captureRange: 5, price: 3, cost: 2))
        
        freeAnimals[Continent.southAmerica]!.append(Animal(name: "Jaguar", image: "lion", space: "green_3x3", diet: Diet.carnivore, region: .southAmerica, profit: 3, captureRange: 3, price: 4, cost: 2))
 
        freeAnimals[Continent.southAmerica]!.append(Animal(name: "Alpaca", image: "lion", space: "green_3x3", diet: Diet.herbivore, region: .southAmerica, profit: 1, captureRange: 5, price: 1, cost: 1))
        
        
        
        newsList.append(News(message: "Your zoos have to close because of protest", pastEffect: "lose one animal", presentEffect: "have no profit for this round", futureEffect: "no effect"))
        newsList.append(News(message: "This is the second news", pastEffect: "get one animal", presentEffect: "have double profit for this round", futureEffect: "no effect"))
        newsList.append(News(message: "This is the third news", pastEffect: "get one animal", presentEffect: "have double profit for this round", futureEffect: "no effect"))
        newsList.append(News(message: "This is the fourth news", pastEffect: "get one animal", presentEffect: "have double profit for this round", futureEffect: "no effect"))
    }
    
}

#Preview {
    ContentView(numberOfPlayers: .constant(2), playerNames: ["Joe", "Dan"])
}

public struct OnFirstAppearModifier: ViewModifier {
    
    private let onFirstAppearAction: () -> ()
    @State private var hasAppeared = false
    
    public init(_ onFirstAppearAction: @escaping () -> ()) {
        self.onFirstAppearAction = onFirstAppearAction
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                onFirstAppearAction()
            }
    }
}

extension View {
    func onFirstAppear(_ onFirstAppearAction: @escaping () -> () ) -> some View {
        return modifier(OnFirstAppearModifier(onFirstAppearAction))
    }
}

struct News : Identifiable {
    let id = UUID()
    let message : String
    let pastEffect : String
    let presentEffect : String
    let futureEffect : String
}

enum TimePeriod: String {
    case past, present, future
    
    var description: String {
        switch self {
        case .past: return "Past"
        case .present: return "Present"
        case .future: return "Future"
        }
    }
}

enum Continent: String {
    case africa, europe, asia, northAmerica, southAmerica, australia
    
    var description: String {
        switch self {
        case .africa: return "Africa"
        case .europe: return "Europe"
        case .asia: return "Asia"
        case .northAmerica: return "North America"
        case .southAmerica: return "South America"
        case .australia: return "Australia"
        }
    }
}

enum Diet: String {
    case carnivore, herbivore, omnivore
    
    var description: String {
        switch self {
        case .carnivore: return "Carnivore"
        case .herbivore: return "Herbivore"
        case .omnivore: return "Omnivore"
        }
    }
}


struct Animal : Identifiable{
    let id = UUID()
    let name : String
    let image : String
    let space : String
    let diet : Diet
    let region : Continent
    let profit : Int
    let captureRange : Int
    let price : Int
    let cost : Int
}
