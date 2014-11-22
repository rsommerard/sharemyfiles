class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :token
      t.string :filename

      t.timestamps
    end
  end
end
