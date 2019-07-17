Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '9d0503273dff285906ca', '1ba5642c4fb1cff1883737e8b3960946e304b12d'
end