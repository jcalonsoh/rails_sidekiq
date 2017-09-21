# frozen_string_literal: true

class Email < ApplicationRecord
  validates :mailto, :mailbody, presence: true
end
