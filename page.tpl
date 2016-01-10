% rebase('base.tpl', title=name.title(), logged_in=logged_in)

<div class="page-header">
  <a class="edit with-icon" href="/edit/blub"><span class="glyphicon glyphicon-pencil"> </span></a>
  <h1>{{name.title()}}</h1>
</div>
<div class="video">
  <video controls preload>
    <source src="/video/mok-birma.mp4" type="video/mp4"></source>
  </video>
</div>