Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAD330E0D5
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 05:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785562671; cv=none; b=WZSAxC7iRsPj7wMg3rDGq5wKWYj2Tm6hhc+D00TYmwz5TkXGx+6YU5j2WNB/A/eDDV++DcfErmJB25rb/HTVaGGzS712KYl/bAyIbqoOkQC1j3I8fFg09thdKkbwSZL8z3A8i0BBMXFiiAewe6VOGM9W1alJ+moweNQRv4EEIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785562671; c=relaxed/simple;
	bh=/bF7uGXr9I1sPRoDjPc2jF8sU2yNXfPno4I6+A2v6+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSWeIifIlftFRYoO952ZQpCmAixtEW7dcF3Ehmk+SO7ZvJgmieWswBGGbp6RprLvWRCfc6tNNx6n4+ha9mVj8kx3G0Li6SI8OeO+MUkVF7VsJlrzIldwIdwRmSSwnLcXdRfVTu7YtdMlk6Yw9tuX5yLUwNDzlebXFATRfz9sIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1ipBVYD; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1ipBVYD"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4560d6f82edso1073436fac.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 22:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785562667; x=1786167467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7naUL68gT+h+kPY6A9pQiMXc0qOFWe9rutL/giM7fs=;
        b=s1ipBVYDqiKGi7IgTqjknR8kvUB/vSD8psTECyZshWL/wZKMDgZEhN46RxFDvwc2hT
         CZ2jeNQh0EBT2HBweMIy3UFOxdI7ob8ug3K6zB0wX1NE4R1yb5p+mp/BVHffSbddDQLB
         bhfepnffs7b3WKmeBG+ZKvEK57d19PGwN7gGeXm/KaLY4R2pF2/qVNHKU0xzNmHkvMjD
         YGuFLQrvYGSqxWJtLDaqCswcXv8Wes7gdrQ7USF0gJAzMOaXUAyhG3E6QRqqlz7R1joM
         2eEaxNO87ZGtiu+ZAMZzAzd/VkGDUH9cwQYKBRm8IILR6bzv/MbMi3aDJDkZZFJfFnfe
         J/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785562667; x=1786167467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7naUL68gT+h+kPY6A9pQiMXc0qOFWe9rutL/giM7fs=;
        b=LikH43se0v9tdMXZ/aOP4g0d3xOsiDcJfHyriOV2pFfiFVkdAfX6IyPrQiA+VRr1ya
         aWPOzM51EtiAU/WpHB0yd9Bj4dSps4+fMBydwDQ91gEg1xQjHb6BJcguIY8QUqUiGS5N
         kf2BoW74d773kLqWmgIE6UDnCfNhmqnmzO5vin6U4+O++NAJ6/ud9vwrxmf3Cr3seZIP
         ijhd7E9V/BSIzEIHU6UQllSRqIknICafaotZTkp8e1hDowv+AlbqHdgkeTfY8mYYJxFs
         dy2adGA08XoZTCUlgTDtKiDpvaxVcwfqRlLMhyb9aMnGWWs0L7mqXa5QgJI2xYvcMAKT
         cytg==
X-Gm-Message-State: AOJu0YzSj8kqqlUQjzi30r6mx50KHcXYvT4F6W7pP5I8P2V0oUsLgCGb
	WawJiFFs8/7faZhgmz7bCglKNbexh88iBsp222GhOK6i6vyVZETKshsF1fl2Hw==
X-Gm-Gg: AR+sD11bPY+kQLlkYnv1SLzMGKItSv/Pf5/Ym5J+Js80RRmYgSNhZs4pDiaRxpidWCQ
	JLTCH+W8PTcgq4jz0peTPTnI8z6vrFL2sgGWtYcg65hKEfv4fmz+shwCYs7g1v5Tx6iKNgmX9ZB
	SK9fqxtBeVPnjIIdVHonEzBgYMPrPRctC31LiZDgeIO1v8uRc9tpTgQ46ztpsYz7o/MEio6BppU
	N4QfnG9pKN3oKcrgXwwj4iwr1cLWUdNTJbXmRB3IPYGo2RW3oMjM6XKtvNxe4XvCQAVsY7OH4Ov
	kcameHSrWKR9iqaKPq6cCqPg2jOirhd4VbAB9tqgwpncFlW7oiZFnc74t/aIfbAMHJDgDeARjmR
	n1Ew7fVpaZSZbcrTAszEaBfewa15/7OPGIEeiap2A/cqSTo717Z4rip53cu+ctWRNspWkeLX51Q
	1qvlWOVg8kzROnBiR6u2X6fzhPvUL2u4Lz1bqW/WzTAeROwAZkBgANLDrwkMWp4ULVLWiVBgvKO
	EEfEr9g0sme8wHNf/g+Ie39zUtP61iEcv4iJErA
X-Received: by 2002:a05:6870:2192:b0:448:604c:bc63 with SMTP id 586e51a60fabf-45905f176e3mr5173991fac.18.1785562666701;
        Fri, 31 Jul 2026 22:37:46 -0700 (PDT)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f664d884sm3144695fac.12.2026.07.31.22.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:37:45 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH] media: hws: fix device info register field masks
Date: Sat,  1 Aug 2026 01:37:41 -0400
Message-ID: <20260801053741.805829-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The baseline driver decodes the device version from bits 15:8 and the
sub-version from bits 23:16 of HWS_REG_DEVICE_INFO. The current masks
decode both fields one byte too low, reading the device version from a
byte the baseline driver ignores and the sub-version from the device
version field.

hws_configure_hardware_capabilities() uses the device version to
classify the hardware generation. An incorrect version can classify
newer hardware as legacy, select the legacy capture path, and skip
HWS_REG_DMA_MAX_SIZE programming.

Correct both field masks and update the register layout documentation.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws_pci.c | 4 ++--
 drivers/media/pci/hws/hws_reg.h | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 30bb7d34465b..75be77d6c197 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -33,8 +33,8 @@ static unsigned long long hws_elapsed_us(u64 start_ns)
 }
 
 /* register layout inside HWS_REG_DEVICE_INFO */
-#define DEVINFO_VER GENMASK(7, 0)
-#define DEVINFO_SUBVER GENMASK(15, 8)
+#define DEVINFO_VER GENMASK(15, 8)
+#define DEVINFO_SUBVER GENMASK(23, 16)
 #define DEVINFO_YV12 GENMASK(31, 28)
 #define DEVINFO_HWKEY GENMASK(27, 24)
 #define DEVINFO_PORTID GENMASK(25, 24) /* low 2 bits of HW-key */
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
index e4fb4af44434..ac607360d628 100644
--- a/drivers/media/pci/hws/hws_reg.h
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -121,9 +121,10 @@
 #define HWS_REG_DEVICE_INFO   (CVBS_IN_BASE +  88 * PCIE_BARADDROFSIZE)
 /*
  * Reading this 32-bit word returns:
- *   bits 7:0   = "device version"
- *   bits 15:8  = "device sub-version"
- *   bits 23:24 = "HW key / port ID" etc.
+ *   bits 7:0   = unused by the baseline driver
+ *   bits 15:8  = device version
+ *   bits 23:16 = device sub-version
+ *   bits 27:24 = HW key (port ID in bits 25:24)
  *   bits 31:28 = "support YV12" flags
  */
 
-- 
2.43.0
