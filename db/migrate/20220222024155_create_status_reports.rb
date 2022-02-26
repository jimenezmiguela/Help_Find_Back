class CreateStatusReports < ActiveRecord::Migration[6.1]
  def change
    create_table :status_reports do |t|
      t.references :missing_person, null: false, foreign_key: true
      t.string :case_id
      t.string :description
      t.string :details
      t.string :image_url

      t.timestamps
    end
  end
end
