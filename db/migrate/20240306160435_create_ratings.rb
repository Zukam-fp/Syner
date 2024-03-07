class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.integer :team_work
      t.integer :physic
      t.integer :dribbling
      t.integer :shoot
      t.references :user_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
