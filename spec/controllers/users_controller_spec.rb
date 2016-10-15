require 'rails_helper'

describe UsersController, type: :controller do
  let!(:user)                         { create :user, :with_books, points: 100 }
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
      expect(assigns(:user)).to eq user
      expect(assigns(:historyList).map(&:book_id)).to eq successful_book_transactions.map(&:book_id)
      expect(assigns(:buyList).map(&:book_id)).to eq pending_book_transactions.map(&:book_id)
    end
  end

  # FIXME: We are now direct the user to a partial template so it invoke a MISSING_TEMPLATE ERROR when
  # we try to get the edit in the controller.
  xdescribe '#edit' do
    it 'will redirect the path to the correct template and assign the right variables' do
      get :edit, { id: user.id }
      expect(assigns(:user)).to eq user
    end
  end

  describe '#update' do
    describe 'when update is successful' do
      it 'will redirect the user profile' do
        get :update, { id: user.id, user: { username: 'lala' } }
        expect(assigns(:user)).to eq user
        expect(response).to redirect_to user
      end
    end

    # TODO: Test the alert message when the update is fail or test it in feature test
  end

  describe '#donate' do
    describe 'when user has enough points to donate' do
      it 'will redirect the user profile' do
        get :donate, { user_id: user.id, user: { donate_amount: '80' } }
        current_user = User.find user.id
        expect(assigns(:user)).to eq user
        expect(current_user.points).to eq 20
        expect(response).to redirect_to user
      end
    end

    describe 'when user does not has enough points to donate' do
      it 'will redirect the user profile' do
        get :donate, { user_id: user.id, user: { donate_amount: '200' } }
        current_user = User.find user.id
        expect(assigns(:user)).to eq user
        expect(current_user.points).to eq 100
        expect(response).to redirect_to user
      end
    end
  end
end
