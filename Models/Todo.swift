import Foundation

struct Todo: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool
    var onChainStatus: OnChainStatus
    
    enum OnChainStatus: Codable {
        case notCarved
        case carving
        case carved(txHash: String)
    }
} 