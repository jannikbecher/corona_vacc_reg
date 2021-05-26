defmodule CoronaVaccReg.Email do
  import Bamboo.Email

  @confirmation_email_html """
  <strong>Vielen Dank für Ihre Anmeldung zur Coronaimpfung mit BioNTech in unserer Praxis.</strong><br>
  Da wir weitaus mehr Anfragen als Impfstoff haben und der Impfstoff immer nur wochenweise in unterschiedlichen Mengen geliefert wird, haben wir Sie der Reihe nach auf eine Warteliste gesetzt. Wir werden Sie regelmäßig über den Impffortschritt in der Praxis informieren und etwa 1 Woche vorher anschreiben, wenn ein Impftermin frei ist. Beim Impftermin in der Praxis erhalten Sie auch den Termin zur 2. Impfung nach 6 Wochen. Diesen 2. Termin können wir nur in Ausnahmefällen geringfügig verlegen.<br>
  Falls Sie zwischenzeitlich woanders geimpft sein sollten oder bei anderen Fragen schreiben Sie an <a href="mailto:kontakt@waesterpraxis.de">kontakt@waesterpraxis.de</a><br><br>
  Ihre Hausärztliche Gemeinschaftspraxis an der Wäster<br>
  Dr. M. Becher und Dr. C. Becker
  """

  def send_confirmation_email(receiver) do
    new_email(
      to: receiver,
      from: "Wästerpraxis <kontakt@waesterpraxis.de>",
      subject: "Anmeldung Coronaimpfung",
      html_body: @confirmation_email_html,
      text_body: "Vielen Dank für Ihre Anmeldung!"
    )
    |> CoronaVaccReg.Mailer.deliver_now!()
  end
end
