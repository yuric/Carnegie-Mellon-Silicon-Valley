class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :your_name
      t.text :your_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
