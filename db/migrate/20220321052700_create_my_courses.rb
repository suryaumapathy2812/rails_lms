class CreateMyCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :my_courses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end