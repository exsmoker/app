import Foundation

enum Reason: CaseIterable, Identifiable {
    case
    health_respiratory,
    health_respiratoryA,
    health_respiratoryB,
    health_respiratoryC,
    health_respiratoryD,
    health_respiratoryE,
    health_respiratoryF,
    health_respiratoryG,
    health_respiratoryH,
    health_respiratoryI
    
    var id: Self {
        self
    }
    
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
