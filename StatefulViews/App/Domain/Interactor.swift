public struct Interactor {
    let service: Service

    func getTodos() async throws -> Todos {
        try await service.getTodos().toDomain
    }
}

struct Todos: Equatable {
    let todos: [Todo]
}

extension GetTodosResponse {
    var toDomain: Todos {
        .init(todos: self.map(\.toDomain))
    }
}

struct Todo: Identifiable, Equatable {
    let id: Int
    let title: String
    let completed: Bool
}

extension TodoData {
    var toDomain: Todo {
        .init(id: id, title: title, completed: completed)
    }
}


