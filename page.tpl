% import time
% import hashlib
% rebase('base.tpl', title=video['title'].title(), logged_in=logged_in)
% def getLabelColor(name):
% css = hashlib.md5(name.encode()).hexdigest()[:6]
% text = 'black' if ( int(css[1:2], 16) + int(css[3:4], 16) + int(css[5:6], 16) )/float(45) < 0.35 else 'white'
% return dict(css=css, text=text)
% end

<div class="page-header">
  <h1>{{video['title'].title()}}</h1>
</div>
<div class="video">
  <video controls preload>
    <source src="/video/{{video['pathname']}}" type="video/mp4"></source>
  </video>
</div>
<hr>
<div class="row">
    <div class="col-md-6">
        <h2><small>Veröffentlicht am: </small>
            <span class="publication-date">{{time.strftime("%d.%m.%Y", time.gmtime(video['release']))}}</span>
        </h2>
        <p>{{video['description'] if video['description'] else ""}}</p>
    </div>
    <div class="col-md-6 video-labels">
    % for cid in categories:
        <div class="row video-labels-{{categories[cid]['category_escaped_title'] or categories[cid]['category_title'].lower()}}">
            <div class="col-xs-3">
                <h4>{{categories[cid]['category_title']}}</h4>
            </div>
            <div class="col-xs-9">
                % for category_value in categories[cid]['query']:
                % color = getLabelColor(category_value['title'])
                <a href="/{{categories[cid]['category_escaped_title'] or categories[cid]['category_title'].lower()}}/{{category_value['escaped_title'] or category_value['title'].lower()}}">
                    <span class="label label-default" style="background-color:#{{color['css']}}; color:{{color['text']}}">{{category_value['title']}}</span>
                </a>
                % end
            </div>
        </div>
    % end
    </div>
</div>