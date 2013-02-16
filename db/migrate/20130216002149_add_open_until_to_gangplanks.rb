class AddOpenUntilToGangplanks < ActiveRecord::Migration
  def change
    add_column :gangplanks, :open_until, :datetime
    remove_column :gangplanks, :status
  end
end
