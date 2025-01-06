import SwiftUI

struct SkeletonModifier: ViewModifier {
    let isLoading: Bool
    func body(content: Content) -> some View {
        if isLoading {
            content
                .overlay(content: {
                    TimelineView(.animation) { timeline in
                        let now = timeline.date.timeIntervalSinceReferenceDate

                        let xOffset = (now).truncatingRemainder(dividingBy: 2) - 1
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .white.opacity(0.7), .clear]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ).offset(x: xOffset * UIScreen.main.bounds.width)
                            .blendMode(.lighten)
                    }
                })
                .redacted(reason: .placeholder)
        } else {
            content
        }
    }
}

public extension View {
    func skeleton(_ isLoading: Bool) -> some View {
        self.modifier(SkeletonModifier(isLoading: isLoading))
    }
}
