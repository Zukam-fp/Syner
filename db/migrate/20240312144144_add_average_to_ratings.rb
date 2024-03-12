class AddAverageToRatings < ActiveRecord::Migration[7.1]
  def change
    add_column :ratings, :average, :float
  end
end
