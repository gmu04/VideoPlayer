// VideoOverlayView.swift by Gokhan Mutlu on 14.11.2024

import SwiftUI
import AVKit

struct VideoOverlayView: View {
	//player object (1/3)
	@State var player = AVPlayer(url:
									Bundle.main.url(forResource: "sun", withExtension: "mp4")!)
	
	var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()
			
			//create a video-player user interface for the player object (2/3)
			VideoPlayer(player: player){
				ZStack(alignment: .bottomTrailing) {
					Color.clear
					Text("What a beautiful morning")
						.foregroundStyle(.black)
						.background(.white.opacity(0.6))
						.padding(.trailing, 5)
						.padding(.bottom, 5)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			}
			.frame(maxWidth: .infinity)
			.frame(height: 220)
			.onAppear{
				//play the video (3/3)
				player.seek(to: CMTime.zero)
				player.play()
			}
		}
	}
}

#Preview {
	VideoOverlayView()
}
