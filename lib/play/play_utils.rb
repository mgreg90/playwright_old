module Playwright
  module Utils

    def to_snake_case(text)
      text = text.chars.map do |letter|
        revision = letter.downcase == letter ? letter : "_#{letter.downcase}"
        revision = '_' if ['-', ' '].include?(revision)
        revision
      end.join
      while text.include?('__')
        text.gsub!('__', '_')
      end
      text
    end

    def to_camel_case(text)
      text.split('_').map(&:capitalize).join
    end

  end
end