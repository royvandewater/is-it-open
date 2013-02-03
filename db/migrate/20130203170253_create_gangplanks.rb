class CreateGangplanks < ActiveRecord::Migration
  def change
    create_table :gangplanks do |t|
      t.string :status

      t.timestamps
    end
  end
end
