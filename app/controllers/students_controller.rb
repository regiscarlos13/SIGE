class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :sexos, only: [:new, :edit, :create]

  include VariablesEnuns

  def index
    @students = @school.students
  end

  def show
  end

  def mostrar
    @student = Student.where(cpf: params[:cpf])[0]
    render json: @student
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :nascimento, :censo, 
        :mae, :pai, :cpf, :cep, :bairro, :cidade, 
        :rua, :uf, :numero, :complemento, :naturalidade, 
        :cpfmae, :cpfpai,  :telefone,
        :email, :sexo, :necessidade,
         :cpf_financeiro, :nome_financeiro, :cep_financeiro,
         :bairro_financeiro, :cidade_financeiro, :rua_financeiro,
         :uf_financeiro, :numero_financeiro, :complemento_financeiro, :rg


        ).merge(school_id: current_user.school.id)
    end
  end