file = File.readlines('./words-to-wrap.txt', "\n\n");
file.each do |para|
    newStr = ''
    para.split(' ').each do |word|
        if (newStr.length + word.length + 1 <= 80)
            newStr += word + ' '
        else
            puts newStr
            newStr = ''
        end
    end
    puts newStr + "\n\n"
end