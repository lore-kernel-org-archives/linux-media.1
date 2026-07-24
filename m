Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096062E8B6B;
	Fri, 24 Jul 2026 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929729; cv=pass; b=n7mTs18dA55X+N8zSgsYPnPpwTS5H/I4hBz87ACGCqwxwciJ6GuuyTpTjWPPQ7d43dbZzKQXIB+z/wyGQa21uWEwzStIXTUg9Ns8T2+JSbW+LcAgw9XH3itozIO4hRLwQbBPJ3orl+yKVBeY13+rzhnNCDYWj7+EffLQjlzczGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929729; c=relaxed/simple;
	bh=GOyTBmorNPlbaBj6n8HNAZD7i7dBw4hgy01mMEZ7nW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sltFBzyOPbkfmzfom6Tp6OI7gdDLOKvGZ8YyB6Dgf7ecFf+4QYyIjBMHnRWb4EFpunmWpKrGUmG81+tFUVvhg8VnLpQyE+8C2Cd3aeMolPwO8xrrPNJUZdGFrKm9Hn3MM5DKbAC5ycJiBF9w94rvpmS4IciFbDuWWr5eOddp+8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Lb0TrZeq; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Lb0TrZeq"
ARC-Seal: i=1; a=rsa-sha256; t=1784929377; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b/s0KCq8gjOyZmovUmVoLfILVyOedETSv8IDKSLfJVZZZOWp5O+e6QD68u5EQRxynKZ3ZnDxMxy1C++nYR2+hRREAm6j2Szmv/ED4x+SwjUrvkR/KMmKxA7w6PUSjWDOltMf2X3sX22ELgb1LRcdpUIgDVGsSw/ygBJDtG16OmQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784929377; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AhqocKeO+xmT6PKXoNm9qP1r9U7QqO5xcilyv7orcX4=; 
	b=lDbVsQGZaJKLcuA+1fmKzdh3cksNZ9xfSumx3jriKpLV8gYGgIy2gU+I4493iyIIQY45qLv+cSbJIxFz50cCc0uVTSo26SbrMgWjI0aNTd+HKq4wOhoc1+9gD1VRl7hivk+Mg2ImDe/oXpu4lLm0zSUGrAw6+i/MaLG5JC8cHs8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784929377;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AhqocKeO+xmT6PKXoNm9qP1r9U7QqO5xcilyv7orcX4=;
	b=Lb0TrZeq8vZOzHHyoWnz7Coi2nt2KyVNMoeg2gUc4izYr/DVAFxdM+0/51bGn3sH
	fJknJNZATkyntbIQfMHCPYBoyUf7MlWKuZlbL13hhQ62UW8ig5yBF+ZHt/X2TkhiUb4
	9LUnCH1uZKlaqwiUY57ogpLg706ei2ltMGd784gw=
Received: by mx.zohomail.com with SMTPS id 1784929373797131.6453756535609;
	Fri, 24 Jul 2026 14:42:53 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Daniel Lundberg Pedersen <dlp@qtec.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] docs: derive table column minimum widths from content
Date: Fri, 24 Jul 2026 17:42:48 -0400
Message-ID: <20260724214249.23830-3-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724214249.23830-1-rito@ritovision.com>
References: <20260724214249.23830-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The contained overflow wrapper added previously allows wide tables to
scroll within the document instead of widening the page. It does not,
however, prevent individual columns from collapsing until their contents
wrap into narrow, nearly vertical text.

CSS alone cannot derive a useful minimum from the contents of each
column. Extend table_layout.py to inspect tables in the resolved doctree
and measure the longest normalized single-column cell in each logical
column. Assign the resulting table-column-width-N class to every
single-column cell in that column.

Track row-spanning cells while traversing each row so later entries
remain aligned with their logical columns. Ignore cells that extend
across multiple columns when measuring and assigning widths because
their content cannot be attributed to one column.

Map the generated classes to ch-based minimum widths in CSS. Limit the
derived value to 40 characters and cap each CSS minimum at 60vw so
unusually long content cannot create an excessive column floor on narrow
viewports. These remain minimums rather than fixed widths, leaving
native table layout free to distribute additional space.

Allow otherwise unbreakable table-cell content to wrap anywhere. The
generated minimums keep this wrapping from collapsing columns
prematurely, while long identifiers, URLs, and inline literals can still
break instead of forcing unbounded table expansion. Any remaining
table-level width is handled by the contained overflow wrapper.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: ChatGPT SOL 5.6
---
This patch assumes that commit 1afefde902c5 ("Revert \"docs: allow
inline literals in paragraphs to wrap to prevent overflow\"") is not
carried forward. It retains overflow-wrap: anywhere and addresses the
table regression that motivated the revert with content-derived column
minimums.

The same table can collapse in opposite directions depending on its
content and the generalized CSS rules applied to it. A rule that keeps
one column readable can cause another to absorb too much or too little
space, creating a whack-a-mole effect where fixing one imbalance
introduces another. Because generalized selectors cannot derive a
different minimum from the contents of each column, preserving readable
widths requires a targeted, per-column solution.

The kgdbreboot parameter table demonstrates two opposite column-collapse
failure modes across documentation versions:

To reproduce these failure modes, view each page at a viewport width of
500px or narrower.

v7.1 collapses the left column of inline literals into nearly vertical
text while leaving the right column readable:

https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot

v7.0 leaves the left column readable but collapses the right column into
nearly vertical text:

https://www.kernel.org/doc/html/v7.0/process/debugging/kgdb.html#run-time-parameter-kgdbreboot

With this series applied, both columns retain readable widths and any
remaining table width is contained through horizontal scrolling instead
of widening the page:

https://linux-tables.ritovision.com/process/debugging/kgdb.html#run-time-parameter-kgdbreboot

 Documentation/sphinx-static/custom.css | 187 ++++++++++++++++++++++++-
 Documentation/sphinx/table_layout.py   |  98 +++++++++++++
 2 files changed, 284 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index e9fc17f5b..6a33d3362 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -38,6 +38,183 @@ div.body div.table-overflow {
     overflow-y: hidden;
 }
 
+/*
+ * Let long identifiers, URLs, and other unbreakable cell content contribute a
+ * smaller intrinsic minimum width so the viewport-capped column minimums can
+ * take effect. Normal text still wraps at ordinary break opportunities; a
+ * break inside a token is used only when needed to avoid overflow.
+ */
+div.body table.docutils th,
+div.body table.docutils td {
+    overflow-wrap: anywhere;
+}
+
+/*
+ * table_layout.py derives a minimum width from the longest non-spanning
+ * cell in each column and assigns the corresponding table-column-width-N
+ * class. These minimums prevent premature wrapping, while overflow-wrap:
+ * anywhere above prevents long tokens from forcing unbounded expansion.
+ *
+ * Cap the generated floor at 60vw so an individual column's minimum remains
+ * fully visible on narrow viewports and does not itself require horizontal
+ * scrolling to read. Keep this range in sync with MAX_COLUMN_WIDTH.
+ */
+div.body table.docutils .table-column-width-2 {
+    min-width: min(2ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-3 {
+    min-width: min(3ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-4 {
+    min-width: min(4ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-5 {
+    min-width: min(5ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-6 {
+    min-width: min(6ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-7 {
+    min-width: min(7ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-8 {
+    min-width: min(8ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-9 {
+    min-width: min(9ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-10 {
+    min-width: min(10ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-11 {
+    min-width: min(11ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-12 {
+    min-width: min(12ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-13 {
+    min-width: min(13ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-14 {
+    min-width: min(14ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-15 {
+    min-width: min(15ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-16 {
+    min-width: min(16ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-17 {
+    min-width: min(17ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-18 {
+    min-width: min(18ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-19 {
+    min-width: min(19ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-20 {
+    min-width: min(20ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-21 {
+    min-width: min(21ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-22 {
+    min-width: min(22ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-23 {
+    min-width: min(23ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-24 {
+    min-width: min(24ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-25 {
+    min-width: min(25ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-26 {
+    min-width: min(26ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-27 {
+    min-width: min(27ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-28 {
+    min-width: min(28ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-29 {
+    min-width: min(29ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-30 {
+    min-width: min(30ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-31 {
+    min-width: min(31ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-32 {
+    min-width: min(32ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-33 {
+    min-width: min(33ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-34 {
+    min-width: min(34ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-35 {
+    min-width: min(35ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-36 {
+    min-width: min(36ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-37 {
+    min-width: min(37ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-38 {
+    min-width: min(38ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-39 {
+    min-width: min(39ch, 60vw);
+}
+
+div.body table.docutils .table-column-width-40 {
+    min-width: min(40ch, 60vw);
+}
+
 /* Size the logo appropriately */
 img.logo {
     width: 104px;
@@ -171,8 +348,16 @@ div.language-selection ul li:hover {
 }
 
 /*
- * Let long inline literals in paragraph text wrap as needed to prevent
+ * Treat inline literals like normal text for wrapping in ordinary layouts,
+ * while allowing breaks inside long unbroken tokens when needed to prevent
  * overflow.
+ *
+ * In tables, this aggressive wrapping can otherwise collapse narrow columns
+ * into nearly vertical text. The content-derived minimum widths assigned by
+ * table_layout.py establish a readable floor for each column. The column
+ * width adapts without falling below that floor, while long inline literals
+ * wrap within the available width rather than forcing the table to expand or
+ * collapsing into vertical text.
  */
 code.docutils.literal span.pre {
     white-space: normal;
diff --git a/Documentation/sphinx/table_layout.py b/Documentation/sphinx/table_layout.py
index 029b31ee6..88de246c5 100644
--- a/Documentation/sphinx/table_layout.py
+++ b/Documentation/sphinx/table_layout.py
@@ -8,13 +8,109 @@ than the viewport helps prevent columns from collapsing into unreadable
 vertical text, while containing page-wide overflow that would increase the
 total page width and break the page margins. Applying overflow directly to the
 table instead of the wrapper creates a double-border rendering defect.
+
+Derive a targeted minimum width for each logical column from the content
+belonging to that column. These minimums prevent aggressive wrapping from
+collapsing text and inline literals into nearly vertical or excessively narrow
+columns, while preserving content-aware column widths and allowing the overall
+table to scroll within its container on narrow viewports.
 """
 
+from docutils import nodes
 from sphinx.writers.html5 import HTML5Translator
 
 __version__ = "1.0"
 
 
+MAX_COLUMN_WIDTH = 40
+
+
+def _content_length(entry):
+    """Return a stable character count for rendered cell content."""
+    return len(" ".join(entry.astext().split()))
+
+
+def _width_class(content_length):
+    if content_length <= 1:
+        return None
+
+    width = min(content_length, MAX_COLUMN_WIDTH)
+    return f"table-column-width-{width}"
+
+
+def _table_rows(tgroup):
+    for section in tgroup.children:
+        if not isinstance(section, (nodes.thead, nodes.tbody)):
+            continue
+        for row in section.children:
+            if isinstance(row, nodes.row):
+                yield row
+
+
+def _inject_table_column_classes(table):
+    tgroup = next(
+        (child for child in table.children if isinstance(child, nodes.tgroup)),
+        None,
+    )
+    if tgroup is None:
+        return
+
+    column_count = int(tgroup.get("cols", 0))
+    if column_count < 1:
+        return
+
+    column_lengths = [0] * column_count
+    positioned_entries = []
+    active_rowspans = [0] * column_count
+
+    for row in _table_rows(tgroup):
+        next_rowspans = [max(0, span - 1) for span in active_rowspans]
+        column = 0
+
+        for entry in row.children:
+            if not isinstance(entry, nodes.entry):
+                continue
+
+            while column < column_count and active_rowspans[column]:
+                column += 1
+            if column >= column_count:
+                break
+
+            colspan = int(entry.get("morecols", 0)) + 1
+            colspan = min(colspan, column_count - column)
+            positioned_entries.append((entry, column, colspan))
+
+            if colspan == 1:
+                column_lengths[column] = max(
+                    column_lengths[column],
+                    _content_length(entry),
+                )
+
+            rowspan = int(entry.get("morerows", 0))
+            if rowspan:
+                for index in range(column, column + colspan):
+                    next_rowspans[index] = max(next_rowspans[index], rowspan)
+
+            column += colspan
+
+        active_rowspans = next_rowspans
+
+    column_classes = [_width_class(length) for length in column_lengths]
+    for entry, column, colspan in positioned_entries:
+        if colspan != 1:
+            continue
+
+        class_name = column_classes[column]
+        if class_name:
+            entry["classes"].append(class_name)
+
+
+def inject_layout_classes(_app, doctree, _docname):
+    """Add generated classes used by the documentation layout CSS."""
+    for table in doctree.traverse(nodes.table):
+        _inject_table_column_classes(table)
+
+
 class LayoutInjectionHTMLTranslator(HTML5Translator):
     """Add HTML containers needed for responsive layout behavior."""
 
@@ -28,6 +124,8 @@ class LayoutInjectionHTMLTranslator(HTML5Translator):
 
 
 def setup(app):
+    app.connect("doctree-resolved", inject_layout_classes)
+
     for builder in ("html", "dirhtml", "singlehtml"):
         app.set_translator(builder, LayoutInjectionHTMLTranslator, override=True)
 
-- 
2.51.0
