# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  name: "admin",
  email: "admin@admin.com",
  password: "123456",
  is_admin: true
  )

User.create(
  name: "user",
  email: "user@user.com",
  password: "123456"
  )

# Project.create(
#   name: "VMS B9 FPT IS",
#   description: "a formally written declaration of the project and its idea and context to explain the goals and objectives to be reached, the business need and problem to be addressed, potentials pitfalls and challenges, approaches and execution methods, resource estimates, people and organizations involved, and other relevant information that explains the need for project startup and aims to describe the amount of work planned for implementation.",
#   duration: "1 10
# 2 15
# 3 20
# 4 10
# 5 15
# 6 20
# 7 10
# 8 15
# 9 20
# 10 20",
#   dependence: "1 3
# 1 4
# 2 5
# 2 6
# 3 5
# 4 8
# 5 7
# 6 7
# 6 9
# 7 8
# 7 10
# 8 10
# 9 10",
#   matrix_experiment: "1 0 1 0 0
# 0 0 1 1 0
# 0 0 0 0 1
# 1 0 1 0 0
# 0 1 1 1 0
# 0 1 1 0 0
# 0 1 0 1 0
# 1 0 0 0 1
# 0 0 1 1 0
# 0 0 1 0 1",
#   level_experience: "0.0 0.0 0.4 0.8 0.0
# 0.2 0.0 0.4 0.0 0.0
# 0.0 0.8 0.0 0.0 0.0
# 0.0 0.0 0.4 0.8 0.6
# 0.0 0.6 0.0 0.0 0.0
# 0.0 0.6 0.4 0.8 0.0
# 0.0 0.4 0.4 0.0 0.0
# 0.0 0.6 0.6 0.8 0.0
# 0.0 0.2 0.4 0.0 0.0
# 0.6 0.4 0.0 0.0 0.6",
#   user_id: "2",
#   weighted_of_fitness_1: 0.1,
#   weighted_of_fitness_2: 0.9,
#   number_of_task: 10,
#   number_of_develop: 10
#   )
