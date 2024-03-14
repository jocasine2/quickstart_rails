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
                atributo = value.split(':').first.strip.gsub(/^[^a-zA-Z]*/, '') # Remover caracteres especiais do início
                classes_info[classe_atual] << atributo if classe_atual
            end
        end
    
        return classes_info
    end
    
end