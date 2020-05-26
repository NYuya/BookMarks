require 'rails_helper'

  describe 'adminログイン' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_admin) { admin }
      it 'ログインに成功する' do
        fill_in 'admin[email]', with: test_admin.email
        fill_in 'admin[password]', with: test_admin.password
        click_button 'Sign in'

        expect(page).to have_content 'successfully'
      end

      it 'ログインに失敗する' do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'Sign in'

        expect(current_path).to eq(new_admin_session_path)
      end
    end
  end

# Specs in this file have access to a helper object that includes
# the Admins::AdminsHelper. For example:
#
# describe Admins::AdminsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Admins::AdminsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
