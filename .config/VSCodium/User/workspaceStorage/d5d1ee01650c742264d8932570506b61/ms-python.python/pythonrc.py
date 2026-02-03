import sys;import site;import functools;sys.argv[0] = '/build/extension/python_files/pythonrc.py';functools.reduce(lambda k, p: site.addsitedir(p, k), ['/nix/store/f2l9dha8rg6hiy0pcm55ifdr8i3l4c9q-python3.13-debugpy-1.8.19/lib/python3.13/site-packages','/nix/store/0bf48ka7w497i9m4z4z9g95sxsdgpy7l-python3.13-jedi-language-server-0.46.0/lib/python3.13/site-packages','/nix/store/xg46a8r6wk3ipzli7vg6yc51jvjm65ib-python3.13-docstring-to-markdown-0.17/lib/python3.13/site-packages','/nix/store/m3d4z6wpxn2nj5drpk45cqshi16b148m-python3.13-importlib-metadata-8.7.0/lib/python3.13/site-packages','/nix/store/lw6p28jwl4sh4d05wnkx4ff6na1l531c-python3.13-toml-0.10.2/lib/python3.13/site-packages','/nix/store/5cczv2901dq0xazd545r6anx1i78z1zx-python3.13-zipp-3.23.0/lib/python3.13/site-packages','/nix/store/j7m1m27aswbb59qpg7msjz1k24sj2idf-python3.13-typing-extensions-4.15.0/lib/python3.13/site-packages','/nix/store/liqqws0b9b0p042rszcccc7da8153yqa-python3.13-jedi-0.19.2/lib/python3.13/site-packages','/nix/store/sx44s75lg49d5j5jn0b7ag6q4y9z5a4l-python3.13-parso-0.8.5/lib/python3.13/site-packages','/nix/store/wcmwx1rd4hpqal22j8f5pvk8kh2c8662-python3.13-lsprotocol-2025.0.0/lib/python3.13/site-packages','/nix/store/561yxycidcaa4bk2svz82hnzng9r1yr3-python3.13-attrs-25.4.0/lib/python3.13/site-packages','/nix/store/78nfmqm0faq4dnyhka58hiwm39bx2vvg-python3.13-cattrs-25.3.0/lib/python3.13/site-packages','/nix/store/5vih2qy07qkq2sm37i3jdndxlafwb2l2-python3.13-pygls-2.0.0/lib/python3.13/site-packages'], site._init_pathinfo());
import platform
import sys

if sys.platform != "win32":
    import readline

original_ps1 = ">>> "
is_wsl = "microsoft-standard-WSL" in platform.release()


class REPLHooks:
    def __init__(self):
        self.global_exit = None
        self.failure_flag = False
        self.original_excepthook = sys.excepthook
        self.original_displayhook = sys.displayhook
        sys.excepthook = self.my_excepthook
        sys.displayhook = self.my_displayhook

    def my_displayhook(self, value):
        if value is None:
            self.failure_flag = False

        self.original_displayhook(value)

    def my_excepthook(self, type_, value, traceback):
        self.global_exit = value
        self.failure_flag = True

        self.original_excepthook(type_, value, traceback)


def get_last_command():
    # Get the last history item
    last_command = ""
    if sys.platform != "win32":
        last_command = readline.get_history_item(readline.get_current_history_length())

    return last_command


class PS1:
    hooks = REPLHooks()
    sys.excepthook = hooks.my_excepthook
    sys.displayhook = hooks.my_displayhook

    # str will get called for every prompt with exit code to show success/failure
    def __str__(self):
        exit_code = int(bool(self.hooks.failure_flag))
        self.hooks.failure_flag = False
        # Guide following official VS Code doc for shell integration sequence:
        result = ""
        # For non-windows allow recent_command history.
        if sys.platform != "win32":
            result = "{command_executed}{command_line}{command_finished}{prompt_started}{prompt}{command_start}".format(
                command_executed="\x1b]633;C\x07",
                command_line="\x1b]633;E;" + str(get_last_command()) + "\x07",
                command_finished="\x1b]633;D;" + str(exit_code) + "\x07",
                prompt_started="\x1b]633;A\x07",
                prompt=original_ps1,
                command_start="\x1b]633;B\x07",
            )
        else:
            result = "{command_finished}{prompt_started}{prompt}{command_start}{command_executed}".format(
                command_finished="\x1b]633;D;" + str(exit_code) + "\x07",
                prompt_started="\x1b]633;A\x07",
                prompt=original_ps1,
                command_start="\x1b]633;B\x07",
                command_executed="\x1b]633;C\x07",
            )

        # result = f"{chr(27)}]633;D;{exit_code}{chr(7)}{chr(27)}]633;A{chr(7)}{original_ps1}{chr(27)}]633;B{chr(7)}{chr(27)}]633;C{chr(7)}"

        return result


if sys.platform != "win32" and (not is_wsl):
    sys.ps1 = PS1()

if sys.platform == "darwin":
    print("Cmd click to launch VS Code Native REPL")
else:
    print("Ctrl click to launch VS Code Native REPL")
