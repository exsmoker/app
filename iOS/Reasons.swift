import SwiftUI

struct Reasons: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Reasons")
                    .font(Font.title.bold())
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
            }
        }.onAppear {
            
        }.onChange(of: tab) {
            if $0 == 2 {
                
            }
        }
    }
}
