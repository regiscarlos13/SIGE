class RelatoriosController < ApplicationController
 before_action :set_tables, only: [:turmas, :matriculados] 

	def turmas
		@total_matriculas = Matricula.where(turma_id: @turmas).count
		format_pdf('relatorios/pdf/turmas', 'turmas')
		
	end
	

	def matriculados
		@matriculas = Matricula.where(turma_id: params[:turmas_ids]).joins(:student).order('students.name ASC')
		format_pdf('relatorios/pdf/matriculados', 'Matriculados' )
	end

	private
	def set_tables
		@turmas = @year.turmas.joins(:serie).order('series.name ASC').order(:name)
	end
end
