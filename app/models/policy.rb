class Policy < ApplicationRecord
  include RTFHelper

  belongs_to :provider
  belongs_to :user
  has_many :insured_items

  def self.import_from_dallas_rtf rtf_doc

  end

end
