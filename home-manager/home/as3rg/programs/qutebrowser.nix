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
        "Матлог -- GH" = "https://github.com/shd/logic2023/tree/main";
        "Матлог -- ДЗ" = "https://github.com/shd/logic2023a";
        "Матлог -- Таблица" = "https://docs.google.com/spreadsheets/d/1eEa_FCtvZwIchcKUJyCb8E9_u2XLRtGPc9sKbf7YoS0/edit#gid=0";
        "ДМ -- Страница Курса" = "http://neerc.ifmo.ru/teaching/dm2/2023-2024/";
        "ДМ -- Таблица ДЗ" = "https://docs.google.com/spreadsheets/d/1ctOiIdPdyowYB6HW_dzlig6-5pihQXS5LAfq9wf_pQo/edit?usp=sharing";
        "ДМ -- ДЗ" = "http://neerc.ifmo.ru/wiki/index.php?title=%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B9_%D0%BF%D0%BE_%D0%94%D0%9C_2%D0%BA_2023_%D0%BE%D1%81%D0%B5%D0%BD%D1%8C";
        "ДифУры -- Тесты" = "https://mvbabushkin.xyz/course/view.php?id=61";
        "ДифУры -- Таблица" = "https://docs.google.com/spreadsheets/d/e/2PACX-1vTz5tMsJAyXM4QhnLUE4UqxDIgIBu4odKx59LYE6aRV2_I8ebA1qNhq7JL7u6eWWityjp_IA2ao9HvK/pubhtml";
        "Матан -- Таблица" = "https://docs.google.com/spreadsheets/d/1tFx2HNKzBCyfDXXEv-lsnT4Dl9RUn4nxbrpPToL_IZw/edit#gid=81001944";
        "CPP -- Информация" = "https://cpp-kt.github.io/course/";
        "CPP -- Twitch" = "https://www.twitch.tv/sorokin_ivan";
        "CPP -- Таблица" = "https://docs.google.com/spreadsheets/d/1wsmQrGDhR3F9Em7bBEzq1D6LKWXDwKyHaEOj_6yt10Q/edit#gid=0";
        "CPP -- Формочка" = "https://forms.gle/qjcZfXPMjdBzEWED7";
        "АиСД -- Лекции" = "https://www.youtube.com/playlist?list=PLrS21S1jm43haXE1MX_d3INRWPJs_pmvf";
        "АиСД -- ДЗ" = "https://nerc.itmo.ru/teaching/algo/year2022/tasks_sem3_38-39.pdf";
        "АиСД -- Таблица" = "https://docs.google.com/spreadsheets/d/1hTtuMnpUixMLnMBcKFk72M7vW4uQopHIz5OlELNuFvk/edit?usp=sharing";
        "Англ -- Таблица" = "https://docs.google.com/spreadsheets/d/1mZs16RJ9QDWSks0Ya1FLDTPdT1fERPgqou8tOBWHvME/edit?usp=share_link";
        "OS -- Лекции" = "https://www.youtube.com/playlist?list=PLd7QXkfmSY7YDTNm2XwH12y4UKxPpVwZH";
        "OS -- Таблица" = "https://docs.google.com/spreadsheets/d/1qmtpEDTlYyYaZ_atwmjqZVhTRsWbAVVYLIS-ovje1wo/edit#gid=0";
        "Шикимори" = "https://shikimori.me/";
        "Google Календарь" = "https://calendar.google.com/calendar/u/0/r/month?pli=1";
    };
    searchEngines = {
        DEFAULT = "https://yandex.ru/search/?text={}";
        y = "https://yandex.ru/search/?text={}";
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
