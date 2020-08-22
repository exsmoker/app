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
                    Image(systemName: "chart.bar")
                }
            Circle()
                .tabItem {
                    Image(systemName: "chart.pie")
                }
            Circle()
                .tabItem {
                    Image(systemName: "star")
                }
            Circle()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
