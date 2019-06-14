Hippo_eyeDoc
============
Fork of Hippo with bugfixes by DrBassman.  Forked so that a "fixed" ruby gem could be
created / uploaded to rubygems.org.

Hippo
=====

The Hippo library is an attempt at creating a simple DSL to generate and parse HIPAA
transaction sets.  HIPAA or the Health Insurance Portability Accountability Act is a
series of regulations which place restrictions and requirements on the way transaction
sets  (ie. Claims, Remittances, Eligibility, Claim Status, etc.) must be formatted.

The HIPAA required transactions sets are created by the X12
organization. The current production version (as of 2011/02/05) is 4010A1, but
effective 2012/01/01 all organizations must be migrated to using version
5010.

To obtain copies of the implementation guides you must purchase them from the X12
organization. The implementation data is also available in tabular format (CSV).  The
transaction sets, loops, and segments in Hippo were created from the X12 CSV Table Data.

More information can be found at the following sites:

* [General HIPAA information from CMS](https://www.cms.gov/HIPAAGenInfo/01_Overview.asp)
* [Wikipedia HIPAA Article](http://en.wikipedia.org/wiki/Hipaa)
* [5010 Implementation Timeline](https://www.cms.gov/ElectronicBillingEDITrans/18_5010D0.asp)
* [X12 Store](https://store.x12.org)

Sample scripts using Hippo:

* [277CA Parser](https://gist.github.com/1492492)

This Repository
---------------

I was needing to parse the so-called '999' and '277' files that the vendor to whom I submit electronic
medical claims provides for each file uploaded.  A google search led me to the hippo ruby gem.  When my claims processor
changed the segment_separator in the 999 & 277's that they provide, my script quit working.  I discovered that the '~'
character was HARD-CODED as the segment_separator.  I copied the repository to github so that I could
"forget" which file it was that I updated, and to contribute the fix back to whomever would find it
useful.

I have attempted to email a patch to the author, but many of the links for this gem on
http://rubygems.org/gems/hippo (particularly the links to github source) are broken.  To date, I have not received any 
response from the author linked from that page...

This repository also includes my scripts for parsing the 999 & 277 files that I use in my practice...

Ryan Losh, O.D.
01/11/2018 @ 11:03PM CST.

Installation
------------
    gem install hippo

Usage
-----
This is very straight forward. Basically, create an instance of the
transaction set that you will be working with, and start filling in the
loops, segments, and fields.  For a complete example from the 222A1 (837-P) implementation
guide please review [test/test_hipaa_837.rb](/promedical/hippo/blob/master/test/test_hipaa_837.rb).

Below is a small sample of how to create a transaction set.

```ruby
ts = Hippo::TransactionSets::HIPAA_837::Base.new

ts.ST do |st|
  st.TransactionSetControlNumber        = '0021'
  st.ImplementationConventionReference  = '005010X222A1'
end

ts.BHT do |bht|
  bht.TransactionSetPurposeCode = '00'
  bht.ReferenceIdentification   = '244579'
  bht.Date                      = '20061015'
  bht.Time                      = '1023'
  bht.TransactionTypeCode       = 'CH'
end

ts.L1000A do |l1000a|
  l1000a.NM1 do |nm1|
    nm1.EntityTypeQualifier        = '2'
    nm1.NameLastOrOrganizationName = 'PREMIER BILLING SERVICE'
    nm1.IdentificationCode         = 'TGJ23'
  end

  l1000a.PER do |per|
    per.Name                            = 'JERRY'
    per.CommunicationNumberQualifier_01 = 'TE'
    per.CommunicationNumber_01          = '3055552222'
    per.CommunicationNumberQualifier_02 = 'EX'
    per.CommunicationNumber_02          = '231'
  end
end

puts ts.to_s

# Below is the output of ts.to_s (split onto separate lines for readability)
#
# ST*837*0021*005010X222A1~
# BHT*0019*00*244579*20061015*1023*CH~
# NM1*41*2*PREMIER BILLING SERVICE*****46*TGJ23~
# PER*IC*JERRY*TE*3055552222*EX*231~
```

Transaction Set/Loop and Segment DSL
------------------------------------
Transaction Sets/Loops and Segments are defined with a very straight forward DSL.

```ruby
module Hippo::Segments
  class TestSimpleSegment < Hippo::Segments::Base
    segment_identifier 'TSS'

    field :name => 'Field1'
    field :name => 'Field2'
    field :name => 'Field3'
    field :name => 'Field4'
    field :name => 'CommonName'
    field :name => 'CommonName'
    field :name => 'DateField',     :datatype => :date
    field :name => 'TimeField',     :datatype => :time
    field :name => 'IntegerField',  :datatype => :integer
    field :name => 'DecimalField',  :datatype => :decimal
  end

  class TestCompoundSegment < Hippo::Segments::Base
    segment_identifier 'TCS'

    composite_field 'CompositeField' do
      field :name => 'Field1'
      field :name => 'Field2'
      field :name => 'Field3'
      field :name => 'CompositeCommonName'
    end

    composite_field 'CompositeField' do
      field :name => 'Field4'
      field :name => 'Field5'
      field :name => 'Field6'
      field :name => 'CompositeCommonName'
    end

    field :name => 'Field7'
  end
end

module Hippo::TransactionSets
  module Test
    class Base < Hippo::TransactionSets::Base

      segment Hippo::Segments::TestSimpleSegment,
                :name           => 'Test Simple Segment #1',
                :minimum        => 1,
                :maximum        => 5,
                :position       => 50,
                :defaults => {
                  'TSS01' => 'Blah'
                }

      segment Hippo::Segments::TestCompoundSegment,
                :name           => 'Test Compound Segment #2',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 100,
                :defaults => {
                  'Field7' => 'Preset Field 7'
                }

      segment Hippo::Segments::TestSimpleSegment,
                :name           => 'Test Simple Segment #3',
                :minimum        => 1,
                :maximum        => 1,
                :position       => 50,
                :defaults => {
                  'TSS01' => 'Last Segment'
                }
    end
  end
end
```

Quick Guide to Populating a Transaction Set
-------------------------------------------
Using the simple transaction set and segments defined above, here are a few ways to access
the fields.

To create a transaction set simple choose the set you want and call new on it's Base class.

```ruby
ts = Hippo::TransactionSets::Test::Base.new
```

The segments can be accessed directly from the created transaction set using the segment
identifier.

```ruby
ts.TCS
```

Since the TSS segment can be repeated we must call #build to generate a new
instance for each repeat. (You will be returned the first instance each time if you
do not call #build.)

```ruby
tss = ts.TSS.build

# or

ts.TSS.build do |tss|
  # do something here...
end
```

The code above produces the following string output (notice how the values from
:defaults are prefilled, and the output is automatically sorted based on the order
that the segments were declared):

```ruby
# ts.to_s => 'TSS*Blah~TCS***Preset Field 7~'
```

You can set the field values on a given segment a few different ways.

First you must access the segment that the field belongs to. You can
either access the fields directly on the segment or use the block syntax.

```ruby
# this is one way to populate the fields
ts.TCS.Field1 = 'Foo'
ts.TSS.Field2 = 'Bar'

# this is another way
ts.TCS do |tcs|
  tcs.Field1 = 'Foo'
end

ts.TSS do |tss|
  tss.Field2 = 'Bar'
end
```

Once you have access to the segment you can set the field values by either
calling the field name or using its relative position in the segment. If the
field name is used more than once in a segment or if you are accessing a
composite field you can optionally pass the index of the field to access.

```ruby
ts.TCS do |tcs|
  tcs.Field1    = 'Foo'     # use the field name
  tcs.TCS01_01  = 'Bar'     # use shorthand notation:
                            #   TCS01 refers to the first field within the current segment
                            #   _01 refers to the first field within the composite field
end
```

If you read the transaction set declaration from above you will notice that the TSS segment
can be set in two different sequences (with different preset values).  By default (as you
can see from the previous example) when we call TSS we are referring to the first segment,
but if you need to access the second instance of TSS in the transaction set you would specify
TSS_02 instead.

```ruby
ts.TCS.Field1     = 'Foo'
ts.TSS.Field2     = 'Bar'
ts.TSS_02.Field2  = 'Baz'

# ts.to_s => 'TSS*Blah*Bar~TCS*Foo**Preset Field 7~TSS*Last Segment*Baz~'
```

Obviously, this could get somewhat tedious when operating on a TransactionSet with many segments
with the same identifier.  As an alternative you can also access a particular segment/loop based
on the name provided in the TransactionSet definition.  You can either pass the actual name or
a Regexp to search with.

```ruby
ts.find_by_name('Test Simple Segment #1') do |tss|
  tss.Field2 = 'Baz'
end

# which is essentially equivilent (because the search occurs in order of declaration)
ts.find_by_name(/Segment/) do |tss|
  tss.Field2 = 'Baz'
end

# ts.to_s => 'TSS*Blah*Baz~'
```

The same technique can be used to reference fields within a segment that have the same name.

```ruby
ts.TSS.CommonName = 'Value1'
ts.TSS.CommonName_02 = 'Value2'

# ts.to_s => 'TSS*Blah*Bar***Value1*Value2~TCS*Foo**Preset Field 7~TSS*Last Segment*Baz~'
```

Type Conversion
---------------

As of Hippo version 0.2.0 values are stored in the native format, and coverted back to the
appropriate string representation when required.  This means that you can set and access date,
time, integer, and decimal fields without having to convert back and forth between strings.

As part of the type conversion process we are also validating that a fields value is being set
with a valid value for that particular data type.

Just a few examples using the type conversion:

```ruby
seg = Hippo::Segments::TSS.new    # Please review definition from above.

# Date fields:
seg.DateField = Date.new(2012, 01, 20)
seg.DateField = "20120120"
seg.DateField = Time.new(2012, 01, 20, 10, 15, 20)

# all of these formats result in the same internal representation
puts seg.DateField.inspect # => #<Date: 2012-01-20 ((2455947j,0s,0n),+0s,2299161j)>

# To set the field back to a blank/empty value simply assign it to nil
seg.DateField = nil

# Time fields:
seg.TimeField = "0120"      # => 1:20 am       (HHMM)
seg.TimeField = "012023"    # => 1:20:23 am    (HHMMSS)
seg.TimeField = "01202322"  # => 1:20:23.22 am (HHMMSSDD)
seg.TimeField = Time.now

# Integer fields:
seg.IntegerField = "10"     # => 10
seg.IntegerField = 10       # => 10
seg.IntegerField = "10blah" # => 10

# Decimal fields:
seg.DecimalField = "123.45"   # => #<BigDecimal:7fe83c315750,'0.12345E3',18(18)>
seg.DecimalField = 123.45     # => #<BigDecimal:7fe83c315750,'0.12345E3',18(18)>
seg.DecimalField = 123        # => #<BigDecimal:7fe83b9dd4f8,'0.123E3',9(18)>
seg.DecimalField = 123.0      # => #<BigDecimal:7fe83b9dd4f8,'0.123E3',9(18)>
```

__Please Note__: Due to issues with floating point representation of currency values we have
chosen to use BigDecimal internally to store all fields with a decimal datatype.

Hierarchy Traversal
-------------------

There are times with a given transaction set that you may start with a given segment but need
to traverse up to a higher level loop/transaction set container.  The best example of this is
when dealing with 997 or 999 acknowledgments.  If there are errors in your original transmission
they are reported on the 997 and 999 as the segment number in error.  We need to then take that
errored segment and figure out more context.

The first thing we have to do is find the segment in error.  The 999 contains this in the IK3
segment of the 2100 - AK2/IK3 loop. Then we need to access those segments in the original
transmitted file.  Finally, we need to access an ancestor that gives enough context to resolve
the error.

Here is a quick example:

```ruby
ts_999 = Hippo::Parser.parse_file('location/to/999/file.999')
ts_837 = Hippo::Parser.parse_file('location/to/837/file.837')

# first lets get the index of all of the errored segments
error_indexes = ts_999.L2000AK2.map{|l| l.L2100AK2.map{|m| m.IK3.IK303}}.flatten
# or
error_indexes = ts_999.segments.select{|s| s.class.to_s =~ /IK3/}.collect{|s| s.IK303}

# now lets find those segments in the file being confirmed
errored_segments = ts_837.segments.values_at(error_indexes)

# and finally lets find the claim that they belong to
errored_claims  = errored_segments.collect{|s| s.ancestors.select{|a| a.class.to_s =~ /L2000B/}}.flatten
```

For more example please review the test suite.

License
-------
Copyright 2011 by ProMedical, and licensed under the Modified BSD License. See included
[LICENSE](/promedical/hippo/blob/master/LICENSE) file for
details.
