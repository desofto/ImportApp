class Company < ActiveRecord::Base
  has_many :operations,
    inverse_of: :company

  validates :name,
    presence: true
end
