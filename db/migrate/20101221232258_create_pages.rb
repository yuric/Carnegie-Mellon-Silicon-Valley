class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :other

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
