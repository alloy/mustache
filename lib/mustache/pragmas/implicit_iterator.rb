class Mustache
  module Pragmas
    module ImplicitIterator
      attr_accessor :iterator

      def [](name)
        el = super
        if el.is_a?(Array)
          el.map { |e| !e.is_a?(Hash) ? { iterator => e } : e }
        else
          el
        end
      end
    end
  end
end

Mustache::PRAGMAS['IMPLICIT-ITERATOR'] = proc do |options|
  iterator = options[:iterator] || '.'
  '#{(class<<ctx;self;end).send(:include,%s);%s;nil}' %
    [ 'Mustache::Pragmas::ImplicitIterator', "ctx.iterator='#{iterator}'" ]
end
