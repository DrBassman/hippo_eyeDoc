module Hippo_eyeDoc
  module Exceptions
    class Exception < StandardError; end

    class InvalidValue    < Exception; end
    class InvalidField    < Exception; end
    class InvalidSegment  < Exception; end
    class ParseError      < Exception; end
  end
end
