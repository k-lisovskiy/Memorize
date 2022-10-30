//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Lisovskiy on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚗", "🚀", "🛥️", "🚘", "⛵️", "🚂", "🛵", "🚆", "🚇", "🚋", "🚜", "🚕", "🛴", "🛺", "🚲", "🏎️", "🚁", "🚃", "🚓", "🚒", "🚑", "🚌", "🚎", "🏍️", "🛻", "🛞", "🛳️", "🚅", "🛩️", "🚛", "🚙"]
    @State var emojiCount = 15
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack{
                
                removeButton
                Spacer()
                addButton
            }.font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    var removeButton: some View {
//        var enabled: Bool {emojiCount > 2}
        return Button {
            emojiCount -= 1
        } label: {
            Image(systemName: "minus.circle.fill")
            
        }
//        .disabled(!enabled)
    }
    var addButton: some View {
//        var enabled: Bool {emojiCount < emojis.count}
        return Button {
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle.fill")
        }
//        .disabled(!enabled)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let Shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                Shape.fill().foregroundColor(.white)
                Shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                Shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
