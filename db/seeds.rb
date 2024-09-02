require 'faker'

puts'destruindo players...'
Player.destroy_all
puts'destruidos'

puts'destruindo games...'
Game.destroy_all
puts'destruidos'

puts'destruindo users...'
User.destroy_all
puts'destruidos'

puts "=clear="

puts'criando user'

User.create!(email: 'julin@realuser.com', password: '123456', first_name: 'Julinho', last_name: 'Balinha', age: 17, nick_name: Faker::Games::Pokemon.name)
puts "criou user #{User.last.nick_name}"

User.create!(email: 'juju@user.com', password: '123456', first_name: 'Julio', last_name: 'Balas', age: 33, nick_name: Faker::Games::Pokemon.name)
puts "criou user #{User.last.nick_name}"

User.create!(email: 'jukaliao@user.com', password: '123456', first_name: 'Juliao', last_name: 'Balao', age: 45, nick_name: Faker::Games::DnD.first_name)
puts "criou user #{User.last.nick_name}"

User.create!(email: 'superjuca@user.com', password: '123456', first_name: 'Juliaozao', last_name: 'Balaozao', age: 51, nick_name: Faker::Games::WorldOfWarcraft.class_name)
puts "criou user #{User.last.nick_name}"

User.create!(email: 'jusi@user.com', password: '123456', first_name: 'Julia', last_name: 'Balah', age: 29, nick_name: Faker::Games::WorldOfWarcraft.class_name)
puts "criou user #{User.last.nick_name}"

User.create!(email: "juvbargao@emailreal.confia", password: '123456', first_name: "Juvenal", last_name: "Borga", age: 13, nick_name: Faker::Games::Pokemon.name)
puts "criou user #{User.last.nick_name}"

User.create!(email: "zein@emailreal.confia", password: '123456', first_name: "Jose", last_name: "Adarmiro", age: 26, nick_name: Faker::Games::DnD.first_name)
puts "criou user #{User.last.nick_name}"

User.create!(email: "luruta@emailreal.confia", password: '123456', first_name: "Luciana", last_name: "Rutamorao", age: 22, nick_name: Faker::Games::WorldOfWarcraft.class_name)
puts "criou user #{User.last.nick_name}"

User.create!(email: "a.remora@emailreal.confia", password: '123456', first_name: "Andrea", last_name: "Moraci Redoma", age: 14, nick_name: Faker::Games::DnD.first_name)
puts "criou user #{User.last.nick_name}"

User.create!(email: "albertin_tilim@emailreal.confia", password: '123456', first_name: "Hodalberto", last_name: "Tilimpiado", age: 18, nick_name: Faker::Games::DnD.first_name)
puts "criou user #{User.last.nick_name}"

puts "Criou todos usuarios"

puts "Criando Games..."
pg_rating = [13, 16, 18, 22, 10]

10.times do
  Game.create!(name: Faker::Games::Heroes.artifact, system: Faker::Game.title, pg: pg_rating.sample, user: User.all.sample)
  puts "Criou game #{Game.count}"
end

puts "Criou #{User.count} users, e #{Game.count} games."
