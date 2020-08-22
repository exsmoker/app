import SwiftUI

@main struct App: SwiftUI.App {
    private let session = Session()
    
    var body: some Scene {
        WindowGroup {
            Main()
                .environmentObject(session)
                .onAppear {
                    session.load()
                }
        }
    }
}
