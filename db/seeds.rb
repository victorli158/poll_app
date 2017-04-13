# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(user_name: 'tu')
u2 = User.create(user_name: 'victor')
u3 = User.create(user_name: 'john')


p1 = Poll.create(title: 'poll 1', author_id: 1)
p2 = Poll.create(title: 'poll 2', author_id: 1)
p3 = Poll.create(title: 'poll 3', author_id: 1)

p4 = Poll.create(title: 'poll 4', author_id: 2)
p5 = Poll.create(title: 'poll 5', author_id: 2)

p6 = Poll.create(title: 'poll 6', author_id: 3)


q1 = Question.create(text: 'How are you?', poll_id: 1)
q2 = Question.create(text: 'question 2?', poll_id: 1)

q3 = Question.create(text: 'what is ruby?', poll_id: 4)
q4 = Question.create(text: 'how to commit?', poll_id: 4)

q5 = Question.create(text: 'who are you?', poll_id: 6)


a1 = AnswerChoice.create(text: 'Good', question_id: q1.id)
a2 = AnswerChoice.create(text: 'Bad', question_id: q1.id)

a3 = AnswerChoice.create(text: 'a crystal', question_id: q3.id)
a4 = AnswerChoice.create(text: 'language', question_id: q3.id)

r1 = Response.create(user_id: 3, answer_choice_id: 1)
r2 = Response.create(user_id: 2, answer_choice_id: 1)

r3 = Response.create(user_id: 1, answer_choice_id: 3)
r4 = Response.create(user_id: 2, answer_choice_id: 4)
