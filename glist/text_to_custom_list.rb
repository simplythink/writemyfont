#!/usr/bin/env ruby
# frozen_string_literal: true

# Offline: read any UTF-8 text file → writemyfont "使用者字表" glyph names.
# Usage:
#   ruby text_to_custom_list.rb article.txt
#   ruby text_to_custom_list.rb article.txt mylist.txt
# Options:
#   --comma-only   output only one comma-separated line (for customGlyphs)
#   --lines-only   one glyph name per line (uniXXXX / uXXXXX)

SKIP_CP = [0x20, 0x3000, 0xA0, 0x9, 0xA, 0xD].freeze

def codepoint_to_gname(cp)
  h = cp.to_s(16).upcase
  cp <= 0xFFFF ? "uni#{h.rjust(4, '0')}" : "u#{h}"
end

def glyph_names_from_text(str)
  seen = {}
  order = []
  str.each_codepoint do |cp|
    next if SKIP_CP.include?(cp)

    gn = codepoint_to_gname(cp)
    next if seen[gn]

    seen[gn] = true
    order << gn
  end
  order
end

def usage(msg = nil)
  warn msg if msg
  warn 'Usage: ruby text_to_custom_list.rb INPUT.txt [OUTPUT.txt] [--comma-only|--lines-only]'
  exit 1
end

args = ARGV.dup
mode = :both
if args.delete('--comma-only')
  mode = :comma
elsif args.delete('--lines-only')
  mode = :lines
end

usage if args.empty?

input = args.shift
output = args.shift
usage("Unexpected args: #{args.join(' ')}") unless args.empty?

usage("Not a file: #{input}") unless File.file?(input)

text = File.read(input, encoding: 'UTF-8')
names = glyph_names_from_text(text)

base = File.basename(input, '.*')
out_path = output || "#{base}-custom-glyphs.txt"

File.open(out_path, 'w:utf-8') do |f|
  f.puts '# writemyfont 使用者字表（由 glist/text_to_custom_list.rb 產生）'
  f.puts "# 來源: #{input}"
  f.puts '# 格式說明：'
  f.puts '#   - 「一行一個 uniXXXX」或下方「逗號分隔」皆可於網頁匯入。'
  f.puts '#   - 以文字檔內容出現順序去重（略過空白與常見空格字元）。'
  f.puts "# 字數: #{names.size}"
  f.puts

  unless mode == :comma
    f.puts '# --- 一行一個字形名（可選） ---'
    names.each { |g| f.puts(g) }
    f.puts
  end

  unless mode == :lines
    f.puts '# --- customGlyphs 用（逗號分隔，單行） ---'
    f.puts(names.join(','))
  end
end

puts "Wrote #{names.size} glyphs → #{out_path}"
