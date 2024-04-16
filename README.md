# README


things used -> JWT (json web tokens) for user authorization (SIGNIN, SIGNUP)
rack-cors
mysql (setup in database.yml)


ruby contains :

controllers ->  signin, signup, refresh(for refreshing the access tokens), records, artists
models -> user, artist, record
config -> initiallizers -> cors.rb, jwt_sessions.rb
routes.rb 

frontend :

src -> backend -> index1.js (used to add csrf in the headers from local storage and to handle errors in the response (token regenerate))
components-> header.vue, signin, signup, record, artist (header added into app.vue which is the base file)

router -> used to set the routes. whichever route is selected, app.vue shows the component attached to that route. 


if tailwind is used, then add the config in .postcssrc file



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Purpose of APP

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-> has a signup page. user creates an account. the email, password is sent to the signup controller, which creates a session for the current user. using this session, we create the tokens (access, refresh, and csrf). the access tokens are stored in the cookies and the csrf is sent along with the response. on the frontend side, this csrf is then added to the localstorage along with another boolean variable "is_signed_in".
once the session get's over(or user sign's out), the two are deleted from the localstorage. 

-> has a signin page, which does the exact same as above. the only difference is that here we don't create a new user but simply authenticate the user. 

-> has a refresh_controller, which is called from the src/backend/index1.js. this is used to add the csrf in the headers of the request. also, it is used to handle the errors. how can an error occur? the user logs in today and close the app. then open the app tomorrow again(after the access token expires). so since the access tokens expire by that time, as a result of which, when the application is opened again, the tokens do not match with the tokens on the backend. as a result, the response by the server gives an error and in index1.js, i have written a logic that if the response has an error, clear the local storage and retry. 




