# encoding: UTF-8
require "spec_helper"

describe AdMailer do
	let(:ad) { Ad.sham! }
	let(:mail) { AdMailer.send_edit_link(ad) }

	it "should send edit link" do
		mail.subject.should eq("Edytuj ogłoszenie")
		mail.to.should eq([ad.email])
		mail.from.should eq(["from@example.com"])
		mail.body.encoded.should match(ad.token)	
	end
end