require 'rails_helper'

describe ArticleUser do

  context 'Associations' do
  	it { is_expected.to belong_to :user }
  	it { is_expected.to belong_to :article } 
  end 
end 