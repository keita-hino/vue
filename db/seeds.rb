# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do |i|
  Project.create(
    project_name: "プロジェクト#{i+1}",
    sales_amount: "#{i+1}00000".to_i,
    working_group: 1,
    start_date: Time.now + (i+1).month,
    end_date: Time.now + (i+1).month,
   )
end