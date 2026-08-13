Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE0D38BF7F
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 17:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642607; cv=none; b=LGxRzcI9Y+/tfkD6b49yDEoG0X1GbfoJLswCD8bO8cLujxtPt6HckRT4ALUW5MFw6uCFGeyPa+WrovbXqyrbrsQcaD2iDBLrc4XX2Fxcl6CRQhCqiSAdbyw//ayWfqI0AQlAZnneXN21QOU4dmKIzAqvOeBRsOU1VcBj+ji0EKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642607; c=relaxed/simple;
	bh=cghfAlaKcd/uhrDWKx7DLpRz7LxfFE6lrVCnUGAafNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3sfC2/eeklkBM4zCbcHlMZIEgEsbAdRaSgGskFyliBpaqZooMwqRvmk4i+lEHssri76RMNZslaJqbxcd4GX/ZgP/CGjcdVg6Ox0V8G7ANyS5lvayb7J53ZzByDK1Cv/FPzftiwMX4gSesQIJHP6FHQoOH1soZTL8mmlPZx6wiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFBsV4MH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFBsV4MH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84867f07d63so670b3a.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642605; x=1787247405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0pjwno30/VPREthOeV/FfuLHBxN0mxRR1HaGuVBAv0=;
        b=YFBsV4MHW3NmmsjfOym88Fb4jqBnq3kOcvUjTqmBHciXAd+UqwpReGzjzP1Xydy/PC
         Pk/7iP/yF2+vVd6AmA8/K1nG33nCmaFZraE9Vbs8SgRKChi+hsNoZU3sA1/TzrPSr6qz
         sMAyXTw2FRW/p/kUSsONd0O43AOybIXXcTVIL33T4Cd1dSNsuMjovfarVHgJWZuhEFnL
         KZQkF+2+haYjg1spjERi/XEBw2ybDNFS7nM+Q5HOExO4xqOsCU4/jR3HkAigmYIPxKAZ
         MZJIUHicRp2QZfM1URLsj5YOHyfl1O0paAx+JznGAcqAZ7zonkhcXckIhUnLT7fPPNTq
         wlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642605; x=1787247405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0pjwno30/VPREthOeV/FfuLHBxN0mxRR1HaGuVBAv0=;
        b=I+4em0zYciJpHUiNCWJ2P8IitaywlYJnkGLF4nQQjmWLhjQ3dMHNsx5M50CSuaS50K
         99twb6mLPaIm5QKNbs2BAVfNpepF65m/UXRkHrCyO3vuSuoDEtx8P7r3y+xgyWCQ/9xv
         7Jp7ZYROheGi8Zhh6KTSuK0j1sSSbmgzXRhNuH8FkfqLG0G1X/batSe01OdL04eeoEIU
         lwXS4msJBPZSFFhFt3ASeYsWkun7zK8AuET3rMNxr/muS0pYle6WjoIp+itP9eFipyAj
         JsDL68+rvfxPZx02PnhroaSfPF+de1g8NEF39rr9zDKnyOc9yfRkuCAwQ4iPNExy82J2
         vEBw==
X-Gm-Message-State: AOJu0YwLWbN0gF9YT3oQzhXb5vOUWyEBzr2mpt11f3UrKHRBUquqt/rj
	MOABM+MC63OFJhk1GE+nWDHev5qQMA/eznfoIVawseSrnoctGuCI7T4PnZCakBVje9s=
X-Gm-Gg: AR+sD13Z2/JqBCDpqV1VD8p1unlwSOQ27lA2Q7xeX2kidsghTsS4o4yY1h/I1fMKU3h
	p0bg4ejuq3DwjZB5WmUy8uDABJWxZrrEX+XPvqgJ5YhLuwdk4fjSWyhrXvo41xaJHGzkFRBblGh
	S+9N5kxV84S0nop6+DsyUNOD4HqlW/EV+qDWo1D2dbnCb12IuBsEHCLKVoT61pUTuk6ewKJoRcl
	1ybTnxxkYKLSsr+RSceaImM2kFd96v7BNIqsu+/a/BfOHbkBCljX+CKtYyeEA6koQIUQCqUQz8l
	cALKdLrINwznAsiUhw0TEEK74mtrSubHgnEcvAY8pwJHK4Vry1ACgrBBtfvBHyJUnOsd2gnLUKE
	R3x6MS3ic3u2tChPgZC4BJF4KkduTw9b3FWyzl+zjIjcwGT60TErisJ+AWVRROQ9qq3Iof4GL+w
	qYwdgrdGr7/hEW6F2PWxfEnb70NIfmEbfwbdGeCbDn/Dwvv31RDqphIl6ZkHDD+ksHS2/FZk0NZ
	u+2J5gECVrejml/LMt7WAtYnREsdp8NFthCEEUS4SXmXXVMW6UDUhK8
X-Received: by 2002:a05:6a00:8f0a:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84fc6e5b7f7mr8692156b3a.23.1786642605106;
        Thu, 13 Aug 2026 10:36:45 -0700 (PDT)
Received: from desktop.local (97-115-114-204.ptld.qwest.net. [97.115.114.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4565c86sm1269994b3a.12.2026.08.13.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:36:44 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [PATCH 2/5] facetimehd: add Kconfig and Makefile
Date: Thu, 13 Aug 2026 10:35:10 -0700
Message-ID: <20260813173516.29293-3-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813173516.29293-1-jackflusche@gmail.com>
References: <20260813173516.29293-1-jackflusche@gmail.com>
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

