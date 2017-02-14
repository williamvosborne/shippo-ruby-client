require 'pry'
require 'simplecov'

SimpleCov.start

require 'vcr'
require 'rspec/core'
require 'webmock/rspec'
require 'shippo'


def configure_vcr(cassette_path)
  VCR.configure do |config|
    config.cassette_library_dir = cassette_path
    config.hook_into :webmock
    config.filter_sensitive_data('<API_TOKEN>') do |interaction|
      interaction.request.headers['Authorization'].first
    end
  end
end

RSpec.configure do |config|
  config.before do
    srand 117
  end
end

Shippo::API.warnings = false
