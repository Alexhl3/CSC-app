class UserPolicy < BasePolicy
  def new
    Current.user.admin?
  end

  def create
    Current.user.admin?
  end
end