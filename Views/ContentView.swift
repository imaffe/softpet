import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Add todo section
                HStack {
                    TextField("New todo", text: $viewModel.newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: viewModel.addTodo) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                // Todo list
                List {
                    ForEach(viewModel.todos) { todo in
                        TodoRowView(todo: todo, onToggle: {
                            viewModel.toggleTodo(todo)
                        }, onCarve: {
                            viewModel.carveTodoOnChain(todo)
                        })
                    }
                }
            }
            .navigationTitle("Todo List")
        }
    }
} 