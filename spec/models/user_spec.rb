require 'rails_helper'

describe User do
  context 'Validations' do
  	it { is_expected.to validate_presence_of :first_name }
  	it { is_expected.to validate_presence_of :last_name }
  	it { is_expected.to validate_attachment_presence(:image) }
	  it { is_expected.to validate_attachment_content_type(:image).
	                allowing('image/png', 'image/gif').
               		rejecting('text/plain', 'text/xml') }
	  it { is_expected.to validate_attachment_size(:image).in(0..10.megabytes) }
  end

  context 'associations' do 
    it { is_expected.to have_many :articles }
  	it { is_expected.to have_many :votes }
  end

  describe '#name' do 
		let!(:user) 	{ create(:user, {last_name: 'Futurez', first_name: 'Jim'}) }

		it 'returns a name display of user' do  
			expect(user.name).to eq 'Jim Futurez' 
		end
	end
end