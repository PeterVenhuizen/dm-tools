# frozen_string_literal: true

class MonstersController < ApplicationController
  before_action :set_monster, only: %i[show edit update destroy]

  def index
    @monsters = Monster.all
  end

  def show; end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)

    respond_to do |format|
      if @monster.save
        format.html { redirect_to monster_url(@monster), notice: 'Monster was successfully created.' }
        format.json { render :show, status: :created, location: @monster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :size, :species, :alignment, :armor_class, :hit_points,
                                    :hit_dice, { speed: {} }, :languages, :challenge_rating,
                                    { ability_scores: {} }, :xp)
  end
end
