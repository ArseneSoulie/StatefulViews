import SwiftUI

struct ContentView: View {
    @State var viewModel: ViewModel
    var body: some View {
        StatefulView(viewState: $viewModel.viewState) { data in
                List {
                    ForEach(data.todos) { todo in
                        HStack {
                            if todo.completed {
                                Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                            } else {
                                Image(systemName: "xmark.circle")
                            }
                            Text(todo.title)
                        }
                    }
                }
        }.refreshableOnAppear(action: viewModel.fetchData)
    }
}
