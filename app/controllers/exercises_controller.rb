class ExercisesController < ApplicationController

	before_action :find_exercise, except: [:index, :new, :create]

	def index
		@exercises = current_user.exercises.order("created_at DESC")
	end

	def new
		@exercise = current_user.exercises.new
	end

	def create
		@exercise = current_user.exercises.new(exercise_params)

		if @exercise.save
			flash[:notice] = "Saved successfully"
			redirect_to [current_user, @exercise]
		else
			flash[:notice] = "Could not saved"
			render "new"
		end
	end

	def show

	end

	def edit

	end

	def update

		if @exercise.update(exercise_params)
			flash[:success] = "Updated successfully"
			redirect_to [current_user, @exercise]
		else
			render "edit"
		end
	end

	def destroy
		@exercise.destroy
		redirect_to :back
	end

	private

	def exercise_params
		params.require(:exercise).permit(:duration_in_min, :workout, :workout_date)
	end

	def find_exercise
		@exercise = Exercise.find params[:id]
	end

end