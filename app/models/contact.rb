class Contact < ApplicationRecord
  belongs_to :customer

  validates_presence_of :phone_number
end
