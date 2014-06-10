ActiveAdmin.register Candidature do
  index do
    column :name
    column :email
    column(:motivation) {|model| truncate(model.motivation) }
    column(:resume) {|model| link_to "download", model.resume.url }
    column :created_at

    actions
  end
end