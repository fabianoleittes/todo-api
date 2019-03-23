require "rails_helper"

RSpec.describe "Todos API", type: :request do
  describe "POST /v1/todos" do
    context "with valid data" do
      before do
        post(
          "/v1/todos",
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
          "/v1/todos",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /v1/todos" do
    context "as an authorized user" do
      it "returns a response 200" do
        get(
          "/v1/todos",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:ok)
      end
    end

    context "as an unauthorized user" do
      it "returns a 422 response" do
        get(
          "/v1/todos",
          params: {},
          headers: {}
        )

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /v1/todos/:id" do
    context "when the record exists" do
      it "returns a response 200" do
        get(
          "/v1/todos/#{todo.id}",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the record does not exists" do
      before { get "/v1/todos/#{42}", params: {}, headers: headers }

      it "returns a response 404" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a found message" do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe "PATCH /v1/todos/:id" do
    context "with valid data" do
      it "updates the specified todo" do
        todo_params = {
          todo: {
            title: "Daily routine"
          }
        }.to_json

        patch(
          "/v1/todos/#{todo.id}",
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
          "/v1/todos/#{todo.id}",
          params: todo_params.to_json,
          headers: headers
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /v1/todos/:id" do
    context "when record not exists" do
      it "returns a response 404" do
        delete(
          "/v1/todos/42",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when record exists" do
      it "returns a response 204" do
        delete(
          "/v1/todos/#{todo.id}",
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
