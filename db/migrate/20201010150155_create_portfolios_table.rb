class CreatePortfoliosTable < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :description
      t.string :tech
      t.string :client
      t.timestamps
    end
  end
end
