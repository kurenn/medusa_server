defmodule Medusa do
  import ImageBase64Handler
  require Logger

  def merge_images(urls) do
    file_name = UUID.uuid4(:hex)

    convert(urls, file_name)
    File.read!("/tmp/#{file_name}")
  end

  defp transform_to_base64(file_name) do
    imagetobase64("/tmp/#{file_name}.png", "/tmp/#{file_name}")
  end

  defp convert(image_paths, file_name) do
    System.cmd "convert", Enum.concat(arguments(image_paths), conversion_arguments(file_name)), stderr_to_stdout: true
    transform_to_base64(file_name)
  end

  defp arguments(image_paths) do
    [head | tail] = image_paths

    composited_urls = Enum.map(tail, fn(url) -> [url, "-composite"] end)

    List.flatten [head | composited_urls]
  end

  defp conversion_arguments(file_name) do
    ["/tmp/#{file_name}.png"]
  end
end
