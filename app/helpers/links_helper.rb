module LinksHelper
  def show_comments?
    params[:id].nil? || params[:request].present?
  end
end
