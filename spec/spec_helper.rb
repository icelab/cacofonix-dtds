require "bundler/setup"
require "cacofonix/dtds"

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.example_status_persistence_file_path = ".rspec_status"
end
