import SwiftUI

extension Stats {
    struct Chart: View {
        let values: [CGFloat]
        let title: LocalizedStringKey
        let subtitle: LocalizedStringKey
        
        var body: some View {
            ZStack {
                Grid(values: values)
                    .padding(.vertical, 30)
                VStack {
                    HStack {
                        Text(title)
                            .font(Font.body.bold())
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text(subtitle)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
            }.frame(height: 200)
            .padding()
        }
    }
}

private struct Grid: View {
    let values: [CGFloat]
    
    var body: some View {
        Base()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round))
        Pattern()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round, dash: [1, 4]))
        Shade(values: values)
            .fill(Color.accentColor.opacity(0.3))
        Road(values: values)
            .stroke(Color.accentColor, style: .init(lineWidth: 2, lineCap: .round))
        ForEach(0 ..< values.count) {
            Dot(values: values, index: $0)
                .fill(Color.accentColor)
            Dot(values: values, index: $0)
                .stroke(Color.primary, style: .init(lineWidth: 2, lineCap: .round))
        }
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

private struct Shade: Shape {
    var values: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        if !values.isEmpty {
            path.move(to: .init(x: 0, y: rect.maxY))
            path.addLines(values.enumerated().map {
                .init(x: rect.maxX / .init(values.count - 1) * .init($0.0), y: rect.maxY - (rect.maxY * $0.1))
            })
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.addLine(to: .init(x: 0, y: rect.maxY))
            path.closeSubpath()
        }
        return path
    }
    
    var animatableData: [CGFloat] {
        get { values }
        set { values = newValue }
    }
}

private struct Road: Shape {
    var values: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: 0, y: rect.maxY))
        if !values.isEmpty {
            path.addLines(values.enumerated().map {
                .init(x: rect.maxX / .init(values.count - 1) * .init($0.0), y: rect.maxY - (rect.maxY * $0.1))
            })
        } else {
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        }
        return path
    }
    
    var animatableData: [CGFloat] {
        get { values }
        set { values = newValue }
    }
}

private struct Dot: Shape {
    var values: [CGFloat]
    let index: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: .init(x: rect.maxX / .init(values.count - 1) * .init(index), y: rect.maxY - (rect.maxY * values[index])), radius: 5, startAngle: .zero, endAngle: .init(radians: .pi * 2), clockwise: true)
        return path
    }
    
    var animatableData: [CGFloat] {
        get { values }
        set { values = newValue }
    }
}
