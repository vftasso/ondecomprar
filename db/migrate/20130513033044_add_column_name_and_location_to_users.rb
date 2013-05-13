class AddColumnNameAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :after => :id
    add_column :users, :location, :string, :after => :email
  end
end
