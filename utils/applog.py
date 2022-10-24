from rich import print


class appLog:

    @staticmethod
    def install(platform, name):
        print(f"installing {platform} {name}...[green]\\[ok][/green]")

    @staticmethod
    def config(name):
        print(f"linking {name}...[green]\\[ok][/green]")

    @staticmethod
    def prereq(msg):
        print(f"[yellow]\\[pre-req][/yellow] {msg}...[green]\\[ok][/green]")

    @staticmethod
    def err(msg):
        print(f"{msg}...[red]\\[error][/red]")
