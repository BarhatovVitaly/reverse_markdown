module ReverseMarkdown
  module Converters
    class Tr < Base
      def convert(node, state = {})
        content = treat_children(node, state).rstrip
        result  = "|#{content}\n"  
        state.fetch(:idx, 0) == 0 ? result + underline_for(node) : result
      end

      def underline_for(node)
        "| " + (['---'] * node.element_children.size).join(' | ') + " |\n"
      end
    end

    register :tr, Tr.new
  end
end
