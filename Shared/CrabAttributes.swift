import ActivityKit
import Foundation

struct CrabAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable {
        let stateName: String
        let since: Date
    }
}
