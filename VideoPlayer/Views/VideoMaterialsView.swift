// VideoMaterialsView.swift by Gokhan Mutlu on 14.11.2024

import SwiftUI
import AVFoundation
import RealityKit

struct VideoMaterialsView: View {

	//player object (1/3)
	@State var player = AVPlayer(url:
									Bundle.main.url(forResource: "sun", withExtension: "mp4")!)

    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()

			VStack {
				Text("Video Materials")
					.padding(.bottom, 10)
					.font(.title2)
					.foregroundStyle(.white)
					.frame(maxWidth: .infinity)
					.background(.gray.opacity(0.4))
				
				//create a AR video-player user interface for the player object (2/3)
				ARVideoPlayerView(player)
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
    VideoMaterialsView()
}


struct ARVideoPlayerView: UIViewRepresentable{
	
	typealias UIViewType = ARView
	private let player:AVPlayer
	
	init(_ player:AVPlayer) {
		self.player = player
	}
	
	func makeUIView(context: Context) -> ARView {
		let arView = ARView(frame: .zero)
		
		//TODO: Connect/select a real device, or select Any iOS device, if you see the following error
		//	"No exact matches in call to initializer"
		let anchor = AnchorEntity(plane:AnchoringComponent.Target.Alignment.vertical)
		
		//create meterial to run a video
		let videoMaterial = VideoMaterial(avPlayer: player)
		//if video has a sound
		videoMaterial.controller.audioInputMode = .spatial
		
		
		let modelEntity = ModelEntity(mesh: MeshResource.generatePlane(width: 0.7, depth: 0.5), materials: [videoMaterial])
		
		//player.play()
		
		anchor.addChild(modelEntity)
		arView.scene.addAnchor(anchor)
		
		return arView
	}
	
	func updateUIView(_ uiView: ARView, context: Context) {
		
	}
}
