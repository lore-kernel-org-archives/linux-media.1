Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8A21D3F5
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062213; cv=none; b=iBC5Ttf8bXYuBTq8OrGk9/n7q0ow74dXXOtQdygIOo8k3vuNMhMK0iB9RFaGkxUl/ZuzLyvJ7QnbeyGxmJeGhP3aqo0SNSd1hEW+n948TJnW/ntqmNtx4zg5WZd/S3NEo4Q168eCce1Hvu5Orunvu5ssc5NfnYxxrtGfoKaimO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062213; c=relaxed/simple;
	bh=YF6S8kj16m0PGKKMGbtq8A/6TSIKU3NATksXRfK3hDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxP0UJtyznBjxMDnDF03d7hF1oujQ2WmHd9Ar5+jbi8HC15xDe2GHFTzvfxKYvi9jNeyHQ8e9+MpbH/TFX0Y3TLIUyzWHqer034ZIypFBpM/TnlgaXC9r6rM/FhLa260AKCV2UtxU27BY0W2GPGRCTCuUPghskU9DPyjBMZ51yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRrmdHQy; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRrmdHQy"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5da029a1749so796969e0c.0
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791062210; x=1791667010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCjLGYk7/FWCc5lrfAE1chxOoz+weFAXmXg3n/KZkTY=;
        b=kRrmdHQyEORdk3BZ9IJnETlYMSQRMgpDQsMpsYk835PF6qgw2wreQOT9kM8Rx/3M8G
         7rws8LkUPCw5xd0wznaX8xlEKR2MCQC7weV58VnTgcsWffWnLrtUVWC8PRP6xr1Xe7EE
         gx7f0Sk1IJpcdwJOsV3yXDJBWeHXXXT5sKSD/lMKBPSmJoO6Bkwf7dr0LZMzI0nb35Nq
         qeIuFn3GyJbv5Gy/Sw3xeAKwkbF8QlSE+7amwJcTrplKvr7UL85qBPuO+9csBnzYrTZ+
         LqVINR2nO6bSDRG42qyiMuNFxnV2XiSRGdf4dmhwpAN6KeypKulq4zrYGAnELgEWgAB9
         gZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062210; x=1791667010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCjLGYk7/FWCc5lrfAE1chxOoz+weFAXmXg3n/KZkTY=;
        b=raHbDbNuWwESgwQbx1rUESAfYtWjy8953JtnSU+YBgcYYVx+iqDvMM+uU7J7wuQmnB
         g7Ft8qw75AGTZiC/h985DI64EIrtIJQfMT4G5lafQ0HRKEU/hFnWcqUSodr8emVaLv//
         qdA6h+BcVamj0q/taRgt4zj3P1yke+gD/Qgiib4u8mDdKxfsGxoqr1wgPtCirKne62bq
         wA0yKuGVDYRckLOXcz7FjN+Qtk3aAju6YX9ckIPrbvWMw5j7K9bMez7YpGl6RSkJGO0i
         XlagAG/SfB7UEqOKuUmT2z+BThYviNNPmeOxt2Ifx/OlvK8mL0IaN7Jm1JTkN0hywR2U
         4NxA==
X-Forwarded-Encrypted: i=1; AKwUvBxlJWOjYapnVNhQMHuKU2+jpNVjzAnZDK9EF43LNANA7uJncDh1yKV8l8pYC48n9kFUyEtC4YbcIC3+Yw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL36vvohqi69wHb21qJXia5/3//5m+wjj3+QwTKLjq5q9nKN1Vp
	GLHxVescJmGmtGBHqvnV25yC1YGARsDDd1JtsxWp6OJcIIMsjOcXL8Mo6rYMCA==
X-Gm-Gg: AYBFou0mIv2IYb6LsY1VREoObOO3Khuc4agMKYhRuXwyiGTBYpMVxV46t1RUGayox1G
	qlK37A3Tvah8rNG3YZyTd4lCy507EwLFQRw6OC9GeSbcMu6UYxRpyQdtQaFxojUOmXcahuWaYaF
	Etz2u/g0BtZsVvCsEJxsX1F2Gzg26yHpkwnqvO0klN/tsA1RkRI2EOtYPgf3Jm+TEwUhxqxaqtb
	LLmwK9LiIuc+oMKawp+mjBU9K15CVPiZJaumlLCs6YB+Q7T9WjG/Sn6BerkgJI7t2pKVz1/XXZK
	MeLkYiiHGnHm2IKGg88ZjVF8Lg/o5GPXRvgjnq2AzcpTcT0GySkKCTaK0vOKgF3hQRKDNi/2NOH
	1/S95Jf4OI81YzzocKpeSGtFm+nGsjQOZBcB/bGfOXStezgJ2Nn5FMzIHPGIrT9En2wEUNWYhhz
	86s1RdsuKBx5XVF8Puw8acQcx8c7779raYlQP+a3P80Gnn/CYqTLaO7VQgqQrSonipSc+2+ofdM
	jMkFScOiD+6ChNffAFRaW72k9r0dFyyVUNiFu6FnuqZQY7tPHMDFHW45Q==
X-Received: by 2002:a05:6102:6c7:b0:7c3:8ae6:d7ab with SMTP id ada2fe7eead31-7c38ae6ea31mr199359137.5.1791062210214;
        Sat, 03 Oct 2026 14:16:50 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:d915:e941:f0c4:82f6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ff5c4f06sm6017025137.3.2026.10.03.14.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:16:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
Date: Sat,  3 Oct 2026 18:16:39 -0300
Message-ID: <20261003211639.23194-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003211639.23194-1-festevam@gmail.com>
References: <20261003211639.23194-1-festevam@gmail.com>
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

