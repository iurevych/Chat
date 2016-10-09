class MessagesController < ApplicationController
  def login
    session[:username] = params[:username]
    redirect_to messages_url
  end

  def index
    @messages = Message.all
    @new_message = Message.new(username: session[:username])
  end

  def create
    @message = Message.create(body: params[:message][:body], username: session[:username])

    respond_to do |format|
      format.json {render json: {message: @message}}
    end
  end
end
