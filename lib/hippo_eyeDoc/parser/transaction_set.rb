module Hippo_eyeDoc
  class Parser
    module TransactionSet
      attr_accessor :unparsed_data

      def initialize(options={})
        super
      end

      def find_first_segment(segments, identifier, reverse = false)
        segments.reverse! if reverse

        if index = segments.index{|o| o.identifier == identifier}
          segments[index]
        else
          nil
        end
      end

      def parsed_segments
        @segments ||= @unparsed_data.split(@segment_separator).collect do |segment_string|
          segment_identifier = segment_string.split(@field_separator).first
          segment = Hippo_eyeDoc::Segments.const_get(segment_identifier.lstrip).new(:parent => self)

          segment.parse(segment_string)

          segment.to_s == '' ? nil : segment
        end.compact
      end

      def read(input = nil)
        input ||= ''

        @unparsed_data = input.gsub(/[\a\e\f\n\r\t\v]/,'')
        parse_separators(@unparsed_data)
      end

      def parse(input)
        read(input)
        populate(parsed_segments)
        self
      end
    end
  end
end
