class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_opening

  scope :active, -> { where(aasm_state: [0, 2, 3]) }
  scope :hired, -> { where(aasm_state: 4) }

  include AASM

  enum aasm_state: {
    applied: 0,
    rejected: 1,
    contacted: 2,
    interviewed: 3,
    hired: 4
  }

  aasm column: :aasm_state, enum: true do
    Submission.aasm_states.each { |k, v| state k.to_sym, inital: v.zero? }

    event :admin_reject do
      transitions :from => [:applied, :contacted, :interviewed], :to => :rejected
    end

    event :admin_contacts_candidate do
      transitions :from => :applied, :to => :contacted
    end

    event :admin_interviews_candidate do
      transitions :from => [:applied, :contacted], :to => :interviewed
    end

    event :admin_hires_candidate do
      transitions :from => :interviewed, :to => :hired
    end

    event :admin_reconsiders_candidate do
      transitions :from => :rejected, :to => :applied
    end
  end
end
