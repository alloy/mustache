$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'mustache'

class Pragma < Mustache
  self.path = File.dirname(__FILE__)

  def names
    %w( Chris Mark Scott )
  end
end

if $0 == __FILE__
  puts Pragma.to_html
end
