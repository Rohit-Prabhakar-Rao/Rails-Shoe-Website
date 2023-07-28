class AdminController < ApplicationController
  # before_action :authenticate_admin, except: [:login]

  def login
    username = params[:username]
    password = params[:password]

    if valid_credentials?(username, password)
      session[:admin_logged_in] = true
      redirect_to stores_path, notice: "Login successful. Welcome, #{username}!"
    else
      render :login
    end
    flash[:alert] = "Invalid credentials. Please try again."
  end

  def logout
    if session[:admin_logged_in]
      session[:admin_logged_in] = false
      flash[:alert] = "Logged out..." 
      redirect_to '/admin/login'
    else
      redirect_to '/admin/login', alert: "You are not logged in."
    end
  end

  def destroy
    session[:admin_logged_in] = nil
    redirect_to root_path, notice: 'Admin logged out successfully!'
  end

  private

  def valid_credentials?(username, password)
    username == "Rohit" && password == "password"
  end

end