//
//  NewsView.swift
//  TheZoo
//
//  Created by 　金明毅 on 2025/4/26.
//

import SwiftUI

struct NewsView: View {
    var onDismiss: () -> Void
    
    @Binding var newsList: [News]
    @State private var news: News? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            
            Spacer()
            
            Text("News")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
            
            Spacer()
            
            if let news = news {
                Text(news.message)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .cornerRadius(10)
                
                Spacer()
                
                Text("Impact: \(news.impact)")
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))

            } else {
                Text("No news available.")
                    .font(.title2)
            }
            
            
            Button {
                onDismiss()
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
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGray6))
        .onAppear {
            if let randomIndex = newsList.indices.randomElement() {
                news = newsList.remove(at: randomIndex)
            }
            print("remaining news: ++++++++++++++++++")
            print(newsList)
        }
        

    }
}

#Preview {
    NewsView(onDismiss: {}, newsList: .constant([            News(
        message: "NHK reports: Tokyo Zoo reopened its doors after a prolonged closure due to the pandemic. During the closure time, it implemented a new AR and VR experience to reduce direct human and animal contact!",
        impact: "Future Zoo may not need to acquire animals due to the advancements in technology. By collaborating with game development companies and animal exporters, zoos can fulfil their moral vision while maintaining their educational function. The player who is closest to Japan can return one animal from their zoo."
    )]))
}
