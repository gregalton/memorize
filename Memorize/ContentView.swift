//
//  ContentView.swift
//  Memorize
//
//  Created by Greg Alton on 10/20/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚘", "🚚", "🚀", "✈️", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🩼", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵"]
    @State var emojiCount = 3
    
    var remove: some View {
        //Remove Card Button
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.square")
        }
    }
    
    var add: some View {
        //Add Card Button
        Button {
            if emojiCount < emojis.count - 1 {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.square")
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0...emojiCount], id: \.self, content: { emoji in
                    CardView(content: emoji)
                })
            }
            Spacer()
            // Add and Remove Buttons
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 2.0)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        }
        .padding()
        .foregroundColor(.brown)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
