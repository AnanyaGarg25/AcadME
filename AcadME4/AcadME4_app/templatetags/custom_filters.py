from django import template

register = template.Library()

@register.filter
def get_item(dictionary, key):
    return dictionary.get(key, None)

def ordinal_suffix(day):
    """Returns the day with an ordinal suffix (1st, 2nd, 3rd, etc.)"""
    if 10 <= day % 100 <= 20:
        suffix = "th"
    else:
        suffix = {1: "st", 2: "nd", 3: "rd"}.get(day % 10, "th")
    return f"{day}{suffix}"

@register.filter
def format_due_date(value):
    """Formats the date as '3rd Apr, 2025'"""
    return value.strftime(f"{ordinal_suffix(value.day)} %b, %Y")
