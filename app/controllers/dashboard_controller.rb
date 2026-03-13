class DashboardController < AuthenticatedController
  def index
    # @recent_banks = current.user.tenant.banks.limit(5)
    @user = current_user
  end
end
