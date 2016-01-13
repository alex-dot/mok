% import time
% rebase('base.tpl', title='Add a Video', logged_in=logged_in)

<div class="page-header">
  <h1>Add a Video</h1>
</div>

<form id="add-video-form" action="/add" method="post">
  <div class="row">
    <div class="col-md-6">

      <div class="form-group">
        <label for="title">Title</label>
        <input class="form-control" type="text" name="title" placeholder="Title">
      </div>
      <div class="form-group">
        <label for="subtitle">Subtitle</label>
        <input class="form-control" type="text" name="subtitle" placeholder="Subtitle">
      </div>
      <div class="form-group">
        <label for="pathname">Path</label>
        <input class="form-control" type="text" name="pathname" placeholder="Path">
      </div>
      <div class="form-group">
        <label for="url">URL</label>
        <input class="form-control" type="text" name="url" placeholder="URL">
      </div>
      <div class="form-group">
        <label for="release">Release Date</label>
        <input class="form-control" type="text" name="release" placeholder="{{time.strftime('%Y-%m-%d')}}">
      </div>
      <label for="description">Description</label>
      <textarea name="description" style="width:100%"></textarea>

    </div>
    <div class="col-md-6">

      <div class="form-group">
        <label for="categories">Categories</label>
        <input class="form-control" type="text" name="categories" placeholder="Stub">
      </div>

    </div>
  </div>

  <button class="btn btn-success" type="submit">Add the Video</button>
</form>