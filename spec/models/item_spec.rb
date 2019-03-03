require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:todo) }
  end
  context "associations" do
    it { is_expected.to belong_to(:todo) }
  end
end
