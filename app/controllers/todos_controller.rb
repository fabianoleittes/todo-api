class TodosController < ApplicationController
  def index
    json_response(current_user.todos.all)
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
end
