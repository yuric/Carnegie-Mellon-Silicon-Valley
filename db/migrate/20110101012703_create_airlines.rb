class CreateAirlines < ActiveRecord::Migration
  def self.up
    create_table :airlines do |t|
      t.string :flyFrom
      t.string :flyTo
      t.date :departureOnThe
      t.string :departureDaySection
      t.string :returnDaySection
      t.date :returnOnThe
      t.integer :passengersToBoard

      t.timestamps
    end
  end

  def self.down
    drop_table :airlines
  end
end
