Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60F4A1E04
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359047; cv=none; b=fTPDrPas/ZpahrZjK9vRaEA2K1HypTI8Qz3KrBFEsmpwoCaHAiJ6jxC8PYJ3Ks81ZyMFtQ0ct1CPvEihx63frhfaaq2uM4x8AVkKIBnU8US3cmm2bmntfJIyL2ttnYlQ+JWAzjs7Qc4Nk5QjUUz28pEA2eWO0P1Y4RfrfNLh9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359047; c=relaxed/simple;
	bh=dn5lfqglA93Cf4DCouOkQx4zA8810nNbg54kpC3NCv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY0KuWir/QbkHS+Q1rq/r2/7CU4cHKsqtMC1pjeiYehg5emRkKZWcW35eJMzuOw0ZeEZ4VgF/7kphH3HrzEtnbJ3+BllBkUu5+/sYw0xi38sYRWNiglm32mD6MbkcYw3yN0hsurz4JdzyNAkUZyYFMWoaTmfhpF+PH590gudmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljT5ewZv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljT5ewZv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso17957105e9.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359044; x=1788963844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw0rLiQuiue9t66DwgUiBZvqp9/daLkRFkCzFJ0WIrM=;
        b=ljT5ewZvUuDWIOMeIIVre3afgQ1rVhR5YL3fqa16FjHo/pVzApQwZrZveHnHgkF1i3
         GlwWb9KimhGRyvk3bqxADfvO3Otx/sBrxzeZwFgixoGRBRF2aZ4a2/q1Uge5GDV02q6W
         CQ95Ls8BCG2YfxaXKJ2UDZRSfeR+c4b0Zyf7HK2kHEBXM7eKaQtiQkB4AxOwJxoG8I3V
         NHMLRQCN92H31QB+eV5ob8HuYhiFOTFva8kZLohJ4jDUrIqXJDgjbzcTDkoTc5hDrGWQ
         Acj6L5qlqKNbi2rljfW+fNCIMq7HTFxepq//IL0v4fX2MLxzKme/Z5UccBL7pMI2Z7T/
         OQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359044; x=1788963844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw0rLiQuiue9t66DwgUiBZvqp9/daLkRFkCzFJ0WIrM=;
        b=nBvx9l7AwlOPkmUjQeJukfp0psxkWdJBlnLnjDM3mkrQ8JG9JIz4rwpsAWuImLGlED
         e0XAEqm3mrEiyasVkLinF4NnM5N39FriCIeA11Y7JjqAy7+e6dRyrBXD6nEprsKw7InZ
         JPWY3V6NCHAxsk2D41diMpu/aZ7HfjUX+sMsBNtp03rucJ4sO1N40BO9SIUJnNVIqCtN
         Pd/mEJybFEyT8QTlIxoDC5NnAx1k30h64rymzgG9BllcPbjBfn0TNZ5UUx57PYLr2GAk
         R/LmuPoLajPqNlXrrhJUDjklBSmZpuuDu3CRBl1cEs5xXaNSq4kvHG6ucPzAKSwqEPL6
         Q1AA==
X-Gm-Message-State: AFuF++ka8X3Z+64MxYfcy3EzyrpHHbJc8wS0avbheWH/P7aW9mZ/1n15
	YI/k11sMlsU9Qicp01vGPmzBqCryJV4PfV/78UCO24FHkMaKLOXnQTePKFn4Rw==
X-Gm-Gg: AR+sD10vUmFkMTsE6HngynPz7z7cCL66JOVMEYa6h2acqAQGYbjoXsCwGt760HSphp/
	dlTX+B+OUEJ4FdV433yqujUERHtHTXol1ZLUfqfof+/t5NG4G7yRhkdNvmoOEvgVg123pog2V6n
	3ouDgDwVaZqJBTxVab6Kogf8Qi//fl3ebghXfZBDEaEY1eteHdAugrtzqLBxFiNPOUkIpZEGiPh
	FF7sM4qWmH8tC013syxGady4lAySwlkvqjOi6FdyF12pTf2n0wo5O/O1uW0Htbt0wdc+h9COsNx
	YXbLyLamgehfRNU5j4oz0LrDE/8kRMVLHrJ7C2DhoXN8cJqDSC6Oo+VG3aDJNOGruPcuL6Kox6l
	6k79pf6bKWS7MZ+hiJYGa6Xke5DdfG3244ig8ZcMD22gGENuLAy5qgRTWuDknXk2hpIUUj44EID
	p+dIXt5Gx1tLZEQPzSCodoKDF+Kr1BAJBeTuo98kmOwEtxvEfk+kSRvTrxYbL2ULpXDouC+qCNp
	2MHc2tC1mwGZGu5XSL98X+u7SXL2UaAsNCjqCe0G0t5h/+7lG4HhJxSPYc=
X-Received: by 2002:a05:600c:3485:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49ce7c26ecfmr39084775e9.5.1788359043774;
        Wed, 02 Sep 2026 07:24:03 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:24:03 -0700 (PDT)
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
Subject: [PATCH v5 5/7] media: ipu-bridge: Assign endpoint property indices dynamically
Date: Wed,  2 Sep 2026 16:23:19 +0200
Message-ID: <20260902142322.73523-6-fernandorimoli11@gmail.com>
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

Index the ep_properties array dynamically instead of plain numerical
values as is done in mipi-disco-img.c.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
---
 drivers/media/pci/intel/ipu-bridge.c | 27 ++++++++++++++-------------
 include/media/ipu-bridge.h           | 19 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 131c70844..eb7d1611b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -451,6 +451,7 @@ static void ipu_bridge_create_fwnode_properties(
 {
 	struct ipu_property_names *names = &sensor->prop_names;
 	struct software_node *nodes = sensor->swnodes;
+	unsigned int i = 0;
 
 	sensor->prop_names = prop_names;
 
@@ -508,21 +509,21 @@ static void ipu_bridge_create_fwnode_properties(
 			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 	}
 
-	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
-					sensor->prop_names.bus_type,
-					V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
-	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(
-					sensor->prop_names.data_lanes,
-					bridge->data_lanes, sensor->lanes);
-	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(
-					sensor->prop_names.remote_endpoint,
-					sensor->local_ref);
+	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
+		PROPERTY_ENTRY_U32(names->bus_type,
+				   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
+	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_DATA_LANES)] =
+		PROPERTY_ENTRY_U32_ARRAY_LEN(names->data_lanes,
+					     bridge->data_lanes, sensor->lanes);
+	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_REMOTE_EP)] =
+		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
+					 sensor->local_ref);
 
 	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac7654..06701d151 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -64,6 +64,23 @@ enum ipu_sensor_swnodes {
 	SWNODE_COUNT
 };
 
+enum ipu_bridge_ep_props {
+	IPU_BRIDGE_EP_BUS_TYPE,
+	IPU_BRIDGE_EP_DATA_LANES,
+	IPU_BRIDGE_EP_REMOTE_EP,
+	IPU_BRIDGE_EP_LINK_FREQUENCIES,
+	IPU_BRIDGE_EP_NUM_OF,
+	IPU_BRIDGE_EP_NUM_ENTRIES
+};
+
+/*
+ * Get the index of the next property in a property array, with a given maximum
+ * value.
+ */
+#define IPU_BRIDGE_NEXT_PROPERTY(index, max)		\
+	(WARN_ON((index) > IPU_BRIDGE_##max) ?		\
+	 IPU_BRIDGE_##max : (index)++)
+
 /* Data representation as it is in ACPI SSDB buffer */
 struct ipu_sensor_ssdb {
 	u8 version;
@@ -141,7 +158,7 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
-	struct property_entry ep_properties[5];
+	struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
 	struct property_entry ivsc_properties[1];
-- 
2.43.0

