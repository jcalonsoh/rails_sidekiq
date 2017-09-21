# frozen_string_literal: true

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  test 'Fail sanving Email' do
    email = Email.new
    assert_not email.save
  end

  test 'Email with fields' do
    email = Email.new(mailto: 'j.carlos.alonso.h@gmail.com', mailbody: 'blah')
    assert email.save
  end
end
