defmodule CoronaVaccReg.Email do
  import Bamboo.Email

  def send_confirmation_email(receiver) do
    new_email(
      to: receiver,
      from: "kontakt@waesterpraxis.de",
      subject: "Anmeldung Coronaimpfung",
      html_body: "<strong>Vielen Dank für Ihre Anmeldung!</strong>",
      text_body: "Vielen Dank für Ihre Anmeldung!"
    )
    |> CoronaVaccReg.Mailer.deliver_now!()
  end
end
