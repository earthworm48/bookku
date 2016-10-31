require 'rails_helper'

describe User, type: :model do
  xdescribe "validations" do
    it { is_expected.to validate_presence_of :username }
  end

  describe "associations" do
    it { is_expected.to have_many(:book_transactions) }
    it { is_expected.to have_many(:books) }
    it { is_expected.to have_many(:point_transactions) }
  end
end
