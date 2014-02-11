require 'spec_helper'

feature 'visitor sees all submissions' do
	scenario 'on homepage' do
	submission = create(:submission)
		visit submissions_path
		expect(page).to have_content 'A Wonderful Story'
	end
end
