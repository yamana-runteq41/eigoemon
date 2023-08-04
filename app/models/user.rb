class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_quiz_histories, dependent: :destroy

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  def record_quiz_history(quiz_choice)
    word_id = quiz_choice.quiz.word_id
    is_correct = quiz_choice.is_correct
    quiz_history = user_quiz_histories.create!(
      word_id: word_id, 
      quiz_choice: quiz_choice, 
      is_correct: is_correct
    )
    increase_level if quiz_history.is_correct && user_quiz_histories.where(is_correct: true).count % 3 == 0
    quiz_history
  end

  private

  def increase_level
    increment!(:level)
    ActionCable.server.broadcast("level_up_#{id}", { level: level })
  end 
end
