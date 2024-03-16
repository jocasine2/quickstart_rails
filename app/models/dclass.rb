# app/models/dclass.rb

class Dclass
    attr_accessor :name, :attributes, :methods, :relationship_cardinalities

    def initialize(name, attributes = [], methods = [], relationship_cardinalities = {})
        @name = name
        @attributes = attributes
        @methods = methods
        @relationship_cardinalities = relationship_cardinalities
    end
end