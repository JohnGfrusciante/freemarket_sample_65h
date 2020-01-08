# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:tel]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def index
    
  end

  # GET /resource/sign_up
  def new

  end

def create
  password = Devise.friendly_token.first(7)
  if session[:provider].present? && session[:uid].present?
    @user = User.new(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
    sns = SnsCredential.new(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    if @user.save && sns.save
      redirect_to root_path notice: 'ログインしました'
    else
      redirect_to controller: 'signup', action: 'index'
    end
  else
    @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
    if @user.save
      redirect_to root_path notice: 'ログインしました'
    else
      redirect_to controller: 'signup', action: 'index'
    end
  end
end
  # POST /resource
  def create

  end

  def email
    @user = User.new
  end

  def tel
    @user = User.new(sign_up_params)
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
  end

  def authen
    session["devise.regist_data"]["user"]["tel"] = params[:user][:tel]
    @user = User.new(session["devise.regist_data"]["user"])
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :email and return
    end
  end

  def address
    @address = Address.new
  end

  def credit
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :address and return
    end
    session["devise.regist_data"][:address] = (@address.attributes)
  end

  def done
    @user = User.new(session["devise.regist_data"]["user"])
    @user.build_address(session["devise.regist_data"]["address"])
    @user.save
    sign_in(:user, @user)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def address_params
    params.require(:address).permit(:name_family, :name_first, :kana_family, :kana_first, :postal_code, :prefecture, :municipality, :house_number, :building, :tel)
  end

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
end