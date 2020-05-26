require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_customer_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'customer[last_name]', with: Faker::Internet.last_name
        fill_in 'customer[first_name]', with: Faker::Internet.first_name
        fill_in 'customer[last_name_kana]', with: Faker::Internet.last_name_kana
        fill_in 'customer[first_name_kana]', with: Faker::Internet.first_name_kana
        fill_in 'customer[post_code]', with: Faker::Internet.post_code
        fill_in 'customer[address]', with: Faker::Internet.address
        fill_in 'customer[phone_number]', with: Faker::Internet.phone_number
        fill_in 'customer[email]', with: Faker::Internet.email
        fill_in 'customer[password]', with: 'password'
        fill_in 'customer[password_confirmation]', with: 'password'
        click_button 'Sign up'
        expect(page).to have_content 'successfully'
      end
      it '新規登録に失敗する' do
        fill_in 'customer[last_name]', with: ''
        fill_in 'customer[first_name]', with: ''
        fill_in 'customer[last_name_kana]', with: ''
        fill_in 'customer[first_name_kana]', with: ''
        fill_in 'customer[post_code]', with: ''
        fill_in 'customer[address]', with: ''
        fill_in 'customer[phone_number]', ''
        fill_in 'customer[email]', with: ''
        fill_in 'customer[password]', with: ''
        fill_in 'customer[password_confirmation]' ''
        click_button 'Sign up'
        expect(page).to have_content 'error'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:customer) { create(:customer) }
    before do
      visit new_customer_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_customer) { customer }
      it 'ログインに成功する' do
        fill_in 'customer[name]', with: test_customer.name
        fill_in 'customer[password]', with: test_customer.password
        click_button 'Log in'

        expect(page).to have_content 'successfully'
      end

      it 'ログインに失敗する' do
        fill_in 'customer[name]', with: ''
        fill_in 'customer[password]', with: ''
        click_button 'Log in'

        expect(current_path).to eq(new_customer_session_path)
      end
    end
  end
end

describe 'ユーザーのテスト' do
  let(:customer) { create(:customer) }
  let!(:test_customer2) { create(:customer) }
  let!(:order) { create(:order, customer: customer) }
  before do
    visit new_customer_session_path
    fill_in 'customer[name]', with: customer.name
    fill_in 'customer[password]', with: customer.password
    click_button 'Log in'
  end
end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_customer_path(customer)
        expect(current_path).to eq('/customers/' + customer.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        visit edit_customer_path(test_customer2)
        expect(current_path).to eq('/customers/' + customer.id.to_s)
      end
    end
end