Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '685593707978.apps.googleusercontent.com', 'NYsdlAzEgjZgu8Jl_S1aZa_h'
  provider :facebook, '256339511099558', '9c8d57b803aad25cfd06c615ffd66300'
end
