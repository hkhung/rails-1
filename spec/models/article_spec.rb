require 'rails_helper'

describe Article do
  context 'Validations' do
  	it { is_expected.to validate_presence_of :title  }
  	it { is_expected.to validate_presence_of :content  }  
  	it { is_expected.to validate_attachment_presence(:image) }
	  it { is_expected.to validate_attachment_content_type(:image).
	                allowing('image/png', 'image/gif').
               		rejecting('text/plain', 'text/xml') }
	  it { is_expected.to validate_attachment_size(:image).in(0..10.megabytes) }
  end

  context 'Associations' do
  	it { is_expected.to belong_to :author }
  	it { is_expected.to have_many :voted } 
  end

  describe '.canRead' do
    let!(:articles)       { create_list(:article, 10)}
    let!(:user)           { create(:user)}
    let!(:article_users)  { create(:article_user, article_id: articles.first.id, user_id: user.id)}

    it 'returns a list of articles' do 
      article_users
      expect(Article.canRead(user.id).count).to eq 9
    end
  end
end 