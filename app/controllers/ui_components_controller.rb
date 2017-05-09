class UiComponentsController < ApplicationController
  
  before_action :authenticate_request!

  def navbar
    respond_to do |format|
      format.json do
        render json: navbar_template.to_json
      end
    end
  end

  private

    def navbar_template
      render_to_string({template: 'application/_navbar.html.erb', layout: false, formats: [:html]})
    end
end