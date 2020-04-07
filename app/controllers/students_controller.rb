class StudentsController < ApplicationController

    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new(params.require(:student).permit!)
        @student[:first_name] = params[:student][:first_name]
        @student[:last_name] = params[:student][:last_name]
        @student.save
        redirect_to student_path(@student)
    end 
    
    def show
        @student = Student.find(params[:id])
    end 
    
    def edit
        @student = Student.find(params[:id])
    end
    
    def update
        @student = Student.find(params[:id])
        @student.update(params.require(:student).permit!)
        redirect_to student_path(@student)
    end 



end 