require 'rails_helper'

RSpec.describe 'delete article', type: :system, js: true do
    let(:user) { FactoryBot.create(:user) }
    let(:article) { FactoryBot.create(:article) }
    before do
        login_as(user)
    end
  
    scenario 'empty title and body' do
        
        visit article_path(article)

        accept_alert do
            click_on 'Destroy'
        end

        expect(page).to have_text('article was deleted') 
        expect(Article.count).to eq(0)
    end
end