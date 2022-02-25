class CreateMissingPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :missing_people do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :hair_color
      t.integer :weight
      t.string :race

      t.timestamps
    end
  end
end
