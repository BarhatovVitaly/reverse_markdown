module ReverseMarkdown
  module Converters
    class H < Base
      def convert(node, state = {})
        prefix = '#' * node.name[/\d/].to_i
        if state.fetch(:no_new_line, false)
          [prefix, ' ', treat_children(node, state)].join
        else
          ["\n", prefix, ' ', treat_children(node, state), "\n"].join
        end

      end
    end

    register :h1, H.new
    register :h2, H.new
    register :h3, H.new
    register :h4, H.new
    register :h5, H.new
    register :h6, H.new
  end
end
