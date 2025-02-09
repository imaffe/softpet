import SwiftUI

struct TodoRowView: View {
    let todo: Todo
    let onToggle: () -> Void
    let onCarve: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : .gray)
            }
            
            Text(todo.title)
                .strikethrough(todo.isCompleted)
            
            Spacer()
            
            switch todo.onChainStatus {
            case .notCarved:
                Button("Carve", action: onCarve)
                    .buttonStyle(.borderedProminent)
            case .carving:
                ProgressView()
            case .carved(let txHash):
                Text("📝")
                    .onTapGesture {
                        UIPasteboard.general.string = txHash
                    }
            }
        }
    }
} 