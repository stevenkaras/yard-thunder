require 'logger'
$log = Logger.new(STDERR)
$log.info "hello, world"

module YardThunder
  class OptionHandler < YARD::Handlers::Ruby::Base
    handles method_call(:option)

    process do
      parser.extra_state.thunder_options ||= []
      parser.extra_state.thunder_options << {}.tap do |option|
        params = statement.parameters(false)
        option[:name] = params[0].jump(:ident, :string_content).source
        params[1].each do |param|
          key = param.first.jump(:label, :ident)[0].to_sym
          value = param[1][0].jump(:const, :kw, :string_content).source
          option[key] = value
        end
      end
    end
  end

  # class LegacyOptionHandler < YARD::Handlers::Ruby::Legacy::Base
  #   handles /\Aoption(\s|\()/
    
  #   process do
  #     parser.extra_state ||= {}
  #     parser.extra_state[:thunder_options] ||= []
  #     parser.extra_state[:thunder_options] << tokval_list(statement.tokens[1..-1], :attr)
  #   end
  # end

  module MethodHandlerOptionMixin
    def process
      super
      return unless parser.extra_state
      # handle any options for this command
      if parser.extra_state.thunder_options
        # add the options parameter to the method if it's not already there
        unless @registered_object.tags(:param).find {|x| x.name == "options"}
          option_param = YARD::Tags::Tag.new(:param, "a customizable set of options", "Hash", "options")
          @registered_object.docstring.add_tag(option_param)
        end

        # trick the parser to parse the option as a YARDoc tag
        parser.extra_state.thunder_options.each do |option|
          name = option[:name]
          description = option[:desc] || ""
          if option[:default]
            unless description.lstrip.start_with? /\(.+\)/
              description = "(#{option[:default]}) #{description}"
            end
          end
          type = option[:type] || "String"

          text = "options #{name} [#{type}] #{description}"
          option_tag = YARD::Tags::Library.default_factory.parse_tag_with_options(:option, text)
          @registered_object.docstring.add_tag(option_tag)
        end
        parser.extra_state.thunder_options = nil
      end
    end
  end

end
