class AddCachedVotesToTeachers < ActiveRecord::Migration[6.0]
  def change
    change_table :teachers do |t|
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
    end
  end
end
