import SwiftUI

struct ContentView: View {
    @State private var panic = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("I have a craving")
                Button(action: {
                    self.panic = true
                }) {
                    Text("Now")
                        .padding()
                        .foregroundColor(.pink)
                }.accentColor(.clear)
                    .sheet(isPresented: $panic) {
                        Craving()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
