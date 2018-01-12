module Hippo::TransactionSets
  class RepeatingComponent < Array
    include Hippo::Outputters::HTML::RepeatingComponent
    include Hippo::Outputters::PDF::RepeatingComponent
    include Hippo::Outputters::PrettyString::RepeatingComponent

    def initialize(component_entry, parent)
      @component_entry = component_entry
      @parent = parent
    end

    def build
      component = @component_entry.populate_component(@component_entry.klass.new(:parent => @parent))

      push(component)
      yield component if block_given?
      component
    end

    def to_s
      self.map(&:to_s).join
    end

    def segments
      return [] unless self.length != 0

      self.map(&:segments).flatten
    end

    def segment_count
      segments.length
    end

    def ancestors
      if parent
        parent.ancestors.flatten
      else
        []
      end
    end

    def method_missing(method_name, *args, &block)
      build if self.length == 0

      self.first.send(method_name, *args, &block)
    end
  end
end
