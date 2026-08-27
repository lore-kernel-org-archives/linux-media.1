Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76A266576
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834061; cv=none; b=quQ1Jrj1BTreitHTmp1fOXZ9DqQugtQgTFT2aqTDoJrEIGjF9uuUnGgmINuyf2regIrYvGHK/7+m2PNKU4LO6ptCkYBKEoMfaNjEbtVcaouB9k0PM+Ym/i9KLmrx+k7PPwyi/+TC5BB1ReuxIvU152dNxX0GA3N8KKlBjPNyll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834061; c=relaxed/simple;
	bh=4prpn+2Wa8MKd+nNdnZRgP+Ou+qFTgzV9iggxYOWIbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pfbN2lwaJCQQpTOUoF55f+3FRMEJ3gyrDtN1Js/f4wNJDj9EO8P4d0DaKJ3wUdwu3X6bbFmG6DYTdw5/XVcz7B1a26TwITurrAYpdzsiF7JbYX9nLjHPn/k+CMdNNKcyw+tt9lejKUhhgJqkeahkf9xcqBdsfEi4iYa1ySTKM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHa044aa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHa044aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834060; x=1819370060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4prpn+2Wa8MKd+nNdnZRgP+Ou+qFTgzV9iggxYOWIbQ=;
  b=hHa044aaYwsEvew9h14vZcI0GTzq6nIi1MCouliicFVBQBv+Q/33B7+H
   lhZnPnvBGo57dy6fcSsXbIydr1e0MGonV62XZZQmagG3oMR47jXC4ZICA
   1tCdcWA7GzHIN258AR4tzprK3obw0/XtMNK/Li/QCiQJqhR+/dta0oAvP
   I6b+WcZAKo/TYYRxYDq/vlBxYIJZEb+PdaMYsmo1ns7Rr2evdK1tH9r3x
   oGz64RlphzSmh4zeVnMbRZTVfM9X3arlobgYOJHZtq72R0Wt4p1SO/aPY
   FqpUV5eLIjsksNBzt82UTWEBTppsFaf1rfwL/3+Xc5UXx25J/ddCwv1ri
   g==;
X-CSE-ConnectionGUID: iuYffXHuRM2W0/qI9TBaXg==
X-CSE-MsgGUID: VbLGyjI8RumiH9pNDr+tng==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188603"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188603"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:20 -0700
X-CSE-ConnectionGUID: b5eO3M2yTvCpQp7HxNVSYg==
X-CSE-MsgGUID: O7UyCwfIRZ2UkWhGTWF54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384406"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:18 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 15/44] media: ipu6: Add ipu7 cpd handling
Date: Thu, 27 Aug 2026 15:33:07 +0300
Message-ID: <20260827123336.2219048-16-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware format differs slightly between ipu6 and ipu7.
Add support for ipu7 firmware validation and handling.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 169 +++++++++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6-cpd.h |  43 ++++++
 2 files changed, 197 insertions(+), 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 966a16a300f8..8e59406a725c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -16,6 +16,7 @@
 #include "ipu6-bus.h"
 #include "ipu6-cpd.h"
 #include "ipu6-dma.h"
+#include "ipu7-mmu-hw.h"
 
 /* 15 entries + header*/
 #define MAX_PKG_DIR_ENT_CNT		16
@@ -62,6 +63,20 @@ static inline const struct ipu6_cpd_ent *ipu6_cpd_get_entry(const void *cpd,
 #define ipu6_cpd_get_metadata(cpd) ipu6_cpd_get_entry(cpd, METADATA_IDX)
 #define ipu6_cpd_get_moduledata(cpd) ipu6_cpd_get_entry(cpd, MODULEDATA_IDX)
 
+#define IPU7_CPD_BINARY_START_IDX	1U
+#define IPU7_CPD_METADATA_START_IDX	2U
+#define IPU7_CPD_BINARY_NUM		2U /* ISYS + PSYS */
+#define IPU7_CPD_METADATA_ATTR		0xa
+#define IPU7_CPD_METADATA_IPL		0x1c
+/*
+ * Entries include:
+ * 1 manifest entry.
+ * 1 metadata entry for each sub system(ISYS and PSYS).
+ * 1 binary entry for each sub system(ISYS and PSYS).
+ */
+#define IPU7_CPD_ENTRY_NUM	(IPU7_CPD_BINARY_NUM * 2U + 1U)
+#define IPU7_MAX_MANIFEST_SIZE	(SZ_4K * sizeof(u32))
+
 static const struct ipu6_cpd_metadata_cmpnt_hdr *
 ipu6_cpd_metadata_get_cmpnt(struct ipu6_device *isp, const void *metadata,
 			    unsigned int metadata_size, u8 idx)
@@ -309,39 +324,163 @@ static int ipu6_cpd_validate_metadata(struct ipu6_device *isp,
 	return 0;
 }
 
-int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
-			       unsigned long cpd_file_size)
+static struct ipu7_cpd_metadata *ipu7_cpd_get_metadata(const void *cpd, int idx)
 {
-	const struct ipu6_cpd_hdr *hdr = cpd_file;
-	const struct ipu6_cpd_ent *ent;
-	int ret;
+	const struct ipu6_cpd_ent *cpd_ent =
+		ipu6_cpd_get_entry(cpd, IPU7_CPD_METADATA_START_IDX + idx * 2);
 
-	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
-				    cpd_file_size);
-	if (ret)
-		return ret;
+	return (struct ipu7_cpd_metadata *)((u8 *)cpd + cpd_ent->offset);
+}
 
-	/* Check for CPD file marker */
-	if (hdr->hdr_mark != CPD_HDR_MARK) {
-		dev_err(&isp->pdev->dev, "Invalid CPD header\n");
+static int ipu7_cpd_validate_metadata(struct ipu6_device *isp,
+				      const void *cpd, int idx)
+{
+	const struct ipu6_cpd_ent *cpd_ent =
+		ipu6_cpd_get_entry(cpd, IPU7_CPD_METADATA_START_IDX + idx * 2);
+	const struct ipu6_cpd_ent *bin_ent =
+		ipu6_cpd_get_entry(cpd, IPU7_CPD_BINARY_START_IDX + idx * 2);
+	const struct ipu7_cpd_metadata *metadata =
+		ipu7_cpd_get_metadata(cpd, idx);
+	struct device *dev = &isp->pdev->dev;
+	u32 offset;
+
+	/* Sanity check for metadata size */
+	if (cpd_ent->len != sizeof(struct ipu7_cpd_metadata)) {
+		dev_err(dev, "Invalid metadata size\n");
+		return -EINVAL;
+	}
+
+	/* Validate type and length of metadata sections */
+	if (metadata->attr.hdr.type != IPU7_CPD_METADATA_ATTR) {
+		dev_err(dev, "Invalid metadata attr type (%d)\n",
+			metadata->attr.hdr.type);
 		return -EINVAL;
 	}
+	if (metadata->attr.hdr.len != sizeof(struct ipu7_cpd_metadata_attr)) {
+		dev_err(dev, "Invalid metadata attr size (%d)\n",
+			metadata->attr.hdr.len);
+		return -EINVAL;
+	}
+	if (metadata->ipl.hdr.type != IPU7_CPD_METADATA_IPL) {
+		dev_err(dev, "Invalid metadata ipl type (%d)\n",
+			metadata->ipl.hdr.type);
+		return -EINVAL;
+	}
+	if (metadata->ipl.hdr.len != sizeof(struct ipu7_cpd_metadata_ipl)) {
+		dev_err(dev, "Invalid metadata ipl size (%d)\n",
+			metadata->ipl.hdr.len);
+		return -EINVAL;
+	}
+
+	offset = metadata->ipl.param[0];
+	if (offset > IPU7_FW_CODE_REGION_SIZE ||
+	    bin_ent->len > IPU7_FW_CODE_REGION_SIZE - offset) {
+		dev_err(dev, "Incorrect binary size %u and offset %u\n",
+			bin_ent->len, offset);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int __ipu7_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+				    unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_ent *ent;
+	const struct ipu7_cpd_hdr *hdr = cpd_file;
+	unsigned int i;
 
-	/* Sanity check for manifest size */
 	ent = ipu6_cpd_get_manifest(cpd_file);
-	if (ent->len > MAX_MANIFEST_SIZE) {
+	if (ent->len > IPU7_MAX_MANIFEST_SIZE) {
 		dev_err(&isp->pdev->dev, "Invalid CPD manifest size\n");
 		return -EINVAL;
 	}
+	/* Sanity check for CPD entry header */
+	if (hdr->ent_cnt != IPU7_CPD_ENTRY_NUM) {
+		dev_err(&isp->pdev->dev, "Invalid CPD entry number %d\n",
+			hdr->ent_cnt);
+		return -EINVAL;
+	}
 
 	/* Validate metadata */
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
+		int ret = ipu7_cpd_validate_metadata(isp, cpd_file, i);
+
+		if (ret) {
+			dev_err(&isp->pdev->dev, "Invalid metadata(%d)\n", i);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int __ipu6_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+				    unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_ent *ent;
+	int ret;
+
+	ent = ipu6_cpd_get_manifest(cpd_file);
+	if (ent->len > MAX_MANIFEST_SIZE) {
+		dev_err(&isp->pdev->dev, "Invalid CPD manifest size\n");
+		return -EINVAL;
+	}
+
 	ent = ipu6_cpd_get_metadata(cpd_file);
 	ret = ipu6_cpd_validate_metadata(isp, cpd_file + ent->offset, ent->len);
 	if (ret)
 		return ret;
 
-	/* Validate moduledata */
 	ent = ipu6_cpd_get_moduledata(cpd_file);
 	return ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
 					    ent->len);
 }
+
+int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+			       unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_hdr *hdr = cpd_file;
+	int ret;
+
+	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
+				    cpd_file_size);
+	if (ret)
+		return ret;
+
+	/* Check for CPD file marker */
+	if (hdr->hdr_mark != CPD_HDR_MARK) {
+		dev_err(&isp->pdev->dev, "Invalid CPD header\n");
+		return -EINVAL;
+	}
+
+	if (IS_IPU7(isp))
+		return __ipu7_validate_cpd_file(isp, cpd_file, cpd_file_size);
+
+	return __ipu6_validate_cpd_file(isp, cpd_file, cpd_file_size);
+}
+
+int ipu7_cpd_copy_binary(const void *cpd, const char *name, void *dst,
+			 u32 *entry)
+{
+	unsigned int i;
+
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
+		const struct ipu7_cpd_metadata *metadata;
+		u8 idx = IPU7_CPD_BINARY_START_IDX + i * 2U;
+		const struct ipu6_cpd_ent *ent =
+			ipu6_cpd_get_entry(cpd, idx);
+
+		if (strncmp(ent->name, name, sizeof(ent->name)))
+			continue;
+
+		metadata = ipu7_cpd_get_metadata(cpd, i);
+		memcpy(dst + metadata->ipl.param[0], cpd + ent->offset,
+		       ent->len);
+		*entry = metadata->ipl.param[2];
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_cpd_copy_binary, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.h b/drivers/media/pci/intel/ipu6/ipu6-cpd.h
index e0e4fdeca902..b614ed0004bb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.h
@@ -98,8 +98,51 @@ struct ipu6_cpd_client_pkg_hdr {
 	u32 prog_bin_size;
 } __packed;
 
+/* IPU7 */
+
+struct ipu7_cpd_hdr {
+	u32 hdr_mark;
+	u32 ent_cnt;
+	u8 hdr_ver;
+	u8 ent_ver;
+	u8 hdr_len;
+	u8 rsvd;
+	u8 partition_name[4];
+	u32 crc32;
+} __packed;
+
+struct ipu7_cpd_metadata_hdr {
+	u32 type;
+	u32 len;
+} __packed;
+
+struct ipu7_cpd_metadata_attr {
+	struct ipu7_cpd_metadata_hdr hdr;
+	u8 compression_type;
+	u8 encryption_type;
+	u8 rsvd[2];
+	u32 uncompressed_size;
+	u32 compressed_size;
+	u32 module_id;
+	u8 hash[48];
+} __packed;
+
+struct ipu7_cpd_metadata_ipl {
+	struct ipu7_cpd_metadata_hdr hdr;
+	u32 param[4];
+	u8 rsvd[8];
+} __packed;
+
+struct ipu7_cpd_metadata {
+	struct ipu7_cpd_metadata_attr attr;
+	struct ipu7_cpd_metadata_ipl ipl;
+} __packed;
+
 int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src);
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev);
 int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 			       unsigned long cpd_file_size);
+int ipu7_cpd_copy_binary(const void *cpd, const char *name, void *dst,
+			 u32 *entry);
+
 #endif /* IPU6_CPD_H */
-- 
2.55.0

