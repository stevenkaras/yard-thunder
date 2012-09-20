module YardThunder
  class DescriptionHandler < YARD::Handlers::Ruby::Base
    handles method_call(:desc)

    process do
      parser.extra_state.thunder_desc = statement.parameters(false).map do |param|
        param.jump(:string_content).source
      end
    end
  end

  # class LegacyDescriptionHandler < YARD::Handlers::Ruby::Legacy::Base
  #   namespace_only
  #   handles /\Adesc(\s|\()/
    
  #   process do
  #     parser.extra_state ||= {}
  #     parser.extra_state[:thunder_desc] = tokval_list(statement.tokens[1..-1], :attr)
  #   end
  # end

  module MethodHandlerDescriptionMixin
    def process
      super
      return unless parser.extra_state
      #TODO: create a second code object for the thunder command itself

      # handle a command description for this method
      if parser.extra_state.thunder_desc
        usage, desc = *parser.extra_state.thunder_desc
        require 'pry'; pry binding
        @registered_object.docstring = desc
        @registered_object.signature = usage
        @registered_object.namespace.groups << ["Thunder Commands"] unless @registered_object.namespace.groups.include? "Thunder Commands"
        @registered_object.group = "Thunder Commands"
        @registered_object.docstring.add_tag YARD::Tags::Tag.new(:thunder_command, '')
        parser.extra_state.thunder_desc = nil
      end
    end
  end

end
