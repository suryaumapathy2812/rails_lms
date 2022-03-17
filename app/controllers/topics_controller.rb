class TopicsController < ApplicationController
  layout "topics_layout"
  before_action :get_course
  before_action :get_topics
  before_action :set_topic, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /topics or /topics.json
  def index
    puts params[:course_id]
    puts "Getting Courses"
  end

  def list
    render :partial => 'topics/list'
  end

  # GET /topics/1 or /topics/1.json
  def show
    puts "Show Method"
  end

  # GET /topics/new
  def new
    puts @topics
    @new_topic = @course.topics.build
    render 'topics/new'
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics or /topics.json
  def create
    @topic = @course.topics.build(topic_params)
    @topic.course_id = @course.id
    respond_to do |format|
      if @topic.save
        format.html { redirect_to course_path(@course), notice: "Topic was successfully created." }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1 or /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to course_path(@course), notice: "Topic was successfully updated." }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1 or /topics/1.json
  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: "Topic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_course
    @course = Course.find(params[:course_id])
  end

  def get_topics
    @topics = @course.topics
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = @course.topics.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:name, :description, :course_id)
  end

end
