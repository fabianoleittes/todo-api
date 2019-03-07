require "rails_helper"

RSpec.describe "Todos API", type: :request do
  describe "POST /todos" do
    context "with valid data" do
      before do
        post(
          "/todos",
          params: todo_params.to_json,
          headers: headers
        )
      end

      it "returns a 201 response" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid data" do
      before do
        post(
          "/todos",
          params: {},
          headers: headers
        )
      end

      it "returns a 422 response" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  def todo_params
    attributes_for(:todo, created_by: user)
  end
end
