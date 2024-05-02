class ProfileController < ApplicationController
  def create
    profile = Profile.create(name: params[:name], email: params[:email], phone: params[:phone])
    Conversation.create(profile_id: profile.id)
    render json: {success: true}, :status => :ok
  end

  def delete_profile
    Profile.find(id: params[:id])&.destroy
    render json: {success: true}, :status => :ok
  end

  def edit_profile
    Profile.find(params[:id]).update(name: params[:name], email: params[:email], phone: params[:phone])
    render json: {success: true}, :status => :ok
  end

  def profiles
    limit = 5
    all_profiles = []
    page = 1
    Profile.all.each do |profile|
      profile = {
        id: profile.id,
        name: profile.name,
        email: profile.email,
        phone: profile.phone,
        created_at: profile.created_at,
      }
      all_profiles << profile
    end

    sorted_profiles = all_profiles.sort_by{|profile| profile[:created_at]}.reverse
    start_index = (page - 1) * limit
    end_index = page * limit - 1
    paginated_data = sorted_profiles[start_index..end_index]
    render json: { success: true, data: paginated_data, count: sorted_profiles.count }
  end
end
