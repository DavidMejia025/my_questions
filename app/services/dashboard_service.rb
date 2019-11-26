module Services
  class DashBoard
    def initialize
      @students  = User.all.where(role: "student")
      @questions = Questions.all
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

    def self.get_student_data(student)
      questions        = student.questions
      solved_questions = questions.left_outer_joins(:user_questions).where(user_questions: {solved: true})

      {
        name:      student.username,
        questions: questions.count,
        correct:   solved_questions.count,
        score:     (questions.count * 100) / solved_questions.count
      }
    end

    def self.get_question_data(question)
      users_question = UserQuestion.where(question_id: question.id)
      attempts       = users_question.count
      solved         = user_questions.where(solved: true)

      {
        question_id: question.id,
        attempts:    question.user_question.attempts,
        success:     attempts,
        solved:      (attemps * 100) / solved
      }
    end
  end
end
