//
//  CardItem.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 13.03.2022.
//

import SwiftUI
import CachedAsyncImage

struct CardItem: View {
    var card: Card
    var body: some View
    {
        VStack(alignment: .center)
        {
            CachedAsyncImage(
                url: URL(string: card.image),
                content: { image in
                    image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(15)
                },
                placeholder: {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.fieldsMainGreenColor))
                }
            )
            .padding()
            
            Text(card.name)
                .foregroundColor(.white)
                .font(.title2)
        }
        .padding()
    }
}

struct CardItem_Previews: PreviewProvider
{
    static var previews: some View
    {
        CardItem(card: Card.init(image: "https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Mahadev-Bhagwan-Photo-for-Devotee.jpg", name: "Card"))
            .preferredColorScheme(.dark)
    }
}
