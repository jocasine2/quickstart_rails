class Diagram < ApplicationRecord

    require 'rexml/document'

def self.ler_arquivo_drawio(nome_arquivo)
  # Abrir e ler o arquivo .drawio
  file = File.open(nome_arquivo)
  xml_content = file.read
  file.close

  # Usar REXML para analisar o conteúdo XML
  doc = REXML::Document.new(xml_content)

  # Estrutura para armazenar informações coletadas
  informações = {
    entidades: [],
    relacionamentos: []
  }

  # Percorrer os elementos mxCell no XML
  doc.elements.each('//mxCell') do |elemento|
    # Verificar se o elemento representa uma entidade
    if elemento.attributes['vertex'] == '1'
      nome_entidade = elemento.attributes['value']
      atributos = []

      # Percorrer os filhos do elemento para coletar atributos
      elemento.elements.each('mxCell') do |atributo|
        if atributo.attributes['vertex'] == '1'
          atributo_nome = atributo.attributes['value']
          atributos << atributo_nome
        end
      end

      informações[:entidades] << { nome: nome_entidade, atributos: atributos }
    end

    # Verificar se o elemento representa um relacionamento
    if elemento.attributes['edge'] == '1'
      fonte_id = elemento.attributes['source']
      destino_id = elemento.attributes['target']
      informações[:relacionamentos] << { fonte_id: fonte_id, destino_id: destino_id }
    end
  end

  return informações
end

end
