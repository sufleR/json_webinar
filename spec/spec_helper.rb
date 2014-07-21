ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.render_views = true

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  shared_context "api" do
    def api_headers(version=1, user=nil)
      options = {}
      options['HTTP_ACCEPT'] = "json"
      options
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
    FactoryGirl.lint
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
