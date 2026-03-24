import tkinter as tk
from tkinter import messagebox, ttk
import psycopg2
import hashlib
import random
from PIL import Image, ImageTk, ImageDraw
import os

DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'milk_factory',
    'user': 'postgres',
    'password': '153264'
}


def show_frame(frame):
    frame.tkraise()


def get_user_by_login(login):
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        cur.execute(
            "SELECT id, login, password_hash, role, is_blocked, failed_attempts FROM users WHERE login = %s",
            (login,)
        )
        user = cur.fetchone()
        cur.close()
        conn.close()
        return user
    except Exception as e:
        messagebox.showerror("Ошибка БД", f"Не удалось подключиться к базе данных:\n{e}")
        return None


def update_failed_attempts(login, increment=0, reset=False):
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        if reset:
            cur.execute("UPDATE users SET failed_attempts = 0, is_blocked = FALSE WHERE login = %s", (login,))
        elif increment > 0:
            cur.execute("UPDATE users SET failed_attempts = failed_attempts + %s WHERE login = %s", (increment, login))
            cur.execute("UPDATE users SET is_blocked = TRUE WHERE login = %s AND failed_attempts >= 3", (login,))
        conn.commit()
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Ошибка обновления попыток: {e}")


def check_credentials(login, password):
    user = get_user_by_login(login)
    if user is None:
        return (False, None, False)  # пользователь не найден
    user_id, db_login, password_hash, role, is_blocked, failed_attempts = user
    if is_blocked:
        return (False, role, True)

    hashed_password = hashlib.sha256(password.encode()).hexdigest()
    if hashed_password == password_hash:
        update_failed_attempts(login, reset=True)
        return (True, role, False)
    else:
        return (False, role, False)


def create_sample_image(size=200):
    img = Image.new('RGB', (size, size), color=(240, 240, 240))
    draw = ImageDraw.Draw(img)
    draw.rectangle([0, 0, size//2, size//2], fill=(255, 100, 100))
    draw.rectangle([size//2, 0, size, size//2], fill=(100, 255, 100))
    draw.rectangle([0, size//2, size//2, size], fill=(100, 100, 255))
    draw.rectangle([size//2, size//2, size, size], fill=(255, 255, 100))
    draw.line((size//2, 0, size//2, size), fill='black', width=2)
    draw.line((0, size//2, size, size//2), fill='black', width=2)
    draw.text((size//4-20, size//4-10), "1", fill='black')
    draw.text((3*size//4-20, size//4-10), "2", fill='black')
    draw.text((size//4-20, 3*size//4-10), "3", fill='black')
    draw.text((3*size//4-20, 3*size//4-10), "4", fill='black')
    return img


class CaptchaPuzzle:
    def __init__(self, parent, on_success_callback):
        self.parent = parent
        self.on_success = on_success_callback
        self.tile_size = 100
        self.grid_size = 2
        self.correct_order = list(range(4))
        self.current_order = self.correct_order.copy()
        self.selected = None

        image_path = "Bird.png"
        if os.path.exists(image_path):
            self.full_image = Image.open(image_path).resize((200, 200))
        else:
            self.full_image = create_sample_image(200)

        self.tiles = []
        w, h = self.full_image.size
        step_w = w // self.grid_size
        step_h = h // self.grid_size
        for i in range(self.grid_size):
            for j in range(self.grid_size):
                left = j * step_w
                top = i * step_h
                right = left + step_w
                bottom = top + step_h
                tile = self.full_image.crop((left, top, right, bottom))
                self.tiles.append(tile)

        self.frame = ttk.LabelFrame(parent, text="Соберите пазл", padding=10)
        self.frame.pack(pady=10)

        self.grid_frame = ttk.Frame(self.frame)
        self.grid_frame.pack()

        self.labels = [[None for _ in range(self.grid_size)] for _ in range(self.grid_size)]
        self.photo_images = []

        self.shuffle()
        self.draw_grid()

        self.shuffle_btn = ttk.Button(self.frame, text="Перемешать", command=self.shuffle)
        self.shuffle_btn.pack(pady=5)

    def shuffle(self):
        random.shuffle(self.current_order)
        self.selected = None
        self.draw_grid()
        self.check_win()

    def draw_grid(self):
        for i in range(self.grid_size):
            for j in range(self.grid_size):
                idx = i * self.grid_size + j
                tile_idx = self.current_order[idx]
                photo = ImageTk.PhotoImage(self.tiles[tile_idx])
                self.photo_images.append(photo)

                if self.labels[i][j] is None:
                    label = ttk.Label(self.grid_frame, image=photo, borderwidth=2, relief="ridge")
                    label.grid(row=i, column=j, padx=2, pady=2)
                    label.bind("<Button-1>", lambda e, r=i, c=j: self.on_tile_click(r, c))
                    self.labels[i][j] = label
                else:
                    self.labels[i][j].config(image=photo)

    def on_tile_click(self, row, col):
        clicked_idx = row * self.grid_size + col
        if self.selected is None:
            self.selected = clicked_idx
            self.labels[row][col].config(relief="sunken")
        else:
            self.swap_tiles(self.selected, clicked_idx)
            self.selected = None
            self.draw_grid()
            self.check_win()

    def swap_tiles(self, idx1, idx2):
        self.current_order[idx1], self.current_order[idx2] = self.current_order[idx2], self.current_order[idx1]

    def check_win(self):
        if self.current_order == self.correct_order:
            self.on_success(True)
            return True
        else:
            self.on_success(False)
            return False


def user_exists(login):
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        cur.execute("SELECT id FROM users WHERE login = %s", (login,))
        exists = cur.fetchone() is not None
        cur.close()
        conn.close()
        return exists
    except Exception as e:
        messagebox.showerror("Ошибка", f"Не удалось проверить существование пользователя:\n{e}")
        return False


def add_user(login, password, role):
    if user_exists(login):
        messagebox.showerror("Ошибка", f"Пользователь с логином '{login}' уже существует!")
        return False

    hashed = hashlib.sha256(password.encode()).hexdigest()
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO users (login, password_hash, role, is_blocked, failed_attempts) VALUES (%s, %s, %s, %s, %s)",
            (login, hashed, role, False, 0)
        )
        conn.commit()
        cur.close()
        conn.close()
        return True
    except Exception as e:
        messagebox.showerror("Ошибка", f"Не удалось добавить пользователя:\n{e}")
        return False

def get_all_users():
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        cur.execute("SELECT id, login, role, is_blocked FROM users ORDER BY id")
        users = cur.fetchall()
        cur.close()
        conn.close()
        return users
    except Exception as e:
        messagebox.showerror("Ошибка", f"Не удалось загрузить пользователей:\n{e}")
        return []


def update_user(user_id, new_password=None, new_role=None, unblock=False):

    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        if new_password:
            hashed = hashlib.sha256(new_password.encode()).hexdigest()
            cur.execute("UPDATE users SET password_hash = %s WHERE id = %s", (hashed, user_id))
        if new_role:
            cur.execute("UPDATE users SET role = %s WHERE id = %s", (new_role, user_id))
        if unblock:
            cur.execute("UPDATE users SET is_blocked = FALSE, failed_attempts = 0 WHERE id = %s", (user_id,))
        conn.commit()
        cur.close()
        conn.close()
        return True
    except Exception as e:
        messagebox.showerror("Ошибка", f"Не удалось обновить пользователя:\n{e}")
        return False


def unblock_user(user_id):

    return update_user(user_id, unblock=True)


def delete_user(user_id):

    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        cur.execute("DELETE FROM users WHERE id = %s", (user_id,))
        conn.commit()
        cur.close()
        conn.close()
        return True
    except Exception as e:
        messagebox.showerror("Ошибка", f"Не удалось удалить пользователя:\n{e}")
        return False


def show_main_window(role):

    for widget in SecondWindow.winfo_children():
        widget.destroy()

    if role == 'admin':

        ttk.Label(SecondWindow, text="Панель администратора", font=("Arial", 14)).pack(pady=10)

        ttk.Button(SecondWindow, text="Добавить пользователя", command=open_add_user_dialog).pack(pady=5)

        columns = ("ID", "Логин", "Роль", "Заблокирован")
        tree = ttk.Treeview(SecondWindow, columns=columns, show="headings", height=15)
        for col in columns:
            tree.heading(col, text=col)
            tree.column(col, width=100)

        tree.pack(pady=10, fill=tk.BOTH, expand=True)

        action_frame = ttk.Frame(SecondWindow)
        action_frame.pack(pady=5)

        def refresh_users():
            for row in tree.get_children():
                tree.delete(row)
            for user in get_all_users():
                user_id, login, role, is_blocked = user
                blocked_str = "Да" if is_blocked else "Нет"
                tree.insert("", tk.END, values=(user_id, login, role, blocked_str))

        def edit_selected():
            selected = tree.selection()
            if not selected:
                messagebox.showwarning("Внимание", "Выберите пользователя")
                return
            values = tree.item(selected[0], "values")
            user_id = values[0]
            open_edit_user_dialog(user_id, refresh_users)

        def unblock_selected():
            selected = tree.selection()
            if not selected:
                messagebox.showwarning("Внимание", "Выберите пользователя")
                return
            values = tree.item(selected[0], "values")
            user_id = values[0]
            if unblock_user(user_id):
                messagebox.showinfo("Успех", "Блокировка снята")
                refresh_users()
            else:
                messagebox.showerror("Ошибка", "Не удалось снять блокировку")

        def delete_selected():
            selected = tree.selection()
            if not selected:
                messagebox.showwarning("Внимание", "Выберите пользователя")
                return
            values = tree.item(selected[0], "values")
            user_id = values[0]
            if messagebox.askyesno("Подтверждение", "Удалить пользователя?"):
                if delete_user(user_id):
                    refresh_users()
                    messagebox.showinfo("Успех", "Пользователь удалён")

        ttk.Button(action_frame, text="Редактировать", command=edit_selected).pack(side=tk.LEFT, padx=5)
        ttk.Button(action_frame, text="Снять блокировку", command=unblock_selected).pack(side=tk.LEFT, padx=5)
        ttk.Button(action_frame, text="Удалить", command=delete_selected).pack(side=tk.LEFT, padx=5)
        ttk.Button(action_frame, text="Обновить", command=refresh_users).pack(side=tk.LEFT, padx=5)

        refresh_users()
    else:
        # Обычный пользователь
        ttk.Label(SecondWindow, text="Вы успешно вошли!", font=("Arial", 14)).pack(pady=20)
        ttk.Label(SecondWindow, text="Добро пожаловать в систему").pack()


def open_add_user_dialog():

    dialog = tk.Toplevel(root)
    dialog.title("Добавить пользователя")
    dialog.geometry("300x250")
    dialog.grab_set()

    ttk.Label(dialog, text="Логин:").pack(pady=5)
    login_entry = ttk.Entry(dialog)
    login_entry.pack()

    ttk.Label(dialog, text="Пароль:").pack(pady=5)
    password_entry = ttk.Entry(dialog, show="*")
    password_entry.pack()

    ttk.Label(dialog, text="Роль:").pack(pady=5)
    role_combo = ttk.Combobox(dialog, values=["user", "admin"], state="readonly")
    role_combo.set("user")
    role_combo.pack()

    def do_add():
        login = login_entry.get().strip()
        password = password_entry.get()
        role = role_combo.get()
        if not login or not password:
            messagebox.showwarning("Ошибка", "Заполните все поля")
            return
        if add_user(login, password, role):
            messagebox.showinfo("Успех", "Пользователь добавлен")
            dialog.destroy()
        else:
            messagebox.showerror("Ошибка", "Не удалось добавить пользователя")

    ttk.Button(dialog, text="Добавить", command=do_add).pack(pady=20)


def open_edit_user_dialog(user_id, refresh_callback):
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cur = conn.cursor()
        cur.execute("SELECT login, role, is_blocked FROM users WHERE id = %s", (user_id,))
        login, role, is_blocked = cur.fetchone()
        cur.close()
        conn.close()
    except Exception as e:
        messagebox.showerror("Ошибка", f"Не удалось загрузить данные: {e}")
        return

    dialog = tk.Toplevel(root)
    dialog.title("Редактировать пользователя")
    dialog.geometry("300x300")
    dialog.grab_set()

    ttk.Label(dialog, text=f"Логин: {login}").pack(pady=5)

    ttk.Label(dialog, text="Новый пароль (оставьте пустым, чтобы не менять):").pack(pady=5)
    password_entry = ttk.Entry(dialog, show="*")
    password_entry.pack()

    ttk.Label(dialog, text="Роль:").pack(pady=5)
    role_combo = ttk.Combobox(dialog, values=["user", "admin"], state="readonly")
    role_combo.set(role)
    role_combo.pack()

    unblock_var = tk.BooleanVar(value=is_blocked)
    ttk.Checkbutton(dialog, text="Снять блокировку", variable=unblock_var).pack(pady=5)

    def do_update():
        new_password = password_entry.get() if password_entry.get() else None
        new_role = role_combo.get()
        unblock = unblock_var.get()
        if update_user(user_id, new_password, new_role, unblock):
            messagebox.showinfo("Успех", "Данные обновлены")
            refresh_callback()
            dialog.destroy()
        else:
            messagebox.showerror("Ошибка", "Не удалось обновить данные")

    ttk.Button(dialog, text="Сохранить", command=do_update).pack(pady=20)


def Connection():
    login = LoginEntry.get().strip()
    password = PasswordEntry.get()

    if not login or not password:
        messagebox.showwarning("Ошибка", "Введите логин и пароль")
        return

    user = get_user_by_login(login)
    if user is None:
        messagebox.showerror("Ошибка", "Вы ввели неверный логин или пароль. Пожалуйста проверьте ещё раз введенные данные")
        return

    user_id, db_login, password_hash, role, is_blocked, failed_attempts = user
    if is_blocked:
        messagebox.showerror("Блокировка", "Вы заблокированы. Обратитесь к администратору")
        return

    if not captcha_passed.get():
        update_failed_attempts(login, increment=1)
        user_after = get_user_by_login(login)
        if user_after and user_after[4]:  # is_blocked
            messagebox.showerror("Блокировка", "Вы заблокированы. Обратитесь к администратору")
        else:
            messagebox.showerror("Ошибка", "Пазл собран неверно. Попробуйте ещё раз.")
        return

    success, role, blocked = check_credentials(login, password)
    if blocked:
        messagebox.showerror("Блокировка", "Вы заблокированы. Обратитесь к администратору")
    elif success:

        messagebox.showinfo("Успешно", "Вы успешно авторизовались")
        show_main_window(role)
        show_frame(SecondWindow)
    else:
        update_failed_attempts(login, increment=1)
        user_after = get_user_by_login(login)
        if user_after and user_after[4]:  # is_blocked
            messagebox.showerror("Блокировка", "Вы заблокированы. Обратитесь к администратору")
        else:
            messagebox.showerror("Ошибка", "Вы ввели неверный логин или пароль. Пожалуйста проверьте ещё раз введенные данные")


def on_captcha_success(success):
    captcha_passed.set(success)

root = tk.Tk()
root.title("Авторизация")
root.geometry("500x650+500+200")
root.resizable(False, False)

root.grid_rowconfigure(0, weight=1)
root.grid_columnconfigure(0, weight=1)

AuthWindow = ttk.Frame(root)
SecondWindow = ttk.Frame(root)

for frame in (AuthWindow, SecondWindow):
    frame.grid(row=0, column=0, sticky='nsew')

ttk.Label(AuthWindow, text="Добро пожаловать", font=("Arial", 14)).pack(pady=10)

ttk.Label(AuthWindow, text="Логин:").pack(pady=(10,0))
LoginEntry = ttk.Entry(AuthWindow)
LoginEntry.pack(pady=5)

ttk.Label(AuthWindow, text="Пароль:").pack(pady=(10,0))
PasswordEntry = ttk.Entry(AuthWindow, show="*")
PasswordEntry.pack(pady=5)

ConnectingBtn = ttk.Button(AuthWindow, text="Подключиться", command=Connection)
ConnectingBtn.pack(pady=10)

captcha_passed = tk.BooleanVar(value=False)
puzzle = CaptchaPuzzle(AuthWindow, on_captcha_success)

show_frame(AuthWindow)
root.mainloop()