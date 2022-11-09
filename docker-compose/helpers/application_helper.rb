module ApplicationHelper
    

    def selectag(nome, name, id, collection, label='', value='' , selected='', attributes='')
        css = '<style>
            .select-wrapper{
                padding-left: 0px; 
                padding-right: 0px;
            }
        </style>';

        html = css+'<select id="select-'+id+'" name="'+name+'" '+attributes+' style="padding-left: 0px; padding-right: 0px;">'
        html += '<option selected value="">Selecione</option>'
        collection.map { |e|
            if selected.to_s == e[value].to_s
                html += '<option selected value="'+e[value].to_s+'">'+e[label].to_s+'</option>'
            else
                html += '<option value="'+e[value].to_s+'">'+e[label].to_s+'</option>'
            end
        }
        html += '</select>
                <script>
                    $(document).ready(function(){
                        $(\'#select-'+id+'\').formSelect();
                    });
                </script>';

        html.html_safe
    end

    def simple_list(list, headers = [])
        html = '<ul class="list-group">'
  
        if !headers.empty?
            html += '<li class="list-group-item d-flex justify-content-between align-items-center">'
            for header in headers
                html += '<h4 class = "list-group-item-heading">'+header.to_s+'</h4>'
            end
            html += '</li>'
        end
        
        for item in list
            html += '<li class="list-group-item d-flex justify-content-between align-items-center">
                '+item[0].to_s+'<span class="badge badge-primary badge-pill">'+item[1].to_s+'</span>
            </li>'
        end
        html += '</ul>'

        html.html_safe
    end

    def horizontal_list(list)
        count = 0
        html = ''
        for item in list
            if(count%8 ==0)
                html += '<ul class="list-group list-group-horizontal-sm">'
            end
            
            html += '<li class="list-group-item d-flex justify-content-between align-items-center">'+item[0].to_s+'</li>'
            
            if(count%8 ==7)
                html += '</ul>'
            end

           
            count = count+1
        end

        
        html.html_safe
    end
    
    # <%=selectag(name='distribuidores', placeholder='Digite as primeiras 5 letras do nome ou NIS do beneficiário', json_url='/beneficiarios/json', minimum='5', sortField='text', valueField='id', labelField='nome', searchField='nome')%>
    def selectag_search(label, id, name, placeholder, json_url, minimum, sortField, valueField, labelField, searchField)

        html = '
        <label for="Email">'+label+'</label>
        <select id="select-'+id+'" name="'+name+'"  placeholder="'+placeholder+'">
        </select>
        <script>
          $(document).ready(function () {
              $(\'#select-'+id+'\').selectize({
                sortField: \''+sortField+'\',
                valueField: \''+valueField+'\',
                labelField: \''+labelField+'\',
                searchField: \''+searchField+'\',
                  load: function (query, callback) {
                      if (!query || query.length < '+minimum+') return callback();
                      $.ajax({
                          url: \''+json_url+'\',
                          data: {
                            \'search\' : encodeURIComponent(query.toUpperCase())
                          },
                          success: function (response) { 
                            console.log(response); 
                            this.options = response; 
                            callback(response); 
                          }
                      });
                  }
              });
          });
        </script>';

        html.html_safe
    end

    def cupon_card(cupom)
            css = '<style>
                .cupom-validade{
                    font-size: 14px;
                }
            </style>';

            gerar_cupom = ''
            html=css+'<div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                        <img src="/others_assets/img/vale.png" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                        <div class="card-body">';
                        
                        if cupom.status_cupom == 'disponivel'
                           html+= '<h2>'+cupom.referencia+'</h2>
                            <span class="card-text">(Válido até '+cupom.data_limite.strftime('%d/%m/%Y')+')</span><br>';
                            bg_type = 'success'
                            gerar_cupom = '<a href="/gerar_cupom/'+cupom.codigo+'"><div class="cupom-status badge rounded-pill bg-'+bg_type.to_s+'" style="text-align:center"><span class="" style="color:white"><i class="material-icons left" style="font-size: 14px; margin-right: 4px;">grade</i>Gerar Cupom</span></div></a><br>';   
                        else
                            html += '
                            <span><strong>'+cupom.referencia+'</strong></span>
                            <span class="cupom-validade">(Válido até '+cupom.data_limite.strftime('%d/%m/%Y')+')</span><br>'; 

                            if cupom.status_cupom == 'gerado'
                                html += '<br><h2>'+cupom.codigo+'</h2><br>';
                                bg_type = 'warning'
                            end
                        end

                        if cupom.status_cupom == 'resgatado'
                            html += '
                                        <span><label><strong>Código:</strong></label> '+cupom.codigo+'</span><br>
                                        <span><label><strong>Distribuidor:</strong></label> '+cupom.razao_social_distribuidor+'</span><br>
                                        <span><label><strong>Data da Entrega:</strong></label> '+cupom.data_limite.strftime('%d/%m/%Y') +'</span><br>
                                        <span><label><strong>Série:</strong></label> '+cupom.serie+'</span><br>
                                    ';
                            bg_type = 'primary'
                        end

                        if cupom.status_cupom == 'expirado'
                            bg_type = 'danger'
                        end

                        if cupom.status_cupom == 'indisponivel'
                            bg_type = 'secondary'
                        end

                html += '<div class="cupom-status badge rounded-pill bg-'+bg_type.to_s+'" style="text-align:center"><span class="" style="color:white">'+cupom.status_cupom.upcase!+'</span></div><br>'+gerar_cupom;   
                
                html += '</div>
                        </div>
                    </div>
                </div>';

            html.html_safe
    end

    def href_buttom(ref)
     html = '<a class="btn-large" href="'+ref+'" style="box-shadow: none; color: white !important; text-decoration: none;" >Voltar</a>'
     html.html_safe
    end

    def alert(notice)

        if notice.present?
            if notice["message"].present? && notice["notice_type"] == 'info'
                html = '<script> info("'+notice["message"]+'") </script>'
            elsif notice["message"].present? && notice["notice_type"] == 'success'
                html = '<script> success("'+notice["message"]+'") </script>'
            elsif notice["message"].present? && notice["notice_type"] == 'error'
                html = '<script> error("'+notice["message"]+'") </script>'
            else 
                html = ''
            end
            
            html.html_safe
        end
    end
    
    def formata_cpf(num)
        num[0..2]+'.'+num[3..5]+'.'+num[5..7]+'-'+num[8..9]
    end

    def formata_cnpj(num)
        num[0..1]+'.'+num[2..4]+'.'+num[5..7]+'/'+num[8..11]+'-'+num[12..13]
    end

    def active(path)
        html = 'ue'
       
        if request.env['PATH_INFO'] == path
            html = 'active'
        end
       
        html.html_safe
    end

    def navlink(label,link)
        html = '<li class="'+active(link)+'" ><a href="'+link+'" class="navlink" >'+label+'</a></li>'
        html.html_safe
    end
        
    def navlink_a(label,link)
        html = '<a href="'+link+'" class="navlink" >'+label+'</a>'
        html.html_safe
    end

    #dataTables
    
    def string_between_strings(str, start, finish)
        str[/#{start}(.*?)#{finish}/m, 1]
    end

    def get_total_record_count(sql)
        ActiveRecord::Base.connection.execute(sql).count
    end

    def set_search_string(column_names)
        str = "CONCAT("
        key = 0
        ou = ''
        
        column_names.each do |col|
            if key == 0
                str += col 
            else
                str += ",' ', "+col
            end

            key += 1 
        end

        str +=") "
    end
    
    def where_search_dataTables(sql, column_names, term)
        sql = sql.upcase

        if term.present?
            if column_names.length > 0
                if !(sql.include? "WHERE") && !(sql.include? "where")
                    sql +=" WHERE " 
                else
                    sql +=" AND " 
                end

                key = 0
                ou = ''
                
                column_names.each do |col|
                    if key != 0
                        ou = " OR " 
                    end

                    if !(col.include? "id") && !(col.include? "ID") 
                        sql += ou+"upper("+col+") LIKE '%"+term+"%' " 
                        key += 1 
                    end
                end

                sql +=' OR '+set_search_string(column_names)+" LIKE '%"+term+"%' " 
            end
        end
        
        sql
    end

    def order_by_limit(column_names)
        
        order_by = "ORDER BY "
        key = 0

        column_names.each do |col|
            if key != 0
                ou = " OR " 
            end

            if params["order"][key.to_s].present?
                order_by += column_names[params["order"][key.to_s]["column"].to_i]+' '+params["order"][key.to_s]["dir"]
            end

            key += 1 
        end

        limit = " LIMIT "+params["length"]+" OFFSET "+params["start"]
        
        order_by+" "+limit
    end

    def set_column_dataTables(sql, column_names)
        sql = sql.upcase
        if column_names.length > 0
            str_middle = string_between_strings(sql.upcase, "SELECT", "FROM")
            columns = column_names.join(", ")
            sql.gsub! str_middle, " "+columns+" "
        end

        sql+" "+order_by_limit(column_names)
 
    end

    def get_results_dataTables(sql, column_names)
        sql = sql.upcase
        
        total = get_total_record_count(sql)

        data = []
        #adicionar filtros por column_name
        @search = ActiveRecord::Base.connection.execute(set_column_dataTables(sql, column_names))
        
        @search.each do |tuple| 
            data.push tuple
        end  

        {"data" => data, "from"=> total}
    end

    def jsonDatatables(sql, column_names, term, min=3)
        sql = sql.upcase
        term.gsub! ' ', '%'
        
        #termo
        term = term.upcase
    
        retorno = []

        #obtendo a quandidade total de registros da pesquisa
        recordsTotal = get_total_record_count(sql)
    
        #se o termo da busca tiver pelo menos "min" letras
        if term.length > min
            #adiciona colunas ao where da sql
            sql = where_search_dataTables(sql, column_names, term)
        end

        #obtendo dados do bd
        @search = get_results_dataTables(sql,column_names) 
        
        retorno = {
            "recordsTotal" => recordsTotal,  #Quantidade de registros que há no banco de dados
            "recordsFiltered" => @search["from"], #Total de registros quando houver pesquisa
            "draw" => params["draw"], #para cada requisição é enviado um número como parâmetro
            "data" => @search["data"]   #Array de dados completo dos dados retornados da tabela   
        }
    
        render json: retorno
    end
end
