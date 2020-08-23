import SwiftUI
import Core
import Balam
import Combine

final class Session: ObservableObject {
    @Published private(set) var user: User!
    private let session = Balam("Session")
    
    func load() {
        var sub: AnyCancellable?
        sub = session.nodes(User.self).sink {
            if let user = $0.first {
                self.user = user
            }
            sub?.cancel()
        }
    }
}
