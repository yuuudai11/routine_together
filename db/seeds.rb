# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin.create!(
#   email: 'admin2@mail',
#   password: 'aaaaaa'
# )

admins = [
    {email: 'admin@mail', password: '000000'}
  ]

admins.each do |admin|
  Admin.find_or_create_by(email: admin[:email]) do |a|
    a.password = admin[:password]
  end
end

statuses = [
    {days: (1..3), status_name: '幕の内第一歩'},
    {days: (4..10), status_name: '三日坊主'},
    {days: (11..20), status_name: '頑張り屋'},
    {days: (21..30), status_name: '独り立ちレベル'},
    {days: (31..60), status_name: '一人前'},
    {days: (61..90), status_name: 'プロ'},
    {days: (91..120), status_name: '鉄人'},
    {days: (121..180), status_name: '仙人'},
    {days: (181..365), status_name: 'スーパーサイヤ人'}
  ]

Status.destroy_all # 毎回更新する場合_ここ使う
statuses.each do |status|
  status[:days].each do |day|
    Status.find_or_create_by(days: day) do |s|
      s.status_name = status[:status_name]
    end
  end
end