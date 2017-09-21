class Email < ApplicationRecord
  validates_presence_of :mailto, :mailbody
end
