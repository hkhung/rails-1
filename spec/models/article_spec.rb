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
  	it { is_expected.to have_many :votes } 
  end
  
end 