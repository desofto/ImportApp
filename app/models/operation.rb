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

  scope :in_current_month,
    -> { where('operation_date >= ?'.freeze, Time.zone.today.beginning_of_month) }

  scope :accepted,
    -> { where(status: 'accepted'.freeze) }

  scope :search, lambda { |term|
    fields = %w(status invoice_num reporter categories.name)
    conditions = fields.map { |field| "#{field} ilike :term" }
    joins(:categories).where(conditions.join(' or '), term: "%#{term}%")
  }
end
