## This repo shows an implementation of a StatefulView
A stateful view allows you to easily handle an error state and a loading state with a single source of data

### Strucutre

- Stateful: Contains everything that could be its own library
- App: An example use case with an MVVM structure

### Check this out

https://github.com/user-attachments/assets/7c23efac-6cc9-486d-ab5d-9f246b205a91

### Usage
This is an example of an implementation of a view with a StatefulView
```swift
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
        }.onAppearAndRefresh(action: viewModel.fetchData)
    }
}

```

The onAppearAndRefresh modifier allows you to fetch the data on the onAppear and refresh when you pull on the view
