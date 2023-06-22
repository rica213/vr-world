class CreateStudios < ActiveRecord::Migration[7.0]
  def change
    create_table :studios do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :duration
      t.string :location
      t.string :working_hours
      t.string :image_url
      t.integer :rating
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
