class Formatter:
    def format_date(a_date: str) -> str:
        a_date = a_date.split("/")
        formatted_date = str(a_date[-1] + "-" + a_date[-2] + "-" + a_date[0])
        return formatted_date
