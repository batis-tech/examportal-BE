class AddTableQuestionAndOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :questionTitle
      t.string :questionDetail
      t.timestamps
    end
  end
end
