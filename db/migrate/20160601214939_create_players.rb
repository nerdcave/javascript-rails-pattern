class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :email
      t.integer :high_score

      t.timestamps
    end
  end
end
