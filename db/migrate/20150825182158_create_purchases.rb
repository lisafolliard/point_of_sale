class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:purchase_date, :timestamp)

      t.timestamps()
    end
  end
end
