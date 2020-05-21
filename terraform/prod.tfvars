# Simple name with only alpha characters
app_name = "TODO"
# you should have manually created this key during the setup
ssh_key_name = "TODO"
# these stages can be anything you'd like though prod / dev / staging are common
stage = "prod | dev | staging"
# usually does not need to be a a big instance - you'd be suprised with what you
# can do with a small instance
instance_type = "t2.micro - TODO"
# the elastic ip address that you manually created in the AWS console
http_server_elastic_ip_allocation_id = "eipalloc-TODO"
# again, you'd be suprised what you can do with a small server
rds_instance_type = "db.t2.micro - TODO"
database_user = "app"
# since the database should only be available from within
# the vpc and definitely NOT be public, a strong password is probably
# not necessary
database_password = "super-strong-password-123"
# Be sure to use the default port for the type of database you're using
# for postgres: 5432 and mysql: 3306
database_port = TODO
