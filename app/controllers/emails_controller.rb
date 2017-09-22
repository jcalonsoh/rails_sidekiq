# frozen_string_literal: false

class EmailsController < ApplicationController
  def queue
    ReportWorker.perform_async("07-01-2016", "08-01-2016")
    render text: "REQUEST TO GENERATE A REPORT ADDED TO THE QUEUE"
  end
end
