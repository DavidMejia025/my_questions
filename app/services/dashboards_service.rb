class DashboardsService
  def initialize
    @students  = User.all.where(role: "student")
    @questions = Question.all
  end

  def get_data
    {
      total_students:  @students.all.count,
      total_questions: @questions.all.count,
      students_data:   students_statistics,
      questions_data:  questions_statistics
    }
  end

  private

  def students_statistics
    data = @students.map do|student|
      get_student_data(student)
    end
  end

  def questions_statistics
    data = @questions.map do|question|
      get_question_data(question)
    end
  end

  def get_student_data(student)
    questions        = student.questions
    solved_questions = questions.left_outer_joins(:user_questions).where(user_questions: {solved: true})
    score            = solved_questions.count  > 0 ? (questions.count * 100) / solved_questions.count : 0

    {
      name:      student.username,
      questions: questions.count,
      correct:   solved_questions.count,
      score:     score
    }
  end

  def get_question_data(question)
    users_question = UserQuestion.where(question_id: question.id)
    attempts       = users_question.count
    solved         = users_question.where(solved: true)
    success        = solved.count > 0 ? (users_question.count * 100) / solved.count : 0

    {
      question_id: question.id,
      attempts:    attempts,
      success:     success,
    }
  end
end
