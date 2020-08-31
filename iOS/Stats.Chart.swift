import SwiftUI
import Core

extension Stats {
    struct Chart: View {
        @Binding var values: [CGFloat]
        let title: LocalizedStringKey
        @Binding var range: Smoke.Range
        
        var body: some View {
            ZStack {
                Grid(values: $values)
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
                        Text(.init(range.limit))
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("Now")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }.frame(height: 200)
            .padding()
        }
    }
}

private struct Grid: View {
    @Binding var values: [CGFloat]
    
    var body: some View {
        Base()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round))
        Pattern()
            .stroke(Color.secondary, style: .init(lineWidth: 1, lineCap: .round, dash: [1, 4]))
        Shade(values: $values)
            .fill(Color.accentColor.opacity(0.3))
        Road(values: values)
            .stroke(Color.accentColor, style: .init(lineWidth: 2, lineCap: .round))
        ForEach(0 ..< values.count, id: \.self) {
            Dot(y: values[$0], index: $0, count: values.count)
                .fill(Color.accentColor)
            Dot(y: values[$0], index: $0, count: values.count)
                .stroke(Color.primary, style: .init(lineWidth: 2, lineCap: .round))
        }
    }
}

private struct Base: Shape {
    func path(in rect: CGRect) -> Path {
        .init {
            $0.move(to: .zero)
            $0.addLine(to: .init(x: 0, y: rect.maxY))
            $0.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        }
    }
}

private struct Pattern: Shape {
    func path(in rect: CGRect) -> Path {
        .init { path in
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
        }
    }
}

private struct Shade: Shape {
    @Binding var values: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        .init {
            if !values.isEmpty {
                $0.move(to: .init(x: 0, y: rect.maxY))
                $0.addLines(values.enumerated().map {
                    .init(x: rect.maxX / .init(values.count - 1) * .init($0.0), y: rect.maxY - (rect.maxY * $0.1))
                })
                $0.addLine(to: .init(x: rect.maxX, y: rect.maxY))
                $0.addLine(to: .init(x: 0, y: rect.maxY))
                $0.closeSubpath()
            }
        }
    }
    
    var animatableData: [CGFloat] {
        get { values }
        set { values = newValue }
    }
}

private struct Road: Shape {
    var values: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        Path {
            $0.move(to: .init(x: 0, y: rect.maxY))
            if !values.isEmpty {
                $0.addLines(values.enumerated().map {
                    .init(x: rect.maxX / .init(values.count - 1) * .init($0.0), y: rect.maxY - (rect.maxY * $0.1))
                })
            } else {
                $0.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            }
        }
    }
    
    var animatableData: Path.AnimatableData {
        get { values }
        set { values = newValue }
    }
}

private struct Dot: Shape {
    var y: CGFloat
    let index: Int
    let count: Int
    
    func path(in rect: CGRect) -> Path {
        .init {
            $0.addArc(center: .init(x: rect.maxX / .init(count - 1) * .init(index), y: rect.maxY - (rect.maxY * y)), radius: 5, startAngle: .zero, endAngle: .init(radians: .pi * 2), clockwise: true)
        }
    }
    
    var animatableData: CGFloat {
        get { y }
        set { y = newValue }
    }
}
