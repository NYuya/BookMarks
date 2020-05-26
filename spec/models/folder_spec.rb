require 'rails_helper'

RSpec.describe Folder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

require 'rails_helper'

RSpec.describe 'folderモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:customer) { create(:customer) }
    let!(:folder) { build(:folder, customer_id: customer.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        folder.folder_name = ''
        expect(folder.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'customerモデルとの関係' do
      it 'N:1となっている' do
        expect(folder.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end