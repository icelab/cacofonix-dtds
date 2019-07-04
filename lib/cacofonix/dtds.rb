# frozen_string_literal: true

module Cacofonix
  module DTDs
    Error = Class.new(StandardError)

    def self.xml_catalog_path
      File.expand_path("../../data/catalog.xml", __dir__)
    end

    def self.apply_libxml_env!(env = ENV)
      existing_value = env[libxml_env_key]

      if block_given? && existing_value && existing_value != xml_catalog_path
        yield existing_value
      end

      env[libxml_env_key] = xml_catalog_path
    end

    def self.libxml_env_key
      "XML_CATALOG_FILES"
    end
  end
end
