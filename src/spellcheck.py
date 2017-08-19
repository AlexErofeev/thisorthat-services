import language_check

tool = language_check.LanguageTool('ru-RU')
def autocorrect_text(text):
    matches = tool.check(text)
    answer = '{{{}}}'.format(', '.join(map(str, matches)))
    return answer

