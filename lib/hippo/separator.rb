module Hippo
  DEFAULT_FIELD_SEPARATOR        = '*'
  DEFAULT_COMPOSITE_SEPARATOR    = ':'
  DEFAULT_SEGMENT_SEPARATOR      = '~'
  DEFAULT_REPETITION_SEPARATOR   = '^'

  module Separator
    attr_accessor :field_separator, :composite_separator, :repetition_separator, :segment_separator

    def initialize(options = {})
      [:field_separator, :repetition_separator, :composite_separator, :segment_separator].each do |sym|
        value = options[sym] || parent_or_default_separator(sym)

        self.send(:"#{sym}=", value)
      end
    end

    def parent_or_default_separator(separator_type)
      if defined?(parent) && parent
        parent.send(separator_type.to_sym)
      else
        Hippo.const_get(:"DEFAULT_#{separator_type.to_s.upcase}")
      end
    end

    def parse_separators(input)
      if input =~ /\AISA/
        @field_separator      = input[3,1]
        @repetition_separator = input[82,1]
        @composite_separator  = input[104,1]
        @segment_separator    = input[105,1]
      end
    end

    def separators
      {
        :field_separator      => @field_separator,
        :composite_separator  => @composite_separator,
        :segment_separator    => @segment_separator,
        :repetition_separator => @repetition_separator
      }
    end

    def repeating_field_separator_at_end_of_segment_regexp
      %r{
          #{Regexp.escape(@field_separator)}+
          #{Regexp.escape(@segment_separator)}
        }x
    end

    def repeating_composite_separator_regexp
      %r{
          #{Regexp.escape(@composite_separator)}+
          #{Regexp.escape(@field_separator)}
        }x
    end

    def regexp_escaped_separators
      Regexp.escape(@composite_separator) +
        Regexp.escape(@field_separator)   +
        Regexp.escape(@segment_separator)
    end

    def empty_field_regexp
      %r{([#{regexp_escaped_separators}])
          \s+
          ([#{regexp_escaped_separators}])
        }x
    end

    def remove_empty_fields(input)
      while input =~ empty_field_regexp
        input = input.gsub(empty_field_regexp, '\1\2')
      end

      input
    end
  end
end
