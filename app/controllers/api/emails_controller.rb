# frozen_string_literal: true

module Api
  class EmailsController < ActionController::API
    def index
      emails = Email.all
      render json: emails, status: 200
    end

    def create
      Rails.logger.error params.to_yaml
      email = Email.new(email_params)
      if email.save
        queue email.id
        render json: email, status: 201, location: email
      else
        render json: email.errors, status: 422
      end
    end

    private

    def email_params
      params.require(:email).permit(:mailto, :mailbody)
    end

    def queue(id_mail)
      EmailsenderJob.perform_later mail_id: id_mail
    end
  end
end
