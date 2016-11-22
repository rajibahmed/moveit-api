module Errors
  VALIDATION_ERRORS = {
    validation_failed: [ 1000, "validation failed".freeze ].freeze,
    not_found: [ 1001, "not found".freeze ].freeze,
		not_authorized: [ 1002, "not authorized".freeze ].freeze,
		error: [ 1003, "something went wrong".freeze ].freeze,
  }.freeze

  def self.for(identifier, model: nil)
    default = [1, "unknown error"]
    code, message = VALIDATION_ERRORS.fetch(identifier, default)

    rsp = { code: code, message: message }
    rsp[:errors] = model.errors.full_messages  if model
    rsp
  end
end
