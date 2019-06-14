module Hippo_eyeDoc::Outputters
  module PrettyString
    module TransactionSet
      def pretty_print(pp)
        pp.text to_pretty_string
      end

      def to_pretty_string(indent_level = 0)
        output = ''

        values.sort.each do |sequence, component|
          component_definition = self.class.components[sequence]

          extra_indent = if component_definition.klass.ancestors.include?(Hippo::TransactionSets::Base)
                           2
                         elsif sequence == 0
                           0
                         else
                           2
                         end

          output += component.to_pretty_string(indent_level + extra_indent)
        end

        output
      end
    end

    module RepeatingComponent
      def pretty_print(pp)
        pp.text to_pretty_string
      end

      def to_pretty_string(indent_level = 0)
        map{|component| component.to_pretty_string(indent_level)}.join
      end
    end

    module Segment
      def to_pretty_string(indent_level = 0)
        ' ' * indent_level + to_s + "\n"
      end
    end
  end
end
