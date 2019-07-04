RSpec.describe Cacofonix::DTDs do
  subject(:dtds) { described_class }

  describe ".xml_catalog_path" do
    it "returns the catalog path" do
      expect(File.read(dtds.xml_catalog_path)).to include("onix-international.dtd")
    end
  end

  describe ".apply_libxml_env!" do
    it "sets the XML_CATALOG_FILES env var with catalog path" do
      env = {}
      expect { dtds.apply_libxml_env!(env) }
        .to change { env }
        .to("XML_CATALOG_FILES" => dtds.xml_catalog_path)
    end

    it "overrides any existing env value" do
      env = {"XML_CATALOG_FILES" => "existing_value"}

      expect { dtds.apply_libxml_env!(env) }
        .to change { env }
        .to("XML_CATALOG_FILES" => dtds.xml_catalog_path)
    end

    it "yields any existing env value" do
      env = {"XML_CATALOG_FILES" => "existing_value"}

      existing = nil

      expect { dtds.apply_libxml_env!(env) { |v| existing = v } }
        .to change { existing }
        .to("existing_value")
    end

    it "does not yield if the existing value is already the catalog path" do
      env = {"XML_CATALOG_FILES" => dtds.xml_catalog_path}

      existing = nil

      expect { dtds.apply_libxml_env!(env) { |v| existing = v } }
        .not_to change { existing }
    end

    it "supports breaking from the existing value block to abort changing the env" do
      env = {"XML_CATALOG_FILES" => "existing_value"}

      expect { dtds.apply_libxml_env!(env) { break } }
        .not_to change { env }
    end
  end
end
