permission_step = /^"([^"]*)" can ([^"]+?)(?:| on| in| from) the "([^"]*)" project$/

def create_permission(user, thing, action)
  Permission.create!(user: User.find_by_email!(user),
                     thing: thing,
                     action: action)
end

def find_project(project)
  Project.find_by_name!(project)
end

#Given /^"([^"]*)" can view the "([^"]*)" project$/ do |user, project|
#  Permission.create!(user: User.find_by_email!(user),
#                     thing: Project.find_by_name!(project),
#                     action: 'view')
#end
#
#Given /^"([^"]*)" can create tickets in the "([^"]*)" project$/ do |user, project|
#  Permission.create!(user: User.find_by_email!(user),
#                     thing: Project.find_by_name!(project),
#                     action: "create tickets")
#end

Given permission_step do |user, action, project|
  create_permission(user,
                    find_project(project),
                    action)
end



