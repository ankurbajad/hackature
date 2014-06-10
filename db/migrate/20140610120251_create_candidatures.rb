class CreateCandidatures < ActiveRecord::Migration
  def change
    create_table :candidatures do |t|
      t.string :name
      t.text :motivation
      t.string :resume
      t.text :steps

      t.timestamps
    end
  end
end
