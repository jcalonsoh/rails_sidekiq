# frozen_string_literal: true

class EmailsenderJob < ApplicationJob
  queue_as :default

  def perform(opts = {})
    Rails.logger.info "SIDEKIQ WORKER GENERATING A SOMETHING FROM API REST #{opts[:mail_id]}"
  end
end
