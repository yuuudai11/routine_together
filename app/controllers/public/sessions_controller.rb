# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]



  def after_sign_in_path_for(resource)
    public_users_show_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = "ゲストユーザーとしてログインしました"
    redirect_to public_users_show_path(current_user)
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

#退会しているかを判断するメソッド
def user_state
  ##[処理内容]入力されたemailからアカウントを１件取得
  @user = User.find_by(user_name: params[:user][:user_name])
  ##アカウントを取得できなかった場合、このメソッドを終了する
  return if !@user
  ##[処理内容２]取得したアカウントのパスワードと入力されたパスワードが入力されたパスワードが一致しているか判別
  if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    ##処理内容３
    redirect_to new_user_session_path
  end
end


end
