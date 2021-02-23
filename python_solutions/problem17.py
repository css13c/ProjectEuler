# Solution to Project Euler Problem 17:
# If all the numbers from 1 to 1000 (inclusive) were written
# out in words, how many letters would be used?

def count_letters(word: str):
    import re
    matches = re.findall('([A-z])', word)
    return len(matches)

def num_to_word(num: int):
    from math import floor
    baseWords = {
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine",
        10: "ten",
        11: "eleven",
        12: "twelve",
        13: "thirteen",
        14: "fourteen",
        15: "fifteen",
        16: "sixteen",
        17: "seventeen",
        18: "eighteen",
        19: "nineteen",
        20: "twenty",
        30: "thirty",
        40: "forty",
        50: "fifty",
        60: "sixty",
        70: "seventy",
        80: "eighty",
        90: "ninety",
    }

    div = 1000
    word = ""
    while num > 0 and div >= 1:
        if num < div:
            div /= 10
            continue

        if num == 1000:
            word = "one thousand"
        elif num >= 100:
            hundred_count = floor(num / div)
            optional_and = "" if num % div == 0 else " and "
            word += f"{baseWords[hundred_count]} hundred{optional_and}"
        elif num >= 20:
            tens_place = floor(num / div) * 10
            hyphon = "" if num % div == 0 else "-"
            word += f"{baseWords[tens_place]}{hyphon}"
        else:
            word += f"{baseWords[num]}"
            break

        num %= div
        div /= 10

    return word

def letters_in_range(max: int):
    letters = 0
    for i in range(1, max + 1):
        word = num_to_word(i)
        letters += count_letters(word)

    return letters

if __name__ == "__main__":
    print(f"Problem 17 solution: {letters_in_range(1000)}")

def test_example():
    assert letters_in_range(5) == 19

def test_num_to_word_99():
    assert num_to_word(99) == "ninety-nine"

def test_num_to_word_1000():
    assert num_to_word(1000) == "one thousand"

def test_num_to_word_342():
    assert num_to_word(342) == "three hundred and forty-two"

def test_num_to_word_115():
    assert num_to_word(115) == "one hundred and fifteen"