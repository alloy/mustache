class Mustache
  module Pragmas
    module DotNotation
      def [](name)
        return super unless name.to_s.include? '.'
        parts = name.to_s.split('.')
        ret = self

        while parts.any?
          part = parts.shift
          ret = ret[part.to_s] || ret[part.to_sym]
        end
        ret
      end
    end
  end
end

Mustache::PRAGMAS['DOT-NOTATION'] = proc do |options|
  '#{(class<<ctx;self;end).send(:include,%s);%s;nil}' %
    [ 'Mustache::Pragmas::DotNotation', '' ]
end
