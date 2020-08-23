import SwiftUI

struct Main: View {
    @EnvironmentObject var session: Session
    
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
            Settings()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
