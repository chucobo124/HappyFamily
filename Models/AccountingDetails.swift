import Foundation

struct AccountingDetails {
    var title: String
    var avatarURL: String
    var totalBorrows: Float64
    var totalOwes: Float64
    var groupSpents: [GroupSpent]
}
