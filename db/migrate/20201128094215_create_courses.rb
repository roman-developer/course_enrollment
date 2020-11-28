class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, unique: true, null: false

      t.timestamps
    end
  end
end
