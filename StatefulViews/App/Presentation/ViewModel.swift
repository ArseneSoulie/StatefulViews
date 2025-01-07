import SwiftUI

@Observable
final class ViewModel {
    private let interactor: Interactor

    @MainActor var viewState: ViewState<Todos> = .loading(stubData: .stub)

    public init(interactor: Interactor) {
        self.interactor = interactor
    }

    func fetchData() async {
        await setViewState(.loading(stubData: .stub))
        do {
            let data = try await interactor.getTodos()
            print(data)
            await setViewState(.result(data: data))
        } catch let error {
            let viewModelError = ViewModelError(message: "\(error)")
            await setViewState(.error(errorData: viewModelError))
        }
    }

    @MainActor func setViewState(_ viewState: ViewState<Todos>) {
        self.viewState = viewState
    }
}

extension Todos {
    static let stub: Self = .init(todos: [
        .init(id: 1, title: "Bonjour je suis un stub", completed: false),
        .init(id: 2, title: "blabla bla", completed: true),
        .init(id: 3, title: "Bla", completed: true),
        .init(id: 4, title: "Blabal blabla bla", completed: false),
        .init(id: 5, title: "Blabla blablablabal blablabal bla", completed: true),
        .init(id: 6, title: "Je suis le dernier", completed: false)
    ]
    )
}
