import SwiftUI

struct Main: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Circle()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }
            Circle()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                }
            Circle()
                .tabItem {
                    Image(systemName: "star.fill")
                }
            Circle()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
