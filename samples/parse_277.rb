#!/usr/bin/env ruby
require 'pp'
require 'pry'
require 'hippo_eyeDoc'

def wrap_text(text, max_width, wrap_string = "\n")
  if text.length <= max_width
    text
  else
    text.scan(/.{1,#{max_width}}/).join(wrap_string)
  end
end

category_codes = Hippo_eyeDoc::CodeLists::ClaimStatusCategoryCodes
status_codes   = Hippo_eyeDoc::CodeLists::ClaimStatusCodes

ARGF.each do |infile|
  ftaq = 0
  ftaa = 0
  ftrq = 0
  ftra = 0
  parser = Hippo_eyeDoc::Parser.new
  transaction_sets = parser.parse_string(infile)

  transaction_sets.each do |ts|
    puts '=' * 120
	puts "+---------" + ('-' * ARGF.filename.length) + "+"
	puts "| File [%s] |" % [ARGF.filename] 
	puts "+---------" + ('-' * ARGF.filename.length) + "+"
    puts "Confirmation for 837 transaction on %s with a batch control number of %s." % [ts.L2000A.L2200A.DTP.DTP03.to_s, ts.L2000B.L2200B.TRN.TRN02]
    puts "  %s(%s)" % [ts.L2000A.L2100A.NM1.NameLastOrOrganizationName, ts.L2000A.L2100A.NM1.EntityIdentifierCode]

    if ts.L2000B.L2200B.STC.STC03 == 'U'
      puts "  Entire batch REJECTED!!!!"
    else
      taq = ts.L2000B.L2200B.find_by_name('Total Accepted Quantity').QTY02
      taq ||= 0
      taa = ts.L2000B.L2200B.find_by_name('Total Accepted Amount').AMT02
      taa ||= 0
      trq = ts.L2000B.L2200B.find_by_name('Total Rejected Quantity').QTY02
      trq ||= 0
      tra = ts.L2000B.L2200B.find_by_name('Total Rejected Amount').AMT02
      tra ||= 0
      ftaq = ftaq + taq
      ftaa = ftaa + taa
      ftrq = ftrq + trq
      ftra = ftra + tra
      puts "  Accepted: %4d ($%-9.2f) Rejected: %4d ($%-9.2f)" % [taq, taa, trq, tra]
    end

    ts.L2000C.each do |l2000c|
      puts '-----------------------------------------------------------------------------------------------------------------------'
      puts "    Billing Provider: %s(%s)" % [l2000c.L2100C.NM1.NM103, l2000c.L2100C.NM1.NM109]
      taq = l2000c.L2200C.find_by_name('Total Accepted Quantity').QTY02
      taq ||= 0
      taa = l2000c.L2200C.find_by_name('Total Accepted Amount').AMT02
      taa ||= 0
      trq = l2000c.L2200C.find_by_name('Total Rejected Quantity').QTY02
      trq ||= 0
      tra = l2000c.L2200C.find_by_name('Total Rejected Amount').AMT02
      tra ||= 0
      puts "    Accepted: %4d ($%-9.2f) Rejected: %4d ($%-9.2f)" % [taq, taa, trq, tra]

      #TODO: need to handle/print out Provider level STC if present

      l2000c.L2000D.each do |l2000d|
        claim_number      = ''
        patient_name      = ''
        date_of_service   = ''
        claim_status      = ''
        claim_status_text = []
        services          = []

        patient_name = (l2000d.L2100D.NM1.NM103 + ', '  + l2000d.L2100D.NM1.NM104)[0,30].ljust(30)

        l2000d.L2200D.each do |l2200d|
          claim_number    = l2200d.TRN.TRN02
          date_of_service = l2200d.DTP.DTP03

          # claim level
          claim_status = l2200d.STC.any?{|stc| stc.STC03 == 'U'} ? 'REJECTED' : 'ACCEPTED'
          claim_status_text = []

          l2200d.STC.each do |stc|
            next if stc.STC03 != 'U'
            claim_status_text << "Cat: #{stc.STC01_01} Stat: #{code = stc.STC01_02} - #{wrap_text(status_codes[code][:description], 65)}"
            claim_status_text << "#{stc.STC12}" if stc.STC12
          end

          l2200d.L2220D.each do |l2220d|
            next unless l2220d.STC.STC03 != 'U'

            service_status_text = []
            l2220d.STC.each do |stc|
              next if stc.STC03 != 'U'

              service_status_text << "Cat: #{stc.STC01_01} Stat: #{code = stc.STC01_02} - #{wrap_text(status_codes[code][:description], 65)}"
              service_status_text << "#{stc.STC12}" if stc.STC12
            end

            services << {
              :date_of_service => l2220d.DTP.DTP03,
              :procedure_code => l2220d.SVC.SVC01_02,
              :modifier_1 => l2220d.SVC.SVC01_03,
              :modifier_2 => l2220d.SVC.SVC01_04,
              :service_status_text => service_status_text
            }

          end

          puts "      CLM# #{claim_number} - #{patient_name} #{claim_status}"
          puts "        #{claim_status_text.join("\n        ")}\n" if claim_status_text.length > 0
          puts "" if claim_status == 'REJECTED'
          services.each do |s|
            puts "        SVC - REJECTED DOS: #{s[:date_of_service]} - CPT: #{s[:procedure_code]}"
            puts "          #{s[:service_status_text].join("\n        ")}" if s[:service_status_text].length > 0
            puts ""
          end
        end   #l2000d.L2200D.each
      end #l2000c.L2000D.each
    end #ts.L2000C.each
    puts "+---------" + ('-' * ARGF.filename.length) + "+"
    puts "| END [%s] |" % [ARGF.filename] 
    puts "| Accepted: %4d ($%-9.2f) Rejected: %4d ($%-9.2f) |" % [ftaq, ftaa, ftrq, ftra]
    puts "+---------" + ('-' * ARGF.filename.length) + "+"
  end #transaction_sets
end #infile
