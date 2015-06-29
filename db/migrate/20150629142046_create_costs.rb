class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :name
      t.float :price
      t.string :reason
      t.string :image_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
