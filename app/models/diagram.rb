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
        classes_info = Hash.new { |h, k| h[k] = [] }
    
        classe_atual = nil
    
        # Percorrer os elementos mxCell no XML
        doc.elements.each('//mxCell') do |elemento|
            value = elemento.attributes['value']
            next if value.nil? || value.empty?
    
            if value =~ /^[A-Z]/
                # Elemento é o nome de uma classe
                classe_atual = value
            else
                # Elemento é um atributo
                atributo = value.strip.gsub(/^[^a-zA-Z]*/, '').delete(' ') # Remover caracteres especiais do início
                classes_info[classe_atual] << atributo if classe_atual
            end
        end
    
        return classes_info
    end
    
    def self.classes_names
        Diagram.classes.keys
    end

    def self.scaffold_generator
        classes_info = Diagram.classes

        classes_info.each do |class_name, attributes|
            scaffold_attributes = attributes.reject { |attr| attr =~ /\(.*\)/ } # Remover métodos

            scaffold_command = "rails g scaffold #{class_name.downcase}"

            scaffold_attributes.each do |attribute|
                scaffold_command << " #{attribute.downcase}"
            end

            system(scaffold_command)
        end
    end

    def self.scaffold_destroyer
        classes_info = Diagram.classes
        
        classes_info.each do |class_name, _attributes|
            scaffold_command = "rails d scaffold #{class_name.downcase}"
            system(scaffold_command)
        end
    end
    
end