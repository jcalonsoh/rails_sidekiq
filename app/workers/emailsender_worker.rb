# frozen_string_literal: true

class EmailSenderWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(start_date, end_date)
    logger.info "SIDEKIQ WORKER GENERATING A REPORT FROM #{start_date} to #{end_date}"
  end
end
