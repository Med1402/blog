require 'rails_helper'

RSpec.describe 'new Article' , type: :system do
    let(:user) { FactoryBot.create(:user) }
    before do
        login_as(user)
    end
    
    it 'Adding wrong article' do
        visit  new_article_path

        click_button 'Create Article'


        expect(page).to have_content("Title can't be blank")
        expect(Article.count).to eq(0)
        
    end

    it 'Adding new article' do
        visit  new_article_path

        fill_in 'article_title', with: 'TestArticle'
        fill_in 'article_body', with: 'Testing to add a new article'

        click_button 'Create Article'

        expect(Article.count).to eq(1)
        expect(Article.last.title).to eq('TestArticle')
        expect(Article.last.body).to eq('Testing to add a new article')

    end
end
  