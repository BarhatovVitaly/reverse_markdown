module ReverseMarkdown
  module Converters
    class P < Base
      def convert(node, state = {})
        if state.fetch(:no_new_line, false)
          treat_children(node, state).strip
        else
          "\n\n" << treat_children(node, state).strip << "\n\n"
        end
      end
    end

    register :p, P.new
  end
end
