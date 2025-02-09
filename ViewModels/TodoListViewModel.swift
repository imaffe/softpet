import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var newTodoTitle: String = ""
    
    func addTodo() {
        guard !newTodoTitle.isEmpty else { return }
        let todo = Todo(title: newTodoTitle, isCompleted: false, onChainStatus: .notCarved)
        todos.append(todo)
        newTodoTitle = ""
    }
    
    func toggleTodo(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
    
    func carveTodoOnChain(_ todo: Todo) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        
        // Set status to carving
        todos[index].onChainStatus = .carving
        
        // Simulate blockchain interaction
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.todos[index].onChainStatus = .carved(txHash: "0x" + UUID().uuidString)
        }
    }
} 