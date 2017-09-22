# frozen_string_literal: true

require 'test_helper'

class ListingEmailsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'return list of all emails' do
    Email.create!(mailto: 'j.carlos.alonso.h@gmail.com', mailbody: 'Blob')
    Email.create!(mailto: 'j.carlos.alonso.h@outlook.cl', mailbody: 'Many Blob')

    get '/emails'
    assert_equal 200, response.status

    emails = json(response.body)
    mails = emails.collect { |e| e[:mailto] }
    assert_includes mails, 'j.carlos.alonso.h@gmail.com'
  end
end
