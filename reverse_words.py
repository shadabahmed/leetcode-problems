#!/usr/bin/python
# -*- coding: utf-8 -*-


def rev_string(str, left, right):
    while left < right:
        (str[left], str[right]) = (str[right], str[left])
        left += 1
        right -= 1


def reverse_words(str):
    rev_str = []
    start = 0
    finish = len(str) - 1
    while str[start] == ' ':
        start = start + 1
    while str[finish] == ' ':
        finish = finish - 1

    for idx in reversed(range(start, finish + 1)):
        if str[idx] == ' ' and (idx == 0 or str[idx - 1] == ' '):
            continue
        rev_str.append(str[idx])
    start = 0
    for finish in range(0, len(rev_str) + 1):
        if finish == len(rev_str) or rev_str[finish] == ' ':
            rev_string(rev_str, start, finish - 1)
            start = finish + 1

    return ''.join(rev_str)


print reverse_words(' shadab     ahmed ')
