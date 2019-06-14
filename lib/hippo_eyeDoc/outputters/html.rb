 module Hippo_eyeDoc::Outputters
  module HTML
    module TransactionSet
      def to_html
        output = ''
        initial_call = caller.select{|m| m =~ /#{__FILE__}/}.length == 0

        if initial_call
          output = %{<fieldset class="hippo-transaction-set"><legend>#{self.class.to_s.sub('Hippo_eyeDoc::TransactionSets::','')}</legend>}
        end

        values.sort.each do |sequence, component|
          component_definition = self.class.components[sequence]
          if component_definition.klass.ancestors.include?(Hippo_eyeDoc::TransactionSets::Base)
            output += %Q{<fieldset class="hippo-component"><legend>#{component_definition.klass.to_s.sub('Hippo_eyeDoc::TransactionSets::','')} - #{component_definition.options[:name]}</legend>}
            output += component.to_html
            output += '</fieldset>'
          else
            output += %Q{<span class="hippo-segment-name">#{component_definition.options[:name]}</span><span class="hippo-segment-data">#{component.to_s}</span><br/>}
          end
        end

        output + (initial_call ? '</fieldset>' : '')
      end
    end

    module RepeatingComponent
      def to_html
       map{|component| component.to_html}.join
      end
    end

    module Segment
      def to_html
        to_s
      end
    end
  end
end
