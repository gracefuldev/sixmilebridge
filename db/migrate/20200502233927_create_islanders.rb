class CreateIslanders < ActiveRecord::Migration[6.0]
  def change
    create_table :islanders do |t|
      t.string :email
      t.string :timezzone

      t.timestamps
    end
  end
end
