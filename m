Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B455C4A261F
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200362; cv=none; b=RuQqDB/C0GoFIkDQYnlItU/O5VOL7Fe92MlB2hA75cm9CT1sY5jbNnxRNvlMVWD3c+pIRY6we9q0sW6y9n4/CWXJL9Ph7MXiJKrDzRPuadWZY4M7UXHwq3Y26XmJRqhxf1s9pDaJpqRMy7LX5MW3bVbvL8h2zvDCmwl5mzFteaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200362; c=relaxed/simple;
	bh=BNErPJFItjdmNqkCy5QarfwFjClYdyv4WlBIvJKkr6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvXv/ppLyKhH2glCibTz1vZkZgJiG8g8jZtsKoJH7XqsD7xeyp0YpaYLzwvF//2LcuADGDdM/BwUa++OpqWAeZhcY/unbUbHoWCt2ezIvKtFXRC54VPu23iGmIXoInGr87HbM0sKuvtS8Fpf3c+XJRuV8scT1FNGdso41QLdwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iq+BJ66D; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq+BJ66D"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48433f36a21so116404f8f.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200359; x=1788805159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwCJrHtvcffMrHWjLqVlY+8cLXvhynbdWqJIBifJ6ts=;
        b=Iq+BJ66DjJOduTrXSzoz52ZtNDPtc1oyFwOaMXkbRJz9xR8qIZbP6PhVICNHcoYNZq
         jVHGvWrGfdZqVsF0qWnWs92eGegZBYmV36s01yS4YRhjFhadbR60ZF0bk24JlJ6ibm85
         K0P0x4Lem78KOb6r+5wlqA65MzL1SYqgEnM9/JsxSnlM8yHW3Ymz7aexfzGH9yTzHgHL
         jlFe8c7ZW4GfPaTpy3jpYGzPkgG8o52pLFl3UEAwAEhQ26r0Ctytnpzn5BvY59Qw8Kym
         Dkfx2S3YMgF/wYnNQ0RHofB1pqYvc1h7DhqZOQjVhmOVWvggCYMUAdd+sqG5CeXpdcNU
         vChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200359; x=1788805159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwCJrHtvcffMrHWjLqVlY+8cLXvhynbdWqJIBifJ6ts=;
        b=DbpWC284XSSo7NJCpZxUnMv1XkNWoXgWnv+5p7ILNeydXw63bkHaERNo+U56ciitKM
         GSzBAZN28ubcAdKj1DeNKc131Menjd1lc0uRbLJ1qcUxGDGF/5W4Dn1bNVZ0zE/GLrKf
         Y6vcPK9VoJK/oqGjDjtYjSX+EmyoxbJSi5xowoxBPf7IT8+4Q0kPBNcJc0LlJsrpue2Y
         nzw8zF2/zMW+659PtRdpfbWp5e44HlP49a8OYMED9s6t85D6NTm3CM28pAQvNRqSuYp0
         fwNnYC6MyJ6HtViHUV/7jS9AD5HDe8OmStNXOtmNYem+L11Ta01UpGN+nuCtLz89Gk5v
         P4HA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Q3BAl5znjIjO3I4HojTkAW/zKQosq0UlBv1/5v6ZnAfuTnzI7JW2auam8GKPJ7/KvsFu99iGG2PHTA==@vger.kernel.org
X-Gm-Message-State: AFuF++mf1a05od0x2K3374hhFDu5KRYL0mz4wdqFp+YDXcqBOgtow9JB
	uq2yuVdm5PwanCCXNcajcopsEmTG7Y6TldN8+oc3eL+f5K85E5/k38Nf
X-Gm-Gg: AR+sD12BfRrsqc7w2GDZ9gnIuy2vifyUlYIL2PVAA8DKh0kKXzIny1oKGNAe1I/175E
	hnZDiXbBPMNg/T9TPdkSG8Hhn7DGXG/lwEFFR0fJytNhC6O2+tpQwrOnwbs6HUSenuqUbHo08WJ
	T48dmIgfIWmov9f8HsZDYeiry4q7+nIa8tOmX94qBydPTR0I9aCA0QlyTBBx3/BBlcWor2LKlaS
	Jp+mwiuG6NlwDy5SsZaBMKLwIlckCwcPTY7ekqMbrIdGQ+jsX8zAIYvcncb5/mPwA88hv3AhfKi
	C/YDudPqkwVJpPizD/WHawVLF3RhG74id30s/ooF8UHU67lxiWxuJdVFe1SiU/vySSYJexBmnew
	YnOBoDLJve0lMovhi+/9v2jC/vylHpAN+fqbiR05E7wb6ILwacIxXbwAJU1tvg45H6l+3kGAT/r
	rAuc+LKKTBXCiz8CfBlk1GYk7WCu+yhIDEWqGneQlsTNUhC76IKjXW1rO4C4SuCZDcxdLgJMZKs
	UPxzQT5vinq
X-Received: by 2002:a05:600c:6819:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cdd41ca5amr3351055e9.6.1788200358770;
        Mon, 31 Aug 2026 11:19:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:18 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 5/6] media: ipu-bridge: Match sensor configs per IPU and add config flags
Date: Mon, 31 Aug 2026 20:18:57 +0200
Message-ID: <20260831181858.325109-6-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sensors need different treatment depending on which IPU they are
connected to, so the sensor's ACPI HID alone is not always enough to
describe what the bridge has to set up.

Add an optional IPU PCI product ID and a set of flags to struct
ipu_sensor_config, along with an IPU_SENSOR_CONFIG_MATCH_FL() macro to
define such an entry. A config naming a PCI product ID only applies to
that IPU and takes precedence over a generic config for the same sensor,
so that a sensor covered by both is connected once, through the more
specific entry. Existing entries are unchanged and keep matching any IPU.

No flags are defined yet and no entry uses the new macro, so there is no
functional change.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           | 29 +++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index cd3c36d44..38ad3e54e 100644
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
@@ -853,6 +854,32 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	return ret;
 }
 
+/*
+ * Whether a sensor config applies to the IPU the bridge sits on. A config
+ * naming a PCI product ID only applies to that IPU, and takes precedence over
+ * a generic config for the same sensor, which is skipped so that the sensor is
+ * not connected twice.
+ */
+static bool ipu_bridge_config_matches(const struct ipu_sensor_config *cfg,
+				      struct ipu_bridge *bridge)
+{
+	unsigned int i;
+
+	if (cfg->pci_id)
+		return cfg->pci_id == bridge->pci_id;
+
+	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
+		const struct ipu_sensor_config *sp =
+			&ipu_supported_sensors[i];
+
+		if (sp->pci_id && sp->pci_id == bridge->pci_id &&
+		    !strcmp(sp->hid, cfg->hid))
+			return false;
+	}
+
+	return true;
+}
+
 static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 {
 	unsigned int i;
@@ -862,6 +889,9 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
+		if (!ipu_bridge_config_matches(cfg, bridge))
+			continue;
+
 		ret = ipu_bridge_connect_sensor(cfg, bridge);
 		if (ret)
 			goto err_unregister_sensors;
@@ -948,6 +978,7 @@ int ipu_bridge_init(struct device *dev,
 		sizeof(bridge->ipu_node_name));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
+	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
 	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
 
 	ret = software_node_register(&bridge->ipu_hid_node);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 61e10cef1..d12e51336 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -17,13 +17,27 @@
 #define IPU_SENSOR_ROTATION_NORMAL		0
 #define IPU_SENSOR_ROTATION_INVERTED		1
 
-#define IPU_SENSOR_CONFIG(_HID, _NR, ...)	\
-	(const struct ipu_sensor_config) {	\
-		.hid = _HID,			\
-		.nr_link_freqs = _NR,		\
-		.link_freqs = { __VA_ARGS__ }	\
+/* Flags for struct ipu_sensor_config */
+#define IPU_BR_FL_NONE				0
+
+/*
+ * Sensor config specific to a single IPU, identified by its PCI product ID,
+ * with flags describing what the sensor needs on that IPU. Where both a
+ * specific and a generic (IPU_SENSOR_CONFIG) entry exist for the same HID,
+ * the specific one takes precedence.
+ */
+#define IPU_SENSOR_CONFIG_MATCH_FL(_HID, _ID, _FLAGS, _NR, ...)	\
+	(const struct ipu_sensor_config) {			\
+		.hid = _HID,					\
+		.pci_id = _ID,					\
+		.flags = IPU_BR_FL_##_FLAGS,			\
+		.nr_link_freqs = _NR,				\
+		.link_freqs = { __VA_ARGS__ }			\
 	}
 
+#define IPU_SENSOR_CONFIG(_HID, _NR, ...)			\
+	IPU_SENSOR_CONFIG_MATCH_FL(_HID, 0, NONE, _NR, __VA_ARGS__)
+
 #define NODE_SENSOR(_HID, _PROPS)		\
 	(const struct software_node) {		\
 		.name = _HID,			\
@@ -132,6 +146,9 @@ struct ipu_node_names {
 
 struct ipu_sensor_config {
 	const char *hid;
+	/* IPU PCI product ID this config is specific to, 0 for any */
+	const u16 pci_id;
+	const u32 flags;
 	const u8 nr_link_freqs;
 	const u64 link_freqs[MAX_NUM_LINK_FREQS];
 };
@@ -177,6 +194,8 @@ typedef int (*ipu_parse_sensor_fwnode_t)(struct acpi_device *adev,
 
 struct ipu_bridge {
 	struct device *dev;
+	/* PCI product ID of the IPU, 0 if it is not a PCI device */
+	u16 pci_id;
 	ipu_parse_sensor_fwnode_t parse_sensor_fwnode;
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
-- 
2.43.0

