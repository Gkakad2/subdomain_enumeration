🌐 Subdomain Enumeration Tool

A lightweight **Bash-based subdomain enumeration script** that helps you discover subdomains of a given domain using a wordlist.  
It includes built-in checks for dependencies (`figlet`, `lolcat`) and offers **manual** or **automatic installation** if they are missing.  

---

## ✨ Features
- ✅ Checks and installs required tools (`figlet`, `lolcat`) automatically.  
- ✅ Simple CLI options for domain and wordlist.  
- ✅ Uses `host` command to resolve valid subdomains.  
- ✅ Colorful & attractive banner output with `figlet` + `lolcat`.  
- ✅ Easy to use, minimal dependencies.  

---

## ⚡ Requirements
- Linux environment (Ubuntu/Debian recommended).  
- Internet connection (for auto installation).  

The script automatically handles:
- [`figlet`](http://www.figlet.org/) → For ASCII art banners.  
- [`lolcat`](https://github.com/busyloop/lolcat) → For rainbow-colored text.  

---

## 📥 Installation
Clone the repository:
```bash
git clone https://github.com/Gkakad2/subdomain_enumeration.git
cd subdomain_enumeration

Make the script execuable: chmod +x subd_enum.sh

🚀 Usage

Run the script with the following options:

./subd_enum.sh -d <DOMAIN> -w <WORDLIST>

Options:

-d DOMAIN → Target domain (e.g., example.com)

-w WORDLIST → Subdomain wordlist file (e.g., subdomains.txt)

-h, --help → Show usage guide

📌 Example
./subd_enum.sh -d example.com -w subdomains.txt


Output:

sub.example.com
admin.example.com
mail.example.com

🛠️ Tool Installation Handling

If required tools are missing:

The script will prompt you to choose:
1️⃣ Manual Installation (run commands yourself)
2️⃣ Auto Installation (script installs for you)

Example prompt:

The following tools are missing: figlet
Choose an installation option:
  1. Manual Installation
  2. Auto Installation
Enter choice [1/2]:

📂 Repository Structure
📦 subdomain_enumeration
 ┣ 📜 LICENSE
 ┣ 📜 README.md
 ┣ 📜 subd_enum.sh      # Main script
 ┣ 📜 subdomains.txt    # Sample wordlist

🌟 Contribution

Pull requests are welcome! If you’d like to improve this tool (e.g., add concurrency, better resolvers), feel free to fork and contribute.

⚠️ Disclaimer

This tool is for educational and ethical penetration testing purposes only.
Do not use it against domains you don’t own or have explicit permission to test.

👩‍💻 Developed with ❤️ by Gayatri (Gkakad2)
