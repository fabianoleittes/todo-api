require "rails_helper"

RSpec.describe "Auth", type: :request do
  describe "POST /auth/login" do
    context "when valid credentials" do
      before do
        post(
          "/auth/login",
          params: auth_params.to_json,
          headers: headers
        )
      end

      it "returns an authenticator token" do
        expect(json["auth_token"]).not_to be_nil
      end

      it "returns a 200 response" do
        expect(response).to have_http_status(:ok)
      end

      it "returns correct content_type" do
        expect(response.content_type).to eq("application/json")
      end
    end

    context "when invalid credentials" do
      before do
        post(
          "/auth/login",
          params: {},
          headers: headers
        )
      end

      it "returns a failure message" do
        expect(json["message"]).to match(/Invalid credentials/)
      end
    end
  end

  def auth_params
    {
      email: user.email,
      password: user.password
    }
  end
end
