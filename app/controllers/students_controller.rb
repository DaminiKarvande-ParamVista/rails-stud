    class StudentsController < ApplicationController
        before_action :set_student, only: %i[show edit update destroy]

        helper_method :formatted_date

        def index
            @students = Student.all
        end

        def new
            @student = Student.new
        end

        def create
            @student = Student.new(student_params)

            if @student.save
                redirect_to students_path, notice: 'Student was successfully created.'
            else
                render :new, status: :unprocessable_entity
            end
        end

        def show
        end

        def edit
        end

        def update
            if @student.update(student_params)
                redirect_to student_path(@student), notice: 'Student was successfully updated.'
            else
                render :edit, status: :unprocessable_entity
            end
        end

        def destroy
            @student.destroy
            redirect_to students_path, notice: 'Student was successfully deleted.'
        end

        

        private 

        def student_params
            params.require(:student).permit(:first_name, :last_name, :email_address, :permanent_contact, :alternative_contact, :date_of_birth, :local_address, :permanent_address, :wa_contat, :profile_image)
        end

        def set_student
            @student = Student.find(params[:id])
        end

        def formatted_date(date)
            date.strftime('%A, %b, %d, %Y') if date.present?
        end
        end
