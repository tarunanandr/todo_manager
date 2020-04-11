class TodosController < ApplicationController
  def index
    #render plain: Todo.order(:id).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    "" 'confirmation_text = "Todo created with id = #{new_todo.id}"
    render plain: confirmation_text' ""
    redirect_to todos_path
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: Todo.find(id).to_pleasant_string
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    "" 'render plain: "Updated the Todo with completed value = #{completed}"' ""
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
