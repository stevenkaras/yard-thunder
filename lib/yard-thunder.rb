$: << File.expand_path("..", __FILE__)

#
# Provides integration for Thunder in YARDoc output
#
module YardThunder

  require 'yard-thunder/description'
  require 'yard-thunder/options'
  require 'yard-thunder/subcommand'
  require 'yard-thunder/default_command'

  # mixin for storing the latest registered object
  module ThunderMethodHandlerMixin
    # overrides the register function of a MethodHandler to store the latest registered object
    def register(*objs)
      @registered_object = objs.first
      super(*objs)
    end
  end
end

class YARD::Handlers::Processor
  # extra state to be stored while parsing
  attr_accessor :extra_state
end

class YARD::Handlers::Ruby::MethodHandler
  include YardThunder::ThunderMethodHandlerMixin
  include YardThunder::MethodHandlerOptionMixin
  include YardThunder::MethodHandlerDescriptionMixin
end

# class YARD::Handlers::Ruby::Legacy::MethodHandler 
#   include YardThunder::ThunderMethodHandlerMixin
#   include YardThunder::MethodHandlerOptionMixin
#   include YardThunder::MethodHandlerDescriptionMixin
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
