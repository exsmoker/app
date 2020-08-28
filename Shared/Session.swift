import SwiftUI
import Core
import Balam
import Combine

final class Session: ObservableObject {
    @Published private(set) var user: User!
    let smoke = Smoke()
    private let session = Balam("Session")
    private let stats = Balam("Stats")
    
    func load() {
        var sub: AnyCancellable?
        sub = session.nodes(User.self).sink {
            if let user = $0.first {
                sub = self.stats.nodes(Smoke.Hit.self).sink {
                    self.smoke.hits = $0.sorted { $0.date < $1.date }
                    self.user = user
                    sub?.cancel()
                }
            } else {
                sub?.cancel()
            }
        }
    }
    
    func create(_ name: String, location: String, price: Double, quantity: Int, currency: User.Currency) {
        var user = User()
        user.name = name.isEmpty ? NSLocalizedString("Cezz.appleseed", comment: "") : name
        user.location = location.isEmpty ? NSLocalizedString("Berlin.germany", comment: "") : location
        user.price = price
        user.quantity = quantity
        user.currency = currency
        session.add(user)
        self.user = user
        
        smoke.hits = [.init(.none)]
        stats.add(smoke.hits.last!)
    }
    
    func smoked(_ hit: Smoke.Hit) {
        smoke.hits.append(hit)
        stats.add(hit)
    }
}
