class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :gadget

      t.timestamps
    end
    add_index :images, :gadget_id
  end
end
