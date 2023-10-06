import Kingfisher
import SwiftUI

struct AccountingListCardView: View {
    @State private var shouldExpand = true
    @State var accountingDetails: AccountingDetails
    var body: some View {
        HStack(alignment: .center){
            KFImage(URL(string: accountingDetails.avatarURL)!)
                .resizable()
                .cornerRadius(100.0)
                .frame(width:50, height: 50)
            
            Text(accountingDetails.title)
                .font(.headline)
            
            Spacer()
            
            Text(String(accountingDetails.totalBorrows))
                .foregroundColor(.green)
                .font(.caption)
                .bold()
            
            Text(String(accountingDetails.totalOwes))
                .foregroundColor(.red)
                .font(.caption2)
                .bold()
            
            Button(
                action: {
                    withAnimation{
                         shouldExpand.toggle()
                    }
                },
                label: {
                    Image(systemName: shouldExpand ?  "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
                        .foregroundColor(Color.gray)
                }
            ).font(.caption)
        }.padding()
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60), body: {
    AccountingListCardView(
        accountingDetails: AccountingDetails(
            title: "2023 八月貓貓養育金",
            avatarURL: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/86.png",
            totalBorrows: 100.12,
            totalOwes: 200.22,
            groupSpents: [
                GroupSpent(own: 0.0, borrowed: 100.0, name: "Ri"),
                GroupSpent(own: 100.0, borrowed: 0.0, name: "柑仔"),
                GroupSpent(own: 0.0, borrowed: 100.0, name: "妮娸"),
            ]
    ) )
})
