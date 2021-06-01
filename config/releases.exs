import Config

# Config for bamboo mailer
config :corona_vacc_reg, CoronaVaccReg.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.ionos.de",
  hostname: "waesterpraxis.de",
  port: 587,
  username: "kontakt@waesterpraxis.de",
  password: System.fetch_env!("EMAIL_PASSWORD"),
  tls: :always,
  retries: 1,
  no_mx_lookups: false,
  auth: :always
