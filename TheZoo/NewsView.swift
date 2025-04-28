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
            Text("📰 News")
                .font(.largeTitle)
                .bold()
            
            if let news = news {
                Text(news.message)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                Text(news.pastEffect)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                Text(news.presentEffect)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                Text(news.futureEffect)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text("No news available.")
                    .font(.title2)
            }
            
            Button("Got it") {
                onDismiss()
            }
            .font(.title2)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        .background(Color.white)
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
        message: "Example Message",
        pastEffect: "Effect in the past",
        presentEffect: "Effect in the present",
        futureEffect: "Effect in the future"
    )]))
}
