# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}
require_relative 'vars/_stage'

# server "10.0.0.171", user: fetch(:deploy_user), roles: %w{app db}
server "192.168.227.226", user: fetch(:deploy_user), roles: %w{app db}