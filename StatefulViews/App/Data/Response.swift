typealias GetTodosResponse = [TodoData]

struct TodoData: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
