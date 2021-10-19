module ApplicationHelper
include OutherHelper
include BtnHelper
include TableHelper



	def col(input, sm, md, lg, &block)
		content_tag(:div, input, class: "col-sm-#{sm} col-md-#{md} col-lg-#{lg}")
	end	

	def i18n_yes(field)
		field == true ? 'Sim' : 'Não'
	end

	def format_cpf(number)
      number.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
    end

    def format_cep(number)
      number.gsub(/\A(\d{2})(\d{3})(\d{3})\Z/, "\\1.\\2-\\3")
	end

	def situacao(campo)

		if campo == 'Matriculado'
			content_tag(:h4, content_tag(:span, 'Matriculado', class: 'badge badge-primary'))
			
		elsif campo == 'Reprovado'
			content_tag(:h4 ,content_tag(:span, 'Reprovado', class: 'badge badge-danger'))
		else
			content_tag(:h4, content_tag(:span, 'Transferido', class: 'badge badge-info'))
		end
	end


end
