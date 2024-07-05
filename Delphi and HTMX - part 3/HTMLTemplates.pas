unit HTMLTemplates;

interface

const
  HTML = '''
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Delphi & HTMX Demo</title>
      <script src="https://unpkg.com/htmx.org@1.9.12"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css" />
    </head>
    <body>
      <main class="container">
        <h1 id="header">Delphi & HTMX Rocks!💃</h1>
        <button hx-get="/helloworld" hx-target="#header">Click me</button>
      <hr />
      <article>
        <h3>Another test</h3>
        <form hx-get="/edit" hx-swap="outerHTML">
          <fieldset role="group">
            <input type="text" name="edit" placeholder="Disabled. Click Edit" disabled />
            <input type="submit" value="Edit ✏">
          </fieldset>
        </form>
      </article>
      </main>
    </body>
  </html>
  ''';

  cSubmit = '''
    <form hx-get="/edit" hx-swap="outerHTML">
      <fieldset role="group">
        <input type="text" name="edit" placeholder="Disabled. Click Edit" disabled />
        <input type="submit" value="Edit ✏">
      </fieldset>
      <kbd>%s</kbd>
    </form>
  ''';

  cEdit = '''
    <form hx-post="/submit" hx-swap="outerHTML">
      <fieldset role="group">
        <input type="text" name="edit" value="%s"/>
        <input type="submit" value="Submit ✅">
      </fieldset>
    </form>
  ''';

implementation

end.
