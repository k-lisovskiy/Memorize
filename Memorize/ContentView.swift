//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Lisovskiy on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    let vehicleEmogis = ["✈️", "🚗", "🚀", "🛥️", "🚘", "⛵️", "🚂", "🛵", "🚆", "🚇", "🚋", "🚜", "🚕", "🛴", "🛺", "🚲", "🏎️", "🚁", "🚃", "🚓", "🚒", "🚑", "🚌", "🚎", "🏍️", "🛻", "🛞", "🛳️", "🚅", "🛩️", "🚛", "🚙"]
    let helloweenEmojis = ["😈", "💀", "👻", "👽", "🎃", "👀", "🧛🏼‍♂️", "🧟‍♂️", "🧌", "🦇", "🐺", "🦂", "🪳", "🌙", "⚰️", "🪦", "🔮"]
    let flagEmojis = ["🏳️‍🌈", "🇺🇳", "🇦🇹", "🇧🇪", "🇧🇴", "🇧🇾", "🇨🇳", "🇨🇰", "🇨🇴", "🇨🇲", "🇨🇦", "🇩🇲", "🇬🇱", "🇬🇦", "🇭🇺", "🇫🇯", "🇱🇾", "🇰🇬", "🇲🇾", "🇳🇦", "🇳🇮", "🇳🇫", "🇲🇸", "🇲🇨", "🇷🇼", "🇷🇺", "🇷🇸", "🇱🇰", "🇨🇭"]
    @State var emojiCount = 16
    @State var emojis = ["✈️", "🚗", "🚀", "🛥️", "🚘", "⛵️", "🚂", "🛵", "🚆", "🚇", "🚋", "🚜", "🚕", "🛴", "🛺", "🚲", "🏎️", "🚁", "🚃", "🚓", "🚒", "🚑", "🚌", "🚎", "🏍️", "🛻", "🛞", "🛳️", "🚅", "🛩️", "🚛", "🚙"]
    @State var mainColor: Color = .red
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
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
                Spacer(minLength: 85)
                vechicleThemeButton
                Spacer()
                helloweenThemeButton
                Spacer()
                flagThemeButton
                Spacer(minLength: 85)
            }.font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(mainColor)
    }
    
    var vechicleThemeButton: some View {
        Button {
            emojis = vehicleEmogis.shuffled()
            mainColor = .red
            
        } label: {
            VStack {
                Image(systemName: "car.circle.fill")
                Text("Transport")
                    .font(.subheadline)
                    .frame(width: 80)
            }
            .foregroundColor(.red)
        }
    }
    var helloweenThemeButton: some View {
        Button {
            emojis = helloweenEmojis.shuffled()
            mainColor = .purple
            
        } label: {
            
            VStack {
                Image(systemName: "moon.stars.circle.fill")
                Text("Helloween")
                    .font(.subheadline)
                    .frame(width: 80)
            }
            .foregroundColor(.purple)
        }
    }
    var flagThemeButton: some View {
        Button {
            emojis = flagEmojis.shuffled()
            mainColor = .green
            
        } label: {
            VStack {
                Image(systemName: "flag.circle.fill")
                Text("Flags")
                    .font(.subheadline)
                    .frame(width: 80)
            }
            .foregroundColor(.green)
        }
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
