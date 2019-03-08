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

  describe "GET /todos" do
    context "as an authorized user" do
      before do
        get(
          "/todos",
          params: {},
          headers: headers
        )
      end

      it "returns a response 200" do
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
    before do
      get(
        "/todos/#{todo.id}",
        params: {},
        headers: headers
      )
    end
    context "when the record exists" do
      it "returns a response 200" do
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

  def todo
    create(:todo, created_by: user)
  end
end
