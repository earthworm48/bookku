require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :password }
  end

  describe "associations" do
    it { is_expected.to have_many(:books).through(:book_transactions) }
    it { is_expected.to have_many(:point_transactions) }
  end
end
