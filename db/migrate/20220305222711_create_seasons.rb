class CreateSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :seasons do |t|
      t.integer :number
      t.date :release_date
      t.date :finish_date
      t.references :anime

      t.timestamps
    end
  end
end
