//
//  EmojiView.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-22.
//

import SwiftUI

struct EmojiView: View {
    var rating : Int16
    var body: some View {
        switch rating
        {
        case 1:
            return Text("😞")
        case 2:
            return Text("😐")
        case 3:
            return Text("🙂")
        case 4:
            return Text("☺️")
        default:
            return Text("🤩")
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(rating: 3)
    }
}
