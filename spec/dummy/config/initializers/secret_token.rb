# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Dummy::Application.config.secret_token = '65fd04c1054a3cd0baed789a53b07bfe23af5f538ca6c679ac96535aed3a4bd945b95c5d64c92db574d7fcc5027bf7647638e34dcdb230b83eaca10c5790079a'
Dummy::Application.config.secret_key_base = '2137d0193d209f4a4b554de1a294d1af1a3394856f03d79b709e3ab338c074eb1f819902799dcdc2a59bdea3fe00a44cad497a4ff7834bdbe8a98502ebf5bfaf' if Rails::VERSION::MAJOR == 4

