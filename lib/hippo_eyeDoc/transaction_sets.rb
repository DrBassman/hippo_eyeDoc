require_relative 'transaction_sets/base'
require_relative 'transaction_sets/component'
require_relative 'transaction_sets/repeating_component'

module Hippo_eyeDoc
  module TransactionSets
    autoload_relative :HIPAA_270, 'transaction_sets/HIPAA_270'
    autoload_relative :HIPAA_271, 'transaction_sets/HIPAA_271'
    autoload_relative :HIPAA_276, 'transaction_sets/HIPAA_276'
    autoload_relative :HIPAA_277, 'transaction_sets/HIPAA_277'
    autoload_relative :HIPAA_835, 'transaction_sets/HIPAA_835'
    autoload_relative :HIPAA_837, 'transaction_sets/HIPAA_837'
    autoload_relative :HIPAA_997, 'transaction_sets/HIPAA_997'
    autoload_relative :HIPAA_999, 'transaction_sets/HIPAA_999'
  end
end
