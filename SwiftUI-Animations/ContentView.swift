//
//  ContentView.swift
//  SwiftUI-Animations
//
//  Created by Mehmet Deniz Cengiz on 10/2/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragamount  = CGSize.zero
    
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragamount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragamount = $0.translation }
                .onEnded { _ in
                    self.dragamount = .zero
                    self.enabled.toggle()
            }
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
