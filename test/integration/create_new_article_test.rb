require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.create(username: 'sve', email: 'sve@example.com', password: 'password', admin: true)
    end

    test "create new article successfully and redirect to show page" do
        sign_in_as(@user, 'password')
        get new_article_path
        assert_template 'articles/new'
        assert_difference 'Article.count', 1 do
            post_via_redirect articles_path, article: { description: 'Articles description', 
                                                        title: 'Something', 
                                                        user_id: 1 }
        end
        assert_template 'articles/show'
        assert_match 'Something', response.body
    end

end