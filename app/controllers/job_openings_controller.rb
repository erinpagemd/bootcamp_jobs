class JobOpeningsController < ApplicationController
  load_and_authorize_resource

  def index
    @submissions = Submission.where(user: current_user).decorate
  end

  def show
    @submission = Submission.new
  end

end
