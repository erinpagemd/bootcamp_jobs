class JobOpeningsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    @submission = Submission.new
  end

end
