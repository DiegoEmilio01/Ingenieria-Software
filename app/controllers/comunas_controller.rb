# frozen_string_literal: true

class ComunasController < ApplicationController
  def new
    @comuna = Comuna.new
  end

  def create
    comuna_params = params.require(:comuna).permit(:nombre, :cuarentena)
    @comuna = Comuna.create comuna_params
    if @comuna.save
      redirect_to comunas_new_path, notice: 'Comuna creada exitosamente.'
    else
      redirect_to comunas_new_path, notice: 'Error al intentar crear la Comuna.'
    end
  end

  def index
    @comunas = Comuna.all
  end

  def show
    @comuna = Comuna.find params[:id]
  end

  def edit
    @comuna = Comuna.find params[:id]
  end

  def update
    comuna_params = params.require(:comuna).permit(:nombre, :cuarentena)
    @comuna = Comuna.find params[:id]
    if @comuna.update comuna_params
      aviso_exito = 'Comuna editada exitosamente.'
      redirect_to comuna_path(@comuna.id), notice: aviso_exito
    else
      aviso_fracaso = 'Error al intentar editar la Comuna.'
      redirect_to comuna_path(@comuna.id), notice: aviso_fracaso
    end
  end

  def destroy
    @comuna = Comuna.find params[:id]
    @comuna.destroy
    redirect_to lista_comunas_path, notice: 'Comuna eliminada exitosamente.'
  end
end