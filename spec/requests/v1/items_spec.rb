require "rails_helper"

RSpec.describe "Items API", type: :request do
  let!(:todo) { create(:todo, created_by: user.id) }
  let!(:items) { create_list(:item, 20, todo_id: todo.id) }
  let(:todo_id) { todo.id }
  let(:id) { items.first.id }

  describe "POST /v1/todos/:todo_id/items" do
    context "with valid data" do
      before do
        post(
          "/v1/todos/#{todo_id}/items",
          params: item.to_json,
          headers: headers
        )
      end

      it "returns status code 201" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid data" do
      it "returns status code 422" do
        post(
          "/v1/todos/#{todo_id}/items",
          params: {},
          headers: headers
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /v1/todos/:todo_id/items" do
    before do
      get(
        "/v1/todos/#{todo_id}/items",
        params: {},
        headers: headers
      )
    end

    context "when todo exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(:ok)
      end

      it "returns all todo items" do
        expect(json.size).to eq(20)
      end
    end

    context "when todo does not exist" do
      let(:todo_id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe "GET /v1/todos/:todo_id/items/:id" do
    before do
      get(
        "/v1/todos/#{todo_id}/items/#{id}",
        params: {},
        headers: headers
      )
    end

    context "when todo item exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(:ok)
      end

      it "returns the item" do
        expect(json["id"]).to eq(id)
      end
    end

    context "when todo item does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe "PATCH /v1/todos/:todo_id/items/:id" do
    let(:attributes) { { name: "Son Goku" }.to_json }

    before do
      patch(
        "/v1/todos/#{todo_id}/items/#{id}",
        params: attributes,
        headers: headers
      )
    end

    context "when item exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(:no_content)
      end

      it "updates the item" do
        item = Item.find(id)
        expect(item.name).to match(/Son Goku/)
      end
    end

    context "when item does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe "DELETE /v1/todos/:id/items/:id" do
    before  do
      delete(
        "/v1/todos/#{todo_id}/items/#{id}",
        params: {},
        headers: headers
      )
    end

    context "when item does exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(:no_content)
      end
    end

    context "when item not does exists" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  def item
    build(:item, todo_id: todo.id)
  end
end
