class CandidatureMailer < ActionMailer::Base
  default from: "hackature@hackature.nl"

  def new_candidature(candidature)
    @candidature = candidature

    if @candidature.resume.present?
      attachments[@candidature.resume.filename] = @candidature.resume.file.read
    end

    mail to: ["pz@q-music.nl", "dimitri.vanheucke@medialaan.be"],
         reply_to: @candidature.email
  end
end
