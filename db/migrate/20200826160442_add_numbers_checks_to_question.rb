class AddNumbersChecksToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :number_1, :integer
    add_column :questions, :number_2, :integer
    add_column :questions, :security_answer, :integer
  end
end
