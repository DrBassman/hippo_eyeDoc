#!/usr/bin/ruby
require 'pp'
require 'pry'
require 'hippo'

#
# This will parse an ANSI X12 999B file and
# indicate if there are any reported errors / rejections.
#

def seg_syntax_code_lookup(code)
  seg_syntax_desc = ""
  case code
  when "1"
    seg_syntax_desc = "Unrecognized Segment ID."
  when "2"
    seg_syntax_desc = "Unexpected Segment."
  when "3"
    seg_syntax_desc = "Required Segment Missing."
  when "4"
    seg_syntax_desc = "Loop Occurs Over Maximum Times."
  when "5"
    seg_syntax_desc = "Segment Exceeds Maximum Use."
  when "6"
    seg_syntax_desc = "Segment Not in Defined Transaction Set."
  when "7"
    seg_syntax_desc = "Segment Not in Proper Sequence."
  when "8"
    seg_syntax_desc = "Segment Has Data Element Errors."
  when "I4"
    seg_syntax_desc = 'Implementation "Not Used" Segment Present.'
  when "I6"
    seg_syntax_desc = "Implementation Dependent Segment Missing."
  when "I7"
    seg_syntax_desc = "Implementation Loop Occurs Under Minimum Times."
  when "I8"
    seg_syntax_desc = "Implementation Segment Below Minimum Use."
  when "I9"
    seg_syntax_desc = 'Implementation Dependent "Not Used" Segment Present.'
  else
    seg_syntax_desc = "Unknown seg_syntax_code"
  end # case code
  seg_syntax_desc
end

ARGF.each do |infile|
  parser = Hippo::Parser.new

  trans_sets = parser.parse_string(infile)

  trans_sets.each do |ts|
    if ts.ST.ST01 == '999'
      if ts.AK9.AK901 == 'A'
        puts "%s indicates all transaction sets were accepted for further processing." % [ARGF.filename]
      else
        ts.L2000AK2.each do |l2000ak2|
          if l2000ak2.IK5.IK501 != 'A'
            trans_set_control_no = l2000ak2.AK2.AK202
            emsg = "Error:  "
            #
            # presence of loop 2100AK2 for Error Identification
            #
            l2000ak2.L2100AK2.each do |l2100ak2|
              seg_id = l2100ak2.IK3.IK301
              seg_pos = l2100ak2.IK3.IK302
              loop_id = l2100ak2.IK3.IK303
              seg_syntax_code = l2100ak2.IK3.IK304
              seg_syntax_desc = seg_syntax_code_lookup(seg_syntax_code)
              ctx_seg_context = l2100ak2.find_by_name('Segment Context')
              ctx_bus_unit_id = l2100ak2.find_by_name('Business Unit Identifier')
              emsg += "trans_number: [%s]\n  seg_id_code: [%s]\n  seg_position: [%s]\n  loop: [%s]\n  syntax code: [%s]  %s" % [trans_set_control_no, seg_id, seg_pos, loop_id, seg_syntax_code, seg_syntax_desc]
              if ctx_seg_context.to_s.length > 0
                emsg += "\n    Segment Context : [%s]" % [ctx_seg_context]
              end
              if ctx_bus_unit_id.to_s.length > 0
                emsg += "\n    Business Unit Identifier : [%s]" % [ctx_bus_unit_id]
              end
              
              #
              # presence of loop 2110AK2 for Implementation Data Element Note
              #
              l2100ak2.L2110AK2.each do |l2110ak2|
                pos_in_seg = l2110ak2.IK4
                data_element = l2110ak2.IK4.IK402
                data_ele_err_cd = l2110ak2.IK4.IK403
                data_copy = l2110ak2.IK4.IK404
                data_ele_err_desc = ""
                case data_ele_err_cd
                when "1"
                  data_ele_err_desc = "Mandatory data element missing"
                when "2"
                  data_ele_err_desc = "Conditional required data element missing"
                when "3"
                  data_ele_err_desc = "Too many data elements"
                when "4"
                  data_ele_err_desc = "Data element too short"
                when "5"
                  data_ele_err_desc = "Data element too long"
                when "6"
                  data_ele_err_desc = "Invalid character in data element"
                when "7"
                  data_ele_err_desc = "Invalid code value"
                when "8"
                  data_ele_err_desc = "Invalid date"
                when "9"
                  data_ele_err_desc = "Invalid time"
                when "10"
                  data_ele_err_desc = "Exclusion Condition Violated"
                else
                  data_ele_err_desc = "Unknown"
                end
                emsg += "\n      Position in Segment [%s]  Data Element Ref No [%s]  Data Element Err Code [%s ==> %s]  Copy of Bad Data Element  [%s]" % [pos_in_seg, data_element, data_ele_err_cd, data_ele_err_desc, data_copy]
              end #l2110ak2
            end # l2100ak2
            puts emsg
          end # IK501 != 'A'
        end # l2000ak2
      end
    end # ST01 = 999
  end # ts

end # infile
