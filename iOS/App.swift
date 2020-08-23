import SwiftUI

@main struct App: SwiftUI.App {
    private let session = Session()
    
    var body: some Scene {
        WindowGroup {
            if session.user == nil {
                Onboard()
                    .environmentObject(session)
                    .onAppear {
                        session.load()
                    }
            } else {
                Main()
                    .environmentObject(session)
            }
        }
    }
}
