class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :operations, :categories do |t|
      t.index [:operation_id, :category_id]
      t.index [:category_id, :operation_id]
    end
    Operation.reset_column_information
    Category.reset_column_information
  end
end
