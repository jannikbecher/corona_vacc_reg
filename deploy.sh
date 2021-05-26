export SECRET_KEY_BASE=$(mix phx.gen.secret)
export DATABASE_URL=ecto://becher:$(cat ../pgpass.temp)@localhost/database

mix deps.get --only prod
MIX_ENV=prod mix compile

npm install --prefix ./assets

npm run deploy --prefix ./assets
mix phx.digest
MIX_ENV=prod mix release
