class CreateUserTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :user_teams do |t|
      t.string :name
      t.integer :user_position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
