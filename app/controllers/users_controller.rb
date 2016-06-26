class UsersController < ApplicationController
  protect_from_forgery except: :index

  def index
    in_callback = params['callback']
    
    if /^[a-zA-Z_][a-zA-Z0-9]{0,9}$/ =~ in_callback
      @callback = in_callback
    else
      @error_status = 400
    end
    
    @users = User.new.all
    if @users.nil?
      @error_status = 500
    end
    
    respond_to do |format|
      format.js {(@error_status) ? (render status: @error_status, js: "") : (render)}
    end
  end
  
end
