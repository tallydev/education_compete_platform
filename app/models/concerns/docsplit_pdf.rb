# module Paperclip
#   class DocsplitPdf < Processor
#     attr_accessor :src, :options, :attachment

#     def initialize(file, options = {}, attachment = nil)
#       super
#       @src        = file
#       @options    = options
#       @attachment = attachment
#       @basename   = File.basename(@file.path, '.*')
#     end
    
#     def src_path
#       File.expand_path(@src.path)
#     end

#     def make
#       dst_dir = Dir.tmpdir
#       dst_path = File.join(dst_dir, "#{@basename}.pdf")

#       if pdf_format?
#         dst_path = File.join(dst_dir, "_#{@basename}.pdf")
#         FileUtils.copy_file(src_path, dst_path)
#       else
#         Docsplit.extract_pdf(src_path, :output => dst_dir)
#       end
      
#       File.open(dst_path)
#     end

#     def pdf_format?
#       src_path =~ /pdf/i
#     end
#   end
# end