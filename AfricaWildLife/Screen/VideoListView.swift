//
//  VideoListView.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 04/08/22.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES

    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hepticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }//: LOOP
            }//: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hepticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }//: ToolBarItem
            }
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
