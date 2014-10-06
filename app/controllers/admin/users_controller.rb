class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show]
  before_action :set_current_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end
  
  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'Usuário criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        format.html { redirect_to admin_users_path, notice: 'Usuário atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_current_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end