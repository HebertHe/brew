module Hbc
  class WithoutSource < Cask
    # Override from `Hbc::DSL` because we don't have a cask source file to work
    # with, so we don't know the cask's `version`.
    def staged_path
      (caskroom_path.children - [metadata_master_container_path]).first
    end

    def to_s
      "#{token} (!)"
    end

    def installed?
      caskroom_path.exist?
    end
  end
end
