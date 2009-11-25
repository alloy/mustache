Mustache::PRAGMAS['IMPLICIT-ITERATOR'] = proc do |options|
  iterator = options[:iterator] || '.'

<<-ruby
\#{def ctx.[](name)
  el = super
  if el.is_a?(Array)
    el.map { |e| !e.is_a?(Hash) ? { '#{iterator}' => e } : e }
  else
    el
  end
end}
ruby
end
