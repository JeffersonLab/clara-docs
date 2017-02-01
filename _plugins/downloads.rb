class DownloadFileTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @params = {}
    input.scan(::Liquid::TagAttributes) do |key, value|
      @params[key] = value
    end
  end

  def render(context)
    file_name = @params['file'].strip
    link_name = @params['name'].strip

    baseurl = "#{lookup(context, 'site.baseurl')}"

    # TODO load from a template
    output =  "<div class=\"download\">"
    output += "<a href=\"#{baseurl}/_downloads/#{file_name}\">#{link_name}</a>"
    output += "</div>"

    return output;
  end

  def lookup(context, name)
    lookup = context
    name.split(".").each { |value| lookup = lookup[value] }
    lookup
  end
end

Liquid::Template.register_tag('download', DownloadFileTag)
