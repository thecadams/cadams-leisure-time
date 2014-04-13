class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :url
      t.boolean :done, null: false, default: false
      t.timestamps
    end
  end
end
