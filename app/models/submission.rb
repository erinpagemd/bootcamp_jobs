class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_opening

  scope :active, -> { where(aasm_state: 0) }

  include AASM

  enum aasm_state: {
    applied: 0,
    rejected: 1
  }

  aasm column: :aasm_state, enum: true do
    Submission.aasm_states.each { |k, v| state k.to_sym, inital: v.zero? }

    event :admin_reject do
      transitions :from => :applied, :to => :rejected
    end
  end
end
