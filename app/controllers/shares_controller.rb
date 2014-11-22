class SharesController < ApplicationController
  before_action :set_share_with_id, only: :destroy
  before_action :watch, only: :index
  before_action :set_share_with_token, only: :download

  before_action :authorize, only: [:index, :destroy]

  def index
    @shares = Share.all
  end

  def download
    if @share
      send_file 'shares/' + @share.filename
    else
      redirect_to shares_url
    end
  end

  def destroy
    File.delete('shares/' + @share.filename)
    @share.destroy
    redirect_to shares_url
  end

  private

    def set_share_with_id
      @share = Share.find(params[:id])
    end

    def set_share_with_token
      @share = Share.find_by(token: params[:token])
    end

    def watch
      @files = Dir.entries('shares')
      @files.delete_if { |fname| fname !~ /^(?!\.).*\.zip$/i }

      @shares = Share.all

      @shares.each do |share|
        share.destroy unless @files.include?(share.filename)
      end

      @files.each do |file|
        @share = Share.new
        @share.token = Digest::SHA1.hexdigest([Time.now, rand].join)
        @share.filename = file

        @share.save
      end
    end
end
