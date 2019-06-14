require_relative 'parser/segment'
require_relative 'parser/transaction_set'

module Hippo_eyeDoc
  class Parser
    include Hippo_eyeDoc_eyeDoc::Separator
    include TransactionSet

    def self.parse_file(input)
      parser = new
      parser.parse_string(input)
    end

    def self.parse_string(input)
      parser = new
      parser.parse_string(input)
    end

    def initialize
      super
    end

    def initialize_transaction_set(index)
      {
        :segments  => [],
        :ISA       => find_first_segment(parsed_segments[0,index + 1], 'ISA', true),
        :GS        => find_first_segment(parsed_segments[0,index + 1], 'GS', true),
        :GE        => find_first_segment(parsed_segments[index + 1, parsed_segments.length - index + 1], 'GE'),
        :IEA       => find_first_segment(parsed_segments[index + 1, parsed_segments.length - index + 1], 'IEA')
      }
    end

    def parse_transaction_sets
      raw_transaction_sets  = []
      inside_transaction    = false

      parsed_segments.each_with_index do |segment, index|
        if segment.identifier == 'ST'
          raw_transaction_sets << initialize_transaction_set(index)

          inside_transaction = true
        end

        raw_transaction_sets.last[:segments] << segment if inside_transaction

        inside_transaction = false if segment.identifier == 'SE'
      end

      raw_transaction_sets
    end

    def populate_transaction_sets
      parse_transaction_sets.collect do |transaction|
        transaction_set_id = transaction[:segments].first.ST01
        transaction_set = Hippo_eyeDoc::TransactionSets.constants.select{|c| c.to_s.end_with?(transaction_set_id) }.first

        Hippo_eyeDoc::TransactionSets.const_get(transaction_set)::Base.new(separators.merge(transaction))
      end
    end

    def parse_file(filename)
      parse_string(File.read(filename))
    end

    def parse_string(input)
      read(input)
      populate_transaction_sets
    end
  end
end
