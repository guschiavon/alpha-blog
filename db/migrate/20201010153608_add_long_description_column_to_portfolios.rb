class AddLongDescriptionColumnToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :overview, :text
  end
end
