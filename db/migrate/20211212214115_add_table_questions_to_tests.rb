class AddTableQuestionsToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :questions, :string, array: true
  end
end
