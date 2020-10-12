class CreatePorfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :porfolios do |t|
      t.string :title
      t.text :description
      t.string :tech
      t.string :client

      t.timestamps
    end
  end
end
