require 'rails_helper'

describe UsersController, type: :controller do
  let!(:user)                         { create :user, :with_books }
  let!(:successful_book_transactions) { create_list :book_transaction, 2, :successful, user: user }
  let!(:pending_book_transactions)    { create_list :book_transaction, 2, :pending, user: user }

  before do
    sign_in user
  end

  describe '#show' do
    it 'will redirect the path to the correct template and assign the right variables' do
      get :show, { id: user.id }
      expect(response).to render_template('show')
      expect(assigns(:sellList)).to eq user.books
      expect(assigns(:historyList).map(&:book_id)).to eq successful_book_transactions.map(&:book_id)
      expect(assigns(:buyList).map(&:book_id)).to eq pending_book_transactions.map(&:book_id)
    end
  end
end
