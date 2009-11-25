$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'mustache'

class PragmaDotNotation < Mustache
  self.path = File.dirname(__FILE__)

  def person
    return {
      :name => 'Chris',
      :age => 24
    }
  end
end

if $0 == __FILE__
  puts PragmaDotNotation.to_html
end
