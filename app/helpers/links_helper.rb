module LinksHelper
  def show_comments?
    params[:id].nil? || params[:request].present? || params[:id].to_i == 0
  end
end
