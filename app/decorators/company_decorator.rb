class CompanyDecorator < Draper::Decorator
  delegate_all

  def hash_with_stats
    {
      id: id,
      name: name,
      operations: operations.count,
      average_amount: '%.2f'.freeze % average_amount,
      highest_operation: '%.2f'.freeze % highest_operation_in_current_month,
      accepted: accepted_operations
    }
  end

  def average_amount
    operations.average(:amount) || 0.0
  end

  def highest_operation_in_current_month
    operations.in_current_month.maximum(:amount) || 0.0
  end

  def accepted_operations
    operations.accepted.count
  end
end
