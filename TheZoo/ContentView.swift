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
//    @State private var currentPlayer = 0
    @State private var showNews = false
    @State private var showInfoSheet = false
    @State private var currentPhase = TimePeriod.past
    @State var freeAnimals : [Continent: [Animal]] = [Continent.africa: [], Continent.europe: [], Continent.asia: [], Continent.australia: [], Continent.northAmerica: [], Continent.southAmerica: []]
    @State var playerAnimals : [String: [Animal]] = [:]
    @State private var newsList : [News] = []
    @State private var showEndGameSheet = false
    @State private var showingConfirmation = false

    @Binding var numberOfPlayers : Int
    var playerNames : [String]
    let futureRound : Int = 6
    let endRound : Int = 11
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack{
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.africa, playerAnimals: $playerAnimals, playerNames: playerNames, currentPhase: currentPhase)) {
                        HStack {
                            Image(systemName: "globe.europe.africa.fill")
                            Text("Africa")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.white)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .cornerRadius(10)
                    }
                    .buttonStyle(PressableButtonStyle())
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.europe, playerAnimals: $playerAnimals,
                                                                    playerNames: playerNames, currentPhase: currentPhase)) {
                        HStack {
                            Image(systemName: "globe.europe.africa.fill")
                            Text("Europe")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color.white)
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                            .cornerRadius(10)
                    }
                                                                    .buttonStyle(PressableButtonStyle())

                }
                HStack {
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.asia, playerAnimals: $playerAnimals,
                                                                    playerNames: playerNames, currentPhase: currentPhase)) {
                        HStack {
                            Image(systemName: "globe.asia.australia.fill")
                            Text("Asia")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.white)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .cornerRadius(10)
                    }
                                                                    .buttonStyle(PressableButtonStyle())
                    
                    
                    
                    
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.australia, playerAnimals: $playerAnimals,
                                                                    playerNames: playerNames, currentPhase: currentPhase)) {
                        HStack {
                            Image(systemName: "globe.asia.australia.fill")
                            Text("Australia")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color.white)
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                            .cornerRadius(10)
                    }
                                                                    .buttonStyle(PressableButtonStyle())

                }
                
                HStack {
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.northAmerica, playerAnimals: $playerAnimals,
                                                                    playerNames: playerNames, currentPhase: currentPhase)) {
                        HStack {
                            Image(systemName: "globe.americas.fill")
                            Text("N. America")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.white)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .cornerRadius(10)
                    }
                                                                    .buttonStyle(PressableButtonStyle())
                    NavigationLink(destination: AnimalSelectionView(animals: $freeAnimals, selectedContinent: Continent.southAmerica, playerAnimals: $playerAnimals,
                                                                    playerNames: playerNames, currentPhase: currentPhase)) {
                        HStack {
                            Image(systemName: "globe.americas.fill")
                            Text("S. America")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(uiColor: .systemGray))
                        }
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.white)
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        .cornerRadius(10)
                    }
                                                                    .buttonStyle(PressableButtonStyle())
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("TIME")
                        Spacer()
                    }
                    .foregroundColor(Color(uiColor: .systemGray))
                    
                    HStack {
                        Image(systemName: "gauge.with.needle.fill")
                        Text(currentPhase.description)
                            .font(.title)
                        
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                }
                

                Spacer()
                
                VStack {
                    HStack {
                        Text("ROUND")
                        Spacer()
                    }
                    .foregroundColor(Color(uiColor: .systemGray))
                    HStack {
                        Image(systemName: "number.circle.fill")
                        Text("\(currentRound)")
                            .font(.title)
                    }
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                }
                
                                
                Spacer()
                
                VStack {
                
                    HStack {
                        HStack {
                            Text("ANIMAL COLLECTIONS")
                                .foregroundColor(Color(uiColor: .systemGray))
                            Spacer()
                        }
                    }
                    
                    VStack { }
                        .frame(maxWidth: .infinity, maxHeight: 0.5)
                        .background(Color(uiColor: .systemGray))
                    
                    ScrollView {
                        LazyHStack {
                            ForEach(playerNames, id: \.self) { name in
                                NavigationLink(destination: PlayerAnimalsView(freeAnimals: $freeAnimals, playerAnimals: $playerAnimals, currentPlayerName: name)) {
                                    HStack {
                                        Image(systemName: "person.fill")
                                        Text(name)
                                        Image(systemName: "chevron.right")
                                        
                                    }
                                }
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .background(Color.white)
                                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                .cornerRadius(10)
                                .buttonStyle(PressableButtonStyle())
                                
                                Divider()
                            }
                        }
                    }
                    .frame(maxHeight: 55)
                    
                    VStack { }
                        .frame(maxWidth: .infinity, maxHeight: 0.5)
                        .background(Color(uiColor: .systemGray))
                }
                
                
                Spacer()
                
                HStack {
                    Button {
                        if currentRound > 1 {
                            currentRound -= 1
                            checkPhase()
                        }
                        
                    } label: {
                        HStack {
//                            Image(systemName: "arrowshape.left.fill")
                            Text("PREV ROUND")
                        }
                        .font(.title3)
                        .bold()
                        .padding(15)
                        .background(.pink)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                    .buttonStyle(PressableButtonStyle())
                    
                    Button {
                        showInfoSheet = true
                        
                        currentRound += 1
                        
                        // show news at each 3 round
                        if currentRound % 2 == 1 && currentRound >= 3 && currentRound < endRound {
                            showNews = true
                        }
                        
                    } label: {
                        HStack {
//                            Image(systemName: "arrowshape.right.fill")
                            Text("NEXT ROUND")
                        }
                        .font(.title3)
                        .bold()
                        .padding(15)
                        .background(.green)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                    .buttonStyle(PressableButtonStyle())
                    .sheet(isPresented: $showInfoSheet, onDismiss: { showInfoSheet = false
                        checkPhase()}) {
                            VStack(spacing: 20) {
                                Spacer()
                                
                                if currentPhase == .past {

                                    Text("Profits!")
                                        .font(.largeTitle)
                                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                        .bold()
                                    
                                    Spacer()
                                    
                                    ForEach(Array(playerAnimals.keys), id: \.self) { name in
                                        if let animals = playerAnimals[name] {
                                            
                                            HStack {
                                                Text("Player: \(name)")
                                                    .font(.title2)
                                                Spacer()
                                            }
                                            .bold()
                                            .foregroundColor(Color(uiColor: .systemGray))
                                            
                                            Text("Profit: \(calculateProfit(animals: animals))")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color.white)
                                                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                                .cornerRadius(10)
                                        }
                                    }
                                } else {
                                    Text("Costs!")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))

                                    Spacer()
                                    
                                    ForEach(Array(playerAnimals.keys), id: \.self) { name in
                                        if let animals = playerAnimals[name] {
                                            
                                                HStack {
                                                    Text("Player: \(name)")
                                                        .font(.title2)
                                                    Spacer()
                                                }
                                                .bold()
                                                .foregroundColor(Color(uiColor: .systemGray))
                                                
                                                Text("Cost: \(calculateCost(animals: animals))")
                                                    .font(.title2)
                                                    .fontWeight(.bold)
                                                    .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(Color.white)
                                                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                                                    .cornerRadius(10)
                                            
                                        }
                                    }
                                }
                                
                                Spacer()
                                
                                Button {
                                    showInfoSheet = false
                                } label: {
                                    HStack {
                                        Image(systemName: "checkmark")
                                        Text("GOT IT")
                                    }
                                    .font(.title3)
                                    .bold()
                                    .padding(15)
                                    .background(.blue)
                                    .foregroundStyle(.white)
                                    .cornerRadius(10)
                                }
                                .buttonStyle(PressableButtonStyle())
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(uiColor: .systemGray6))
                            
                            
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
                                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))

                            
                            Text("Thanks for playing 🦁🐼🐘")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))

                            
                            Button {
                                // Dismiss or navigate back to root
                                dismiss()                            } label: {
                                    HStack {
                                        Image(systemName: "arrowshape.turn.up.backward.fill")
                                        Text("MAIN MENU")
                                    }
                                    .font(.title3)
                                    .bold()
                                    .padding(15)
                                    .background(.blue)
                                    .foregroundStyle(.white)
                                    .cornerRadius(10)
                                }
                                .buttonStyle(PressableButtonStyle())

                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(uiColor: .systemGray6))
                    }
                    
                }
                

                
            }
            .background(Color(uiColor: .systemGray6))
            
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
        .navigationTitle("Back")
        // 1
        .toolbar {
            
            // 2
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    // 3
//                    dismiss()
                    showingConfirmation = true
                    
                } label: {
                    // 4
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Exit")
                    }
                }
                .confirmationDialog("End the game?", isPresented: $showingConfirmation) {
                    Button("Confirm") { dismiss() }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("End the game?")
                }
            }
        }
    }
    
    func checkPhase() {
        if currentRound >= endRound {
            showEndGameSheet = true
        }else if currentRound >= futureRound && currentRound < endRound {
            currentPhase = TimePeriod.future
        }else if currentRound < futureRound {
            currentPhase = TimePeriod.past
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
        freeAnimals[Continent.africa]!.append(Animal(name: "Lion", image: "lion", space: "lion_space", diet: Diet.carnivore, region: .africa, profit: 4, captureRange: 3, price: 4, cost: 4))

        freeAnimals[Continent.africa]!.append(Animal(name: "Hippopotamus", image: "hippo", space: "hippo_space", diet: Diet.omnivore, region: .africa, profit: 2, captureRange: 4, price: 4, cost: 1))
        
        freeAnimals[Continent.africa]!.append(Animal(name: "Meerkat", image: "meerkat", space: "meerkat_space", diet: Diet.omnivore, region: .africa, profit: 3, captureRange: 5, price: 4, cost: 2))
        
        
        freeAnimals[Continent.europe]!.append(Animal(name: "Red Fox", image: "red_fox", space: "red_fox_space", diet: Diet.omnivore, region: .europe, profit: 2, captureRange: 5, price: 3, cost: 2))
        
        freeAnimals[Continent.europe]!.append(Animal(name: "Red Squirrel", image: "red_squirrel", space: "red_squirrel_space", diet: Diet.herbivore, region: .europe, profit: 1, captureRange: 5, price: 2, cost: 1))
        
        freeAnimals[Continent.europe]!.append(Animal(name: "Brown Bear", image: "brown_bear", space: "brown_bear_space", diet: Diet.omnivore, region: .europe, profit: 1, captureRange: 5, price: 1, cost: 1))
        
        
        freeAnimals[Continent.asia]!.append(Animal(name: "Grand Panda", image: "grand_panda", space: "grand_panda_space", diet: Diet.herbivore, region: .asia, profit: 3, captureRange: 3, price: 4, cost: 3))
        
        freeAnimals[Continent.asia]!.append(Animal(name: "Golden Monkey", image: "golden_monkey", space: "golden_monkey_space", diet: Diet.omnivore, region: .asia, profit: 3, captureRange: 4, price: 4, cost: 2))
        
        freeAnimals[Continent.asia]!.append(Animal(name: "Bengal Tiger", image: "bengal_tiger", space: "bengal_tiger_space", diet: Diet.carnivore, region: .asia, profit: 3, captureRange: 3, price: 5, cost: 1))
        
        
        freeAnimals[Continent.australia]!.append(Animal(name: "Kangaroo", image: "kangaroo", space: "kangaroo_space", diet: Diet.herbivore, region: .australia, profit: 1, captureRange: 5, price: 2, cost: 1))
 
        freeAnimals[Continent.australia]!.append(Animal(name: "Platypus", image: "platypus", space: "platypus_space", diet: Diet.carnivore, region: .australia, profit: 3, captureRange: 3, price: 5, cost: 1))
        
        freeAnimals[Continent.australia]!.append(Animal(name: "Koala", image: "koala", space: "koala_space", diet: Diet.herbivore, region: .australia, profit: 3, captureRange: 3, price: 4, cost: 1))
        
        
        freeAnimals[Continent.northAmerica]!.append(Animal(name: "Alligator", image: "alligator", space: "alligator_space", diet: Diet.carnivore, region: .northAmerica, profit: 2, captureRange: 4, price: 3, cost: 2))
        
        freeAnimals[Continent.northAmerica]!.append(Animal(name: "Polar Bear", image: "polar_bear", space: "polar_bear_space", diet: Diet.carnivore, region: .northAmerica, profit: 3, captureRange: 3, price: 3, cost: 3))
        
        freeAnimals[Continent.northAmerica]!.append(Animal(name: "Bison", image: "bison", space: "bison_space", diet: Diet.herbivore, region: .northAmerica, profit: 2, captureRange: 5, price: 4, cost: 2))
        
        
        freeAnimals[Continent.southAmerica]!.append(Animal(name: "Toucan", image: "toucan", space: "toucan_space", diet: Diet.omnivore, region: .southAmerica, profit: 2, captureRange: 5, price: 3, cost: 2))
        
        freeAnimals[Continent.southAmerica]!.append(Animal(name: "Jaguar", image: "jaguar", space: "jaguar_space", diet: Diet.carnivore, region: .southAmerica, profit: 3, captureRange: 3, price: 4, cost: 2))
 
        freeAnimals[Continent.southAmerica]!.append(Animal(name: "Alpaca", image: "alpaca", space: "alpaca_space", diet: Diet.herbivore, region: .southAmerica, profit: 1, captureRange: 5, price: 1, cost: 1))
        
        
        
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))
        newsList.append(News(message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!", impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."))
        newsList.append(News(message: "The BBC reports that London Zoo has initiated a new program to save native UK species. London Zoo is gradually phasing out foreign wildlife and focusing on implementing programs that have a positive impact on local species.", impact: "Future Zoo may focus more on the local animals rather than foreign wildlife. It marks a step forward in decolonising and decommodifying animals. The player who is closest to the United Kingdom gains animals from Europe at no cost."))


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
    let impact : String

}

enum TimePeriod: String {
    case past, future
    
    var description: String {
        switch self {
        case .past: return "Colonial Time"
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
