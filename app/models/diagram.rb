class Diagram < ApplicationRecord

    require 'rexml/document'

    include ActiveModel::Model
    attr_accessor :dclasses
    validates :dclasses, presence: true

    def self.classes(nome_arquivo = "docs/diagramas/exemplo.diagrama.drawio")
        # Abrir e ler o arquivo .drawio
        file = File.open(nome_arquivo)
        xml_content = file.read
        file.close
    
        # Usar REXML para analisar o conteúdo XML
        doc = REXML::Document.new(xml_content)
    
        # Estrutura para armazenar informações das classes
        classes_info = []
        classe_atual = nil
        classes = []

        # Percorrer os elementos mxCell no XML
        doc.elements.each('//mxCell') do |elemento|
            value = elemento.attributes['value']
            next if value.nil? || value.empty?
    
            if value =~ /^[A-Z]/
                # Elemento é o nome de uma classe
                classe_atual = Dclass.new(value)
                classes << classe_atual
            elsif value =~ /\(.*\)/
                # Elemento é um método
                classe_atual.methods << value.gsub(/^[^a-zA-Z]*/, '').delete(' ') # Remover caracteres especiais do início
            else
                # Elemento é um atributo
                atributo = value.strip.gsub(/^[^a-zA-Z]*/, '').delete(' ') # Remover caracteres especiais do início
                classe_atual.attributes << atributo if classe_atual
            end
        end
    
        return classes
    end
    
    def self.classes_names
        Diagram.classes.map(&:name)
    end

    def self.scaffold_generator(migrate = true)
        classes = Diagram.classes

        if migrate
            system("rails db:drop")
            system("rails db:create")
        end

        classes.each do |dclass|
            scaffold_attributes = dclass.attributes.reject { |attr| dclass.methods.include?(attr) }

            scaffold_command = "rails g scaffold #{dclass.name.downcase}"

            scaffold_attributes.each do |attribute|
            scaffold_command << " #{attribute.downcase}"
            end

            system(scaffold_command)
        end

        if migrate
            system("rails db:migrate")
        end
    end

    def self.scaffold_destroyer
        classes = Diagram.classes

        classes.each do |dclass|
            scaffold_command = "rails d scaffold #{dclass.name.downcase}"
            system(scaffold_command)
        end
    end
    
end