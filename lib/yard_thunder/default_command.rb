module YardThunder
  class DefaultCommandHandler < YARD::Handlers::Ruby::Base
    handles method_call(:default_command)

    process do
      # statement.parameters(false).map do |param|
      #   param.jump(:string_content).source
      # end
      # name = statement.parameters.first.jump(:tstring_content, :ident).source
      # object = YARD::CodeObjects::MethodObject.new(namespace, name)
      # register(object)
      # parse_block(statement.last.last, :owner => object)

      # # modify the object 
      # object.dynamic = true 

      # # add custom metadata to the object
      # object['custom_field'] = 'Generated by Methodify'
    end
  end

  # class LegacyDefaultCommandHandler < YARD::Handlers::Ruby::Legacy::Base
  #   namespace_only
  #   handles /\Adefault_command(\s|\()/
    
  #   process do
  #     #TODO: write this
  #   end
  # end
  
end
