defmodule Medusa do
  import ImageBase64Handler

  def merge_images(urls) do
    convert(urls)
    File.read!("/tmp/base64Output")
  end

  defp transform_to_base64 do
    imagetobase64("/tmp/output.jpg", "/tmp/base64Output")
  end

  defp convert(image_paths) do
    System.cmd "convert", Enum.concat(image_paths, conversion_arguments()), stderr_to_stdout: true
    transform_to_base64()
  end

  defp conversion_arguments do
    ["-gravity", "center", "-composite", "/tmp/output.jpg"]
  end
end
