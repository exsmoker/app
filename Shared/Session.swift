import SwiftUI
import Core
import Balam
import Combine

final class Session: ObservableObject {
    @Published private(set) var user: User!
    let smoke = Smoke()
    private let session = Balam("Session")
    private let info = Balam("Info")
    
    func load() {
        var sub: AnyCancellable?
        sub = session.nodes(User.self).sink {
            if let user = $0.first {
                sub = self.info.nodes(Smoke.Info.self).sink {
                    self.smoke.info = $0.first!
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
        
        info.add(smoke.info)
    }
    
    func smoked(_ hit: Smoke.Hit) {
        smoke.info.hits.append(hit)
        info.update(smoke.info)
    }
    
    func craving(_ craving: Smoke.Craving) {
        smoke.info.cravings.append(craving)
        info.update(smoke.info)
    }
}
