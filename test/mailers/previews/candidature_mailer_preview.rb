# Preview all emails at http://localhost:3000/rails/mailers/candidature_mailer
class CandidatureMailerPreview < ActionMailer::Preview
  def new_candidature
    candidature = Candidature.new(
      name: "Jan De Poorter",
      email: 'jan@sumocoders.be',
      phone_number: '0484326161',
      motivation: 'Dit is mijn motivatie',
      resume: File.open(Rails.root + 'public' + 'favicon.ico')
    )

    CandidatureMailer.new_candidature(candidature)
  end
end
