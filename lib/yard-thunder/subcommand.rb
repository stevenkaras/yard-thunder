module YardThunder
  class SubcommandHandler < YARD::Handlers::Ruby::Base
    handles method_call(:subcommand)

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

  # class LegacySubcommandHandler < YARD::Handlers::Ruby::Legacy::Base
  #   namespace_only
  #   handles /\Asubcommand(\s|\()/
    
  #   process do
  #     #TODO: write this
  #   end
  # end
  
end
