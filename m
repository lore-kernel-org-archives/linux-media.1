Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2212F3C3E
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296548; cv=none; b=dtold7EsvrXdAywiHUiTlRk70LFlnykt/uJlgfWt1lPdwB+SNh/1amHFnhCoM0m47MpcbjpmOCLTAV/FCWhKze5UfVxMgU5Rw8At2H7LqLH/lbwLOmc61hOinHQsSHAbhqjy2a4guK2ZzqxXMiezgorRmwND2wj5rqeRKx8Pyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296548; c=relaxed/simple;
	bh=zwqKtimarOKIQOKNb2cLRFiqzKqX3Yzbc4o9OiUepYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOzDSaauHTVjuiSBTvZNSwImL1seoRmeMd9i8Szp9jTT1uaYnOFVhUS1qvvWZaje9Cf5wRYfQjsNWgrL33l3XMfVl3iLdjxXJAIv4uUYP/3ylEL2oJ9pId6bkKvYSkwxI17yEKijtP1cWBuQkz5JCbr8QOLy4zo6bP37h7pIEHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjdbxnv8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjdbxnv8"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so540700a12.3
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296546; x=1787901346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=Zjdbxnv8h6UPab7a9u/TfraNIfzy6og/rfN95Hv80Ml8RxMyyIEaJjJTCL21frrzrE
         JXVn6/ePxgeA7TT4CJy2+N8OTc3VKFHrMoWv1T1ebIiKZgRGVbI9hCUa7JDofh7Y23CZ
         2Aa5Fw7+Jph//v5JCdPPKfuyl5Vvl7UyzMuGK1C3zXt/PkEbpJRKK8e1tzMI/+s+zKKU
         bEr7UqsKG5GAEZEQLxj28+vTlYzr5Uj6WC0JURfXYXG4kag26Enah21Km5MT35q6luJU
         1Mo1IxD0tmfAX1ZInZMUOpoeadfdEv4V4+jhxOGv6JPHaGqRBsLWGDTUYkC9kAqQv0I6
         vuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296546; x=1787901346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Y/Hk1ij4iIeeDeCgZ2taRMrjGJza1klMebG4Wvu7x0=;
        b=nE7C4n4dyyum02oNNskDaMOSa0yhkLKNBfgoGQgEsf+wzznuhet6b9D+TIIuxphS/h
         DujOThOfxyoiE6jmjvKuZcDJVcRSNvttI+Q333MwaVCMCQYBYSAyTpoydnCOQZwxg4+n
         JXGnhJwfNBOzeNRFzUfjQ8JNZIjufmF0yWWuaV6sq1hVzefq8hq6ylnPcF55s0UB8pYJ
         XirV0FtewbX1fcm5PVr/lkptuFmcEhz+3W1vmgH93glSuY+QHOlBTmSKuNcBsx5EYAn4
         IccIy+hs/yhN3MglyIVYUJqrEUzKQq8YsBQQlVJdMxlooQAHabWhklhCaDTw4lsnlEWg
         Bg0A==
X-Forwarded-Encrypted: i=1; AHgh+RpiykO4WO/UR5ywtqz39uodFCAQ3hm3ALR3DHSHz004dDLQEBoFLVuQp/RpsdM6cnP8ZGNnLwLdgHv0aA==@vger.kernel.org
X-Gm-Message-State: AFuF++lzO6Vo11OwEfCp9G9OwUhPRYfDLBmJE7obgyty4MmDfRfUBDGN
	n2UoGH+/1VvqW1BbLr9AYP9iWq5z2xENohQp1bm3pyqIiPZN7hRyn4k=
X-Gm-Gg: AR+sD12DKXgOdIFCo8YILRoNECOIKlM9U7aS/7FVY9DhUtdkZv4T8PQVJhy9PQFawP8
	R5RjppbTlyHEg5Ihby5wQfHqSjF/dIacUZvmoZMh6K2xRCYqlOUQlQXnzZzx98xv1ffJ4r0irn6
	81WXfrxW4Xsj4Skioch2PXyn66NnS6FPmfLBTN73kmp/43REhZXv33WvtPirw2LsXs1q5A6afGs
	aU7JtkgLQ59/O/5qMpDRfr5V88PNdHa3cbkN1xSang+ol2ZwbjiQhwOeLEgkymfpxpoSi4NIQ5T
	2E4x9OlvGMhFEifwWBqgvpnFzyZWnmmglCQjo3PAkImy0YBdbcY7maUnf8KlWpux6zeJoJqHXeS
	VYa0OH3OoNvHzzwOjYKQ+H3U77I+qZU4DdeNOc5ao61ZkDOvL25S6YuPczKvp8DxMqg4b3alE8H
	yahmt80mDbQVsxwmBrD5Hlx1hpr9rTdhB7v/bFmaWnz8hF0x0ys4pAJj+cIPblIBMtv/KmVlhsK
	WwqwL8qh5o33Q==
X-Received: by 2002:a17:90a:da87:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-395c3731c29mr8394315a91.12.1787296545832;
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm1951676a91.15.2026.08.21.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:15:45 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] media: rc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:15:33 +0700
Message-ID: <20260821071533.215821-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/rc/meson-ir.c  | 6 +++---
 drivers/media/rc/sunxi-cir.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 272ebb0d97c8..795b38ca864a 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -567,7 +567,7 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
-static __maybe_unused int meson_ir_resume(struct device *dev)
+static int meson_ir_resume(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 
@@ -579,7 +579,7 @@ static __maybe_unused int meson_ir_resume(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int meson_ir_suspend(struct device *dev)
+static int meson_ir_suspend(struct device *dev)
 {
 	struct meson_ir *ir = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -591,7 +591,7 @@ static __maybe_unused int meson_ir_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
 
 static const struct meson_ir_param meson6_ir_param = {
 	.support_hw_decoder = false,
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..7fd48c510143 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -236,19 +236,19 @@ static void sunxi_ir_hw_exit(struct device *dev)
 	reset_control_assert(ir->rst);
 }
 
-static int __maybe_unused sunxi_ir_suspend(struct device *dev)
+static int sunxi_ir_suspend(struct device *dev)
 {
 	sunxi_ir_hw_exit(dev);
 
 	return 0;
 }
 
-static int __maybe_unused sunxi_ir_resume(struct device *dev)
+static int sunxi_ir_resume(struct device *dev)
 {
 	return sunxi_ir_hw_init(dev);
 }
 
-static SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(sunxi_ir_pm_ops, sunxi_ir_suspend, sunxi_ir_resume);
 
 static int sunxi_ir_probe(struct platform_device *pdev)
 {
@@ -422,7 +422,7 @@ static struct platform_driver sunxi_ir_driver = {
 	.driver = {
 		.name = SUNXI_IR_DEV,
 		.of_match_table = sunxi_ir_match,
-		.pm = &sunxi_ir_pm_ops,
+		.pm = pm_sleep_ptr(&sunxi_ir_pm_ops),
 	},
 };
 
-- 
2.53.0

