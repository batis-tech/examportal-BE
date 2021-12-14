class TestsController < ApplicationController
  before_action :tests_params, only: %i[ create update]
  before_action :set_exame, only: %i[ destroy update]
  before_action :set_question, only: %i[ return_content ]
  before_action :set_options, only: %i[ options ]


    def show
      @tests = Test.all
      render :json => @tests.to_json(
      :include => {
        :questions => {only: [:questionTitle,:questionDetail]},
        :options => {only: [:optionTitle,:optionCorrect]}
      })

    end
    def return_content
       @Test = Test.where(id: params[:id])
        render :json => @Test.to_json(
        :include => {
          :questions => {only: [:questionTitle,:questionDetail]},
          :options => {only: [:optionTitle,:optionCorrect]}
        })
    end
    def create
      @test = Test.new(tests_params)
        if  @test.save
          format.json { render :show, status: :ok, location: @test }
        else
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
    end

    def update
      if @test.update(tests_params)
           format.json { render :show, status: :ok, location: @test }
      else
           format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end

    def destroy
       @test.destroy
    end

    private


    def set_exame
      @test = Test.find(params[:id])
    end
    def set_question
      @test = Question.where(test_id: params[:id])
    end

    def set_options
      @test = Option.where(test_id: params[:id])
    end

    def tests_params
      params.permit(:title ,:description,
        questions_attributes:[
          :questionTitle,
          :questionDetail,
          ],options_attributes:[
          :optionTitle,
          :optionCorrect
          ],
          )
    end


end
