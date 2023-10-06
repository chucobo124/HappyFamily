import Kingfisher
import SwiftUI

struct AccountingListCardView: View {
    @State private var shouldExpand = true
    @State var accountingDetails: AccountingDetails
    var body: some View {
        VStack(alignment: .leading) {
              // Card Details
              HStack(alignment: .center){
                KFImage(URL(string: accountingDetails.avatarURL)!)
                    .resizable()
                    .cornerRadius(100.0)
                    .frame(width:50, height: 50)
                
                Text(accountingDetails.title)
                    .font(.headline)
                
                Spacer()
                
                HStack(){
                    Text(String(accountingDetails.totalBorrows))
                        .foregroundColor(.green)
                        .font(.caption)
                        .bold()
                    
                    Text(String(accountingDetails.totalOwes))
                        .foregroundColor(.red)
                        .font(.caption2)
                        .bold()
                }.frame(width: 100)
                
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
            }
            
            // Expand Info
            VStack() {
                ForEach (accountingDetails.groupSpents, id: \.name) { spent in
                    HStack() {
                        KFImage(URL(string: spent.avatarURL))
                            .resizable()
                            .cornerRadius(100.0)
                            .frame(width:30, height: 30)
                        Text(spent.name).foregroundColor(.gray)
                        Spacer()
                        HStack(){
                            Text(String(spent.borrowed))
                                .foregroundColor(.green)
                                .font(.caption2)
                                .bold()
                            Spacer()
                            Text(String(spent.owes))
                                .foregroundColor(.red)
                                .font(.caption)
                                .bold()
                        }.frame(width: 90)
                    }.padding(.leading, 60)
                        .padding(.trailing, 30)
                }
            }
            .frame(height: shouldExpand ? nil : 0, alignment: .top)
            .clipped()
        }.padding()
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 200), body: {
    AccountingListCardView(
        accountingDetails: AccountingDetails(
            uuid: "3gxd",
            title: "2023 八月貓貓養育金",
            avatarURL: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/86.png",
            totalBorrows: 200.0,
            totalOwes: 100.21,
            groupSpents: [
                GroupSpent(
                    avatarURL: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/85.png" ,
                    owes: 0.0,
                    borrowed: 100.0,
                    name: "Ri"
                ),
                GroupSpent(
                    avatarURL: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/84.png" ,
                    owes: 100.21,
                    borrowed: 0.0,
                    name: "柑仔"
                ),
                GroupSpent(
                    avatarURL: "https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/male/83.png" ,
                    owes: 0.0,
                    borrowed: 100.0,
                    name: "妮娸"
                ),
            ]
    ) )
})
