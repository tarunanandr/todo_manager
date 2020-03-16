class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:id).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo=Todo.create!( todo_text: todo_text, due_date: due_date, completed: false)
    confirmation_text = "Todo created with id = #{new_todo.id}"
    render plain: confirmation_text
  end

  def show
    id=params[:id]
    render plain: Todo.find(id).to_pleasant_string
  end
end