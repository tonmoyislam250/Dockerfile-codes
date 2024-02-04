rm -rf .git
python3 -c "import sys; sys.path.insert(0, '/usr/src/binary'); import pewdiepie"
pip install -r requirements.txt
python3 -m bot
