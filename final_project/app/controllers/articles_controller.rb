class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
	end

	def edit
	end

	def destroy
	end

end
