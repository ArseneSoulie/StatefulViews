import SwiftUI

struct StatefulView<Data: Equatable, Content: View>: View {
    @Binding var viewState: ViewState<Data>

    @ViewBuilder var contentView: (Data) -> Content

    var body: some View {
        VStack {
            switch viewState {
            case let .result(data), let .loading(stubData: data):
                contentView(data)
                    .skeleton(viewState.isLoading)
            case .error(let errorData):
                ErrorView(errorData: errorData)
            }
        }
        .animation(.smooth, value: viewState)
    }
}
