module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def single_question_response(user_question, status = :ok)
    render json: build_question_object(user_question), status: status
  end

  def build_question_object(user_question)
    question = Question.find(user_question.question_id)

    {
      question_id: user_question.id,
      question:    question.description,
      options:     build_options(question)
    }
  end

  def build_options(question)
    options = question.question_options.reduce([]) do |accu, option|
      puts option.identifier
      puts  option.description
       accu = accu.push({
         identifier: option.identifier,
         text:       option.description
       })
       puts "!!!!"
puts accu
       accu
     end

     options
  end
end
