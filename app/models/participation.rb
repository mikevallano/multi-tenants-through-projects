class Participation < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  belongs_to :associated_user, class_name: 'User'
  belongs_to :associated_project, class_name: 'Project'
  belongs_to :project
end
