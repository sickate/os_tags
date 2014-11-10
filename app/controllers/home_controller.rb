class HomeController < ApplicationController

  def index
  end

  def tags
    @tag_array = []
    @client_array = []
    @skill_array = []
    @prospect_array = []
    %w(skill client prospect).each do |tag_clazz|
    #tag_clazz=params['tagclazz']
      User.send("#{tag_clazz}_counts").each do |tag_count|
        hash = {:text => tag_count.name, :weight => tag_count.taggings_count, :link => "/tags/#{tag_count.name}"}
        instance_eval("@#{tag_clazz}_array.push hash")
        #@tag_array.push hash
      end
    end

      User.tag_counts.each do |tag_count|
        hash = {:text => tag_count.name, :weight => tag_count.taggings_count, :link => "/tags/#{tag_count.name}"}
        @tag_array.push hash
      end
  end
end
