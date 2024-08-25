class ApplicationJob < ActiveJob::Base
  require 'nokogiri'
  require 'open-uri'

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
