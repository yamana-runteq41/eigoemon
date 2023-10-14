class Quiz < ApplicationRecord
  belongs_to :word
  has_many :quiz_choices, dependent: :destroy

  def self.get_review_quiz_for_user(user)
    answered_quizzes = Quiz.joins(quiz_choices: :user_quiz_histories).where(user_quiz_histories: { user_id: user.id }).distinct
  
    review_candidate_quizzes = answered_quizzes.select do |quiz|
      latest_history = UserQuizHistory.where(user: user, word_id: quiz.word_id).order(created_at: :desc).first
      days_since_last_answer = (Date.today - latest_history.created_at.to_date).to_i
  
      if latest_history.is_correct?
        correct_histories = UserQuizHistory.where(user: user, word_id: quiz.word_id, is_correct: true).order(created_at: :desc)
        
        last_incorrect_date = UserQuizHistory.where(user: user, word_id: quiz.word_id, is_correct: false).order(created_at: :desc).first&.created_at
        
        consecutive_correct_count = if last_incorrect_date
          correct_histories.take_while { |h| h.created_at > last_incorrect_date }.count
        else
          correct_histories.count
        end
        
        case consecutive_correct_count
        when 1
          days_since_last_answer >= 0
        when 2
          days_since_last_answer >= 5
        else
          false
        end
      else
        days_since_last_answer >= 0
      end
    end
  
    sorted_quizzes = review_candidate_quizzes.sort_by do |quiz|
      UserQuizHistory.where(user: user, word_id: quiz.word_id).order(created_at: :desc).first.created_at
    end
  
    sorted_quizzes.first
  end
  
  def self.next_quiz_for_user(user)
    unanswered_quizzes = all.reject do |quiz|
      user.user_quiz_histories.exists?(word_id: quiz.word_id)
    end

    return unanswered_quizzes.sample if unanswered_quizzes.any?

    quiz_answer_counts = all.each_with_object({}) do |quiz, hash|
      hash[quiz.id] = user.user_quiz_histories.where(word_id: quiz.word_id).count
    end
    min_answered_quiz_ids = quiz_answer_counts.select { |_, count| count == quiz_answer_counts.values.min }.keys

    oldest_answered_quiz = min_answered_quiz_ids.map do |quiz_id|
      user.user_quiz_histories.where(word_id: quiz_id).order(created_at: :asc).first
    end.compact.min_by(&:created_at)

    oldest_answered_quiz ? find(oldest_answered_quiz.word_id) : find(min_answered_quiz_ids.sample)
  end
end
