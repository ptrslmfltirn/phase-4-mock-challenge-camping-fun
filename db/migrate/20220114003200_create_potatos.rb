class CreatePotatos < ActiveRecord::Migration[6.1]
  def change
    create_table :potatos do |t|

      t.timestamps
    end
  end
end
