import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var previousTab = 0

    private let shopURL = URL(string: "https://kennedyviolins.com/pages/accessory-selection?utm_source=ios-app")!

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                LocalHTMLView(fileName: "tuner")
                    .navigationTitle("Tuner")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Tuner", systemImage: "tuningfork")
            }
            .tag(0)

            NavigationStack {
                LocalHTMLView(fileName: "metronome")
                    .navigationTitle("Metronome")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Metronome", systemImage: "music.note")
            }
            .tag(1)

            NavigationStack {
                VStack(spacing: 16) {
                    Image(systemName: "cart")
                        .font(.system(size: 48))
                        .foregroundStyle(.blue)

                    Text("Opening Kennedy Violins Store")
                        .font(.headline)

                    Button("Open Store") {
                        UIApplication.shared.open(shopURL)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .navigationTitle("Shop")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Shop", systemImage: "cart")
            }
            .tag(2)
        }
        .onChange(of: selectedTab) { _, newValue in
            if newValue == 2 {
                UIApplication.shared.open(shopURL)
                selectedTab = previousTab
            } else {
                previousTab = newValue
            }
        }
    }
}

#Preview {
    ContentView()
}
