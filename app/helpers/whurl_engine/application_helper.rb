module WhurlEngine
  module ApplicationHelper
    def clippy(text, bgcolor='#FFFFFF')
      swf_path = asset_path('whurl_engine/clippy.swf')
        html = <<-EOF
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                width="16"
                height="16"
                id="clippy" >
        <param name="movie" value="#{swf_path}"/>
        <param name="allowScriptAccess" value="always" />
        <param name="quality" value="high" />
        <param name="scale" value="noscale" />
        <param NAME="FlashVars" value="text=#{text}">
        <param name="bgcolor" value="#{bgcolor}">
        <embed src="#{swf_path}"
               width="16"
               height="16"
               name="clippy"
               quality="high"
               allowScriptAccess="always"
               type="application/x-shockwave-flash"
               pluginspage="http://www.macromedia.com/go/getflashplayer"
               FlashVars="text=#{text}"
               bgcolor="#{bgcolor}"
        />
        </object>
        EOF
        html.html_safe
      end
  end
end
