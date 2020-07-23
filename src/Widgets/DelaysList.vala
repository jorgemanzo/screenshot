/*
 * Copyright (c) 2011-2018 elementary LLC. (https://elementary.io)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

namespace Screenshot.Widgets {
    public class DelaysList : Gtk.Menu {
        public signal void delay_changed (int delay);

        public DelaysList () {}

        construct {
            var now_sec = get_timer_button (0);
            var three_sec = get_timer_button (3);
            var five_sec = get_timer_button (5);
            var ten_sec = get_timer_button (10);

            this.append (now_sec);
            this.append (three_sec);
            this.append (five_sec);
            this.append (ten_sec);
            this.show_all ();
        }

        private Gtk.MenuItem get_timer_button (int delay) {
            var button = new Gtk.MenuItem ();

            if (delay == 0) {
                button.label = _("Now");
            } else {
                button.label = _("in %ds").printf (delay);
            }

            button.select.connect (() => {
                delay_changed (delay);
            });

            return button;
        }
    }
}
