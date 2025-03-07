# /// script
# dependencies = []
# ///

"""Time formatting utilities for build scripts."""

import datetime

def get_formatted_datetime() -> str:
    """Get current date and time in the format YYYY-MM-DD_HH-MM-SS.
    
    Returns:
        Formatted datetime string
    """
    now = datetime.datetime.now()
    return now.strftime("%Y-%m-%d_%H-%M-%S")

def parse_build_time(timestamp: str) -> datetime.datetime:
    """Parse a build timestamp string into a datetime object.
    
    Args:
        timestamp: String in format YYYY-MM-DD_HH-MM-SS
        
    Returns:
        datetime object, or epoch if parsing fails
    """
    try:
        return datetime.datetime.strptime(timestamp, "%Y-%m-%d_%H-%M-%S")
    except ValueError:
        return datetime.datetime(1970, 1, 1)