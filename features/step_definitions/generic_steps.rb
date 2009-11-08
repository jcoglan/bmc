AN_OBJECT = /(?:an?|one|the) \S+/

Given /^there is (#{AN_OBJECT}) with(?: the)? (.+) "([^\"]*)"$/ do |object_type, attribute, value|
  Factory object_type, attribute => value
end

Given /^there is (#{AN_OBJECT}) titled "([^\"]*)"$/ do |object_type, title|
  Given "there is #{object_type} with title \"#{title}\""
end

Given /^I (?:am on|visit|go to) the page for (#{AN_OBJECT})$/ do |the_object|
  visit path_for(the_object)
end

module ModelHelpers
  attr_reader :universe
  
  def Factory(object_type, attributes)
    object = super(factory_name_for(object_type), attributes)
    universe.register(object)
    object
  end
  
  def factory_name_for(object_type)
    object_type.is_a?(Symbol) ?
        object_type : 
        object_type.split(/\s+/).last.underscore.to_sym
  end
  
  def path_for(object_type)
    url_for(universe[object_type])
  end
  
  class Universe
    NAME_ATTRIBUTES = %w[name title username]
    include ActionController::UrlWriter
    
    def initialize
      @registry = {}
      @named_objects = {}
    end
    
    def register(object)
      initialize_cache_for(object.class)
      each_superclass(object.class) { |name| @registry[name] << object }
      
      NAME_ATTRIBUTES.each { |key| @named_objects[object[key]] = object }
    end
    
    # Accepts:
    # * 'the User'
    # * '"jcoglan"'
    def [](expression)
      return @named_objects[$1] if expression =~ /^"(.+)"$/
      
      pronoun, class_name = expression.strip.split(/\s+/)
      __send__(pronoun, class_name)
    end
    
    def the(klass)
      klass = Kernel.const_get(klass) if klass.is_a?(String)
      
      each_superclass(klass) do |name|
        next unless @registry[name]
        raise "There is more than one #{klass}" if @registry[name].size > 1
        return @registry[name].first if @registry[name].size == 1
      end
      raise "We couldn't find an instances of #{klass}"
    end
    
  private
    
    def each_superclass(klass, &block)
      while klass != ActiveRecord::Base
        block.call(klass.name)
        klass = klass.superclass
      end
    end
    
    def initialize_cache_for(klass)
      each_superclass(klass) { |name| @registry[name] ||= [] }
    end
  end
end

World(ModelHelpers)
Before { @universe = ModelHelpers::Universe.new }

