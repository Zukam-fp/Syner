class AddMatchToTeams < ActiveRecord::Migration[7.1]
  def change
    add_reference :teams, :match, null: false, foreign_key: true
  end
end
