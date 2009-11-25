Mustache::PRAGMAS['IMPLICIT-ITERATOR'] = proc do |*args|
  iterator = args[0] || '.'

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
