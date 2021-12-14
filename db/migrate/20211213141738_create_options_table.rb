class CreateOptionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :optionTitle
      t.string :optionCorrect
      t.timestamps
    end
  end
end
