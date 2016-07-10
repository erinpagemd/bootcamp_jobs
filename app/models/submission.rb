class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_opening

  include AASM

  enum aasm_state: {
    applied: 0,
    rejected: 1
  }

  aasm column: :aasm_state, enum: true do
    Submission.aasm_states.each { |k, v| state k.to_sym, inital: v.zero? }
  end
end
