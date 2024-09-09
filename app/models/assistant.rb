class Assistant < ApplicationRecord
  belongs_to :user
  validates :question, presence: true
  after_create :fetch_answer

  private

  def fetch_answer
    ChatbotJob.perform_later(self)
  end
end
