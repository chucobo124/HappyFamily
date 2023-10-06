import Foundation

struct AccountingDetails {
    var uuid: String
    var title: String
    var avatarURL: String
    var totalBorrows: Float64
    var totalOwes: Float64
    var groupSpents: [GroupSpent]
}
