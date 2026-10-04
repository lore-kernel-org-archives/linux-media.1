Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B749843F8CB
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116390; cv=none; b=QIorOE4IpdvVGVWsI1AITDKnGLN5d8cTdP7FYu8tETb/1v2HJ5Tqc/LE4hg2XjrONv7g1+EkPRWx4p2kb/4Tv0eTkM9D4VkjKczBVOOa+VSdSRoxt5B3qbAkzM3ngSWqURIONVgh+UUHB3hVT/6Qci6p8FpRkLt7nXJbk4xLht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116390; c=relaxed/simple;
	bh=FsKnLSE/pW8xRGPlzKiDk5/W7dq7hM9JvQWcRfmVQpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3GGEQpkCp/2pOQENHroIjQuDyXnQbMn0p7nHgSDyT9GSelJvC4mM8EpujXzy27DdkOnQjH2Vqrs3/Y2CD4cSmUOAcAiRHhHE2a41Cm5r2EJC3QZ1dNBw9c90lNibJx/VBFSUUFxeVLKK3lJmqxGbED3s2tZ8AwDycxqF1kzKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9W004Mw; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9W004Mw"
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5e2d54b77e7so113700e0c.1
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116385; x=1791721185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/CoubgPTdFpizEolPCPsMjR+glD3shZDgbgtoJ9Xu4=;
        b=C9W004MwP5b5LHk23LhwkkZHxrjWpLqTK1VuvCIMQ6QWc2NsRa2IzMDGsc255Xv1FP
         bqWScFyMCAynJXr2CiubP338XBXG8poxbdePOXZIEFe89Mx9XLksLAh4GMrDtdi8crXi
         KiDNK3xtsjA6Wru9bNwPkgdnuDFUo0AodtZmW23EhF5Fi/2jdUo+LxT2NYVINnYNJIyT
         NjxHQDd3+M2hg1CDCQi3vF/0yqMuPnX4KNSd0VjulH1aAKWXZa40jCWqa0bM5UV6hC3O
         MAidfrJukrrIlTVy1JKm3z8unVRkXKQ4JztoacUIBEtZh23h3UP9zqc//th55C0edtq2
         GMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116385; x=1791721185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/CoubgPTdFpizEolPCPsMjR+glD3shZDgbgtoJ9Xu4=;
        b=yD7kU0O9PEjVgRE+denKgivB+a02MMndT7YocaZagxqN3LhZdycu7HI7Yva509lpiq
         J/V1pNIUK1ftvfTEUUTwNvPBBy/FLjMd5+m3unzWslYzVWS4wyns5nLXfix4kAqvO2KA
         qenOuwApZzZK+H+/CPKaHfhLk2CqoAS5d0iLhMVFcMixyIz2R1IrLMByHlB68x38nri2
         sM2cuZAjzws6hc1u6fvg/NiX34VHIOyIsxvpusv6+3KLLe1pDROoLxIU3ZZmVwVnbUQ+
         7tYY/21CkXyV2zjwVsl+ufScYGxZCDKgjPIr9E4zqaDgQfckVotSNbikbZn9QcThLUTn
         SeYA==
X-Forwarded-Encrypted: i=1; AKwUvBzvhHi5qXgBG6ABWfzKOkPIvrc9bneC91mmU2GiFZYoQviwVITQS3Ia6U1wZ+penLOWDi8k2fHM/WSSww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPadR9ORSR6cn6tjQ1TCTJvgIl/WQbLLOkZMIjIggA0As8NL6c
	sf95x9KCirsiaRgXo45e2PEs+sSLU/y3ijsbxXUmF3tGGgVXU+u8RBnz
X-Gm-Gg: AYBFou06cZQMY5W5sOlsSXfHWOhyQBhzabk4P+dUAQOQSbQ+mYZGT3rjrBuQ7JxxYV5
	Ph6Zwn4hnu7B3MV4yf+dtLVCqRqs4cMEctfGpmnvc2ueCCiG2ebm4Tm+xZg6ttys/CPVW15jfTQ
	a8jWKcFOE3YR3GCuEI0VtBpCuCiBqOlS8vDpAhzCad6S9zS/b5ZwEe5NEKBDIrb9GqO+iVIFy3R
	IqvqbkPlDLhTqh9J/sYimLHLxjLSRLKBSMPx5Qq1kF7ygX67J/aM0BT5hSOLdQthtTiGry4X+Xu
	v0FHA+gTjedKYRvkpBU2lrei86EObLv8lpHK8n2iD1y/nSXByNsAazWaZ+RYM5dZ3syeZhco+vq
	M5civxMa4RayQ1U/2hnz4AW2EqQQZta71FUwvvlmMDJ/L3sR0aEQGIiEdX0z0ilBxHLULo7QZ3u
	MS+5i1X8xEOQHOuviGDeyjOStDDs3N2+nE1uCvC6V4Xnbte18nQaRHZ+mcFzDRfIwghs8lUXLt0
	ZqiHB3/tlbMRNzq4r7WkV4AChz2IFIQtCHGyS6GqLj7OnECT2+NaJX9DA==
X-Received: by 2002:a05:6102:80a5:b0:7c1:c1fa:f3e9 with SMTP id ada2fe7eead31-7c1c1fafb0dmr1213988137.22.1791116384857;
        Sun, 04 Oct 2026 05:19:44 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:1d37:6d7:739d:9d6d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b2f115fc9sm7780464241.10.2026.10.04.05.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:19:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
Date: Sun,  4 Oct 2026 09:19:31 -0300
Message-ID: <20261004121931.6746-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004121931.6746-1-festevam@gmail.com>
References: <20261004121931.6746-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add keymap for the Ruwido Z3 RC-34 remote control.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- None.

Changes since v1:
- Use RC_PROTO_NECX. (Sean)
- Use media prefix in the Subject.

 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c

diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index 38b84e34b225..525d203c0a94 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) += \
 			rc-msi-tvanywhere-plus.o \
 			rc-mygica-utv3.o \
 			rc-nebula.o \
+			rc-nec-ruwido-z3-rc34.o \
 			rc-nec-terratec-cinergy-xs.o \
 			rc-norwood.o \
 			rc-npgtech.o \
diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
new file mode 100644
index 000000000000..8a090772446d
--- /dev/null
+++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Keytable for the Ruwido Z3 RC-34 remote
+
+#include <media/rc-map.h>
+#include <linux/module.h>
+
+static struct rc_map_table nec_ruwido_z3_rc34[] = {
+	/* Ruwido Z3 RC-34, NECX address 0xe310 */
+	{ 0xe3100f, KEY_POWER },
+	{ 0xe31016, KEY_MENU },
+	{ 0xe3100a, KEY_UP },
+	{ 0xe3100b, KEY_DOWN },
+	{ 0xe3100d, KEY_LEFT },
+	{ 0xe3100c, KEY_RIGHT },
+	{ 0xe31019, KEY_OK },
+	{ 0xe3106a, KEY_BACK },
+	{ 0xe31033, KEY_INFO },
+	{ 0xe31066, KEY_DISPLAYTOGGLE },
+	{ 0xe3101a, KEY_VOLUMEUP },
+	{ 0xe31010, KEY_VOLUMEDOWN },
+	{ 0xe31013, KEY_MUTE },
+	{ 0xe31032, KEY_CHANNELUP },
+	{ 0xe31031, KEY_CHANNELDOWN },
+	{ 0xe31069, KEY_HP },
+	{ 0xe31000, KEY_NUMERIC_1 },
+	{ 0xe31001, KEY_NUMERIC_2 },
+	{ 0xe31002, KEY_NUMERIC_3 },
+	{ 0xe31003, KEY_NUMERIC_4 },
+	{ 0xe31004, KEY_NUMERIC_5 },
+	{ 0xe31005, KEY_NUMERIC_6 },
+	{ 0xe31006, KEY_NUMERIC_7 },
+	{ 0xe31007, KEY_NUMERIC_8 },
+	{ 0xe31008, KEY_NUMERIC_9 },
+	{ 0xe31030, KEY_NUMERIC_0 },
+	{ 0xe31065, KEY_RED },
+	{ 0xe31063, KEY_GREEN },
+	{ 0xe31064, KEY_YELLOW },
+	{ 0xe3106b, KEY_OPTION },
+	{ 0xe31050, KEY_PLAY },
+	{ 0xe31057, KEY_REWIND },
+	{ 0xe31058, KEY_FASTFORWARD },
+	{ 0xe31060, KEY_PROG1 },
+	{ 0xe31061, KEY_PROG2 },
+	{ 0xe31062, KEY_PROG3 },
+
+	/* RC-34 remote volume keys */
+	{ 0x3506, KEY_VOLUMEUP },
+	{ 0x3507, KEY_VOLUMEDOWN },
+
+	/* McIntosh HR070 remote volume keys */
+	{ 0xca5542, KEY_VOLUMEUP },
+	{ 0xca5543, KEY_VOLUMEDOWN },
+};
+
+static struct rc_map_list nec_ruwido_z3_rc34_map = {
+	.map = {
+		.scan     = nec_ruwido_z3_rc34,
+		.size     = ARRAY_SIZE(nec_ruwido_z3_rc34),
+		.rc_proto = RC_PROTO_NECX,
+		.name     = RC_MAP_NEC_RUWIDO_Z3_RC34,
+	}
+};
+
+static int __init init_rc_map_nec_ruwido_z3_rc34(void)
+{
+	return rc_map_register(&nec_ruwido_z3_rc34_map);
+}
+
+static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
+{
+	rc_map_unregister(&nec_ruwido_z3_rc34_map);
+}
+
+module_init(init_rc_map_nec_ruwido_z3_rc34)
+module_exit(exit_rc_map_nec_ruwido_z3_rc34)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
+MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index f167c37179c8..290919a7247e 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
 #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
 #define RC_MAP_NEBULA                    "rc-nebula"
+#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
 #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
 #define RC_MAP_NORWOOD                   "rc-norwood"
 #define RC_MAP_NPGTECH                   "rc-npgtech"
-- 
2.43.0

