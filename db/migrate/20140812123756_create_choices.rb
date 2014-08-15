class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :text
      t.boolean :correct
      t.references :problem, index: true

      t.timestamps
    end
  end
end
