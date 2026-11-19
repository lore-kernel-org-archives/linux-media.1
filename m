Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102728;
	b=N+x09ulLMHRz+qF8GFBxaVrJ6BSoeGivccidg31DbEa54Mkujj7o/VuAic1wzPX3BVKy
	 Lo/9OeA7ncXBilg5q1LUH7PHOOcfI8aje1s8YnhOOrB0GTD0oQWmJL3v/PCU12vKUc10Z
	 sz7r0tJqQgxNa1B4GqPfGIM5ZoAvixL5heflxHvbKeW4lo8WHD//CZLXSaja3CQIuFcI1
	 bhwYoSPY4WO7jytClMUXgwhv+sKub10MjiH1c+fpKKH7vrWCcrCP6lMD8bj9LqQR6wW02
	 IOGN6mYKqFSmLgqo1LmqmTj5Rb0H94rwYCYJgjVPLLus0zMihNZ06jxxkDck1ugsfGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102728;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=daNrK7FWHiMT3f7MaGMEXwhUz/CP7udAT2Dcelol6I4=;
	b=RyiCXK6cgETVNPsy4aE6BgVvz66AJQdHFQAHLZVaZNt0Z7f9VYPUU1OdY2iIEl/KauL6
	 24Z9TKg//a76VveNnsjVv/X56AveEs0VFO8qHIIZlDR+K5c/OqRVy7faYJBtEwsasyFqv
	 3mJoMdG9BPC1GR05xrmtSmooKTKkauhPKDjiOrp/Me97oZV57zVnHXhkhKETKF8sEhFAC
	 HdzaYsdEOPLPIpss2kcbP6ivXcEybJm2//cUCQJnjh5ZTxK5A1esCYWMtph+N2pTOHphu
	 +HMM/98Y2iwgAKTSq/5TwP9jLUPApQx7JUSahxrCxzCAdxBHTEvyEt0ze3H6BeuiqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oKwvfdxJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D644260A6F5B;
	Thu, 19 Nov 2026 15:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D644260A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oKwvfdxJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B1761CC4;
	Thu, 19 Nov 2026 07:38:42 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FA953F882;
	Thu, 19 Nov 2026 07:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102725; bh=jUCaHPIrNJkyRTaYQgg7unWLLsLVhWDqTOFIXiHywaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oKwvfdxJb4/M5Y86yl1H+mmTJQXg3T9fAwaAzpX+NPHDBD9qpnwZHjJ0q/HxQej9M
	 2RxdXm3RuEOpSCO0A2G0qbdjign2UXG190i6YeF5fSIYkVVkf6U5F+9mxnqj0edszG
	 nnvUj3eZLcwwbDgbpd8/dhiSZuZSJTKhc9s1PfGY=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 10/28] media: mali-vpu: add firmware cache infrastructure
Date: Thu, 19 Nov 2026 15:37:40 +0000
Message-ID: <20261119153758.1426673-11-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a per-device cache for VPU firmware binaries and wire its lifetime
into probe and remove paths. Key cache entries by codec, session role
and compatible firmware major version, and load new entries asynchronously
through the firmware loader.

Validate the firmware and host protocol versions from the firmware
header and derive the number of text, private BSS and shared BSS pages.
Notify registered waiters when loading completes while retaining each
binary through cache, loader and caller references. Failed entries are
evicted immediately.

For now, keep the cache policy deliberately simple: a background thread
periodically prunes entries that are only held by the cache itself.
This is intentional for initial upstreaming, so lifetime and
concurrency behavior stays easy to reason about before adding a
smarter eviction policy.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../platform/arm/mali-vpu/mali-vpu-device.h   |   3 +
 .../arm/mali-vpu/mali-vpu-firmware-cache.c    | 461 ++++++++++++++++++
 .../arm/mali-vpu/mali-vpu-firmware-cache.h    | 172 +++++++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    |  16 +-
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |   3 +
 6 files changed, 656 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 0716a2b0c8712..74e1455c01d8b 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -9,6 +9,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-vb2.o \
 		mali-vpu-formats.o \
 		mali-vpu-controls.o \
-		mali-vpu-mmu.o
+		mali-vpu-mmu.o \
+		mali-vpu-firmware-cache.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
index 20361df05bdcd..a35c1b901aa3f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -14,6 +14,7 @@
 struct clk_bulk_data;
 struct v4l2_m2m_dev;
 struct mali_vpu_variant;
+struct mali_vpu_fw_cache;
 struct reset_control_bulk_data;
 
 /**
@@ -38,6 +39,7 @@ enum mali_vpu_session_role {
  * @v4l2_dev: V4L2 device structure for mali vpu.
  * @vdev_dec: Video device structure for decoder.
  * @m2m_dev: V4L2 mem2mem device structure for mali vpu.
+ * @fw_cache: Firmware cache for sharing or reusing firmware blobs.
  */
 struct mali_vpu_dev {
 	struct device			*dev;
@@ -53,6 +55,7 @@ struct mali_vpu_dev {
 	struct v4l2_device		v4l2_dev;
 	struct video_device		*vdev_dec;
 	struct v4l2_m2m_dev		*m2m_dev;
+	struct mali_vpu_fw_cache	*fw_cache;
 };
 
 #endif /* __MALI_VPU_DEVICE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
new file mode 100644
index 0000000000000..746d30f179305
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/delay.h>
+#include <linux/kthread.h>
+
+#include "mali-vpu-device.h"
+#include "mali-vpu-firmware-cache.h"
+#include "mali-vpu-mmu.h"
+#include "mali-vpu-protocol-def-v3.h"
+
+#define MALI_VPU_FW_CACHE_CLEANUP_INTERVAL_MS 30000
+
+#define MALI_VPU_GET_MAJOR_VERSION(ver) (((ver) >> 16) & 0xFF)
+
+static inline bool mali_vpu_test_bit_le32(u32 bit, const __le32 *addr)
+{
+	return !!(le32_to_cpu(addr[bit >> 5]) & BIT(bit & 0x1F));
+}
+
+static void mali_vpu_fw_bin_release(struct kref *ref)
+{
+	struct mali_vpu_fw_bin *bin = container_of(ref, struct mali_vpu_fw_bin, refcount);
+
+	/* cache_link must already be detached before final put */
+	WARN_ON_ONCE(!list_empty(&bin->cache_link));
+
+	if (bin->fw)
+		release_firmware(bin->fw);
+
+	kfree(bin);
+}
+
+static int mali_vpu_fw_build_name(char *name, size_t name_sz,
+				  const struct mali_vpu_fw_key *key)
+{
+	const char *role_str = NULL;
+	const char *codec = NULL;
+	int n;
+
+	if (!name || !name_sz || !key)
+		return -EINVAL;
+
+	if (key->session_role != MALI_VPU_DECODER)
+		return -EINVAL;
+
+	role_str = "dec";
+
+	if (key->codec_fourcc == V4L2_PIX_FMT_H264)
+		codec = "h264";
+
+	if (!codec)
+		return -ENOENT;
+
+	n = snprintf(name, name_sz, "arm/mali-vpu/v%u/%s%s.fwb",
+		     key->fw_ver_major, codec, role_str);
+	if (n < 0)
+		return n;
+	if ((size_t)n >= name_sz)
+		return -ENAMETOOLONG;
+
+	return 0;
+}
+
+static int mali_vpu_fw_parse_header(const struct firmware *fw,
+				    struct mali_vpu_fw_bin *vpu_fw_bin)
+{
+	const struct mali_vpu_fw_header *header;
+	u32 header_fw_ver_major;
+	u32 fw_version, text_length, bss_start, bss_bitmap_size;
+	u32 master_rw_start, master_rw_size;
+	mali_vpu_mmu_va va;
+	u32 i;
+
+	/* Validate the fw binary */
+	if (fw->size < sizeof(*header)) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"firmware bin too small: %zu bytes, need at least %zu\n",
+			fw->size, sizeof(*header));
+		return -EINVAL;
+	}
+
+	header = (const struct mali_vpu_fw_header *)fw->data;
+
+	fw_version	= le32_to_cpu(header->fw_version);
+	text_length	= le32_to_cpu(header->text_length);
+	bss_start	= le32_to_cpu(header->bss_start_address);
+	bss_bitmap_size	= le32_to_cpu(header->bss_bitmap_size);
+	master_rw_start	= le32_to_cpu(header->master_rw_start_address);
+	master_rw_size	= le32_to_cpu(header->master_rw_size);
+
+	if (text_length < sizeof(*header) ||
+	    text_length > fw->size) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"invalid firmware text length: %u\n",
+			text_length);
+		return -EBADMSG;
+	}
+
+	if (bss_bitmap_size > ARRAY_SIZE(header->bss_bitmap) * 32) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"invalid firmware BSS bitmap size: %u (max %zu)\n",
+			bss_bitmap_size, ARRAY_SIZE(header->bss_bitmap) * 32UL);
+		return -EBADMSG;
+	}
+
+	/* Firmware version mismatch */
+	header_fw_ver_major = MALI_VPU_GET_MAJOR_VERSION(fw_version);
+	if (header_fw_ver_major != vpu_fw_bin->key.fw_ver_major) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"firmware major version mismatch: expected %u, got %u. Binary ver: %#x\n",
+			vpu_fw_bin->key.fw_ver_major, header_fw_ver_major, fw_version);
+		return -EINVAL;
+	}
+
+	/* Match host<->firmware communication protocol version */
+	if (header->protocol_major != MALI_VPU_HOST_PROTOCOL_MAJOR ||
+	    header->protocol_minor > MALI_VPU_HOST_PROTOCOL_MINOR) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"firmware protocol version mismatch: expected %u.%u, got %u.%u\n",
+			MALI_VPU_HOST_PROTOCOL_MAJOR, MALI_VPU_HOST_PROTOCOL_MINOR,
+			header->protocol_major, header->protocol_minor);
+		return -EINVAL;
+	}
+
+	vpu_fw_bin->header = header;
+
+	/* Calculate number of pages needed for the text segment. */
+	vpu_fw_bin->text_page_count = DIV_ROUND_UP(text_length, MALI_VPU_PAGE_SIZE);
+
+	/* Calculate number of pages needed for the BSS segments. */
+	vpu_fw_bin->bss_page_count = 0;
+	vpu_fw_bin->shared_bss_page_count = 0;
+
+	va = bss_start;
+	for (i = 0; i < bss_bitmap_size; i++) {
+		if (va >= master_rw_start &&
+		    va < (master_rw_start + master_rw_size))
+			vpu_fw_bin->shared_bss_page_count++;
+		else if (mali_vpu_test_bit_le32(i, header->bss_bitmap))
+			vpu_fw_bin->bss_page_count++;
+
+		va += MALI_VPU_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static void mali_vpu_fw_notify_event_list(struct list_head *event_list,
+					  struct mali_vpu_fw_bin *bin,
+					  bool same_thread)
+{
+	struct mali_vpu_fw_event *event, *tmp;
+
+	list_for_each_entry_safe(event, tmp, event_list, link) {
+		list_del_init(&event->link);
+		event->fw_bin_ready(bin, event->arg, same_thread);
+	}
+}
+
+static void mali_vpu_fw_request_done(const struct firmware *fw, void *context)
+{
+	struct mali_vpu_fw_bin *vpu_fw_bin = context;
+	const struct mali_vpu_fw_header *hdr;
+	LIST_HEAD(local_event_list);
+	int ret = 0;
+
+	mutex_lock(&vpu_fw_bin->cache->lock);
+	mutex_lock(&vpu_fw_bin->lock);
+
+	if (!fw) {
+		ret = -ENOENT;
+		vpu_fw_bin->fw = NULL;
+	} else {
+		ret = mali_vpu_fw_parse_header(fw, vpu_fw_bin);
+		if (ret) {
+			release_firmware(fw);
+			vpu_fw_bin->fw = NULL;
+		} else {
+			vpu_fw_bin->fw = fw;
+		}
+	}
+
+	/* We have to notify waiters in failure or success case */
+	vpu_fw_bin->load_status = ret;
+	vpu_fw_bin->state = ret ? MALI_VPU_FW_BIN_FAILED : MALI_VPU_FW_BIN_READY;
+
+	/*
+	 * Take a local copy of events/waiters
+	 * so that notify callback can be called outside vpu_fw_bin->lock
+	 */
+	list_splice_init(&vpu_fw_bin->event_list, &local_event_list);
+
+	if (ret) {
+		/* Firmware load failed, remove cached entry */
+		list_del_init(&vpu_fw_bin->cache_link);
+		kref_put(&vpu_fw_bin->refcount, mali_vpu_fw_bin_release); /* Drop cache-ref */
+	}
+
+	mutex_unlock(&vpu_fw_bin->lock);
+	mutex_unlock(&vpu_fw_bin->cache->lock);
+
+	/*
+	 * Keep the loader-owned reference until all waiters have been notified
+	 * and completion logging has finished. Callbacks may release their
+	 * caller-owned reference to vpu_fw_bin; on a load failure, the cache
+	 * reference has also already been dropped.
+	 */
+	mali_vpu_fw_notify_event_list(&local_event_list, vpu_fw_bin, false);
+
+	if (ret) {
+		dev_warn(vpu_fw_bin->cache->dev, "firmware load failed: %s (status=%d)\n",
+			 vpu_fw_bin->filename, ret);
+	} else {
+		hdr = vpu_fw_bin->header;
+		dev_info(vpu_fw_bin->cache->dev, "firmware loaded: %s\n", vpu_fw_bin->filename);
+
+		dev_dbg(vpu_fw_bin->cache->dev,
+			"firmware info: Version %.*s, MVE Protocol Version %u.%u,\n",
+			(int)sizeof(hdr->fw_version_str), (const char *)hdr->fw_version_str,
+			hdr->protocol_major, hdr->protocol_minor);
+		dev_dbg(vpu_fw_bin->cache->dev,
+			"firmware info: \"%.*s\", Rasc jmp = %#x, text_length=%u, bss=%#x\n",
+			(int)sizeof(hdr->info_string), (const char *)hdr->info_string,
+			le32_to_cpu(hdr->rasc_jmp),
+			le32_to_cpu(hdr->text_length),
+			le32_to_cpu(hdr->bss_start_address));
+		dev_dbg(vpu_fw_bin->cache->dev,
+			"firmware info: text pages=%u, shared bss=%u, bss pages=%u\n",
+			vpu_fw_bin->text_page_count, vpu_fw_bin->shared_bss_page_count,
+			vpu_fw_bin->bss_page_count);
+	}
+
+	/* Notification and logging are complete; drop loader-owned reference */
+	kref_put(&vpu_fw_bin->refcount, mali_vpu_fw_bin_release);
+}
+
+static struct mali_vpu_fw_bin *
+mali_vpu_fw_bin_create(struct mali_vpu_fw_cache *cache,
+		       const struct mali_vpu_fw_key *key,
+		       struct mali_vpu_fw_event *event,
+		       bool *call_now)
+{
+	struct mali_vpu_fw_bin *vpu_fw_bin;
+	int ret;
+
+	vpu_fw_bin = kzalloc_obj(*vpu_fw_bin);
+	if (!vpu_fw_bin)
+		return ERR_PTR(-ENOMEM);
+
+	/* One cache-owned reference while binary is in cache->fw_bins */
+	kref_init(&vpu_fw_bin->refcount);
+	/* One caller-owned reference returned by this get(). */
+	kref_get(&vpu_fw_bin->refcount);
+
+	vpu_fw_bin->cache = cache;
+	vpu_fw_bin->key = *key;
+	vpu_fw_bin->state = MALI_VPU_FW_BIN_LOADING;
+	vpu_fw_bin->load_status = -EINPROGRESS;
+	mutex_init(&vpu_fw_bin->lock);
+	INIT_LIST_HEAD(&vpu_fw_bin->cache_link);
+	INIT_LIST_HEAD(&vpu_fw_bin->event_list);
+
+	ret = mali_vpu_fw_build_name(vpu_fw_bin->filename,
+				     sizeof(vpu_fw_bin->filename), key);
+	if (ret) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"could not build fw name: fourcc=%#x, role=%d, version=%#x\n",
+			key->codec_fourcc, key->session_role, key->fw_ver_major);
+		goto err_put_caller_cache;
+	}
+
+	list_add(&vpu_fw_bin->cache_link, &cache->fw_bins);
+
+	/* One loader-owned reference while firmware is being loaded */
+	kref_get(&vpu_fw_bin->refcount);
+
+	ret = request_firmware_nowait(THIS_MODULE, true, vpu_fw_bin->filename,
+				      cache->dev, GFP_KERNEL, vpu_fw_bin,
+				      mali_vpu_fw_request_done);
+	if (ret)
+		goto err_put_loader_caller_cache;
+
+	/*
+	 * Serialise adding event to the event_list and firmware load completion.
+	 * For fast callback where firmware load is completed before this thread can
+	 * queue the event to the event_list for notification.
+	 */
+	mutex_lock(&vpu_fw_bin->lock);
+	if (vpu_fw_bin->state == MALI_VPU_FW_BIN_LOADING)
+		list_add(&event->link, &vpu_fw_bin->event_list);
+	else
+		*call_now = true;
+	mutex_unlock(&vpu_fw_bin->lock);
+
+	return vpu_fw_bin;
+
+err_put_loader_caller_cache:
+	kref_put(&vpu_fw_bin->refcount, mali_vpu_fw_bin_release); /* Loader ref */
+	list_del_init(&vpu_fw_bin->cache_link);
+
+err_put_caller_cache:
+	kref_put(&vpu_fw_bin->refcount, mali_vpu_fw_bin_release); /* Caller ref */
+	kref_put(&vpu_fw_bin->refcount, mali_vpu_fw_bin_release); /* Cache ref */
+	/* Binary freed in release callback */
+	return ERR_PTR(ret);
+}
+
+static bool mali_vpu_fw_key_match(const struct mali_vpu_fw_key *a,
+				  const struct mali_vpu_fw_key *b)
+{
+	return a->codec_fourcc == b->codec_fourcc &&
+	       a->session_role == b->session_role &&
+	       a->fw_ver_major == b->fw_ver_major;
+}
+
+static struct mali_vpu_fw_bin *mali_vpu_fw_find_locked(struct mali_vpu_fw_cache *cache,
+						       const struct mali_vpu_fw_key *key)
+{
+	struct mali_vpu_fw_bin *bin;
+
+	list_for_each_entry(bin, &cache->fw_bins, cache_link) {
+		if (!mali_vpu_fw_key_match(&bin->key, key))
+			continue;
+		if (!kref_get_unless_zero(&bin->refcount))
+			continue;
+
+		return bin;
+	}
+
+	return NULL;
+}
+
+int mali_vpu_fw_cache_get(struct mali_vpu_fw_cache *cache,
+			  const struct mali_vpu_fw_key *key,
+			  struct mali_vpu_fw_event *event)
+{
+	struct mali_vpu_fw_bin *bin;
+	bool call_now = false;
+	int ret = 0;
+
+	if (!cache || !key || !event || !event->fw_bin_ready)
+		return -EINVAL;
+
+	/*
+	 * The callback may run synchronously before this function returns if
+	 * firmware loading has already completed. In that case, same_thread is
+	 * true. Otherwise, the firmware loader invokes it asynchronously with
+	 * same_thread set to false.
+	 *
+	 * The event must remain valid until the callback runs. Every call that
+	 * returns 0 owns one reference to the binary supplied to the callback;
+	 * the caller must release it with mali_vpu_fw_cache_put()
+	 */
+	INIT_LIST_HEAD(&event->link);
+
+	mutex_lock(&cache->lock);
+	bin = mali_vpu_fw_find_locked(cache, key);
+	if (!bin) {
+		bin = mali_vpu_fw_bin_create(cache, key, event, &call_now);
+		if (IS_ERR(bin)) {
+			ret = PTR_ERR(bin);
+			goto unlock_cache;
+		}
+	} else {
+		mutex_lock(&bin->lock);
+		if (bin->state == MALI_VPU_FW_BIN_LOADING)
+			list_add(&event->link, &bin->event_list);
+		else
+			call_now = true;
+		mutex_unlock(&bin->lock);
+	}
+
+unlock_cache:
+	mutex_unlock(&cache->lock);
+
+	if (ret)
+		return ret;
+
+	if (call_now)
+		event->fw_bin_ready(bin, event->arg, true);
+
+	return 0;
+}
+
+void mali_vpu_fw_cache_put(struct mali_vpu_fw_bin *bin)
+{
+	kref_put(&bin->refcount, mali_vpu_fw_bin_release);
+}
+
+static void mali_vpu_fw_cache_prune(struct mali_vpu_fw_cache *cache)
+{
+	LIST_HEAD(prune_list);
+	struct mali_vpu_fw_bin *bin, *temp;
+
+	mutex_lock(&cache->lock);
+	list_for_each_entry_safe(bin, temp, &cache->fw_bins, cache_link) {
+		if (kref_read(&bin->refcount) != 1) /* If only cache holds ref */
+			continue;
+
+		list_del_init(&bin->cache_link);
+		list_add(&bin->cache_link, &prune_list);
+	}
+	mutex_unlock(&cache->lock);
+
+	list_for_each_entry_safe(bin, temp, &prune_list, cache_link) {
+		list_del_init(&bin->cache_link);
+		kref_put(&bin->refcount, mali_vpu_fw_bin_release);
+	}
+}
+
+static int mali_vpu_fw_cache_thread_fn(void *data)
+{
+	struct mali_vpu_fw_cache *cache = data;
+
+	while (!kthread_should_stop()) {
+		mali_vpu_fw_cache_prune(cache);
+		msleep_interruptible(MALI_VPU_FW_CACHE_CLEANUP_INTERVAL_MS);
+	}
+
+	return 0;
+}
+
+int mali_vpu_fw_cache_init(struct mali_vpu_fw_cache *cache, struct device *dev)
+{
+	int ret;
+
+	cache->dev = dev;
+	mutex_init(&cache->lock);
+	INIT_LIST_HEAD(&cache->fw_bins);
+
+	cache->cache_thread = kthread_run(mali_vpu_fw_cache_thread_fn, cache, "mali_vpu_fw_cache");
+	if (IS_ERR(cache->cache_thread)) {
+		ret = PTR_ERR(cache->cache_thread);
+		cache->cache_thread = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+void mali_vpu_fw_cache_cleanup(struct mali_vpu_fw_cache *cache)
+{
+	struct mali_vpu_fw_bin *bin;
+	struct mali_vpu_fw_bin *temp;
+	LIST_HEAD(local);
+
+	if (cache->cache_thread)
+		kthread_stop(cache->cache_thread);
+
+	mutex_lock(&cache->lock);
+	list_splice_init(&cache->fw_bins, &local);
+	mutex_unlock(&cache->lock);
+
+	list_for_each_entry_safe(bin, temp, &local, cache_link) {
+		list_del_init(&bin->cache_link);
+		kref_put(&bin->refcount, mali_vpu_fw_bin_release);
+	}
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
new file mode 100644
index 0000000000000..f8b024222d2d2
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_FIRMWARE_CACHE_H__
+#define __MALI_VPU_FIRMWARE_CACHE_H__
+
+#include <asm/byteorder.h>
+#include <linux/firmware.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct device;
+struct task_struct;
+
+/**
+ * struct mali_vpu_fw_cache - Per-device firmware cache context.
+ * @dev: Device used for firmware requests and logging.
+ * @lock: Serializes access to @fw_bins and cache-global state.
+ * @fw_bins: List of cached firmware binaries (linked by struct mali_vpu_fw_bin::cache_link).
+ * @cache_thread: Background thread that periodically prunes bins as per cache policy.
+ *
+ * One cache context exists per VPU device.
+ */
+
+struct mali_vpu_fw_cache {
+	struct device *dev;
+	struct mutex lock;		/* Protects the fw_bins list */
+	struct list_head fw_bins;
+	struct task_struct *cache_thread;
+};
+
+/**
+ * struct mali_vpu_fw_header - Firmware binary header.
+ * @rasc_jmp: Start address.
+ * @protocol_minor: Host interface protocol minor version.
+ * @protocol_major: Host interface protocol major version.
+ * @reserved: Reserved for future use. Always 0.
+ * @mve_version: MVE version string.
+ * @info_string: Human readable codec information.
+ * @part_number: Part number.
+ * @git_hash: Short git hash of the firmware source.
+ * @fw_version: Semantic firmware version encoded as 0x00MMmmpp where MM = major,
+ *		mm = minor, pp = patch.
+ * @fw_version_str: Semantic firmware version as a string.
+ * @text_length: Length in bytes of the read-only part of the firmware.
+ * @bss_start_address: Start address for BSS segment. This is always page-aligned.
+ * @bss_bitmap_size: The number of bits used in 'bss_bitmap'.
+ * @bss_bitmap: Bitmap which pages that shall be allocated and MMU mapped.
+ *		If bit N is set, then a page shall be allocated and MMU mapped to VA address
+ *		FW_BASE + bss_start_address + N * MVE_PAGE_SIZE.
+ * @master_rw_start_address: Defines a region of shared pages.
+ * @master_rw_size: Defines a region of shared pages.
+ *
+ * This structure is read directly from the firmware binary and describes the layout
+ * of the firmware in memory. All multibyte integer fields are little-endian.
+ */
+struct mali_vpu_fw_header {
+	__le32 rasc_jmp;
+	u8 protocol_minor;
+	u8 protocol_major;
+	u8 reserved[2];
+
+	u8 mve_version[8];
+	u8 info_string[48];
+
+	u8 part_number[8];
+	u8 git_hash[8];
+
+	__le32 fw_version;
+	u8 fw_version_str[16];
+
+	__le32 text_length;
+	__le32 bss_start_address;
+	__le32 bss_bitmap_size;
+	__le32 bss_bitmap[16];
+
+	__le32 master_rw_start_address;
+	__le32 master_rw_size;
+};
+
+/**
+ * struct mali_vpu_fw_key - Structure describing the key fields to identify a firmware binary.
+ * @codec_fourcc: Fourcc code of the codec.
+ * @session_role: Role of the session (encoder/decoder).
+ * @fw_ver_major: Expected major firmware version.
+ *
+ * The key uniquely identifies the firmware variant expected by a session.
+ */
+struct mali_vpu_fw_key {
+	u32 codec_fourcc;
+	u32 session_role;
+	u32 fw_ver_major;
+};
+
+enum mali_vpu_fw_bin_state {
+	MALI_VPU_FW_BIN_LOADING = 0,
+	MALI_VPU_FW_BIN_READY,
+	MALI_VPU_FW_BIN_FAILED,
+};
+
+/**
+ * struct mali_vpu_fw_bin - Structure describing a loaded firmware binary.
+ * @refcount: Lifetime reference count (cache/session/loader references).
+ * @cache: Owning firmware cache context.
+ * @cache_link: Node in mali_vpu_fw_cache::fw_bins list.
+ * @event_list: List of waiters (mali_vpu_fw_event) waiting for this firmware to load.
+ * @lock: Protects load, status, header pointers and @event_list.
+ * @key: Identity key for cache match and filename generation.
+ * @filename: Firmware filename derived from @key.
+ * @state: Current load state of the firmware binary (loading/ready/failed).
+ * @load_status: Final load result (0 on success, negative errno on failure).
+ * @fw: Firmware object returned by firmware loader.
+ * @header: Parsed firmware header within @fw->data.
+ * @text_page_count: Derived page count for firmware text segment.
+ * @bss_page_count: Derived page count for firmware BSS segment.
+ * @shared_bss_page_count: Derived page count for shared BSS area.
+ *
+ * A bin remains in the cache while referenced and may be shared by many sessions
+ * requesting the same @key.
+ */
+struct mali_vpu_fw_bin {
+	struct kref refcount;
+	struct mali_vpu_fw_cache *cache;
+
+	struct list_head cache_link;
+	struct list_head event_list;
+	struct mutex lock;      /* protects state/load_status/header/waiters */
+
+	struct mali_vpu_fw_key key;
+	char filename[128];
+
+	enum mali_vpu_fw_bin_state state;
+	int load_status;
+
+	const struct firmware *fw;
+	const struct mali_vpu_fw_header *header;
+
+	/* Derived fields from mali_vpu_fw_header */
+	u32 text_page_count;
+	u32 bss_page_count;
+	u32 shared_bss_page_count;
+};
+
+/**
+ * struct mali_vpu_fw_event - Completion callback registration for firmware loads.
+ * @link: Internal list node used while in queued in a bin's waiter list.
+ * @fw_bin_ready: Callback routine invoked when firmware load finishes. Its same_thread
+ *		argument is true when called synchronously from mali_vpu_fw_cache_get(),
+ *		and false when called from the asynchronous firmware-loader callback.
+ * @arg: Opaque client context passed to @fw_bin_ready.
+ *
+ * Callback is invoked for both success and failure. The client checks fw_bin->load_status
+ * to determine result.
+ */
+struct mali_vpu_fw_event {
+	struct list_head link;
+	void (*fw_bin_ready)(struct mali_vpu_fw_bin *fw_bin, void *arg, bool same_thread);
+	void *arg;
+};
+
+int mali_vpu_fw_cache_init(struct mali_vpu_fw_cache *cache, struct device *dev);
+void mali_vpu_fw_cache_cleanup(struct mali_vpu_fw_cache *cache);
+int mali_vpu_fw_cache_get(struct mali_vpu_fw_cache *cache,
+			  const struct mali_vpu_fw_key *key,
+			  struct mali_vpu_fw_event *event);
+void mali_vpu_fw_cache_put(struct mali_vpu_fw_bin *bin);
+
+#endif /* __MALI_VPU_FIRMWARE_CACHE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index 2d63dc058c91a..b87725d7d4cab 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -21,6 +21,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-device.h"
+#include "mali-vpu-firmware-cache.h"
 #include "mali-vpu-registers.h"
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vidioc.h"
@@ -232,14 +233,26 @@ static int mali_vpu_probe(struct platform_device *pdev)
 		goto err_unreg_v4l2;
 	}
 
-	ret = mali_vpu_register_video_device(vpu_dev, MALI_VPU_DECODER);
+	vpu_dev->fw_cache = devm_kzalloc(&pdev->dev, sizeof(*vpu_dev->fw_cache), GFP_KERNEL);
+	if (!vpu_dev->fw_cache) {
+		ret = -ENOMEM;
+		goto err_release_m2m;
+	}
+
+	ret = mali_vpu_fw_cache_init(vpu_dev->fw_cache, vpu_dev->dev);
 	if (ret)
 		goto err_release_m2m;
 
+	ret = mali_vpu_register_video_device(vpu_dev, MALI_VPU_DECODER);
+	if (ret)
+		goto err_cleanup_fw_cache;
+
 	platform_set_drvdata(pdev, vpu_dev);
 
 	return 0;
 
+err_cleanup_fw_cache:
+	mali_vpu_fw_cache_cleanup(vpu_dev->fw_cache);
 err_release_m2m:
 	v4l2_m2m_release(vpu_dev->m2m_dev);
 err_unreg_v4l2:
@@ -257,6 +270,7 @@ static void mali_vpu_remove(struct platform_device *pdev)
 	struct mali_vpu_dev *vpu_dev = platform_get_drvdata(pdev);
 
 	video_unregister_device(vpu_dev->vdev_dec);
+	mali_vpu_fw_cache_cleanup(vpu_dev->fw_cache);
 	v4l2_m2m_release(vpu_dev->m2m_dev);
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index aed51eec6ca9c..f3a61731191bc 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -25,6 +25,9 @@
  *
  ****************************************************************************/
 
+#define MALI_VPU_HOST_PROTOCOL_MAJOR 3
+#define MALI_VPU_HOST_PROTOCOL_MINOR 1
+
  #define MVE_CHROMA_FORMAT_420 (0x1)
 
 /* format bitfield: */
-- 
2.43.0

