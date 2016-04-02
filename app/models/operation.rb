class Operation < ActiveRecord::Base
  belongs_to :company,
    inverse_of: :operations

  has_and_belongs_to_many :categories

  validates :invoice_num, :invoice_date, :amount, :operation_date, :status,
    presence: true

  validates :amount,
    numericality: { greater_than: 0 }

  validates :invoice_num,
    uniqueness: true
end
