# frozen_string_literal: true

# Jekyll applies excludes to site files before theme and plugin assets are added.
Jekyll::Hooks.register :site, :post_render do |site|
  filter = Jekyll::EntryFilter.new(site)
  site.static_files.reject! do |file|
    path = file.relative_path.delete_prefix("/")
    path.start_with?("assets/") && filter.excluded?(path) && !filter.included?(path)
  end
end
