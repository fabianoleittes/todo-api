require "rails_helper"

RSpec.describe "Todos API", type: :request do
  describe "POST /todos" do
    context "with valid data" do
      before do
        post(
          "/todos",
          params: todo.to_json,
          headers: headers
        )
      end

      it "returns a 201 response" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid data" do
      it "returns a 422 response" do
        post(
          "/todos",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /todos" do
    context "as an authorized user" do
      it "returns a response 200" do
        get(
          "/todos",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:ok)
      end
    end

    context "as an unauthorized user" do
      it "returns a 422 response" do
        get(
          "/todos",
          params: {},
          headers: {}
        )

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /todos/:id" do
    context "when the record exists" do
      it "returns a response 200" do
        get(
          "/todos/#{todo.id}",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the record does not exists" do
      before { get "/todos/#{42}", params: {}, headers: headers }

      it "returns a response 404" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a found message" do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe "PATCH /todos/:id" do
    context "with valid data" do
      it "updates the specified todo" do
        todo_params = {
          todo: {
            title: "Daily routine"
          }
        }.to_json

        patch(
          "/todos/#{todo.id}",
          params: todo_params,
          headers: headers
        )

        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid data" do
      let!(:todo_params) { build(:todo, title: "") }

      it "returns error code" do
        patch(
          "/todos/#{todo.id}",
          params: todo_params.to_json,
          headers: headers
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /todos/:id" do
    context "when record not exists" do
      it "returns a response 404" do
        delete(
          "/todos/42",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when record exists" do
      it "returns a response 204" do
        delete(
          "/todos/#{todo.id}",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  def todo
    @todo ||= create(:todo, created_by: user)
  end
end
