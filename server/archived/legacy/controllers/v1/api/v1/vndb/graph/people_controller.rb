class Api::V1::Vndb::Graph::PeopleController < ApplicationController
  def show
    @person = ::Database::Person
      .includes(:characters, { novels: :releases })
      .find(params[:id])
    graph_svc = GraphService::Person.new(@person)
    jobs = {
      voiceds: graph_svc.count_voiceds,
      credits: graph_svc.count_credits
    }
    render json: jobs
    # voiced = {}
    # @person.characters.map do |character|
    #   year = character.novel.released.year
    #   if voiced[year].nil?
    #     voiced[year] = {}
    #     voiced[year][:characters] = []
    #   end
    #   voiced[year][:year] = year
    #   voiced[year][:characters] << character
    # end

    # voiceds = voiced.map do |key, value|
    #   voiced[key][:total] = voiced[key][:characters].size
    #   value
    # end

    # render json: voiceds.to_json, root: false
    # @voiceds = @person.characters.group_by_year { |character| character.novel.released }
    # @voiced = Array.new
    # @voiceds.map do |key, value|
    #   @voiced << {
    #     year:   key.year,
    #     total:  value.size
    #   }
    # end
  end
end
