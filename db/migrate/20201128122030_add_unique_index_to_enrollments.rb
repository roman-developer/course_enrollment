class AddUniqueIndexToEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_index :enrollments, [:teacher_id, :course_id], unique: true
  end
end