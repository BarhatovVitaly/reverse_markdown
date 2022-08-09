module ReverseMarkdown
  module Converters
    class Base
      def treat_children(node, state)
        node.children.each_with_index.inject('') do |memo, pair|
          child, index = pair
          memo << treat(child, state.merge(idx: index - 1))
        end
      end

      def treat(node, state)
        ReverseMarkdown::Converters.lookup(node.name).convert(node, state)
      end

      def escape_keychars(string)
        string.gsub(/(?<!\\)[*_]/, '*' => '\*', '_' => '\_')
      end

      def extract_title(node)
        title = escape_keychars(node['title'].to_s)
        title.empty? ? '' : %[ "#{title}"]
      end
    end
  end
end
