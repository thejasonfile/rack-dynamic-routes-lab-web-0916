class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = env["PATH_INFO"].split("/").last #"Figs"
      item_obj = @@items.find {|obj| obj.name == item}

      if @@items.include?(item_obj)
          resp.write "#{item_obj.price}"
      else
          resp.write "Item not found"
          resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404

    end

    resp.finish
  end

end