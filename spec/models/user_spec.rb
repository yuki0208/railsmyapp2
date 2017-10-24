require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user, params) }
  let(:params) { {} }
  describe 'バリデーション' do
    describe 'name' do
      context '空白のとき' do
        let(:params) { { name: '' } }
        it '保存できない' do
          expect(user).to be_invalid
        end
      end
      context '５０文字以下のとき' do
        let(:params) { { name: 'A'*50 } }
        it '保存できる' do
          expect(user).to be_valid
        end
      end
      context '５１文字以上のとき' do
        let(:params) { { name: 'A'*51 } }
        it '保存できない' do
          expect(user).to be_invalid
        end
      end
    end
  end
end
