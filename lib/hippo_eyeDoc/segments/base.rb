module Hippo_eyeDoc::Segments
  class Base
    include Hippo_eyeDoc::Separator
    include Hippo_eyeDoc::Parser::Segment
    include Hippo_eyeDoc::Outputters::HTML::Segment
    include Hippo_eyeDoc::Outputters::PDF::Segment
    include Hippo_eyeDoc::Outputters::PrettyString::Segment

    class << self
      attr_accessor :fields, :identifier, :fixed_width

      def fields
        @fields ||= []
      end

      def identifier
        @identifier ||= ''
      end

      def field(field)
        f              = Hippo_eyeDoc::Field.new
        f.sequence     = fields.length + 1
        f.name         = field[:name]
        f.datatype     = field[:datatype]
        f.minimum      = field[:minimum]
        f.maximum      = field[:maximum]
        f.options      = field[:options]
        f.restrictions = field[:restrictions]
        f.required     = field[:required]  || false
        f.separator    = field[:separator] || @default_separator || :field_separator

        if @composite_block
          f.composite = true
          f.composite_sequence = fields.length
          f.sequence = fields.last.length + 1
          fields.last << f
        else
          fields << f
        end
      end

      def segment?
        true
      end

      def transaction_set?
        false
      end

      def composite_field(field_name)
        @composite_block = true
        @default_separator = :composite_separator
        fields << []
        yield
        @default_separator = :field_separator
        @composite_block = false
      end

      def segment_identifier(id)
        @identifier = id
        @fields     = []
      end

      def segment_fixed_width
        @fixed_width = true
      end
    end

    attr_accessor :values, :parent

    def segments
      [self]
    end

    def segment_count
      segments.count
    end

    def ancestors
      if parent
        parent.ancestors.flatten
      else
        []
      end
    end

    def to_ary
      nil
    end
    alias :to_a :to_ary

    def initialize(options = {})
      @parent = options.delete(:parent)

      super
    end

    def values
      @values ||= {}
    end

    def get_field_name(text)
      text.to_s.gsub(' ','').gsub('=','')
    end

    def get_field(field)
      if field =~ /\A#{self.class.identifier}(?:(\d+)(?:_(\d+)){0,1})\z/
        if $2 && self.class.fields[$1.to_i - 1].class == Array
          self.class.fields[$1.to_i - 1][$2.to_i - 1]
        else
          self.class.fields[$1.to_i - 1]
        end
      else
        fields = self.class.fields.flatten.select{|f| f.name == field.gsub(/_\d{1,2}\z/,'')}

        if field =~ /_(\d{1,2})\z/
          fields[$1.to_i - 1]
        else
          fields.first
        end
      end
    end

    def to_s
      output = self.class.identifier + @field_separator

      self.class.fields.each_with_index do |field, index|
        if field.class == Array # this is a composite field
          field.each do |comp_field|
            field_value = if values[comp_field.composite_sequence]
                            # some values exist for this composite field
                            comp_field.string_value(values[comp_field.composite_sequence][comp_field.sequence])
                          else
                            # no values exist for the entire composite field
                            ''
                          end

            output += field_value + @composite_separator
          end

          output += @field_separator
        else # standard field
          field_value = field.string_value(values[field.sequence])

          output += field_value + @field_separator
        end
      end

      unless self.class.fixed_width
        output = remove_empty_fields(output)
        output = output.gsub(repeating_composite_separator_regexp, @field_separator)
      end

      output += @segment_separator
      output = output.gsub(repeating_field_separator_at_end_of_segment_regexp, @segment_separator)

      output =~ /\A#{self.class.identifier}#{segment_separator}/ ? '' : output
    end

    def identifier
      self.class.identifier
    end

    def method_missing(method_name, *args)
      values

      field = get_field(get_field_name(method_name.to_s))

      if field.nil? || field.class == Array
         raise Hippo_eyeDoc::Exceptions::InvalidField.new("Invalid field '#{method_name.to_s}' specified.")
      end

      if method_name.to_s =~ /=\z/
        if field.composite
          self.values[field.composite_sequence] ||= {}
          self.values[field.composite_sequence][field.sequence] = field.formatted_value(args[0])
        else
          self.values[field.sequence] = field.formatted_value(args[0])
        end
      else
        if field.composite
          self.values[field.composite_sequence] ||= {}
          self.values[field.composite_sequence][field.sequence]
        else
          self.values[field.sequence]
        end
      end
    end
  end
end
