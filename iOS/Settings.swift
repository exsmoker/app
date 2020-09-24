import SwiftUI

struct Settings: View {
    @EnvironmentObject var session: Session
    @Binding var tab: Int
    @State private var average = ""
    @State private var price = ""
    @State private var currency = ""
    
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
                if session.user.premium {
                    Premium()
                } else {
                    Free()
                }
            }
            Profile()
            Control.Icon(image: "dial.min.fill", color: .accentColor) {
                
            }.padding()
            Spacer()
                .frame(height: 30)
            Item(title: "Cigarettes.daily", value: average) {
                
            }
            Item(title: "Currency", value: currency) {
                
            }
            Item(title: "Cost.per.cigarette", value: price) {
                
            }
        }.onAppear {
            if tab == 4 {
                update()
            }
        }.onChange(of: tab) {
            if $0 == 4 {
                update()
            }
        }
    }
    
    private func update() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = session.user.currency.symbol
    
        withAnimation(.easeInOut(duration: 1)) {
            price = formatter.string(from: .init(value: session.user.price))!
            currency = session.user.currency.symbol
            average = "\(session.user.quantity)"
        }
    }
}
