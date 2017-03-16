defmodule MedusaServer.Router do
  use Plug.Router
  require Logger

  plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "Welcome")

  post "/process" do
    Logger.info "POST request"

    urls = conn.body_params["urls"]
    base64Image = Medusa.merge_images(["https://s3.amazonaws.com/icalialabs/assets/img/bg.png", "https://s3.amazonaws.com/icalialabs/assets/img/area-int.png"])
    send_resp(conn, 201, base64Image)
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
