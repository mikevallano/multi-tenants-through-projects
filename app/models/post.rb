class Post < ActiveRecord::Base
  # default_scope { where(account_id: Account.current_id) }
  belongs_to :project

  # extend FriendlyId
  #   friendly_id :name, :use => :history

  # def should_generate_new_friendly_id?
  #   name_changed?
  # end

  # default_scope { where(project_id: Project.current_id) }
end
