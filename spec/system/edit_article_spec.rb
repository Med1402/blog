require 'rails_helper'

RSpec.describe 'update article', type: :system do
    let(:user) { FactoryBot.create(:user) }
    let(:article) { FactoryBot.create(:article) }
    before do
        login_as(user)
    end
  
    scenario 'empty title and body' do
      visit edit_article_path(article)
      
      fill_in 'article_title', with: ''
      fill_in 'article_body', with: ''

      
      click_button 'Update Article'
      
      expect(page).to have_content("Title can't be blank")

    end

    scenario 'Valid title and body' do
      visit edit_article_path(article)
        
      fill_in 'article_title', with: 'Article title updated'
      fill_in 'article_body', with: 'Body of the article updated'
  
        
      click_button 'Update Article'
        
      expect(Article.last.title).to eq('Article title updated')
      expect(Article.last.body).to eq('Body of the article updated')
      
    end
  
end