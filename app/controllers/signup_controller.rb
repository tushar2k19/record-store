class SignupController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      payload = {user_id: user.id}
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)  #enables the ability to refresh the access tokens using the refresh tokens
      tokens = session.login    #returns the tokens for the session
                                # {:csrf=>"BmhxDRW5NAEIx...",
                                #  :access=>"eyJhbGciOiJIUzI1NiJ9...",
                                #  :access_expires_at=>"..."                             looks like this
                                #  :refresh=>"eyJhbGciOiJIUzI1NiJ9...",
                                #  :refresh_expires_at=>"..."}

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production? )       # since the tokens can be either in local storage or
                                                                # in cookies, this creates a http cookie with the tokens.
                                                                # Now these cookies are included in all the user actions. whenever user hits an API,
                                                                # the access token cookie is automatically included in the request headers

      render json: {csrf: tokens[:csrf]}
    else
      render json: {errors: user.errors.full_messages.join(' ')}, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
