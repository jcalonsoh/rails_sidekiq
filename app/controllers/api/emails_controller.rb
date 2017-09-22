module Api
  class EmailsController < ActionController::API
    def index
      emails = Email.all
      render json: emails, status: 200
    end

    def create
      
    end
  end
end
