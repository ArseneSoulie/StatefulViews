import SwiftUI

struct ErrorView: View {
    let errorData: ViewModelError
    var body: some View {
            VStack {
                Text("Pull to refresh ⬇️")
                    .italic()
                Spacer(minLength: 200)
                Image(systemName: "xmark.diamond.fill")
                    .resizable()
                    .foregroundStyle(.red)
                    .frame(width: 64, height: 64)
                Text(errorData.message)
        }
    }
}
