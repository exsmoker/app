import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            Circle()
                .tabItem {
                    Image(systemName: "house")
                }
            Circle()
                .tabItem {
                    Image(systemName: "hammer")
                }
            Circle()
                .tabItem {
                    Image(systemName: "home")
                }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
