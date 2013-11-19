require 'spec_helper'

describe Image do
  context '::create' do
    let(:user) { FactoryGirl.create :user }
    let(:gadget) { FactoryGirl.create :gadget, user: user }

    context 'allowed mimetypes' do
      context 'png image' do
        let(:image) { FactoryGirl.build :image, gadget: gadget }

        it 'succeeds when valid' do
          expect(image.valid?).to be_true
          expect(image.save).to be_true
          expect(Image.count).to eq 1
        end

        it 'fails when too big' do
          mock_attachments image, 'image_file', size: 2.megabytes, mime: 'image/png'

          expect(image.valid?).to be_false
          expect(image.save).to be_false
          expect(Image.count).to eq 0
          expect(image.errors[:image_file]).to include "File must not be over 1 MB"
        end
      end

      context 'png image' do
        let(:image) { FactoryGirl.build :image_jpg, gadget: gadget }

        it 'succeeds when valid' do
          expect(image.valid?).to be_true
          expect(image.save).to be_true
          expect(Image.count).to eq 1
        end

        it 'fails when too big' do
          mock_attachments image, 'image_file', size: 2.megabytes, mime: 'image/jpg'

          expect(image.valid?).to be_false
          expect(image.save).to be_false
          expect(Image.count).to eq 0
          expect(image.errors[:image_file]).to include "File must not be over 1 MB"
        end
      end
    end

    context 'unallowed mimetypes' do
      context 'tiff image' do
        let(:image) { FactoryGirl.build :image, gadget: gadget }

        it 'is invalid' do
          mock_attachments image, 'image_file', mime: 'image/tiff'

          expect(image.valid?).to be_false
          expect(image.save).to be_false
          expect(Image.count).to eq 0
          expect(image.errors[:image_file]).to include "File must be a valid JPG / PNG image"
        end
      end
    end
  end
end
