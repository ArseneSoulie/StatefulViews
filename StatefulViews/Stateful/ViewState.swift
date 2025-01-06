@MainActor
enum ViewState<ViewData: Equatable>: Equatable {
    case result(data: ViewData)
    case loading(stubData: ViewData)
    case error(errorData: ViewModelError)

    var isLoading: Bool {
        if case .loading = self { true } else { false }
    }
}
