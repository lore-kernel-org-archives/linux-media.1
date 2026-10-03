Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4337F72F
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993005; cv=none; b=q19jmZk0Moiy+lMl7gID1Z4cfgYT7Pc0h2zYOkW123Np1vSsNyAr30KP9DHdbxN6dty9IQ6GQvXmn81DW/NLHcCaHpzMjbu+dY7vHhhRaO31IZm+TFYMciaXdo/QivdRPyLG1pU3/RW3iQvYADI6h6FOIo0vHnlruPx/ME5jkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993005; c=relaxed/simple;
	bh=Oo7iFCsWgd1/0XYyOFF3WnVNRUhkxJd9ISmdDyp8p28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQlW17KrSAxQd75W8GUQ/HQhZoAWhAfJWcvp5NkUat6nYGO9r6ld54M+2mgz1z+c/AZ9/wpSxHyRIE4/UyzWa8UbcZYPRFNRa1mD9xKFNI8YQcDG3NediRdpx55Rps7grSED+N/G6igcH7ueZpk/DY58U4/CnS1tKIgnoet3ixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEH85zfA; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEH85zfA"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7a6e560f580so115576137.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 19:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790992999; x=1791597799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lSxuDWtcpxCnWeooDXtbfbm5yCmDSN/hvU5qo3jSo20=;
        b=VEH85zfAPu+za08RAFBtbUeOzU1KIiifbMXZngIGYGe/TZVf8wg2SqT/mW0ePOi4QL
         NFntvuJ7Vl33PkFvE/CmCmt+0IG2/gXoPZM6kgx2GFDBpZUCV64GnrpZ9bniV16vaieG
         rB0Fg8vgAgkt9g/teLkBQh8Hezq/ZlK8/+MiCWsgqKULHlOAGd4bJ9XpBI7I6MNFjkcX
         wOuPrBfevPSfT+y5o+HL+0+PybZK5wqtknUQN6oy0wM8m+BUX6gQfTnVp1lPZMWf4IF5
         +xkAwqzXj0QqT14j0iDYTyFjxWvNB4jNhjNw5xLT7W7VoZtu2EWuZH1pI/gpjTMVzNhG
         Ezyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790992999; x=1791597799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSxuDWtcpxCnWeooDXtbfbm5yCmDSN/hvU5qo3jSo20=;
        b=h7kJtJavaZsfeev79nbqLscN59+eN1qs21tLP6OphVf/p8D5ARRks0rbQBMXG2rKxM
         qinbZnG7JfYdFnrfCxSNd3VHkt/NKE6OW9zzN/jg8NDqCOLylLjYvFJN5i1CrY5rRX5m
         9+2SjVoLTZqP/bmg4CNtYgPYsIlL3OBdm8Y8Lr0l3YYMyfbqjZ+oVwUQKDYRXk73lS1r
         S7NudZ4A0jBZis81vgYBeeg2vX1H2rksmLlmu4/AOOC4ZBANw8z5sRAXzIOitAibNRoT
         r9SFxpJIfMYhomky4/51ZvHP0p2rMDLb9aryGy7mJutDvIrftdPe0b+/AkO6/CKYhrhO
         P5hw==
X-Forwarded-Encrypted: i=1; AKwUvBwxRvu6qYBgY/KAXyoqoF3TZavLv9gH34Nsijw4qNHN1KFFKXnFxlNxwfLgTIXONG9G3C2AE8e1+fHBPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqHHuUpZ8M5dnK+iTyBiGuaH5FtLQIBEJ8Nf9c/gjJLcpIC7IV
	DoagsoVLnvzCUa5dXyOQrWrkdIyfOKvgbK/cAbnE6nvyk2E01w+uvyiD/ZyDyw==
X-Gm-Gg: AYBFou3AhsyYwXM9D29dxgEjd08eyHM4S0syTsHnYA9CEeDQ2jCLOh87BEZQUzfCSXp
	HDREV4lo2tRR0kCkqe/Md2UDblq1o3uWhlw/iscWCzhrMzAqzI8r4LxWxMA1GAM9MtmHxEs3poA
	amMxd/ySt5rb6R+Cgttu7G4ih0kBX4KGY6HCzrrdjSnAWkZjfmbIOETJtwT6QW9tNPylbcSwgrG
	rEHSZ2cdcL+d3dUMRINnVI8FWBgVTPnSuLMcDIVIAviu9SOaWYUt4BxSUOERD/CrWt6nTpBb9zp
	IKNmt/OsEZ/x4ddU7AP8x73hO4QmAFC4I4JjEAKOn/4PxmVjuh4UvVimwX7+FSSsdLdShZgiAwB
	Ai+zB2bnRIv3DQw6uqSVoqILWEgRyhKUYU+7ya3MyexXuyaD5P/0GPn20I/L1UbXG2aTs3Iecym
	6kXV++jZv6SD9APf8dlSVUcWz6rOpTIWVZFYZ/KnG0zo6NdDCzfI5R7pIH1ROE6WmtEfeP74mqJ
	xumqSp3l1tD7uvKA/d6kj+NM/nhXQl8Ifpshc1wEkS+Cg==
X-Received: by 2002:a67:e709:0:b0:7a0:3902:52d7 with SMTP id ada2fe7eead31-7c23f6aafebmr393920137.0.1790992999403;
        Fri, 02 Oct 2026 19:03:19 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:e44d:bc3:a2c4:9ce0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c100a5c965sm4085223137.12.2026.10.02.19.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 19:03:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] rc: Add keymap for Ruwido Z3 RC-34 remote
Date: Fri,  2 Oct 2026 23:03:09 -0300
Message-ID: <20261003020309.11749-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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
index 000000000000..97d416cf0441
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
+		.rc_proto = RC_PROTO_NEC,
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
