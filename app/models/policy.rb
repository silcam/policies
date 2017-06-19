class Policy < ApplicationRecord
  belongs_to :provider
  belongs_to :user
  has_many :insured_items
end
