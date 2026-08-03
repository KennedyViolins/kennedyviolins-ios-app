//
//  Kennedy_Violin_Tuner_AppApp.swift
//  Kennedy Violin Tuner App
//

import SwiftUI
import AVFoundation

@main
struct Kennedy_Violin_Tuner_AppApp: App {

    init() {
        configureAudioSession()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    private func configureAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            // Use playAndRecord so the mic can be captured reliably while also playing clicks/tones
            try session.setCategory(.playAndRecord, mode: .default, options: [.mixWithOthers, .defaultToSpeaker, .allowBluetoothHFP])
            try session.setActive(true)
            print("Audio session configured for playAndRecord")
        } catch {
            print("Failed to configure audio session: \(error)")
        }
    }
}

