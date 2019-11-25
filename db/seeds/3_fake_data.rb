
10.times do |i|
  question = Question.create!(description: Faker::Lorem.paragraph(sentence_count: 15))

  question.question_options.create(
    description:    Faker::Lorem.sentences,
    identifier:     "a",
    correct_answer: true
  )

  question.question_options.create(
    description:    Faker::Lorem.sentences,
    identifier:     "b",
  )

  UserQuestion.create(user_id: User.all.sample.id, question_id: question.id) if rand(2) == 0
end

User.all.each do |user|
  user.questions.each do |question|
    if rand(2) == 0
      user_question = UserQuestion.where("user_id = ? OR question_id = ?", user.id, question.id).first

      answer = user.answers.create!(
        solution:         rand(2) == 0 ? "a" : "b",
        user_question_id: user_question.id
      )
    end
  end
end
