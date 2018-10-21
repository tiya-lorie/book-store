class Api::V1::Authors::ApplicationController < Api::V1::ApplicationController
  private

  def set_author
    @author = ::Authors::Find.run!(id: params[:author_id])
  end
end