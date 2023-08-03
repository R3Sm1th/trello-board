class AddUrlToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :url, :string
    add_column :items, :deadline, :date
    add_column :items, :stack, :string
  end
end
