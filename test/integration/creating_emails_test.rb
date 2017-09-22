require 'test_helper'

class CreatingEmailsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'creating emails' do
    post '/emails', params:
        { email:
              { mailto: 'j.carlos.alonso.h@gmail.com', mailbody: 'SuperBlah' } }.to_json,
                    headers: { 'Content-Type' => 'application/json' }

    assert_equal 201, response.status

    email = json(response.body)
    assert_equal email_url(email[:id]), response.location
  end
end