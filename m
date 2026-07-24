Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4EF3B103B;
	Fri, 24 Jul 2026 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929706; cv=pass; b=XO/gA9huN5WfCXjgHoQylFnuts/ddxDsX/rcADu5XhT9EaeJdqxSijiCbC8CpvTY8MWPQGM4gLwOeyhQAB76vGFO/ZM5qnG7z7IKtS3z5vbZILkongrCRM7rwKuyqLmS7lRdRo+5ZtzfyNsV+kkg6Mp3Ye2Zzlh3h6+KL+ZvdiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929706; c=relaxed/simple;
	bh=LgtWaoRiWiQVhSJtFx0qo8EkdwX8mVbBn4lYjx1Q9Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjqGByHdSjZGcHwdctUi5ntJ0Zp1VQ6d/DuSomIxPMXsFoJFARFcGxqVeYTZ3/mWkQ18ucofsH7zYL21I61u7WabwqPcdw2/ay5EA+GGkdvSSvdlVKOTghCJxyjXm9ckjefqkNeaG6mn+8W2R02RJ2MPsCDIaY091rvhB4plOKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=QYoRev53; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="QYoRev53"
ARC-Seal: i=1; a=rsa-sha256; t=1784929375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BbACxmNHmYG+3eniH20cIDHafB+UUyq0LZwISIfCOP8QyL71AicizjbYOzCOXPR5dx0yJD643UknpnB+bho3ZLUz0+7m4VHstoS9yM4+nQ5Mp4BvtowvSCk7rHEW5wfyTa+jon1rhNkxTdRFtQVTu71Ean7G0EqFLr64z0PerQU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784929375; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hEcYdcncYX+/NUQ21cjtPTLPIKJTl/t/DKtHxa77tVk=; 
	b=KazNhCthVnstcAvVnGlhXXS6bz1w74PuG3Lz31jz1+HPnEE5SrVOdxxdzExUCd0M0H6LqAG59a9fJ+qNBdVdQjDrg7KeOukFMP07v1u3UJ/41wN9CoH/BmztEtIEf8/d2kbMsPRbqrvQlicRwdJnIEk9273xn+6Sc3+IwPXYYQQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784929375;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hEcYdcncYX+/NUQ21cjtPTLPIKJTl/t/DKtHxa77tVk=;
	b=QYoRev535b/MDB8jzZen/PSfMZEnVczaNi2Vr2B6JXtSNmWCoDQa5Brq3j4eHyhu
	7IrkJEVEUOQwhJnRbDfoTYZaGwc2oXgytdZJppxg350n6SdbSo5MJm1QwrTozBEA5Bm
	t92gYup6in64RvABe7l16PBJaTw6B6mUNbNTvqHA=
Received: by mx.zohomail.com with SMTPS id 1784929372879835.290956592263;
	Fri, 24 Jul 2026 14:42:52 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Daniel Lundberg Pedersen <dlp@qtec.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] docs: apply contained horizontal scroll overflow to tables
Date: Fri, 24 Jul 2026 17:42:47 -0400
Message-ID: <20260724214249.23830-2-rito@ritovision.com>
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

Documentation tables can currently fail in two opposite ways on
constrained layouts: columns may collapse until their contents wrap into
nearly vertical text, or a wide table may expand the document and break
the page margins.

Add a foundational containment layer for Sphinx-rendered tables. Wrap
each table in an outer container that owns horizontal overflow while
leaving the table itself in its native layout mode. This allows wide
table content to remain readable through contained scrolling without
expanding the page width and breaking the layout.

Applying overflow directly to the table changes its display behavior and
causes rendering defects. It can add an outer border that overlaps the
table's existing border, making the perimeter appear thicker, and can
leave an awkward gap between that outer border and the rightmost column.
Keeping overflow on a wrapper avoids those border and caption-layout
problems.

The wrapper also provides a useful affordance on narrow viewports. When
a table overflows, its right border remains outside the visible area
until the user scrolls to reveal it, helping indicate that additional
content is available horizontally. Otherwise, showing complete borders
on both sides while content is hidden may leave users unaware that the
table is scrollable.

Give the wrapper the full width available from the document body. With
the 120em body maximum retained, tables can use that space before local
scrolling becomes necessary. Tables whose readable width still exceeds
the body remain contained and horizontally scrollable rather than
widening the page.

This patch establishes the overflow boundary but does not attempt to
assign stable widths to table content across all table shapes. Content-
derived column minimums are added separately.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: ChatGPT SOL 5.6
---
The following pages demonstrate the two opposite table-layout failures
this patch is intended to support.

At a viewport width of 500px or less, a table expands the page width and
breaks the layout:

https://docs.kernel.org/7.0/userspace-api/media/v4l/vidioc-enuminput.html

In the 7.1 documentation, the table instead attempts to fit within the
viewport by collapsing its columns until some content wraps into nearly
vertical text (500px or less):

https://docs.kernel.org/7.1/userspace-api/media/v4l/vidioc-enuminput.html

With both this patch and its follow-up applied, wider tables remain
contained within the page and scroll horizontally, including at a
viewport width of 500px or less:

https://linux-tables.ritovision.com/userspace-api/media/v4l/vidioc-enuminput.html

The wrapper introduced here provides the horizontal overflow boundary.
The follow-up patch adds content-derived column minimums to prevent the
vertical text collapse.


The following test cases highlight problems with alternative approaches
and explain the implementation choices made by this patch.

Applying the horizontal overflow CSS directly to a table without a
wrapper causes a doubled outer border and an empty gap beside the
rightmost column.

Test page:

https://docs.kernel.org/7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot

Apply the horizontal overflow rules directly to the table instead of an
outer wrapper to reproduce the rendering defects.

A body maximum that is too narrow causes contained tables to become
locally scrollable at ordinary desktop viewport widths even when unused
viewport space remains. The retained 120em body maximum avoids that
premature constraint for ordinary layouts, while tables that genuinely
exceed the available body width continue to scroll as intended.

Test page:

https://docs.kernel.org/7.1/userspace-api/media/v4l/vidioc-enuminput.html

To reproduce the premature scrolling, reduce the body maximum to 800px
while applying contained horizontal overflow.

If a narrower maximum width is later desired for prose, it should be
applied selectively to prose or another inner content container rather
than globally reducing the width available to table wrappers.

 Documentation/conf.py                  |  1 +
 Documentation/sphinx-static/custom.css | 11 ++++++++
 Documentation/sphinx/table_layout.py   | 38 ++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 Documentation/sphinx/table_layout.py

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 9b822ab47..53b9eee2e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -153,6 +153,7 @@ extensions = [
     "kernel_feat",
     "kernel_include",
     "kfigure",
+    "table_layout",
     "maintainers_include",
     "parser_yaml",
     "rstFlatTable",
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index aa2a3cf11..e9fc17f5b 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -27,6 +27,17 @@ div.document {
     width: auto;
 }
 
+/*
+ * Put overflow on an outer container rather than changing the table's display
+ * type, preserving native table, caption, and collapsed-border rendering.
+ */
+div.body div.table-overflow {
+    display: block;
+    max-width: 100%;
+    overflow-x: auto;
+    overflow-y: hidden;
+}
+
 /* Size the logo appropriately */
 img.logo {
     width: 104px;
diff --git a/Documentation/sphinx/table_layout.py b/Documentation/sphinx/table_layout.py
new file mode 100644
index 000000000..029b31ee6
--- /dev/null
+++ b/Documentation/sphinx/table_layout.py
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+"""Provide responsive table layout hooks for HTML documentation.
+
+Wrap rendered tables in an outer container that enables contained horizontal
+scrolling on narrow viewports as needed. Allowing the table to remain wider
+than the viewport helps prevent columns from collapsing into unreadable
+vertical text, while containing page-wide overflow that would increase the
+total page width and break the page margins. Applying overflow directly to the
+table instead of the wrapper creates a double-border rendering defect.
+"""
+
+from sphinx.writers.html5 import HTML5Translator
+
+__version__ = "1.0"
+
+
+class LayoutInjectionHTMLTranslator(HTML5Translator):
+    """Add HTML containers needed for responsive layout behavior."""
+
+    def visit_table(self, node):
+        self.body.append('<div class="table-overflow">\n')
+        super().visit_table(node)
+
+    def depart_table(self, node):
+        super().depart_table(node)
+        self.body.append("</div>\n")
+
+
+def setup(app):
+    for builder in ("html", "dirhtml", "singlehtml"):
+        app.set_translator(builder, LayoutInjectionHTMLTranslator, override=True)
+
+    return dict(
+        version=__version__,
+        parallel_read_safe=True,
+        parallel_write_safe=True,
+    )
-- 
2.51.0
