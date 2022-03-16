//
//  ImageRow.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 15.03.2022.
//

import SwiftUI

struct CustomCardsScroll: View {
    var images: [Card]
    
    let columns = [
        GridItem(.fixed(200)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(images) { item in
                    VStack(alignment: .center) {
                        NavigationLink(destination: CardContent(data: item)) {
                            CardItem(card: item)
                        }.padding(10)
                    }
                }
            }
        }
        .frame(maxHeight: 500)
    }
}

#if DEBUG
struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardsScroll(images: [Card(image: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80", name: "one"),
                          Card(image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg", name: "two"),
                          Card(image: "https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?k=20&m=1093110112&s=612x612&w=0&h=3OhKOpvzOSJgwThQmGhshfOnZTvMExZX2R91jNNStBY=", name: "three"),
                          Card(image: "https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312?b=1&k=20&m=1322104312&s=170667a&w=0&h=VQyPkFkMKmo0e4ixjhiOLjiRs_ZiyKR_4SAsagQQdkk=", name: "four"),
                          Card(image: "https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?k=20&m=1093110112&s=612x612&w=0&h=3OhKOpvzOSJgwThQmGhshfOnZTvMExZX2R91jNNStBY=", name: "three"),
                          Card(image: "https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312?b=1&k=20&m=1322104312&s=170667a&w=0&h=VQyPkFkMKmo0e4ixjhiOLjiRs_ZiyKR_4SAsagQQdkk=", name: "four")
                         ]
        )
            .preferredColorScheme(.dark)
    }
}
#endif

