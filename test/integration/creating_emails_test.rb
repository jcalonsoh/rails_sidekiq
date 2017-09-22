require 'test_helper'

class CreatingEmailsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'creating emails' do
    post '/emails', params:
        { email:
              { mailto: 'j.carlos.alonso.h@gmail.com', mailbody: 'SuperBlah' } }.to_json,
                    headers: { 'Accept' => Mime[:json], 'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime[:json], response.content_type

    email = json(response.body)
    assert_equal email_url(email[:id]), response.location
  end
end