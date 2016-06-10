require 'rails_helper'

describe Vote do 
  context 'Associations' do
  	it { is_expected.to belong_to :user }
  	it { is_expected.to belong_to :article } 
  end

  context 'validations' do
  	it { is_expected.to enumerize(:vote).in(:like, :dislike)}
  end
end 