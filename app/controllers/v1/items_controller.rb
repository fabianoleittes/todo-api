module V1
  class ItemsController < BaseController
    before_action :find_todo
    before_action :find_item, only: [:show, :update, :destroy]

    def index
      json_response(@todo.items.all)
    end

    def show
      json_response(@item)
    end

    def create
      @item = @todo.items.new(item_params)

      if @item.save
        json_response(@item, :created)
      else
        json_response(@item.errors, :unprocessable_entity)
      end
    end

    def update
      if @item.update(item_params)
        json_response(@item, :no_content)
      else
        json_response(@item.errors, :unprocessable_entity)
      end
    end

    def destroy
      if @item.destroy
        render nothing: true, status: :no_content
      else
        json_response(@item, :not_found)
      end
    end

    private

    def item_params
      params.permit(:name, :todo_id)
    end

    def find_todo
      @todo ||= Todo.find(params[:todo_id])
    end

    def find_item
      @item ||= @todo.items.find_by!(id: params[:id]) if @todo
    end
  end
end
