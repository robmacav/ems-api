class Customer < ApplicationRecord
    has_one :adress, dependent: :destroy

    accepts_nested_attributes_for :adress, allow_destroy: true

    validates_presence_of :first_name, :last_name
end
