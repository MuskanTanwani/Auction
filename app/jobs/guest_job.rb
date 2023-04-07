class GuestJob < ApplicationJob
  queue_as :default

  def perform(email)
    AcceptanceMailer.acceptance_mailer(email).deliver
  end
end
