module Solargraph
  class Source
    module Encoding
      module_function

      # Convert strings to normalized UTF-8.
      #
      # @param string [String]
      # @return [String]
      def normalize string
        begin
          # STDERR.puts "Banging it from #{string.encoding}"
          # if string.encoding == ::Encoding::UTF_8
          #   string.unicode_normalize
          # else
            string.force_encoding('UTF-8').unicode_normalize
          # end
        rescue ::Encoding::CompatibilityError, ::Encoding::UndefinedConversionError, ::Encoding::InvalidByteSequenceError => e
          # @todo Improve error handling
          STDERR.puts "Normalize error: #{e.message}"
          string
        end
      end
    end
  end
end
