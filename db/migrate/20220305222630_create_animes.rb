class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :status
      t.decimal :ranking
      t.date :release_date
      t.date :finish_date
      t.boolean :removed, default: false
      t.datetime :removal_date

      t.timestamps
    end
  end
end
