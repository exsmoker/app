import SwiftUI
import Core

struct Onboard: View {
    @EnvironmentObject var session: Session
    @State private var offset = CGFloat()
    @State private var name = ""
    @State private var location = ""
    @State private var currency = User.Currency.euro
    @State private var price = Double(0.5)
    @State private var quantity = Int(5)
    @State private var opacity = Double(1)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(height: 4)
                                .foregroundColor(.init(.secondarySystemBackground))
                                .frame(width: 200)
                            HStack {
                                RoundedRectangle(cornerRadius: 3)
                                    .frame(height: 6)
                                    .foregroundColor(.accentColor)
                                    .frame(width: CGFloat(200) / 6 * (offset + 1))
                                if offset < 5 {
                                    Spacer()
                                }
                            }
                        }.frame(width: 200)
                            .padding(.top, 10)
                        Spacer()
                    }
                    Spacer()
                    if offset < 5 {
                        Button(action: {
                            finish()
                        }) {
                            Text("Skip")
                                .foregroundColor(.secondary)
                                .padding()
                        }
                    }
                    HStack {
                        Button(action: {
                            withAnimation {
                                hideKeyboard()
                                offset -= 1
                            }
                        }) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.largeTitle)
                                .padding()
                        }.disabled(offset == 0)
                            .opacity(offset == 0 ? 0.4 : 1)
                        Button(action: {
                            withAnimation {
                                hideKeyboard()
                                offset += 1
                            }
                        }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.largeTitle)
                                .padding()
                        }.disabled(offset == 5)
                            .opacity(offset == 5 ? 0.4 : 1)
                    }
                }
                HStack(spacing: 0) {
                    First()
                        .frame(width: geo.size.width, height: geo.size.height)
                    Second(name: $name)
                        .frame(width: geo.size.width, height: geo.size.height)
                    Third(location: $location)
                        .frame(width: geo.size.width, height: geo.size.height)
                    Fourth(currency: $currency, price: $price)
                        .frame(width: geo.size.width, height: geo.size.height)
                    Fifth(quantity: $quantity)
                        .frame(width: geo.size.width, height: geo.size.height)
                    Sixth {
                        finish()
                    }.frame(width: geo.size.width, height: geo.size.height)
                }.frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
                    .offset(x: geo.size.width * -offset)
            }.opacity(opacity)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func finish() {
        withAnimation {
            opacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            session.create(name, location: location, price: price, quantity: quantity, currency: currency)
        }
    }
}

private struct First: View {
    var body: some View {
        VStack {
            Image("logo")
            HStack {
                Text("Welcome")
                    .font(Font.title.bold())
                    .padding(.leading)
                Spacer()
            }
            HStack {
                Text("Together")
                    .font(.footnote)
                    .padding(.leading)
                    .foregroundColor(.secondary)
                Spacer()
            }
            Spacer()
                .frame(height: 20)
            HStack {
                Text("Bear.with.us")
                    .font(.footnote)
                    .padding()
                Spacer()
            }
            Spacer()
                .frame(height: 80)
        }
    }
}

private struct Second: View {
    @Binding var name: String
    
    var body: some View {
        VStack {
            Text("What.your.name")
                .foregroundColor(.secondary)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 240, height: 40)
                    .foregroundColor(.init(.secondarySystemBackground))
                HStack {
                    Spacer()
                    TextField("Cezz.appleseed", text: $name)
                        .autocapitalization(.sentences)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 220, height: 40)
                    Spacer()
                }
            }
        }
    }
}

private struct Third: View {
    @Binding var location: String
    
    var body: some View {
        VStack {
            Text("What.your.location")
                .foregroundColor(.secondary)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 240, height: 40)
                    .foregroundColor(.init(.secondarySystemBackground))
                HStack {
                    Spacer()
                    TextField("Berlin.germany", text: $location)
                        .autocapitalization(.sentences)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 220, height: 40)
                    Spacer()
                }
            }
        }
    }
}

private struct Fourth: View {
    @Binding var currency: User.Currency
    @Binding var price: Double
    @State private var cost = ""
    @State private var formatter = NumberFormatter()
    
    var body: some View {
        VStack {
            HStack {
                Text("On.average")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
            HStack {
                Text("Cost.per.cigarette")
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
            }
            Text(verbatim: cost)
                .font(Font.title.bold())
                .foregroundColor(.accentColor)
                .padding()
            Stepper("") {
                price = min(3, price + 0.1)
                update()
            } onDecrement: {
                price = max(0.1, price - 0.1)
                update()
            }.font(.title)
                .labelsHidden()
                .padding()
            Picker("", selection: $currency) {
                Text(verbatim: User.Currency.dollar.symbol)
                    .bold()
                    .tag(User.Currency.dollar)
                Text(verbatim: User.Currency.euro.symbol)
                    .bold()
                    .tag(User.Currency.euro)
                Text(verbatim: User.Currency.pound.symbol)
                    .bold()
                    .tag(User.Currency.pound)
            }.pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                .frame(width: 230)
                .padding()
        }.onAppear {
            formatter.numberStyle = .currency
            update()
        }.onChange(of: currency) { _ in
            update()
        }
    }
    
    private func update() {
        switch currency {
        case .dollar: formatter.currencySymbol = "$"
        case .euro: formatter.currencySymbol = "€"
        case .pound: formatter.currencySymbol = "£"
        }
        cost = formatter.string(from: .init(value: price))!
    }
}

private struct Fifth: View {
    @Binding var quantity: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("On.average")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
            HStack {
                Text("Cigarettes.daily")
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
            }
            Text(verbatim: "\(quantity)")
                .font(Font.title.bold())
                .foregroundColor(.accentColor)
                .padding()
            Stepper("", value: $quantity, in: 1 ... 60)
                .labelsHidden()
                .padding()
        }
    }
}

private struct Sixth: View {
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text("Everything.ready")
                .foregroundColor(.secondary)
                .padding()
            Control.Title(title: "Start", background: .accentColor, width: 120, action: action)
        }
    }
}
