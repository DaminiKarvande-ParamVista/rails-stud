    class Admin::StudentsController < AdminController
        include Pundit::Authorization
        before_action :set_student, only: %i[show edit update destroy]

        helper_method :formatted_date

        def index
            @q = policy_scope(Student).ransack(params[:q])
            @students = @q.result(distinct: true).page(params[:page])

            # @students = Student.all.page(params[:page])  #this is using kaminari gem
            # @pagy, @students = pagy(Student.all, items:5)
        end

        def new
            @student = Student.new
            authorize @student
        end

        def create
            @student = Student.new(student_params)
            authorize @student

            if @student.save
                CrudNotificationMailer.create_notification(@student).deliver_now
                redirect_to admin_students_path, notice: 'Student was successfully created.'
            else
                render :new, status: :unprocessable_entity
            end
        end

        def show
            authorize @student
        end

        def edit
            authorize @student
        end

        def update
            authorize @student
            if @student.update(student_params)
                CrudNotificationMailer.update_notification(@student).deliver_now
                redirect_to admin_student_path(@student), notice: 'Student was successfully updated.'
            else
                render :edit, status: :unprocessable_entity
            end
        end

        def destroy
            authorize @student
            @student.destroy
            CrudNotificationMailer.delete_notification(@student).deliver_now
            redirect_to admin_students_path, notice: 'Student was successfully deleted.'
        end

        

        private 

        def student_params
            params.require(:student).permit(:first_name, :last_name, :email_address, :permanent_contact, :alternative_contact, :date_of_birth, :local_address, :permanent_address, :wa_contat, :profile_image, :description)
        end

        def set_student
            @student = Student.find(params[:id])
        end

        def formatted_date(date)
            date.strftime('%A, %b, %d, %Y') if date.present?
        end
        end
