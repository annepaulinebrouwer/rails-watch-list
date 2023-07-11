class ChangeRatingToDecimalInMovies < ActiveRecord::Migration[7.0]
  def up
    change_column :movies, :rating, :decimal, precision: 3, scale: 1
  end

  def down
    change_column :movies, :rating, :integer
  end
end
