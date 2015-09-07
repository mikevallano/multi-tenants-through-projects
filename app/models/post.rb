class Post < ActiveRecord::Base
  # default_scope { where(account_id: Account.current_id) }
  belongs_to :project

  default_scope { where(project_id: Project.current_id) }
end
