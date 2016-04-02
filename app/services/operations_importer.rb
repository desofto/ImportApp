require 'csv'

class OperationsImporter
  def initialize(file_name)
    @file_name = file_name
    @cache_companies = {}
    @cache_categories = {}
  end

  def import
    clear_database

    info = {
      processed: 0,
      successful: 0,
      error: 0
    }

    CSV.foreach(@file_name, headers: true) do |row|
      begin
        import_row row.to_hash
        info[:successful] += 1
      rescue
        info[:error] += 1
      ensure
        info[:processed] += 1
        yield info if block_given?
      end
    end
  end

  private

  def clear_database
    Operation.connection.execute("delete from #{Operation.table_name}")
    Category.connection.execute("delete from #{Category.table_name}")
  end

  def import_row(row)
    categories = row['kind'.freeze] || ''.freeze
    categories = categories.split(';'.freeze).map do |category_name|
      find_category(category_name)
    end
    Operation.create!(
      company: find_company(row['company'.freeze]),
      invoice_num: row['invoice_num'.freeze],
      invoice_date: Time.zone.parse(row['invoice_date'.freeze]),
      operation_date: Time.zone.parse(row['operation_date'.freeze]),
      amount: row['amount'.freeze],
      reporter: row['reporter'.freeze],
      notes: row['notes'.freeze],
      status: row['status'.freeze],
      categories: categories
    )
  end

  def parse_date(date)
    try_parse_date(date, '%m/%d/%Y'.freeze) ||
      try_parse_date(date, '%Y-%m-%d'.freeze) ||
      try_parse_date(date, '%d-%m-%Y'.freeze)
  end

  def try_parse_date(date, format)
    Date.strptime(date, format)
  rescue ArgumentError
    nil
  end

  def find_company(name)
    @cache_companies[name] ||= Company.find_by(name: name)
  end

  def find_category(name)
    @cache_categories[name] ||= Category.find_or_create(name)
  end
end
