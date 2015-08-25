class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:description, :string)
      t.column(:cost, :int)
      t.column(:purchase_id, :int)

      t.timestamps()
    end
  end
end
