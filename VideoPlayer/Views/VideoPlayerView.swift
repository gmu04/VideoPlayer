// VideoPlayerView.swift by Gokhan Mutlu on 14.11.2024

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	//player object (1/3)
	@State var player = AVPlayer(url:
		Bundle.main.url(forResource: "sun", withExtension: "mp4")!)
	
	var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()

			VStack {
				Text("Simple VideoPlayer")
					.padding(.bottom, 10)
					.font(.title2)
					.foregroundStyle(.white)
					.frame(maxWidth: .infinity)
					.background(.gray.opacity(0.4))
				
				//create a video-player user interface for the player object (2/3)
				VideoPlayer(player: player)
					.frame(maxWidth: .infinity)
					.frame(height: 220)
					.onAppear{
						//play the video (3/3)
						player.seek(to: CMTime.zero)
						player.play()
					}
				
				Spacer()
			}
		}
	}
}

#Preview {
    VideoPlayerView()
}
