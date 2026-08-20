Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89234390200
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250133; cv=none; b=tHjtNm1hyQLmaWHaXfuo6hBOHGT1OuUvN2hUk3uBuaL59oZDuYREeT5RD6/VfSmnWD8sqFpstLzqus/q0gc8M2Tj0yN9j/3G/RGTb9Nye9rP5Fph8S1MNSip9PZBjMn88S/FtanNIHVraOljWNBtxCpdJcxGqPZHt7FB0Oc/es8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250133; c=relaxed/simple;
	bh=cghfAlaKcd/uhrDWKx7DLpRz7LxfFE6lrVCnUGAafNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgZFjfkbVTpfzYvKMpNt4riFZ2TtXj8CiUaWWxsSeu6FHLNQBxQ4KhymTzD96udNHh7e33YqvtIY1ttUGoMfHM6gTUUnB78QuyV0fxpmX+bCXalsdX/NsfqWa0Np8pINcAD2IayXIBbwgfQhTfjOsB5znicjdgdPz/wYa5zAeT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7qCb1kU; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7qCb1kU"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso161188b3a.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250132; x=1787854932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0pjwno30/VPREthOeV/FfuLHBxN0mxRR1HaGuVBAv0=;
        b=C7qCb1kU4NsfXiCuDnreaYFMN33zXcRL16FyASqg9L1WlhVf2yUrg6QL+8EgvwcsIl
         2qmIShUTmjdc2zB5fIM2sqWIQt+1OHtdP0R/4krv1AXMxP2SfyTJkEmWiD9i+/qju6J/
         z4EYXyaUNWMurJlmBwdCRAksZmfx2skbqTvsihCQ8x5x49WBb5jwLKAEVDdjjFV40JAC
         Mvwh6BPBs+LZxuZ6q0G8I5SvERC5x4l2WNRXA8Y76DC9SVFt090QkTh6Geo968lIzK3v
         Sq6Qx2TgoVOn1yWjtrUJT8LKIgWQDyBCV7rRGVIumIES1w2tm5DB7TR/mc5Ew8PXhD3g
         ORew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250132; x=1787854932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0pjwno30/VPREthOeV/FfuLHBxN0mxRR1HaGuVBAv0=;
        b=GpnXkP2ORNxULJobX52mxD96OLvDe3d7wWl/YKQYPMO2vVVh2fOe1+0x0ZIqnWFGTW
         3VYDEu+9KcHDuQWuULQkkGWzB+Ex0tpzSa9Gzp/JYlc9GmSMyyiVzn2oDDOKUBqjjBuY
         6kFXuu1sFkCoFPV97RGuOqug2QTB6ZbCitifsv9EJ8q7O7x+CgynXr2QIZTpnZ11iskD
         eS0C0EBIx23tP3cGplxT6GKAHq59resSEucH7eVTWEUvLYHMjMDlruxoA4d44fr5nmnZ
         eQUSYobuKNAFWk1ieEidmRdCZV8AzPRKTg4mY35m/AS4qlO7lBbPiFek7GalmSSuAGsp
         c9tA==
X-Gm-Message-State: AOJu0YzekzLHqrHATPnNfLMHn5RYu5gujXX3fXZcdAXOXcknkvqEkCSU
	uBUdcJZn5hxZSkYGwPbXTX2re68Q4poNkvoT6SwQjn6SDBGMs2pP/ILiZUAnonmkEWU=
X-Gm-Gg: AR+sD12WF8LwVa3wK7xmtUwBj2ucB1e+I2UNeURhu82sBjCXQXD542REuHdKkXaJRKO
	I/FbVhwYYwOziZuu8hOl5oEU378vp8eTxIakdWMHA0yN7qHf1yPZKuXoso62A3Xa4EgGKrIcnXq
	uLxk4fIo2Auh5EELtn/dNaMge5VqB0d+sn/1h23byPQAGXLTYAG1BKSaIpmkmShAO1mVY6lrKfp
	GUFNs2RRumhvQIv4jYOlnA6UCDAcTINp2YaGsEGHNUlHrfctF4fuU5J5akn/D1FfHPK0psvEk48
	Wc4VNJl0zWuepkGUOZxK1dAK50Qv3mSPpXJYTE03wtUqLCkM2FP+hd9rUYlsXzNbM66zlyg9Gd4
	ZLLuRW3G06RO2z793yeczbd2Htea7Ih38PUe1JPRMeH5p1R7gP/Vy3S5ewP6JgmQns5XTHmH5ro
	LuMOL+F6mFjhHylEEynl9VQ/4Ez+w5DQS8FNcA8eq3TkC9vRVyknaTg5PyED5pLK4muEZNJWsd1
	7S6BfgALzc/c//zDT4jgfdwfLqF3YdqLvsFYO0L30mkr4/OSQHFkA==
X-Received: by 2002:a05:6a00:6ca2:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-851d383142dmr26225097b3a.2.1787250131478;
        Thu, 20 Aug 2026 11:22:11 -0700 (PDT)
Received: from desktop.local (97-115-106-59.ptld.qwest.net. [97.115.106.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d369a487sm2037829b3a.59.2026.08.20.11.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:22:11 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [RESEND PATCH 2/5] facetimehd: add Kconfig and Makefile
Date: Thu, 20 Aug 2026 11:21:51 -0700
Message-ID: <20260820182156.18078-3-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820182156.18078-1-jackflusche@gmail.com>
References: <20260820182156.18078-1-jackflusche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added build files for the FacetimeHD driver

Signed-off-by: Jack Flusche <jackflusche@gmail.com>
---
 drivers/media/pci/Kconfig             |  1 +
 drivers/media/pci/Makefile            |  1 +
 drivers/media/pci/facetimehd/Kconfig  | 12 ++++++++++++
 drivers/media/pci/facetimehd/Makefile |  2 ++
 4 files changed, 16 insertions(+)
 create mode 100644 drivers/media/pci/facetimehd/Kconfig
 create mode 100644 drivers/media/pci/facetimehd/Makefile

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index bfdb200f85a3..66f3d8b0ad6f 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -20,6 +20,7 @@ source "drivers/media/pci/tw5864/Kconfig"
 source "drivers/media/pci/tw68/Kconfig"
 source "drivers/media/pci/tw686x/Kconfig"
 source "drivers/media/pci/zoran/Kconfig"
+source "drivers/media/pci/facetimehd/Kconfig"
 
 endif
 
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index c4508b6723a9..666099f23abd 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_VIDEO_TW5864) += tw5864/
 obj-$(CONFIG_VIDEO_TW686X) += tw686x/
 obj-$(CONFIG_VIDEO_TW68) += tw68/
 obj-$(CONFIG_VIDEO_ZORAN) += zoran/
+obj-$(CONFIG_VIDEO_FACETIMEHD) += facetimehd/
diff --git a/drivers/media/pci/facetimehd/Kconfig b/drivers/media/pci/facetimehd/Kconfig
new file mode 100644
index 000000000000..34d3ba8999f4
--- /dev/null
+++ b/drivers/media/pci/facetimehd/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# "Broadcom Facetime HD camera driver
+#
+config VIDEO_FACETIMEHD
+	tristate "Broadcom Facetime HD camera"
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_DMA_SG
+	select VIDEO_DEV
+	help
+	  This adds support for the Apple Facetime HD camera using the Broadcom
+	  PCIe controller (14e4:1570) found on Macbooks from around 2013-2017.
diff --git a/drivers/media/pci/facetimehd/Makefile b/drivers/media/pci/facetimehd/Makefile
new file mode 100644
index 000000000000..2dc42bbc8a8f
--- /dev/null
+++ b/drivers/media/pci/facetimehd/Makefile
@@ -0,0 +1,2 @@
+facetimehd-objs := fthd_ddr.o fthd_hw.o fthd_drv.o fthd_ringbuf.o fthd_isp.o fthd_v4l2.o fthd_buffer.o fthd_debugfs.o
+obj-$(CONFIG_VIDEO_FACETIMEHD) += facetimehd.o
-- 
2.55.0

