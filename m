Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64E4A3F2C
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359053; cv=none; b=ehjQq5RPYkrxBrSb9FiSPNjmNiuM3EMI42uzXIjAdqxjitVafuD7x5lGsl4Ia1IOwx5Xr8K+irCUvIk8UEP9clliJTMyNlSB79jnS2CXzuTTRqX0rN+7pqrIoIYxSBoHU8h7iA7+C1ZsMburX5fI7uVXc5ANiijxaG3VhsBQmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359053; c=relaxed/simple;
	bh=oBxlFptKem+KpXxrIbNTiYDFtt+gGdaL+7vQwWccpoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9MyVfD8db3YK8j9fvt4RTXEC64tGeMJ2t7hLlsu9GEPQa+5XEKG+s07LnzRrOlsP3ByCMAPlE3shijV5+8A7HTRwtPsQy6qdFixsTad2ifOvcqFADzL6mu96Hp8o62WyelepKvLF2RUcpGPPEXDU2iZ6ngn0sy4kBmZQL7Wb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icgBMhe5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icgBMhe5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso10990595e9.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359049; x=1788963849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B/kcq/oQaNYThkEivmQMh6hAFUzMhpSs6Yp0oogSCA=;
        b=icgBMhe5f9Pg8mES8sF0a8bGR6+iKeKe2RrlyVnog/B3XBKJ9yYGN0JoIZrf1Aegfi
         o0nNh/qDvSVFqxbw6mijaMPjnFKj3V4CEj+F8Sti854ZErMynPt4qnAi3foGn5LTdzSt
         HQLxP7RJ3be/4XfSVneaK2ASNeHLA4JXpVMyDqqovGglEWg1zlkHRn5AUpqQ++VXFHEr
         IVpfPof/x8HDbm55mvCyNayF2sj4qYDRIv1gi2iL15vRVxn0QuaAN41WKI1wHOR2nCmo
         sp2monm2m9rRipAr1OO3Rfqol84OWqoNRgMCDD3pN2ZJEwjub/nqiHxjlsXLJYEQ2krm
         71bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359049; x=1788963849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4B/kcq/oQaNYThkEivmQMh6hAFUzMhpSs6Yp0oogSCA=;
        b=rg6WcXRYJUjNqTNSJ9WSNENbUieVPf+OGJzLsIY9MtJg0Rm8z5O01kr53PxjBsQIHv
         fagh3Z6RH3L1UcjjER4ycR+MuYP/Z28ZZnltqGA4quFcHoLkhFBbt19IILj/b+RzeJXp
         5b2wIOwTf8nNatF/mB2pP7hVZ7kIqZDaHL8GC7oZDvHZxTexQqybO6ZvQWdYReS6/AbZ
         H/pXbFMKrjBTLInDG7s8T+aCSFXnxrZoanHjJzzO7cHpKG2F99MTBb5gILm4qeMqmArz
         LQyGsdf18jSttripWEzVMQ2SZSdEIMT4CcehlmxUOPbUWaKCYWZDEA+qNZ66hTRPzyyT
         xmHQ==
X-Gm-Message-State: AFuF++ml3pdMEqCUwyg7AtIliyJx7vaoPv7cVB7s40pA/BJUs+PLtklp
	PlTX78t6TY0BwB0sausi1QNsQ5DhXghwRiXcPp3xdNT02/Iy2hjhHiiGqhe09A==
X-Gm-Gg: AR+sD12LII7RLMxIJM3cUsXMBrfsIt1l2zwG/SMA9qbZfXOTY6FMLaewQQ4rReqxxkk
	hUQyVvetsK9HKTvdvn164ZC/8sFXrCxKkMGm8YBC2va1sLm38Qn2oJsd8dgb0IILV1W+Yoo5JFq
	BKLMPXVsLPm8LRf9yg+xQqZkoPxhwiBDn6NVHgBiP1U2QzfGI7RtJxtw03BA7XpAFafnJQ8MjtH
	TWha8Ysq1pw33mGMQlzuohTAAXhyRCjdxw3fFih12TUoTFBHL5WGXXXPK1FsG3BdDNa0oXSdiNJ
	D/X736JILYbLbue6R7BZ4TO6tg6kv1S4ZuQAppWFSm8ihX4hoh5NZCG1YX8NRcCXJebs11ZENoy
	A/mDIWGixBPC2EH5vBScrEbpOyM1bBN0xqeXSxxytFN9Y+WXMtauenPkktzc+1S997fpYWdHtOq
	VlI1gzVv4dkhTrIWk1OW7HcP1gReihukCjemNStVaLblrbztcta77FqUkt3ioEO5Manztvf+r3g
	bojfQC95I+3GanHwo+ci++DBYrwijOXaGVdR3fFpHh2kYYNGXky5k/iTV0=
X-Received: by 2002:a05:600c:3f06:b0:49c:ee1c:d582 with SMTP id 5b1f17b1804b1-49cee1cd69emr1761085e9.14.1788359047796;
        Wed, 02 Sep 2026 07:24:07 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:24:07 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Lucas Lis <lucaseze.lis@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 6/7] media: ipu-bridge: Match sensor configs per IPU and add config flags
Date: Wed,  2 Sep 2026 16:23:20 +0200
Message-ID: <20260902142322.73523-7-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sensors need different treatment depending on which IPU they are
connected to, so the ACPI HID alone is not enough.

Match on an optional list of IPU PCI product IDs. Entries for one HID
must be adjacent, IPU-specific ones first, so the generic entry is
skipped once a specific one has matched.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
---
 drivers/media/pci/intel/ipu-bridge.c | 35 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           | 26 +++++++++++++++++----
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index eb7d1611b..5efdcb9c8 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,6 +8,7 @@
 #include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -853,8 +854,28 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	return ret;
 }
 
+/*
+ * Whether a sensor config applies to the IPU this bridge sits on. A config
+ * listing PCI product IDs only applies to those IPUs.
+ */
+static bool ipu_bridge_config_matches(const struct ipu_sensor_config *cfg,
+				      struct ipu_bridge *bridge)
+{
+	const u16 *id;
+
+	if (!cfg->pci_ids)
+		return true;
+
+	for (id = cfg->pci_ids; *id; id++)
+		if (*id == bridge->pci_id)
+			return true;
+
+	return false;
+}
+
 static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 {
+	const char *done_hid = NULL;
 	unsigned int i;
 	int ret;
 
@@ -862,9 +883,22 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
+		/*
+		 * Entries for one HID are adjacent, IPU-specific ones first,
+		 * so the generic entry is skipped once a specific one has
+		 * matched and the sensor is not connected twice.
+		 */
+		if (done_hid && !strcmp(cfg->hid, done_hid))
+			continue;
+
+		if (!ipu_bridge_config_matches(cfg, bridge))
+			continue;
+
 		ret = ipu_bridge_connect_sensor(cfg, bridge);
 		if (ret)
 			goto err_unregister_sensors;
+
+		done_hid = cfg->hid;
 	}
 
 	return 0;
@@ -948,6 +982,7 @@ int ipu_bridge_init(struct device *dev,
 		sizeof(bridge->ipu_node_name));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
+	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
 	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
 
 	ret = software_node_register(&bridge->ipu_hid_node);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 06701d151..aca76ff71 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -17,13 +17,24 @@
 #define IPU_SENSOR_ROTATION_NORMAL		0
 #define IPU_SENSOR_ROTATION_INVERTED		1
 
-#define IPU_SENSOR_CONFIG(_HID, _NR, ...)	\
-	(const struct ipu_sensor_config) {	\
-		.hid = _HID,			\
-		.nr_link_freqs = _NR,		\
-		.link_freqs = { __VA_ARGS__ }	\
+/*
+ * Sensor config specific to one or more IPUs, identified by their PCI product
+ * IDs, with flags describing what the sensor needs there. Entries for one HID
+ * must be adjacent in ipu_supported_sensors[], with the IPU-specific ones
+ * before the generic one.
+ */
+#define IPU_SENSOR_CONFIG_MATCH_FL(_HID, _IDS, _FLAGS, _NR, ...)	\
+	(const struct ipu_sensor_config) {				\
+		.hid = _HID,						\
+		.pci_ids = _IDS,					\
+		.flags = _FLAGS,					\
+		.nr_link_freqs = _NR,					\
+		.link_freqs = { __VA_ARGS__ }				\
 	}
 
+#define IPU_SENSOR_CONFIG(_HID, _NR, ...)				\
+	IPU_SENSOR_CONFIG_MATCH_FL(_HID, NULL, 0, _NR, __VA_ARGS__)
+
 #define NODE_SENSOR(_HID, _PROPS)		\
 	(const struct software_node) {		\
 		.name = _HID,			\
@@ -132,6 +143,9 @@ struct ipu_node_names {
 
 struct ipu_sensor_config {
 	const char *hid;
+	/* Zero-terminated list of IPU PCI product IDs, NULL for any IPU */
+	const u16 *pci_ids;
+	const u32 flags;
 	const u8 nr_link_freqs;
 	const u64 link_freqs[MAX_NUM_LINK_FREQS];
 };
@@ -177,6 +191,8 @@ typedef int (*ipu_parse_sensor_fwnode_t)(struct acpi_device *adev,
 
 struct ipu_bridge {
 	struct device *dev;
+	/* PCI product ID of the IPU, 0 if it is not a PCI device */
+	u16 pci_id;
 	ipu_parse_sensor_fwnode_t parse_sensor_fwnode;
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
-- 
2.43.0

