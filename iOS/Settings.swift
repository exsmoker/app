import SwiftUI

struct Settings: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 30)
            ZStack {
                HStack {
                    Spacer()
                    Control.Icon(image: "cart.fill", color: .accentColor) {
                        
                    }.padding()
                }
                if !session.user.premium {
                    Premium()
                } else {
                    Free()
                }
            }
            
            Profile()
            Control.Icon(image: "dial.min.fill", color: .accentColor) {
                
            }.padding()
            
        }
    }
}
