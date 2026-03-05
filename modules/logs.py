import logging
from logging.handlers import RotatingFileHandler

logging.basicConfig(
    level=logging.ERROR,
    format="%(asctime)s - %(levelname)s - %(message)s [%(filename)s:%(lineno)d]",
    datefmt="%d-%b-%y %H:%M:%S",
    handlers=[
        RotatingFileHandler("logs.txt", maxBytes=50000000, backupCount=10),
        logging.StreamHandler(),
    ],
)
logging.getLogger("pyrogram").setLevel(logging.WARNING)

# ✅ Fixed: 'logging = logging.getLogger()' → variable naam badla
# Pehle 'logging' module ko hi shadow kar deta tha, jo baad mein import karne par crash karta
logger = logging.getLogger(__name__)
