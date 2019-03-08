class TodosController < ApplicationController
  before_action :find_todo, only: [:show]

  def index
    json_response(current_user.todos.all)
  end

  def show
    json_response(@todo)
  end

  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      json_response(@todo, :created)
    else
      json_response(@todo.errors, :unprocessable_entity)
    end
  end

  private

  def todo_params
    params.permit(:title)
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end
end
