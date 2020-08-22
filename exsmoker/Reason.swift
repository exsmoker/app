import Foundation

enum Reason: CaseIterable {
    case
    health_respiratory
    
    var image: String {
        "reason_\(self)"
    }
    
    var title: String {
        "Reason.title.\(self)"
    }
    
    var subtitle: String {
        "Reason.subtitle.\(self)"
    }
    
    var description: String {
        "Reason.description.\(self)"
    }
}
