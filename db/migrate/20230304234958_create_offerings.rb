class CreateOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :offerings do |t|
      t.string :type
      t.float :cost
      t.string :paid

      t.timestamps
    end
  end
end
