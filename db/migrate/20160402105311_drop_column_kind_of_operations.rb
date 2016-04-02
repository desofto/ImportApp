class DropColumnKindOfOperations < ActiveRecord::Migration
  def up
    Operation.find_each do |operation|
      operation.categories = operation.kind.split(';').map do |kind|
        Operation.find_or_create(kind)
      end
    end

    remove_column :operations, :kind
  end

  def down
    add_column :operations, :kind, null: false

    Operation.find_each do |operation|
      operation.kind = operation.categories.map(&:name)
    end
  end
end
