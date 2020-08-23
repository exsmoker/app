import SwiftUI

@main struct App: SwiftUI.App {
    @UIApplicationDelegateAdaptor(Delegate.self) private var delegate
    @ObservedObject var session = Session()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if session.user == nil {
                    Onboard()
                        .environmentObject(session)
                } else {
                    Main()
                        .environmentObject(session)
                }
            }.onAppear {
                session.load()
            }
        }
    }
}

private final class Delegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "AccentColor")!
        return true
    }
}
