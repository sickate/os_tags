class HomeController < ApplicationController
  def index
  end
  def tags
    @tag_array = []
    User.tag_counts.each do |tag_count|
      hash = {:text => tag_count.name, :weight => tag_count.taggings_count, :link => "/tags/#{tag_count.name}"}
      @tag_array.push hash
    end
  end
end
