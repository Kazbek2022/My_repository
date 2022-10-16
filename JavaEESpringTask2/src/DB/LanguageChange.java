package DB;

import java.util.HashMap;

public class LanguageChange {
    private static HashMap<Integer, HashMap<String,String>> labels = new HashMap<>();
    static {
        HashMap<String,String> rusLabels = new HashMap<>();
        rusLabels.put("navbar_text", "МИРОВЫЕ НОВОСТИ");
        rusLabels.put("navbar_sign", "Вход");
        rusLabels.put("navbar_signOut", "Выход");
        rusLabels.put("navbar_allnews", "ВСЕ НОВОСТИ");
        rusLabels.put("body_text1", "Все Мировые Новости");
        rusLabels.put("body_text2", "Вы можете следить за всеми новостями на двух языках");
        rusLabels.put("copyright", "Авторские права");
        rusLabels.put("mail", "Адрес электронной почты");
        rusLabels.put("password", "Пароль");
        rusLabels.put("button", "Отправить");
        rusLabels.put("login_error", "Введите правильный почтовый адрес и пароль");
        rusLabels.put("adminPanel", "АДМИН ПАНЕЛЬ");
        rusLabels.put("languages", "Языки");
        rusLabels.put("publications", "Паблики");
        rusLabels.put("news", "Новости");
        rusLabels.put("return", "на главную страницу");

        HashMap<String,String> engLabels = new HashMap<>();
        engLabels.put("navbar_text", "WORLD NEWS PORTAL");
        engLabels.put("navbar_sign", "Sign Up");
        engLabels.put("navbar_signOut", "Sign out");
        engLabels.put("navbar_allnews", "ALL");
        engLabels.put("body_text1", "All World News");
        engLabels.put("body_text2", "You can read all world news in two languages");
        engLabels.put("copyright", "Copyright");
        engLabels.put("mail", "Your email address");
        engLabels.put("password", "Password");
        engLabels.put("button", "Submit");
        engLabels.put("login_error", "Enter correct email and password");
        engLabels.put("adminPanel", "ADMIN PANEL");
        engLabels.put("languages", "Languages");
        engLabels.put("publications", "Publication");
        engLabels.put("news", "News");
        engLabels.put("return", "return to homepage");

        labels.put(1,engLabels);
        labels.put(2,rusLabels);
    }

    public static String getTranslation(int language_id, String labelName) {
        return labels.get(language_id).get(labelName);
    }
}
