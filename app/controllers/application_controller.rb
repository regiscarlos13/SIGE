class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_school, :set_year ,only: [:index]
	before_action :seach_year,  unless: :devise_controller?

	layout :layout_by_resource

	include Layout

	def format_pdf(template, pdf)
		respond_to do |format|
		format.js
		format.pdf do
			render template: template, 
			pdf: pdf, 
			header:  { html: {template: 'relatorios/shared/header' }},
			footer:  { html: {template: 'relatorios/shared/footer' } },
			margin:  { top: 40, bottom: 25, left: 15, right: 15 }
		  end
		end
	end

	def set_session
		cookies.encrypted[:selected_year] = params[:year_select]
		redirect_to root_path
	end	

	def seach_year

		@year_all = Year.where(school_id: current_user.school.id)	

		unless @year_all.present?
			unless controller_name == 'years' 
				redirect_to new_year_path, alert: 'Você tem que Cadastrar Ano Letivo'
			end
		end

		if cookies.encrypted[:selected_year].present?
			@year = Year.find(cookies.encrypted[:selected_year])
			@select_btn_ano = " Ano Letivo - #{@year.year}"

		end
	end

	def set_school
		@school = School.find(current_user.school.id)
	end
	
	def set_year
		if cookies.encrypted[:selected_year].present?
			@years = Year.find(cookies.encrypted[:selected_year])
		else
			unless controller_name == 'home' 
				redirect_to root_path
			end
		end
	end

end
