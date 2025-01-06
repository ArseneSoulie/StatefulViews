import SwiftUI

struct RefreshableOnAppearModifier: ViewModifier {
    @State private var task: Task<Void, Never>?
    let action: () async -> Void

    func body(content: Content) -> some View {
        content
            .refreshable {
                startTaskIfNeeded()
            }
            .onAppear {
                startTaskIfNeeded()
            }
            .onDisappear {
                cancelTaskIfNeeded()
            }
    }

    private func startTaskIfNeeded() {
        cancelTaskIfNeeded()
        task = Task {
            await action()
        }
    }

    private func cancelTaskIfNeeded() {
        task?.cancel()
        task = nil
    }
}

public extension View {
    func refreshableOnAppear(action: @escaping () async -> Void) -> some View {
        self.modifier(RefreshableOnAppearModifier(action: action))
    }
}
