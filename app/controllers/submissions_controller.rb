class SubmissionsController < ApplicationController
	def index
		@submissions = Submission.includes(:user).all
	end

	def new
			@submission = Submission.new
			@user = current_user
	end

#duplicated code, not DRY-- change Submission.create to Submission.new
	def create
		@submission = Submission.new(submission_params)
		@submission.user_id = current_user.id
			if @submission.save!
				flash[:notice] = 'Created a new submission!'
      	redirect_to submissions_path
    	else
      	flash.now[:errors] = @submission.errors.full_messages
      	render :new
    	end
	end


private

	def submission_params
		params.require(:submission).permit(:title, :url, :text_block)
	end
end