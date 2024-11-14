// ContentView.swift by Gokhan Mutlu on 14.11.2024

import SwiftUI
import AVKit

struct ContentView: View {
	//player object (1/3)
	@State var player = AVPlayer(url:
		Bundle.main.url(forResource: "sun", withExtension: "mp4")!)
	
	var body: some View {
		TabView {
			VideoPlayerView()
				.tabItem {
					Label("Simple", systemImage: "sun.max")
						.foregroundStyle(.white)
				}
			
			VideoOverlayView()
				.tabItem {
					Label("Overlay", systemImage: "sun.horizon")
						.foregroundStyle(.white)
				}
			
			VideoMaterialsView()
				.tabItem {
					Label("Materials", systemImage: "sunglasses")
						.foregroundStyle(.white)
				}
			
		}
		.tint(Color.yellow)
	}
}

#Preview {
	ContentView()
}
