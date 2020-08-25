import SwiftUI

struct Main: View {
    @EnvironmentObject var session: Session
    @State private var selected = 0
    
    var body: some View {
        TabView(selection: $selected) {
            Home(tab: $selected)
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(0)
            Cravings()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }.tag(1)
            Rankings()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                }.tag(2)
            Stats()
                .tabItem {
                    Image(systemName: "star.fill")
                }.tag(3)
            Settings()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                }.tag(4)
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
