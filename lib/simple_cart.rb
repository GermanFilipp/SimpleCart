require 'simple_cart/engine'
require 'simple_cart/controller_methods'
require 'simple_cart/model_methods'

module SimpleCart

  PRODUCT_CLASSES = []
  REQUIRED = %w(active_record)

  mattr_accessor :set_cart_on_each_request
  @set_cart_on_each_request = false

  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'



  def self.setup
    yield self
  end

  def self.active_record_missing
    puts <<-WARN
      Warning: no ActiveRecord detected
      ActiveRecord is required for this engine.
      Your Gemfile might not be configured properly.
      ---- try ----
      gem 'active_record''
    WARN
  end

  REQUIRED.each do |r|
    begin
      require r
    rescue LoadError => ex
      self.send "#{r}_missing".to_sym
      raise ex
    end
  end

end
