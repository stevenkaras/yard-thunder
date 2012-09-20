$: << File.expand_path("..", __FILE__)

module YardThunder

  require 'yard-thunder/description'
  require 'yard-thunder/options'
  require 'yard-thunder/subcommand'
  require 'yard-thunder/default_command'

  module ThunderMethodHandlerMixin
    def register(*objs)
      @registered_object = objs.first
      super(*objs)
    end
  end
end

class YARD::Handlers::Processor
  attr_accessor :extra_state
end

class YARD::Handlers::Ruby::MethodHandler 
  include YardThunder::ThunderMethodHandlerMixin
  include YardThunder::MethodHandlerDescriptionMixin
  include YardThunder::MethodHandlerOptionMixin
end

# class YARD::Handlers::Ruby::Legacy::MethodHandler 
#   include ::YardThunder::ThunderMethodHandlerMixin
#   include ::YardThunder::MethodHandlerDescriptionMixin
#   include YardThunder::MethodHandlerOptionMixin
# end

# module YARD::Templates::Helpers::HtmlHelper
#   def signature_for_thunder_command(meth, link = true, *args)
#     if meth.has_tag?(:thunder_command)
#       sig = link ? link_object(meth, meth.signature) : meth.signature
#       "$ " + sig 
#     else
#       old_signature(meth, link, *args)
#     end
#   end
#   alias old_signature signature
#   alias signature signature_for_thunder_command
# end
