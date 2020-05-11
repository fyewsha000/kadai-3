# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

 before_action :authenticate_user!

  # GET /resource/sign_up
  def new
     @profile_image = User.new
  end

  # POST /resource
  def create
    @profile_image = User.new(post_image_params)
    @profile_image_id = current_user.id
    @profile_image.save
  end

  # GET /resource/edit
   def edit
     @user = User.find(params[:id])
   end

  # PUT /resource
   def update
     user = User.find(params[:id])
     user.update(user_params)
     redirect_to user_path(@user.id)
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)


  protected

   def after_update_path_for(resource)
     user_path(current_user.id)
   end
end
