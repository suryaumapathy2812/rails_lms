# frozen_string_literal: true

class MyCoursesController < ApplicationController
  before_action :set_my_course, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[]

  # GET /my_courses or /my_courses.json
  def index
    @my_courses = MyCourse.where(:user_id => current_user.id)
  end

  # GET /my_courses/1 or /my_courses/1.json
  def show; end

  # GET /my_courses/new
  def new
    @my_course = MyCourse.new
  end

  # GET /my_courses/1/edit
  def edit; end

  # POST /my_courses or /my_courses.json
  def create
    _user_id = params[:user_id]
    _course_id = params[:course_id]
    @my_new_course = MyCourse.new(custom_course_params)
    # @my_new_course.user_id = _user_id
    # @my_new_course.course_id = _course_id

    respond_to do |format|
      if @my_new_course.save
        format.html { redirect_to my_course_url(@my_new_course), notice: 'My course was successfully created.' }
        format.json { render :show, status: :created, location: @my_new_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_new_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_courses/1 or /my_courses/1.json
  def update
    respond_to do |format|
      if @my_course.update(my_course_params)
        format.html { redirect_to my_course_url(@my_course), notice: 'My course was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_courses/1 or /my_courses/1.json
  def destroy
    @my_course.destroy

    respond_to do |format|
      format.html { redirect_to my_courses_url, notice: 'My course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def user_enroll_course
  #   puts custom_course_params
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_my_course
    @my_course = MyCourse.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def my_course_params
    params.require(:my_course).permit(:user_id, :course_id)
  end

  def custom_course_params
    params.permit(:user_id, :course_id)
  end


end
