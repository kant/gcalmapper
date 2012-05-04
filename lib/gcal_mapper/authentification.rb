require 'gcal_mapper/authentification/assertion'
require 'gcal_mapper/authentification/oauth2'

module GcalMapper
  #
  # Abstract which type of authentification is required
  #
  class Authentification

    attr_reader :file           # file that is needed for authentification
    attr_reader :client_email   # for assertion authentification
    attr_reader :password       # password for the p12 file

    # intialize client info needed for connection to Oauth2.
    #
    # @param [String] file path to the yaml or p12 file
    # @param [String] client_email client email of service accout if you use p12 file
    # @param [String] password password of the p12 file
    def initialize(file, client_email=nil, password='notasecret')
      @file = File.expand_path(file)
      @client_email = client_email
      @password = password
      raise GcalMapper::AuthFileError if !File.exist?(@file)
    end

    # do the authentification for one of the right authentification method
    #
    # @return [Bool] true if instantiation ok
    def authenticate
      if client_email==nil
        @auth = Authentification::Oauth2.new(@file)
      else
        @auth = Authentification::Assertion.new(@file, @client_email, @password)
      end

      !access_token.nil?
    end

    # Gives the access token
    #
    # @return [string] the access token
    def access_token
      @auth.access_token
    end

  end
end