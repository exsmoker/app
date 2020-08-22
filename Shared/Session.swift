import SwiftUI
import Core

final class Session: ObservableObject {
    @Published private(set) var user = User()
    
    func load() {
        user.name = "John Appleseed"
        user.location = "Berlin, Germany"
    }
}
