defmodule Medusa do
  import ImageBase64Handler
  require Logger

  def merge_images(urls) do
    file_name = UUID.uuid4(:hex)

    convert(urls, file_name)
    File.read!("/tmp/#{file_name}")
  end

  defp transform_to_base64(file_name) do
    imagetobase64("/tmp/#{file_name}.jpg", "/tmp/#{file_name}")
  end

  defp convert(image_paths, file_name) do
    System.cmd "convert", Enum.concat(image_paths, conversion_arguments(file_name)), stderr_to_stdout: true
    transform_to_base64(file_name)
  end

  defp conversion_arguments(file_name) do
    ["-gravity", "center", "-composite", "/tmp/#{file_name}.jpg"]
  end
end
