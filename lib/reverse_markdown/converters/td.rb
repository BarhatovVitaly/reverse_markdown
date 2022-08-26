module ReverseMarkdown
  module Converters
    class Td < Base
      def convert(node, state = {})
        content = treat_children(node, state.merge(no_new_line: true))
        " #{content} |"
      end
    end

    register :td, Td.new
    register :th, Td.new
  end
end
