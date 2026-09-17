Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F1C4E322C
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661875; cv=none; b=B+9cctef1lWw4wKMmTpEOgrFncFfXe5VhqYcjyCxQe0OomRlKghWFFqN91DsPvKLQlyDWoenhhs+HTCRBE9fdamOwDUan1CnK3kvZgIXedz0VulpfmA45Fysw8pauvBkOqC954jK3YxhYog51qs3A9KYSpO/tky/xY6alayGNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661875; c=relaxed/simple;
	bh=QhHH/0BPTkaxtJ8pRI3U8oETQz3niKHrZnciYVcAzds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=staqczRV1gLJ34iNDl14H0+495km/8oBAm8e3MM9fpk6zmY24r2+kkeMsbUUYTs/+uZgZq9eYBmpLHXev/6TnINNyQL773jCikQa+tZfcT8SIMD7u59i9jhitEGglsi+Fnr0rST3mUqyVMCGINI4FUX7OaWUMA7Fukla9IUyk/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XEOq1cQJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XEOq1cQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789661870;
	bh=QhHH/0BPTkaxtJ8pRI3U8oETQz3niKHrZnciYVcAzds=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=XEOq1cQJNFvplt4CwX90aarMsRzFUJfWRlVIk6P98FXaCcx7ZJeO5XUxy0/LftRbk
	 q3PqoRd+OhCbNe2C0O24M0NzlH6delmVEhPbYKXjR7YT3Rm35Nc3NUd2rxcRLergmF
	 IQLWBE/FlfKbP2qt88oLnjn9OuRAEq0YXxWeEQuVt3p2NUBxBFd1WrlED+i8rdWDmQ
	 hwLQI92t8dnhZeCEZZ3ac1kfxQ0gvHNO12so5MmFFCEfaBCJXn98P0j+FqFGB8zb4I
	 pr/gc0wASWiqA6d2GRjc5f9muzYBEX1ANp7vWaBI9lNRgxVW/y32ZcZ6NXw/z8aGgU
	 YA6Dy0/IYchQg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D20F17E087F;
	Thu, 17 Sep 2026 18:17:49 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 17 Sep 2026 12:17:46 -0400
Subject: [PATCH RFC v4l-utils v2 1/3] v4l-util: Add the v4l2top utility
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-add-v4l2top-v2-1-80970c6210c5@collabora.com>
References: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
In-Reply-To: <20260917-add-v4l2top-v2-0-80970c6210c5@collabora.com>
To: linux-media@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.17-dev-4066f

v4l2top is a top-like tool used to show v4l2 mem2mem device usage
statistics.
In this version, it uses the v4l2 fdinfo file to retrieve usage time
information, as well as the driver name to identify the hardware.

It is written in Rust, but will still be built with meson, using a cargo
wrapper script.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 utils/meson.build                 |   2 +
 utils/v4l2top/.gitignore          |   2 +
 utils/v4l2top/Cargo.toml          |  13 +
 utils/v4l2top/README.md           |  43 +++
 utils/v4l2top/src/main.rs         |  51 ++++
 utils/v4l2top/src/renderers.rs    | 593 ++++++++++++++++++++++++++++++++++++++
 utils/v4l2top/src/v4l2_mem.rs     |  56 ++++
 utils/v4l2top/src/v4l2_metrics.rs | 148 ++++++++++
 8 files changed, 908 insertions(+)

diff --git a/utils/meson.build b/utils/meson.build
index 77c2013e..7e60ef3e 100644
--- a/utils/meson.build
+++ b/utils/meson.build
@@ -38,6 +38,8 @@ subdir('v4l2-ctl')
 subdir('v4l2-dbg')
 subdir('v4l2-sysfs-path')
 subdir('v4l2-tracer')
+# FIXME: Should it be renamed to v4l2-top ? Follows the utils naming but not the other top-like utils...
+subdir('v4l2top')
 
 # Compliance tools
 subdir('cec-compliance')
diff --git a/utils/v4l2top/.gitignore b/utils/v4l2top/.gitignore
new file mode 100644
index 00000000..96ef6c0b
--- /dev/null
+++ b/utils/v4l2top/.gitignore
@@ -0,0 +1,2 @@
+/target
+Cargo.lock
diff --git a/utils/v4l2top/Cargo.toml b/utils/v4l2top/Cargo.toml
new file mode 100644
index 00000000..f19518ca
--- /dev/null
+++ b/utils/v4l2top/Cargo.toml
@@ -0,0 +1,13 @@
+[package]
+name = "v4l2top"
+version = "0.1.0"
+edition = "2024"
+license = "MIT or GPL-2.0"
+
+[dependencies]
+ratatui = "0.30.0"
+anyhow = "1.0.68"
+crossterm = "0.29.0"
+chrono = "0.4.44"
+regex = "1.12.3"
+cli-log = "2.1.0"
diff --git a/utils/v4l2top/README.md b/utils/v4l2top/README.md
new file mode 100644
index 00000000..c943f168
--- /dev/null
+++ b/utils/v4l2top/README.md
@@ -0,0 +1,43 @@
+# v4l2top
+
+An `htop`-like utility to show v4l2 mem2mem hardware and memory usage.
+
+## Dependency
+
+Linux needs to be patched to be able to retrieve data from the driver.
+A work in progress branch can be found [here](https://gitlab.collabora.com/detlev/linux/-/tree/rkvdec/list-hantro-buffers).
+It only supports the rkvdec driver, and only h264 on RK3588 for buffer details.
+
+## Installation
+
+The crate is not published yet, use the git url to install locally with cargo:
+```bash
+cargo install https://github.com/cazou/v4l2top.git
+```
+
+### Cross compiling
+
+To build an arm64 binary, install an arm64 Rust toolchain with rustup:
+```bash
+rustup target add aarch64-unknown-linux-gnu
+```
+
+And that you have an arm64 linker.
+Debian:
+```bash
+apt install gcc-aarch64-linux-gnu
+```
+Arch Linux:
+```bash
+pacman -S aarch64-linux-gnu-gcc
+```
+
+Other linkers can be used, but adapt the `.cargo/config.toml` file.
+
+Then you can cross compile for arm64 with:
+```bash
+cargo build --target aarch64-unknown-linux-gnu
+```
+
+Add `--release` for a smaller binary.
+You can retrieve it in `target/aarch64-unknown-linux-gnu/[release|debug]/v4l2top`
diff --git a/utils/v4l2top/src/main.rs b/utils/v4l2top/src/main.rs
new file mode 100644
index 00000000..30e21176
--- /dev/null
+++ b/utils/v4l2top/src/main.rs
@@ -0,0 +1,51 @@
+mod renderers;
+mod v4l2_mem;
+mod v4l2_metrics;
+
+use std::time::Duration;
+
+use anyhow::Result;
+use crossterm::event::KeyModifiers;
+use ratatui::DefaultTerminal;
+
+#[warn(unused_imports)]
+use cli_log::*;
+
+use renderers::TopRenderer;
+
+fn main() -> Result<()> {
+    cli_log::init_cli_log!();
+    ratatui::run(app)?;
+    Ok(())
+}
+
+fn app(terminal: &mut DefaultTerminal) -> Result<()> {
+    let mut renderer = TopRenderer::new();
+
+    terminal.draw(|frame| renderer.render(frame))?;
+
+    loop {
+        if crossterm::event::poll(Duration::from_millis(100))?
+            && let Some(event) = crossterm::event::read()?.as_key_press_event()
+        {
+            match event.code {
+                crossterm::event::KeyCode::Char('q') => break Ok(()),
+                crossterm::event::KeyCode::Char('c') => {
+                    if event.modifiers.contains(KeyModifiers::CONTROL) {
+                        break Ok(());
+                    }
+                }
+                crossterm::event::KeyCode::F(2) => {
+                    renderer.show_bytes_flip();
+                }
+                crossterm::event::KeyCode::F(3) => {
+                    renderer.full_cmd_flip();
+                }
+                crossterm::event::KeyCode::Up => renderer.select_previous(),
+                crossterm::event::KeyCode::Down => renderer.select_next(),
+                _ => {}
+            }
+        }
+        terminal.draw(|frame| renderer.render(frame))?;
+    }
+}
diff --git a/utils/v4l2top/src/renderers.rs b/utils/v4l2top/src/renderers.rs
new file mode 100644
index 00000000..d70813d5
--- /dev/null
+++ b/utils/v4l2top/src/renderers.rs
@@ -0,0 +1,593 @@
+use std::{
+    collections::{BTreeMap, HashMap, VecDeque},
+    time::Instant,
+};
+
+use anyhow::{Result, bail};
+use ratatui::{
+    Frame,
+    layout::{Constraint, Direction, Layout},
+    style::{Color, Style, Stylize},
+    text::Line,
+    widgets::{
+        Block, Cell, LineGauge, Row, Table,
+        TableState,
+    },
+};
+
+#[warn(unused_imports)]
+use cli_log::*;
+
+use crate::v4l2_mem::{DMABuffer, v4l2_mem_get_usage};
+use crate::v4l2_metrics::{V4L2Stream, V4l2FdInfo, find_all_v4l2_fdinfo};
+
+const NUM_BARS: usize = 12;
+const BAR_COLS: usize = 2;
+const BAR_ROWS: usize = NUM_BARS / BAR_COLS;
+
+/// Compact byte formatting
+pub fn format_bytes(bytes: u64, show_bytes: bool) -> String {
+    if show_bytes {
+        return format!("{}B", bytes);
+    }
+
+    const KB: f64 = 1024.0;
+    const MB: f64 = KB * 1024.0;
+    const GB: f64 = MB * 1024.0;
+
+    let b = bytes as f64;
+    if b >= GB {
+        format!("{:.1}G", b / GB)
+    } else if b >= MB {
+        format!("{:.1}M", b / MB)
+    } else if b >= KB {
+        format!("{:.0}K", b / KB)
+    } else {
+        format!("{b}B")
+    }
+}
+
+/// Compact frequency formatting
+pub fn format_freq(freq: u64, show_hertz: bool) -> String {
+    if show_hertz {
+        return format!("{}Hz", freq);
+    }
+
+    const KHZ: f64 = 1024.0;
+    const MHZ: f64 = KHZ * 1024.0;
+    const GHZ: f64 = MHZ * 1024.0;
+
+    let f = freq as f64;
+    if f >= GHZ {
+        format!("{:.1}GHz", f / GHZ)
+    } else if f >= MHZ {
+        format!("{:.1}MHz", f / MHZ)
+    } else if f >= KHZ {
+        format!("{:.0}KHz", f / KHZ)
+    } else {
+        format!("{f}Hz")
+    }
+}
+
+/// Follows the hw usage of a given FD.
+#[derive(Debug, Clone)]
+struct CodecUsage {
+    last_read: Option<Instant>,
+    last_value_ns: Option<u64>,
+    current_usage: Option<u8>,
+}
+
+impl CodecUsage {
+    /// Update the usage based on the latest fdinfo.
+    fn update(&mut self, info: &V4l2FdInfo) {
+        // TODO: Check if v4l2-core-usage-cycles-<core_id> exists.
+        let value_ns = info
+            .fields
+            .get("v4l2-core-usage-time-0")
+            .unwrap_or(&"0 ns".to_string())
+            .trim_end_matches(" ns")
+            .parse::<u64>()
+            .ok();
+        if let (Some(last_read), Some(last_value_ns), Some(value_ns)) =
+            (self.last_read, self.last_value_ns, value_ns)
+        {
+            if value_ns < last_value_ns {
+                // Counter reset (e.g. due to FD reuse by the same PID): discard history.
+                self.last_read = Some(info.timestamp);
+                self.last_value_ns = Some(value_ns);
+                self.current_usage = None;
+                return;
+            }
+
+            let elapsed = last_read.elapsed().as_secs_f64();
+            if elapsed > 0.0 {
+                let usage =
+                    ((value_ns - last_value_ns) as f64 / (elapsed * 1_000_000_000.0)) * 100.0;
+                self.current_usage = Some(usage.min(100.0) as u8);
+            }
+        }
+
+        self.last_read = Some(info.timestamp);
+        self.last_value_ns = value_ns;
+    }
+}
+
+/// Tracks sticky assignment of Stream to bar slots.
+struct StreamBarRenderer {
+    assignments: [(Option<V4L2Stream>, u8); NUM_BARS],
+    slots: [Option<V4L2Stream>; NUM_BARS],
+    usage: BTreeMap<String, usize>,
+    selected: Option<V4L2Stream>,
+}
+
+impl StreamBarRenderer {
+    fn new() -> Self {
+        Self {
+            assignments: [(None, 0u8); NUM_BARS],
+            slots: [None; NUM_BARS],
+            usage: BTreeMap::new(),
+            selected: None,
+        }
+    }
+
+    #[allow(dead_code)]
+    fn total_usage(&self) -> usize {
+        self.usage.values().sum()
+    }
+
+    /// Update assignments given current mem_map. Returns ordered (slot_index, pid, usage) for
+    /// occupied slots and None for empty ones.
+    fn update(&mut self, info: &HashMap<V4L2Stream, StreamInfo>, selected: Option<V4L2Stream>) {
+        self.selected = selected;
+
+        // Remove PIDs that are no longer present.
+        for slot in self.slots.iter_mut() {
+            if let Some(stream) = *slot
+                && !info.contains_key(&stream)
+            {
+                *slot = None;
+            }
+        }
+
+        // Compute per-driver usage totals for the summary bars.
+        self.usage = BTreeMap::new();
+        for stream_info in info.values() {
+            let driver = match stream_info.v4l2_info.fields.get("media-driver") {
+                Some(d) => d,
+                None => {
+                    continue;
+                }
+            };
+            let entry = self.usage.entry(driver.clone()).or_insert(0);
+            *entry += stream_info.usage.current_usage.unwrap_or(0) as usize;
+        }
+
+        // Sort Streams by usage descending; keep only top NUM_BARS.
+        let mut ranked: Vec<(V4L2Stream, u8)> = info
+            .iter()
+            .filter_map(|(&p, b)| b.usage.current_usage.map(|pct| (p, pct)))
+            .collect();
+        ranked.sort_by_key(|a| std::cmp::Reverse(a.1));
+        ranked.truncate(NUM_BARS);
+        let top_pids: HashMap<V4L2Stream, u8> = ranked.iter().copied().collect();
+
+        // Evict Streams that fell out of the max NUM_BARS.
+        for slot in self.slots.iter_mut() {
+            if let Some(pid) = *slot
+                && !top_pids.contains_key(&pid)
+            {
+                *slot = None;
+            }
+        }
+
+        // Assign new Streams to free slots.
+        let assigned: HashMap<V4L2Stream, usize> = self
+            .slots
+            .iter()
+            .enumerate()
+            .filter_map(|(i, s)| s.map(|pid| (pid, i)))
+            .collect();
+        let mut free_slots: VecDeque<usize> =
+            (0..NUM_BARS).filter(|i| self.slots[*i].is_none()).collect();
+
+        for &(stream, _) in &ranked {
+            if !assigned.contains_key(&stream)
+                && let Some(slot_idx) = free_slots.pop_front()
+            {
+                self.slots[slot_idx] = Some(stream);
+            }
+        }
+
+        // Build result array.
+        self.assignments = [(None, 0u8); NUM_BARS];
+        for (i, slot) in self.slots.iter().enumerate() {
+            self.assignments[i] = match slot {
+                Some(stream) => (
+                    Some(*stream),
+                    info.get(stream).unwrap().usage.current_usage.unwrap_or(0),
+                ),
+                None => (None, 0),
+            };
+        }
+    }
+
+    pub fn render(&self, frame: &mut Frame, area: ratatui::layout::Rect) {
+        let row_constraints: Vec<Constraint> =
+            (0..BAR_ROWS + 1).map(|_| Constraint::Length(1)).collect();
+        let col_constraints = (0..BAR_COLS)
+            .map(|_| Constraint::Percentage(100 / BAR_COLS as u16))
+            .collect::<Vec<Constraint>>();
+
+        let rows_layout = Layout::default()
+            .direction(Direction::Vertical)
+            .constraints(row_constraints)
+            .split(Block::bordered().title("VPU Usage (per PID)").inner(area));
+        frame.render_widget(Block::bordered().title("VPU Usage (per PID)"), area);
+
+        for row in 0..BAR_ROWS {
+            let cols_layout = Layout::default()
+                .direction(Direction::Horizontal)
+                .constraints(col_constraints.clone())
+                .split(rows_layout[row]);
+
+            for col in 0..BAR_COLS {
+                let idx = row * BAR_COLS + col;
+                let (stream_opt, pct) = self.assignments[idx];
+
+                if let Some(stream) = stream_opt {
+                    let color = match pct {
+                        0..=50 => Color::Green,
+                        51..=80 => Color::Yellow,
+                        _ => Color::Red,
+                    };
+                    let style = if let Some(selected_stream) = self.selected {
+                        if stream == selected_stream {
+                            Style::default().bold()
+                        } else {
+                            Style::default()
+                        }
+                    } else {
+                        Style::default()
+                    };
+                    frame.render_widget(
+                        LineGauge::default()
+                            .label(format!("{:>9}({:>6}): {pct:>3}%", stream.pid, stream.fd))
+                            .ratio(pct as f64 / 100.0)
+                            .filled_symbol("|")
+                            .filled_style(color)
+                            .style(style),
+                        cols_layout[col],
+                    );
+                }
+            }
+        }
+
+        let total_usages_constraints: Vec<Constraint> = (0..self.usage.len())
+            .map(|_| Constraint::Percentage(100 / self.usage.len() as u16))
+            .collect();
+        let total_usages_layout = Layout::default()
+            .spacing(2)
+            .direction(Direction::Horizontal)
+            .constraints(total_usages_constraints)
+            .split(rows_layout[BAR_ROWS]);
+
+        for (layout, (driver, usage)) in self.usage.iter().enumerate() {
+            let color = match usage {
+                0..=50 => Color::Green,
+                51..=80 => Color::Yellow,
+                _ => Color::Red,
+            };
+
+            frame.render_widget(
+                LineGauge::default()
+                    .label(format!("{driver}: {usage:>3}%"))
+                    .ratio(*usage as f64 / 100.0)
+                    .filled_symbol("|")
+                    .filled_style(Style::default().fg(color)),
+                total_usages_layout[layout],
+            );
+        }
+    }
+}
+
+/// Renders the main table of V4L2 streams and their usage.
+struct StreamTableRenderer {
+    table_state: TableState,
+    show_bytes: bool,
+    full_cmd: bool,
+    keys: Vec<V4L2Stream>,
+}
+
+impl StreamTableRenderer {
+    fn new() -> Self {
+        Self {
+            table_state: TableState::default().with_selected(0),
+            show_bytes: false,
+            full_cmd: false,
+            keys: vec![],
+        }
+    }
+
+    fn render(
+        &mut self,
+        frame: &mut Frame,
+        area: ratatui::layout::Rect,
+        infos: &HashMap<V4L2Stream, StreamInfo>,
+    ) {
+        let columns = [
+            "Driver",
+            "PID",
+            "FD",
+            "Clock rate",
+            "Total Memory",
+            "Command",
+        ];
+        let mut widths = (0..columns.len() - 1)
+            .map(|_| Constraint::Percentage(60 / (columns.len() - 1) as u16))
+            .collect::<Vec<Constraint>>();
+        widths.push(Constraint::Percentage(40));
+
+        let header = Row::new(columns)
+            .style(Style::new().bold())
+            .bottom_margin(1);
+
+        self.keys = infos.keys().copied().collect::<Vec<V4L2Stream>>();
+        self.keys
+            .sort_by(|a, b| a.pid.cmp(&b.pid).then(a.fd.cmp(&b.fd)));
+
+        let rows = self
+            .keys
+            .iter()
+            .map(|stream| {
+                let info = infos.get(stream).unwrap();
+                Row::new([
+                    Cell::from(
+                        info.v4l2_info
+                            .fields
+                            .get("v4l2-driver")
+                            .unwrap_or(&"unknown".to_string())
+                            .to_string(),
+                    ),
+                    Cell::from(stream.pid.to_string()),
+                    Cell::from(stream.fd.to_string()),
+                    Cell::from({
+                        let freq = info
+                            .v4l2_info
+                            .fields
+                            .get("v4l2-curfreq-0")
+                            .unwrap_or(&"unknown".to_string())
+                            .to_string()
+                            .trim_end_matches(" Hz")
+                            .parse::<u64>()
+                            .unwrap_or(0);
+                        format_freq(freq, self.show_bytes)
+                    }),
+                    Cell::from({
+                        let total_mem = info.mem_usage.iter().fold(0, |mem, e| mem + e.size);
+                        format_bytes(total_mem as u64, self.show_bytes)
+                    }),
+                    Cell::from(if self.full_cmd {
+                        info.cmdline.clone()
+                    } else {
+                        info.comm.clone()
+                    }),
+                ])
+            })
+            .collect::<Vec<_>>();
+
+        let footer = Row::new(vec![Cell::from(
+            format!("Total V4L2 FDs: {}", infos.len(),),
+        )]);
+
+        let table = Table::new(rows, widths)
+            .block(
+                Block::bordered()
+                    .title("V4L2 Codec Usage (press 'q' to quit)")
+                    .title_alignment(ratatui::layout::Alignment::Center),
+            )
+            .header(header)
+            .footer(footer)
+            .column_spacing(1)
+            .style(Color::White)
+            .row_highlight_style(Style::new().reversed())
+            .highlight_symbol(">> ");
+
+        frame.render_stateful_widget(table, area, &mut self.table_state);
+    }
+
+    pub fn selected_stream(&self) -> Option<V4L2Stream> {
+        if let Some(idx) = self.table_state.selected() {
+            self.keys.get(idx).copied()
+        } else {
+            None
+        }
+    }
+
+    fn render_mem_details(
+        &self,
+        frame: &mut Frame,
+        area: ratatui::layout::Rect,
+        infos: &HashMap<V4L2Stream, StreamInfo>,
+    ) {
+        let mem_details = Block::bordered()
+            .title("Memory usage details")
+            .title_alignment(ratatui::layout::Alignment::Center);
+
+        let mem_rows = if let Some(stream) = self.selected_stream() {
+            infos[&stream]
+                .mem_usage
+                .iter()
+                .map(|e| {
+                    Row::new([
+                        e.label.to_string(),
+                        format_bytes(e.size as u64, self.show_bytes),
+                    ])
+                })
+                .collect()
+        } else {
+            vec![]
+        };
+
+        let mem_table = Table::new(
+            mem_rows,
+            [Constraint::Percentage(50), Constraint::Percentage(50)],
+        )
+        .block(mem_details);
+
+        frame.render_widget(mem_table, area);
+    }
+
+    pub fn select_previous(&mut self) {
+        self.table_state.select_previous();
+    }
+
+    pub fn select_next(&mut self) {
+        self.table_state.select_next();
+    }
+
+    pub fn show_bytes_flip(&mut self) {
+        self.show_bytes = !self.show_bytes;
+    }
+}
+
+/// Represents all information about a V4L2 stream, including its usage and memory usage.
+struct StreamInfo {
+    v4l2_info: V4l2FdInfo,
+    comm: String,
+    cmdline: String,
+    usage: CodecUsage,
+    mem_usage: Vec<DMABuffer>,
+}
+
+/// The main renderer that combines the stream bars and the stream table.
+pub struct TopRenderer {
+    stream_bars: StreamBarRenderer,
+    table_renderer: StreamTableRenderer,
+    infos: HashMap<V4L2Stream, StreamInfo>,
+}
+
+impl TopRenderer {
+    pub fn new() -> Self {
+        Self {
+            stream_bars: StreamBarRenderer::new(),
+            table_renderer: StreamTableRenderer::new(),
+            infos: HashMap::new(),
+        }
+    }
+
+    fn read_file_to_string(path: String) -> Result<String> {
+        std::fs::read_to_string(path)
+            .map(|s| s.trim().replace("\0", " ").to_string())
+            .map_err(|e| e.into())
+    }
+
+    fn update_data(&mut self) -> Result<()> {
+        let infos = match find_all_v4l2_fdinfo(None) {
+            Ok(infos) => infos,
+            Err(e) => {
+                bail!("Error fetching V4L2 metrics: {e}");
+            }
+        };
+
+        let mem_list = match v4l2_mem_get_usage() {
+            Ok(mem) => mem,
+            Err(e) => {
+                error!("Error fetching V4L2 memory usage: {e}");
+                HashMap::new()
+            }
+        };
+
+        // Remove entries for closed FDs and update usage for active ones.
+        let to_remove = self
+            .infos
+            .keys()
+            .filter(|stream| !infos.keys().any(|info| info == *stream))
+            .cloned()
+            .collect::<Vec<_>>();
+        for stream in to_remove {
+            self.infos.remove(&stream);
+        }
+
+        for (stream, info) in &infos {
+            let stream_info = self.infos.entry(*stream).or_insert(StreamInfo {
+                v4l2_info: info.clone(),
+                comm: Self::read_file_to_string(format!("/proc/{}/comm", stream.pid))
+                    .unwrap_or("unknown".to_string()),
+                cmdline: Self::read_file_to_string(format!("/proc/{}/cmdline", stream.pid))
+                    .unwrap_or("unknown".to_string()),
+                usage: CodecUsage {
+                    last_read: None,
+                    last_value_ns: None,
+                    current_usage: None,
+                },
+                mem_usage: vec![],
+            });
+
+            stream_info.usage.update(info);
+            stream_info.mem_usage = mem_list.get(stream).unwrap_or(&vec![]).clone();
+        }
+
+        Ok(())
+    }
+
+    pub fn render(&mut self, frame: &mut Frame) {
+        if let Err(e) = self.update_data() {
+            frame.render_widget(
+                Block::bordered()
+                    .title(e.to_string())
+                    .title_alignment(ratatui::layout::Alignment::Center),
+                frame.area(),
+            );
+        }
+
+        // Split layout: memory chart on top, table on bottom
+        let chunks = Layout::default()
+            .direction(Direction::Vertical)
+            .constraints([
+                Constraint::Length(9),
+                Constraint::Min(12),
+                Constraint::Length(1),
+            ])
+            .split(frame.area());
+
+        self.stream_bars
+            .update(&self.infos, self.table_renderer.selected_stream());
+        self.stream_bars.render(frame, chunks[0]);
+
+        let [layout_left, layout_right] =
+            Layout::horizontal([Constraint::Percentage(75), Constraint::Percentage(25)])
+                .areas(chunks[1]);
+
+        self.table_renderer.render(frame, layout_left, &self.infos);
+        self.table_renderer
+            .render_mem_details(frame, layout_right, &self.infos);
+
+        // Render shortcuts
+        let line = Line::default().spans([
+            "F2".bold(),
+            "Compact/Unit".black().on_light_green(),
+            "F3".bold(),
+            "FullCmd".black().on_light_green(),
+            "q".bold(),
+            "Quit".black().on_light_green(),
+        ]);
+
+        frame.render_widget(line, chunks[2]);
+    }
+
+    pub fn show_bytes_flip(&mut self) {
+        self.table_renderer.show_bytes_flip();
+    }
+
+    pub fn full_cmd_flip(&mut self) {
+        self.table_renderer.full_cmd = !self.table_renderer.full_cmd;
+    }
+
+    pub fn select_previous(&mut self) {
+        self.table_renderer.select_previous();
+    }
+
+    pub fn select_next(&mut self) {
+        self.table_renderer.select_next();
+    }
+}
diff --git a/utils/v4l2top/src/v4l2_mem.rs b/utils/v4l2top/src/v4l2_mem.rs
new file mode 100644
index 00000000..96492f06
--- /dev/null
+++ b/utils/v4l2top/src/v4l2_mem.rs
@@ -0,0 +1,56 @@
+use anyhow::Result;
+use regex::Regex;
+use std::{
+    collections::HashMap,
+    fs::{File, read_dir},
+    io::{BufRead, BufReader},
+    path::PathBuf,
+};
+
+use crate::v4l2_metrics::V4L2Stream;
+
+#[derive(Debug, Clone)]
+pub struct DMABuffer {
+    pub label: String,
+    pub size: usize,
+}
+
+fn parse_mem_file(
+    mem_file_path: &PathBuf,
+    mem: &mut HashMap<V4L2Stream, Vec<DMABuffer>>,
+) -> Result<()> {
+    let line_regex =
+        Regex::new(r"(?<creator>[^ ]+) +(?<fd>\d+) +(?<pid>\d+) +(?<size>\d+) +(?<label>[^ ].*)")?;
+    let file = File::open(mem_file_path)?;
+    let reader = BufReader::new(file);
+
+    for line in reader.lines() {
+        if let Some(caps) = line_regex.captures(&line?) {
+            let entry = mem
+                .entry(V4L2Stream::new(caps["pid"].parse()?, caps["fd"].parse()?))
+                .or_default();
+            entry.push(DMABuffer {
+                label: caps["label"].to_string(),
+                size: caps["size"].parse()?,
+            });
+        }
+    }
+    Ok(())
+}
+
+///
+/// Retrieve the memory usage of each media process through the v4l2 debugfs file.
+///
+pub fn v4l2_mem_get_usage() -> Result<HashMap<V4L2Stream, Vec<DMABuffer>>> {
+    let mut ret = HashMap::new();
+    let debugfs_path = PathBuf::from("/sys/kernel/debug/v4l2/");
+
+    for dir in read_dir(debugfs_path)? {
+        let mut dev_path = dir?.path();
+        dev_path.push("mem");
+
+        parse_mem_file(&dev_path, &mut ret)?;
+    }
+
+    Ok(ret)
+}
diff --git a/utils/v4l2top/src/v4l2_metrics.rs b/utils/v4l2top/src/v4l2_metrics.rs
new file mode 100644
index 00000000..76069ede
--- /dev/null
+++ b/utils/v4l2top/src/v4l2_metrics.rs
@@ -0,0 +1,148 @@
+//! V4L2 fdinfo metrics parser.
+//!
+//! Scans `/proc` to find file descriptors pointing to V4L2 character devices
+//! and parses their associated `fdinfo` entries into key–value maps.
+//!
+//! # Example
+//!
+//! ```rust,no_run
+//! use v4l2_metrics::{find_all_v4l2_fdinfo, parse_fdinfo};
+//!
+//! // Parse a specific fdinfo file directly
+//! let fields = parse_fdinfo("/proc/self/fdinfo/0").unwrap();
+//! println!("pos: {}", fields.get("pos").unwrap_or(&"unknown".to_string()));
+//!
+//! // Scan all processes for V4L2 file descriptors
+//! let infos = find_all_v4l2_fdinfo(None).unwrap();
+//! for info in &infos {
+//!     println!("pid={} fd={} buf-size={:?}", info.pid, info.fd, info.fields.get("buf-size"));
+//! }
+//!
+//! // Scan a specific process
+//! let infos = find_all_v4l2_fdinfo(Some(1234)).unwrap();
+//! ```
+
+use anyhow::Result;
+use std::collections::HashMap;
+use std::fs::{self, File};
+use std::io::{BufRead, BufReader};
+use std::os::unix::fs::{FileTypeExt, MetadataExt};
+use std::path::{Path, PathBuf};
+use std::time::Instant;
+
+const V4L2_DEV_MAJOR_ID: u64 = 81;
+
+/// A unique identifier for a V4L2 Stream (i.e. a file descriptor pointing to a V4L2 char device).
+#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
+pub struct V4L2Stream {
+    pub pid: usize,
+    pub fd: usize,
+}
+
+impl V4L2Stream {
+    pub fn new(pid: usize, fd: usize) -> Self {
+        Self { pid, fd }
+    }
+}
+
+#[derive(Debug, Clone)]
+pub struct V4l2FdInfo {
+    /// All key–value pairs from the fdinfo file.
+    pub fields: HashMap<String, String>,
+    /// The time at which the file was read.
+    pub timestamp: Instant,
+}
+
+/// Parse a single fdinfo file into a [`FdInfoMap`].
+///
+/// Lines that do not contain a `:` separator are silently skipped (e.g. the
+/// standard `pos`, `flags`,... and lines that happen to have no value are still
+/// split on `:` so they are included; truly malformed lines are dropped).
+pub fn parse_fdinfo(path: impl AsRef<Path>) -> Result<HashMap<String, String>> {
+    let file = File::open(path)?;
+    let reader = BufReader::new(file);
+    let mut map = HashMap::new();
+
+    for line in reader.lines() {
+        if let Some((key, value)) = line?.split_once(':') {
+            map.insert(key.trim().to_string(), value.trim().to_string());
+        }
+    }
+
+    Ok(map)
+}
+
+/// Return the Linux device major number from a raw `dev_t` value.
+fn linux_major(dev: u64) -> u64 {
+    // From <sys/sysmacros.h>: major = bits [19:8] | bits [63:32]
+    ((dev >> 8) & 0xfff) | ((dev >> 32) & !0xfff_u64)
+}
+
+/// Return `true` if the symlink `fd_dir/<fd_name>` resolves to a V4L2 char device.
+fn is_v4l2_fd(fd_dir: &Path, fd_name: &str) -> bool {
+    // metadata() follows the symlink, giving us the target's attributes.
+    fs::metadata(fd_dir.join(fd_name))
+        .map(|m| m.file_type().is_char_device() && linux_major(m.rdev()) == V4L2_DEV_MAJOR_ID)
+        .unwrap_or(false)
+}
+
+/// Find all V4L2 fdinfo entries for a single process.
+fn find_v4l2_fdinfo_for_pid(pid: usize) -> Result<HashMap<V4L2Stream, V4l2FdInfo>> {
+    let pid_dir = PathBuf::from(format!("/proc/{pid}"));
+    let fd_dir = pid_dir.join("fd");
+    let fdinfo_dir = pid_dir.join("fdinfo");
+
+    let mut results = HashMap::new();
+
+    for entry in fs::read_dir(&fdinfo_dir)? {
+        let entry = entry?;
+        let fd_name = entry.file_name();
+        let fd_name_str = fd_name.to_string_lossy();
+
+        // Only consider numeric entries (actual file descriptors).
+        if !fd_name_str.chars().all(|c| c.is_ascii_digit()) {
+            continue;
+        }
+
+        if !is_v4l2_fd(&fd_dir, &fd_name_str) {
+            continue;
+        }
+
+        let fd: usize = fd_name_str.parse()?;
+
+        let timestamp = Instant::now();
+        let fields = parse_fdinfo(entry.path())?;
+
+        results.insert(V4L2Stream::new(pid, fd), V4l2FdInfo { fields, timestamp });
+    }
+
+    Ok(results)
+}
+
+/// Find V4L2 fdinfo metrics for the given PID, or all PIDs if `pid` is [`None`].
+///
+/// Returns a [`HashMap`] of ['V4L2Stream'] -> [`V4l2FdInfo`] entries, one per V4L2 file descriptor
+/// found.  Errors from individual processes are silently ignored when scanning
+/// all PIDs (the process may have exited mid-scan); errors from a specific PID
+/// are propagated.
+pub fn find_all_v4l2_fdinfo(pid: Option<usize>) -> Result<HashMap<V4L2Stream, V4l2FdInfo>> {
+    match pid {
+        Some(pid) => find_v4l2_fdinfo_for_pid(pid),
+        None => {
+            let mut all = HashMap::new();
+
+            for entry in fs::read_dir("/proc")? {
+                let name = entry?.file_name();
+                let name_str = name.to_string_lossy();
+
+                if let Ok(pid) = name_str.parse::<usize>()
+                    && let Ok(infos) = find_v4l2_fdinfo_for_pid(pid)
+                {
+                    all.extend(infos);
+                }
+            }
+
+            Ok(all)
+        }
+    }
+}

-- 
2.55.0

