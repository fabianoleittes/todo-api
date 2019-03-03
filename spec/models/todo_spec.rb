require "rails_helper"

RSpec.describe Todo, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:created_by) }
  end
end
