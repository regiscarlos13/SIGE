class MatriculasController < ApplicationController

  before_action :situations, :tipos, only: [:show, :create]

  before_action :set_turmas, only: [:index, :mudar]

  include VariablesEnuns

  def index
    
  end

  def mudar
    
  end

  def alunos_mudar

  end

    def show
    
      @matricula = Matricula.new
      @turma = Turma.find(params[:id])
      @matriculas = @turma.matriculas
      
      @students = Student.where.not(id: @year.students.ids)

    end



    def destroy
      @matricula = Matricula.find(params[:id])
      @matricula.destroy
      respond_to do |format|
        flash[:notice] = "Removido com Sucesso"
        format.js {render inline: "location.reload();" }
      end
    end
    
    

  def create
      @matricula = Matricula.new(matricula_params)
      respond_to do |format|
        if @matricula.save
          situation = Situation.create(matricula_id: @matricula.id, situacao: 0, tipo: 0)

          flash[:notice] = "Matriculado com Sucesso"
          format.js {render inline: "location.reload();" }
        else
          flash[:alert] = 'Tem que escolher um Aluno!'
				format.js {render inline: "location.reload();" }

        end
      end
  end


  private

  def set_turmas
    @turmas = @year.turmas
  end

  def matricula_params
    params.require(:matricula).permit(:student_id, :turma_id).merge(year_id: cookies.encrypted[:selected_year])
  end
end
