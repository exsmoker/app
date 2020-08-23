import SwiftUI
import Core

struct Onboard: View {
    @EnvironmentObject var session: Session
    @State private var offset = CGFloat()
    @State private var name = ""
    @State private var location = ""
    
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
                                    .frame(width: CGFloat(200) / 3 * (self.offset + 1))
                                        Spacer()
                                Spacer()
                            }
                        }.frame(width: 200)
                            .padding(.top, 10)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.offset -= 1
                            }
                        }) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.largeTitle)
                                .padding()
                        }.disabled(self.offset == 0)
                            .opacity(self.offset == 0 ? 0.4 : 1)
                        Button(action: {
                            withAnimation {
                                self.offset += 1
                            }
                        }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.largeTitle)
                                .padding()
                        }.disabled(self.offset == 1)
                            .opacity(self.offset == 1 ? 0.4 : 1)
                    }
                }
                HStack(spacing: 0) {
                    First()
                        .frame(width: geo.size.width, height: geo.size.height)
                    First()
                        .frame(width: geo.size.width, height: geo.size.height)
                }.frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
                    .offset(x: geo.size.width * -self.offset)
            }
        }
    }
}

private struct First: View {
    var body: some View {
        VStack {
            Image("logo")
            HStack {
                Text("Welcome")
                    .bold()
                    .padding(.leading)
                    .foregroundColor(.primary)
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
                .frame(height: 50)
        }
    }
}
