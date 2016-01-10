<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Mit offenen Karten</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active">
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/">Home 2</a>
        </li>
        <li class="dropdown">
          <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider" role="separator"></li>
            <li class="dropdown-header">Nav header</li>
            <li><a href="#">Separated link</a></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      % if logged_in == True:
      <div class="navbar-form navbar-right btn-group">
        <a href="/add" class="btn btn-default">add video</a>
        <a href="/logout" class="btn btn-danger">logout</a>
      </div>
      % else:
      <div class="navbar-form navbar-right btn-group">
        <a href="/login" class="btn btn-info">login</a>
      </div>
      % end
      <form class="navbar-form navbar-right">
        <div class="form-group">
          <input class="form-control" type="text" placeholder="Titel">
        </div>
        <button class="btn btn-success" type="submit">Suche</button>
      </form>
    </div>
  </div>
</nav>