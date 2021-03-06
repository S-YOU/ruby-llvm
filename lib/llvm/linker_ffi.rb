# Generated by ffi_gen. Please do not change this file by hand.

require 'ffi'

module LLVM::C
  extend FFI::Library
  ffi_lib ["libLLVM-4.0.so.1", "LLVM-4.0"]
  
  def self.attach_function(name, *_)
    begin; super; rescue FFI::NotFoundError => e
      (class << self; self; end).class_eval { define_method(name) { |*_| raise e } }
    end
  end
  
  # This enum is provided for backwards-compatibility only. It has no effect.
  # 
  # <em>This entry is only for documentation and no real method. The FFI::Enum can be accessed via #enum_type(:linker_mode).</em>
  # 
  # === Options:
  # :destroy_source ::
  #   
  # :preserve_source_removed ::
  #   This is the default behavior.
  # 
  # @method _enum_linker_mode_
  # @return [Symbol]
  # @scope class
  enum :linker_mode, [
    :destroy_source, 0,
    :preserve_source_removed, 1
  ]
  
  # Links the source module into the destination module. The source module is
  # damaged. The only thing that can be done is destroy it. Optionally returns a
  # human-readable description of any errors that occurred in linking. OutMessage
  # must be disposed with LLVMDisposeMessage. The return value is true if an
  # error occurred, false otherwise.
  # 
  # Note that the linker mode parameter \p Unused is no longer used, and has
  # no effect.
  # 
  # This function is deprecated. Use LLVMLinkModules2 instead.
  # 
  # @method link_modules(dest, src, unused, out_message)
  # @param [FFI::Pointer(ModuleRef)] dest 
  # @param [FFI::Pointer(ModuleRef)] src 
  # @param [Symbol from _enum_linker_mode_] unused 
  # @param [FFI::Pointer(**CharS)] out_message 
  # @return [Integer] 
  # @scope class
  attach_function :link_modules, :LLVMLinkModules, [:pointer, :pointer, :linker_mode, :pointer], :int
  
  # Links the source module into the destination module. The source module is
  # destroyed.
  # The return value is true if an error occurred, false otherwise.
  # Use the diagnostic handler to get any diagnostic message.
  # 
  # @method link_modules2(dest, src)
  # @param [FFI::Pointer(ModuleRef)] dest 
  # @param [FFI::Pointer(ModuleRef)] src 
  # @return [Integer] 
  # @scope class
  attach_function :link_modules2, :LLVMLinkModules2, [:pointer, :pointer], :int
  
end
