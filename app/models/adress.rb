class Adress < ApplicationRecord
  belongs_to :customer

  validates_presence_of :street_name, :number, :neighborhood
end
