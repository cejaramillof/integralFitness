class AddColumnVariationToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :variation, :integer
  end
end
