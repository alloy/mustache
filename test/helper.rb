require 'test/unit'

$LOAD_PATH.unshift
Dir[File.dirname(__FILE__) + '/../examples/*.rb'].each do |file|
  require file
end
