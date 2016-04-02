class OperationDecorator < Draper::Decorator
  delegate_all

  def to_json
    {
      id: id,
      invoice_num: invoice_num,
      invoice_date: invoice_date,
      operation_date: operation_date,
      amount: amount,
      reporter: reporter,
      notes: notes,
      status: status,
      categories: categories.map(&:name).join(', ')
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
