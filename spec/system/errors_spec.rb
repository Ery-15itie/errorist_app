# spec/system/errors_spec.rb
require 'rails_helper'

RSpec.describe 'エラーおみくじ機能', type: :system do
  it 'ユーザーがエラーおみくじを引ける' do
    visit root_path

    expect(page).to have_content('Errorい人')

    # おみくじを引くボタンをクリック
    click_button 'エラーを引く'

    # 結果が表示されたか判定
    expect(page).to have_content(/ERROR|Exception|error/i)
    expect(page).to have_content('戻る')  # 戻るボタンがあることを確認

    # メッセージが表示されることを確認
    expect(page).to have_content(/Please|してください|detected|Failed/i)
  end

it '言語切り替え機能が動作する' do
    visit root_path

    # 言語切り替えボタンが存在することを確認
    expect(page).to have_selector('input[type="submit"]')

    # 言語切り替え実行（エラーが発生しないことを確認）
    expect { first('input[type="submit"]').click }.not_to raise_error

    # 切り替え後に言語表示が確認できることを保証
    expect(page).to have_content('CURRENT LANGUAGE')
  end

  it 'もう一度引くボタンで新しいエラーが表示される' do
    visit root_path
    click_button 'エラーを引く'

    # 最初の結果を確認
    expect(page).to have_content(/ERROR|error/i)

    # もう一度引くボタンをクリック
    click_button 'もう一度引く'

    # 新しい結果が表示される
    expect(page).to have_content(/ERROR|error/i)
  end
end
