% rebase('base.tpl', title='Login', logged_in=logged_in)

<div class="page-header">
  <h1>Login</h1>
</div>

% if login == 'user_not_found':
<div class="alert alert-danger" role="alert">
  <p>
    <span class="glyphicon glyphicon-alert" aria-hidden="true"> </span>
    User not found in database, please try again
  </p>
</div>
% elif login == 'password_not_match':
<div class="alert alert-warning" role="alert">
  <p>
    <span class="glyphicon glyphicon-alert" aria-hidden="true"> </span>
    Passwords do not match, please try again
  </p>
</div>
% elif login == 'passed':
<div class="alert alert-success" role="alert">
  <p>
    <span class="glyphicon glyphicon-ok-sign" aria-hidden="true"> </span>
    You successfully logged in
  </p>
</div>
% elif login == 'logout':
<div class="alert alert-success" role="alert">
  <p>
    <span class="glyphicon glyphicon-ok-sign" aria-hidden="true"> </span>
    You successfully logged out; have a nice day!
  </p>
</div>
% elif login == 'already_logged_out':
<div class="alert alert-warning" role="alert">
  <p>
    <span class="glyphicon glyphicon-alert" aria-hidden="true"> </span>
    You are already logged out; but no harm done, right?
  </p>
</div>
% end

<form id="login-form" action="/login" method="post">
  <div class="form-group">
    <input class="form-control" type="text" name="username" placeholder="Username">
  </div>
  <div class="form-group">
    <input class="form-control" type="password" name="password" placeholder="Password">
  </div>
  <button class="btn btn-success" type="submit">Login</button>
</form>