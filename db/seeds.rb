# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "A apagar a base de Dados..."

Booking.destroy_all

puts "..."

UserAula.destroy_all

puts "..."

User.destroy_all

puts "..."

Aula.destroy_all

puts "..."

puts "A Base de dados está limpa!!"

puts "..."

puts "..."

puts "A criar utilizadores"

puts "..."

puts "..."

admin = User.new(
  email: "admin@admin.pt",
  password: "123456789",
  first_name: "Cláudia",
  last_name: "Leitão",
  role: 2
)
admin.save

puts "..."

puts "..."

puts "Admin foi criado"

puts "..."

puts "..."

puts "A criar o professor"

puts "..."

puts "..."

professor1 = User.new(
  email: "prof@prof.pt",
  password: "987654321",
  first_name: "Catarina",
  last_name: "Braço Forte",
  role: 1
)
professor1.save

puts "..."

puts "..."

puts "Professor foi criado"

puts "..."

puts "..."

puts "A criar o professor"

puts "..."

puts "..."

professor2 = User.new(
  email: "prof2@prof2.pt",
  password: "987654321",
  first_name: "Guilherme",
  last_name: "Passinhas",
  role: 1
)
professor2.save

puts "..."

puts "..."

puts "Professor foi criado"

puts "..."

puts "..."

puts "A criar o alunos"

puts "..."

puts "..."

aluno1 = User.new(
  email: "aluno1@aluno1.pt",
  password: "123456789",
  first_name: "João",
  last_name: "Sagorro",
  role: 0
)
aluno1.save

puts "Aluno 1 foi criado"

puts "..."

puts "..."

aluno2 = User.new(
  email: "aluno2@aluno2.pt",
  password: "123456789",
  first_name: "Catarina",
  last_name: "Nunes",
  role: 0
)
aluno2.save

puts "..."

puts "..."

puts "Alunos criados!"

puts "..."

puts "..."

puts "Base de dados criada"
