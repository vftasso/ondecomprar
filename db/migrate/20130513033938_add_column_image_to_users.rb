class AddColumnImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, :after => :location
  end
end
