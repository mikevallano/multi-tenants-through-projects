class Chat < ActiveRecord::Base
  belongs_to :project

  default_scope { where(project_id: Project.current_id) }

  extend FriendlyId
    friendly_id :name, use: [:history, :scoped], :scope => :project

  def should_generate_new_friendly_id?
    name_changed?
  end

end
