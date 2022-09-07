class ProductPolicy < BasePolicy
  def edit
    (record.user_id == Current.user.id) or (Current.user.admin?)
  end
  
  def update
    (record.user_id == Current.user.id) or (Current.user.admin?)
  end
  
  def destroy
    (record.user_id == Current.user.id) or (Current.user.admin?)
  end
end