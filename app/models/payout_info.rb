class PayoutInfo < ApplicationRecord
  belongs_to :member

  validates :member_id, :bank_name, :account_holder_name, :account_number, presence: true

  def self.default_account
    where(default_use: true).first
  end
end
