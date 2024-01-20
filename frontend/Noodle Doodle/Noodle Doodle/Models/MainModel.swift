import Foundation

struct CookRequest: Codable {
    var spiceLevel: Int
}

struct CookResponse: Codable {
    var success: Bool
    var message: String
}
