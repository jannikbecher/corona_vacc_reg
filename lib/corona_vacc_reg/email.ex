defmodule CoronaVaccReg.Email do
  import Bamboo.Email

  def send_confirmation_email(user) do
    new_email(
      to: user["email"],
      from: "kontakt@waesterpraxis.de",
      subject: "Anmeldung Coronaimpfung",
      html_body: generate_html(user),
      text_body: "Vielen Dank für Ihre Anmeldung!"
    )
    |> CoronaVaccReg.Mailer.deliver_now!()
  end

  def generate_html(user) do
    """
    <section>
      <h4>Vielen Dank für Ihre Anmeldung zur Coronaimpfung mit BioNTech in unserer Praxis.</h4><br><br>
      <p>
        Name: #{user["last_name"]}<br>
        Vorname: #{user["first_name"]}<br>
        Geburtsdatum: #{user["birthdate"]["day"]}.#{user["birthdate"]["month"]}.#{user["birthdate"]["year"]}<br>
        Mobiltelefon: #{user["mobile"]}<br>
      </p>


      <p>Da wir weitaus mehr Anfragen als Impfstoff haben und der Impfstoff immer nur wochenweise in unterschiedlichen Mengen geliefert wird, haben wir Sie der Reihe nach auf eine Warteliste gesetzt. Wir werden Sie regelmäßig über den Impffortschritt in der Praxis informieren und etwa 1 Woche vorher anschreiben, wenn ein Impftermin frei ist. Beim Impftermin in der Praxis erhalten Sie auch den Termin zur 2. Impfung nach 6 Wochen. Diesen 2. Termin können wir nur in Ausnahmefällen geringfügig verlegen.<br>
      Falls Sie zwischenzeitlich woanders geimpft sein sollten oder bei anderen Fragen schreiben Sie an <a href="mailto:kontakt@waesterpraxis.de">kontakt@waesterpraxis.de</a></p>
      <br>
      <p>Ihre Hausärztliche Gemeinschaftspraxis an der Wäster<br>
      Dr. M. Becher und Dr. C. Becker</p>
    </section>
    """
  end
end
