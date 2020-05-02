class RenameTimezzone < ActiveRecord::Migration[6.0]
  def change
    rename_column :islanders, :timezzone, :timezone
  end
end
