class Candidature < ActiveRecord::Base
  validates_presence_of :name, :motivation, :email
  serialize :steps

  mount_uploader :resume, ResumeUploader
end
