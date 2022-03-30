//
//  CardContent.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 13.03.2022.
//

import SwiftUI

struct CardContent: View {
    var data: Card
    @EnvironmentObject var user: UserDetailsViewModel
    var downloads: [Download]
    var body: some View
    {
        ScrollView
        {
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text(data.name)
                        .font(.title.bold())
                        .foregroundColor(Color.white)
                    Text("Readings")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }
                Spacer()
                VStack {
                    Spacer()
                    Text(user.userInfo?.username ?? "Username")
                        .foregroundColor(.white)
                        .font(.title3)
                    Spacer()
                }
                if let userImageData = user.userInfo?.image {
                    Image(uiImage: UIImage(data: userImageData)!)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                } else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .background()
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                }
            }
            .padding()
            VStack(spacing: 20){
                GraphView()
                    .padding(.top, 20)
            }
            .padding()
            .background(Color.cardBackgroundColor)
            .cornerRadius(18)
            Spacer()
        }
        .background(Color.mainDarkBlueBackgroundColor.ignoresSafeArea())
        .onAppear {
            user.onAppear()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension CardContent
{
    @ViewBuilder
    func GraphView() -> some View{
        GeometryReader { proxy in
            ZStack
            {
                VStack
                {
                    ForEach(getGraphLines(), id: \.self) { line in
                        HStack(spacing: 8)
                        {
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: -15)
                    }
                }
                
                HStack
                {
                    ForEach(downloads) { download in
                        VStack
                        {
                            VStack(spacing: 5)
                            {
                                Capsule()
                                    .fill(Color.green)
                                Capsule()
                                    .fill(Color.yellow)
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: download.downloads, size: proxy.size))
                            
                            Text(download.weekday)
                                .foregroundColor(Color.white)
                                .font(.caption2.bold())
                                .frame(height: 25, alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding(.leading, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 190)
    }
    
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max = getMax()
        let height = (point / max) * (size.height - 30)
        return height
    }
    
    func getGraphLines() -> [CGFloat] {
        let max = getMax()
        var lines: [CGFloat] = []
        lines.append(max)
        for index in 1...4 {
            let progress = max / 4
            lines.append(max - (progress * CGFloat(index)))
        }
        return lines
    }
    
    func getMax() -> CGFloat {
        let max = downloads.max { first, second in
            return second.downloads > first.downloads
        }?.downloads ?? 0
        
        return max
    }
}

struct CardContent_Previews: PreviewProvider {
    static var previews: some View {
        CardContent(data: Card(image: "https://photoscissors.com/images/samples/3-before.jpg", name: "name"), downloads: downloads)
            .environmentObject(UserDetailsViewModel())
    }
}
