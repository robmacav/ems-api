class Device < ApplicationRecord
  belongs_to :device_category
  belongs_to :customer

  validates_presence_of :description
end
