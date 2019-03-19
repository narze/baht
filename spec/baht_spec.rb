RSpec.describe Baht do
  it "has a version number" do
    expect(Baht::VERSION).not_to be nil
  end

  describe '#words' do
    it "exists" do
      expect(described_class).to respond_to :words
    end

    shared_examples "translatable" do |from, to|
      it "translates #{from} to #{to}" do
        expect(described_class.words(from)).to eq to
      end
    end

    it_behaves_like "translatable", nil, "ศูนย์บาทถ้วน"
    it_behaves_like "translatable", 0, "ศูนย์บาทถ้วน"
    it_behaves_like "translatable", 1, "หนึ่งบาทถ้วน"
    it_behaves_like "translatable", 2, "สองบาทถ้วน"
    it_behaves_like "translatable", 3, "สามบาทถ้วน"
    it_behaves_like "translatable", 4, "สี่บาทถ้วน"
    it_behaves_like "translatable", 5, "ห้าบาทถ้วน"
    it_behaves_like "translatable", 6, "หกบาทถ้วน"
    it_behaves_like "translatable", 7, "เจ็ดบาทถ้วน"
    it_behaves_like "translatable", 8, "แปดบาทถ้วน"
    it_behaves_like "translatable", 9, "เก้าบาทถ้วน"
    it_behaves_like "translatable", 10, "สิบบาทถ้วน"
    it_behaves_like "translatable", 100, "หนึ่งร้อยบาทถ้วน"
    it_behaves_like "translatable", 101, "หนึ่งร้อยเอ็ดบาทถ้วน"
    it_behaves_like "translatable", 110, "หนึ่งร้อยสิบบาทถ้วน"
    it_behaves_like "translatable", 111, "หนึ่งร้อยสิบเอ็ดบาทถ้วน"
    it_behaves_like "translatable", 200, "สองร้อยบาทถ้วน"
    it_behaves_like "translatable", 201, "สองร้อยเอ็ดบาทถ้วน"
    it_behaves_like "translatable", 1000, "หนึ่งพันบาทถ้วน"
    it_behaves_like "translatable", 10000, "หนึ่งหมื่นบาทถ้วน"
    it_behaves_like "translatable", 100000, "หนึ่งแสนบาทถ้วน"
    it_behaves_like "translatable", 1000000, "หนึ่งล้านบาทถ้วน"
    it_behaves_like "translatable", 2000001, "สองล้านเอ็ดบาทถ้วน"
    it_behaves_like "translatable", 10000000, "สิบล้านบาทถ้วน"
    it_behaves_like "translatable", 21000000, "ยี่สิบเอ็ดล้านบาทถ้วน"
    it_behaves_like "translatable", 9_000_000_000, "เก้าพันล้านบาทถ้วน"
    it_behaves_like "translatable", 1_000_000_000_000, "หนึ่งล้านล้านบาทถ้วน"
    it_behaves_like "translatable", 1234567890123, "หนึ่งล้านสองแสนสามหมื่นสี่พันห้าร้อยหกสิบเจ็ดล้านแปดแสนเก้าหมื่นหนึ่งร้อยยี่สิบสามบาทถ้วน"

    # Decimals
    it_behaves_like "translatable", 1.25, "หนึ่งบาทยี่สิบห้าสตางค์"
    it_behaves_like "translatable", 100.019, "หนึ่งร้อยบาทสองสตางค์"
    it_behaves_like "translatable", 20001000001.1, "สองหมื่นเอ็ดล้านเอ็ดบาทสิบสตางค์"
    it_behaves_like "translatable", 100.0, "หนึ่งร้อยบาทถ้วน"
    it_behaves_like "translatable", 0.01, "หนึ่งสตางค์"

    # Negatives
    it_behaves_like "translatable", -20000000, "ลบยี่สิบล้านบาทถ้วน"
    it_behaves_like "translatable", -0.001, "ศูนย์บาทถ้วน"
    it_behaves_like "translatable", -0.01, "ลบหนึ่งสตางค์"
    it_behaves_like "translatable", -3.5, "ลบสามบาทห้าสิบสตางค์"
  end
end
