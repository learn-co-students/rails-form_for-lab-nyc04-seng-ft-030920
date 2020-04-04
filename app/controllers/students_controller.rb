class StudentsController < ApplicationController
    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.create(post_params)
        redirect_to @student
    end
    
    def show
        @student = find_student
    end
    
    def edit
        @student = find_student
    end
    
    def update
        @student = find_student
        @student.update(post_params)
        redirect_to @student
    end

    private

    def find_student
        Student.find(params[:id])
    end

    def post_params
        params.require(:student).permit(:first_name, :last_name)
    end
end
