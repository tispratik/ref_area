config.cache_classes = false
config.log_level = :debug
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

config.action_mailer.raise_delivery_errors = false
config.gem 'machinist'
config.gem 'populator'
config.gem 'faker'
config.gem 'random_data'
config.gem 'rails-footnotes'