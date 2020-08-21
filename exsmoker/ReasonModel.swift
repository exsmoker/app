import Foundation

struct ReasonModel: Decodable, Identifiable, Hashable {
    let id: String
    let description: String
    let image: String
}
