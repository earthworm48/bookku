require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create :user }

  before do
    debugger
    sign_in user
  end

  describe 'user' do
    it 'has a user' do
      debugger
    end
  end
end
