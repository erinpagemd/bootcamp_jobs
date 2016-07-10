class PhoneNumbersController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def edit
  end

  def create
    @phone_number.user = current_user
    @phone_number.save
    redirect_to edit_user_path(current_user)
  end

  def update
    @phone_number.update(phone_number_params)
    redirect_to edit_user_path(current_user)
  end

  def phone_number_params
    params.require(:phone_number).permit(:number, :location, :user_id)
  end
end
