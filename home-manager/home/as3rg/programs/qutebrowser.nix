{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.qutebrowser = {
    enable = true;
    quickmarks = {
        "Результаты 3x38-3x39" = "https://docs.google.com/spreadsheets/d/1ht_ZLkAVHkELmb4hR6bwF8SuBUrAIt1GLFWmM90WBuk/edit#gid=0";
        "Матлог -- Twitch" = "https://www.twitch.tv/dshtuk";
        "Матлог -- ДЗ" = "https://github.com/shd/logic2023a";
        "Матлог -- GH" = "https://github.com/shd/logic2023/tree/main";
        # "ДМ -- таблица" = "https://docs.google.com/spreadsheets/d/1scXpy1WPRlcRzxwMFmx2ER7YRWhGyUSTmYaRmKECfQI/edit";
        # "ДМ -- ДЗ" = "http://neerc.ifmo.ru/wiki/index.php?title=%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B9_%D0%BF%D0%BE_%D0%94%D0%9C_2023_%D0%B2%D0%B5%D1%81%D0%BD%D0%B0";
        # "ДМ -- ДЗ (таблица)" = "https://docs.google.com/spreadsheets/d/1jKysJmYm80GMXM6O5fZn6Lx5PZgAASvfXX5ZbgK-wdQ/edit#gid=0";
        # "ДМ -- страница курса" = "http://neerc.ifmo.ru/teaching/dm1/2022-2023/";
        # "ДМ -- лабы" = "https://pcms.itmo.ru/pcms2client/party/contests.xhtml";
        # "ДМ -- Тесты" = "https://nerc.itmo.ru/moo/my/";
        # "Матан -- Таблица" = "https://docs.google.com/spreadsheets/d/1tFx2HNKzBCyfDXXEv-lsnT4Dl9RUn4nxbrpPToL_IZw/edit#gid=985492731";
        "CPP -- Информация" = "https://cpp-kt.github.io/course/";
        "CPP -- Twitch" = "https://www.twitch.tv/sorokin_ivan";
        "Шикимори" = "https://shikimori.me/";
        "Google Календарь" = "https://calendar.google.com/calendar/u/0/r/month?pli=1";
    };
    searchEngines = {
        DEFAULT = "https://yandex.ru/search/?text={}";
        ddg = "https://duckduckgo.com/?q={}";
        bg = "https://www.bing.com/search?q={}";
        g = "https://www.google.ru/search?q={}";
        yt = "https://www.youtube.com/results?search_query={}";
        w = "https://ru.wikipedia.org/w/index.php?search={}";
        rt = "https://rutracker.org/forum/tracker.php?nm={}";
        nx = "https://search.nixos.org/packages?query={}";
        gh = "https://github.com/search?q={}&type=Code";
    };
  };
}
