import SwiftUI

extension Stats {
    struct Chart: View {
        var body: some View {
            ZStack {
                Grid()
            }.frame(height: 120)
            .padding()
        }
    }
}

private struct Grid: View {
    var body: some View {
        Base()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round))
        Pattern()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round, dash: [1, 4]))
    }
}

private struct Base: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: .init(x: 0, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        return path
    }
}

private struct Pattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: .init(x: rect.maxX, y: 0))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        (1 ..< 10).map { rect.maxX / 10 * .init($0) }.forEach {
            path.move(to: .init(x: $0, y: 0))
            path.addLine(to: .init(x: $0, y: rect.maxY))
        }
        (1 ..< 5).map { rect.maxY / 5 * .init($0) }.forEach {
            path.move(to: .init(x: 0, y: $0))
            path.addLine(to: .init(x: rect.maxX, y: $0))
        }
        return path
    }
}
