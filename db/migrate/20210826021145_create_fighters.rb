class CreateFighters < ActiveRecord::Migration[6.1]
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.string :height
      t.string :weight
      t.string :reach
      t.string :stance
      t.string :wins
      t.string :losses
      t.string :draws

      t.timestamps
    end
  end
end
