import Foundation

extension Triggers {
    enum Event: Identifiable {
        case
        craving,
        smoked
        
        var id: Self {
            self
        }
        
        var name: String {
            switch self {
            case .craving: return "Craving"
            case .smoked: return "Smoked"
            }
        }
    }
}
