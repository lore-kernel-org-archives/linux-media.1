Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102730;
	b=B8+s9JTHkXcQ/IZ8KdskixSduEAizPZlEm8owe+IVjKjjDQu5pcU/V08Uu09D2sPnKuk
	 +QRZgNeyDtnli+mRecV1+Qk1YjAvEbMC7UAuEk51ze4uxXEeWitP2T7/CdFvbz/zt4zyo
	 rBjiGdNt0Z17jV9aUb60/AvCTbrK0wlRIbrcqc6KR97XRo9wghPcN4JQKCA4ZjbIP3Pwh
	 D2IKeaIL4T1D/x/TTR80ed0kZNNNZXJWt5lPcrQqpqhSZN0C2joXRNr2QQA5b9Y2eFKsZ
	 Mep80OQ+u056gckd3phcIvm/Fw/Y1pvurnZFSoIzsbxkwMSEny/C/VTFHdTJUXjrxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102730;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A0M7rf3i64HNBSBAd1BuDY3I7fhRjoGGWU/90xyOffg=;
	b=k0FY6wg9zW0zapdgOASVnTxsDW+iSrRzvBrij1tIEkqZvfZ3C9MvoI8dT9CIjMH/1xJ5
	 YWtGScwNXnM30gM2mIhfy6xN5t+8ejZLnYmGcnWUXqd2SouZcQWK+Bw1YnV4evYM2YoCC
	 opybagJlNXOb5xZLiHTWjysWgImw4qWBtsVX8wKGpKsah6m+wAIH4sAbzOcG2VcWklBph
	 tqspH2pSfEVPJP+KDvemG0NjGH93M0dr4c8QNvKhWg/u7m9tIHUssuEqFZd2nfZZKJLjh
	 TNBMcifMnwLs1YUkeFncz9MBEWYB5ZC8dh7OUfHy6ceuY+/UGax8dfZ4WNVTEAOKO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Hp6M5Qjo;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D6A606A339;
	Thu, 19 Nov 2026 15:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D6A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Hp6M5Qjo
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 677801C0A;
	Thu, 19 Nov 2026 07:38:44 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0CEC3F882;
	Thu, 19 Nov 2026 07:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102727; bh=NNLuDVWPw5NKaJMWiQidVXQcE3fAtPrpFGL6XZGpO1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hp6M5QjouEovWzJzSLJolfTFrOp6koh8KpkGbLNKVynUZ05GA8bBeoF8lhVonaVq8
	 ytQHjMR3FH0PzaVeZQ9t+2fTH67PIU/uctpLI6udqW+9XApt1FsvTMoMQ7kAIBGaS1
	 osEgOa+NYad2yAOR4dDdwT42YqCBsuMw9CCmGV6U=
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
Subject: [RFC PATCH 11/28] media: mali-vpu: load firmware for decoder sessions
Date: Thu, 19 Nov 2026 15:37:41 +0000
Message-ID: <20261119153758.1426673-12-charvi.mehta@arm.com>
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

Request the firmware binary during preparation of the decoder coded queue.
Build the cache key from the coded format, session role and
variant firmware major version. Propagate request submission errors
through VB2 prepare_streaming callback.

Track asynchronous firmware loading per session. Retain the cache
reference after a successful load and release failed or late results.

During the session teardown, wait for firmware loading with a timeout.
On timeout, cancel the pending cache waiter. If completion has already
claimed the waiter, wait for its callback before releasing session
resources.

This establishes firmware-binary loading and ownership only. Firmware
address-space construction and execution are added in subsequent
changes.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../arm/mali-vpu/mali-vpu-firmware-cache.c    |  45 +++++
 .../arm/mali-vpu/mali-vpu-firmware-cache.h    |   2 +
 .../platform/arm/mali-vpu/mali-vpu-formats.c  |   7 +
 .../platform/arm/mali-vpu/mali-vpu-formats.h  |   1 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 175 +++++++++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  40 +++-
 .../arm/mali-vpu/mali-vpu-variant-v76.c       |   2 +
 .../platform/arm/mali-vpu/mali-vpu-variant.h  |   2 +
 .../platform/arm/mali-vpu/mali-vpu-vb2.c      |  28 +++
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |   5 +-
 10 files changed, 303 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
index 746d30f179305..2cc69df71bd93 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
@@ -390,6 +390,51 @@ void mali_vpu_fw_cache_put(struct mali_vpu_fw_bin *bin)
 	kref_put(&bin->refcount, mali_vpu_fw_bin_release);
 }
 
+bool mali_vpu_fw_cache_cancel_waiter(struct mali_vpu_fw_cache *cache,
+				     struct mali_vpu_fw_event *event)
+{
+	struct mali_vpu_fw_bin *cancelled_bin = NULL;
+	struct mali_vpu_fw_event *waiter;
+	struct mali_vpu_fw_bin *bin;
+
+	if (!cache || !event)
+		return false;
+
+	mutex_lock(&cache->lock);
+
+	list_for_each_entry(bin, &cache->fw_bins, cache_link) {
+		mutex_lock(&bin->lock);
+
+		list_for_each_entry(waiter, &bin->event_list, link) {
+			if (waiter != event)
+				continue;
+
+			list_del_init(&event->link);
+			cancelled_bin = bin;
+			break;
+		}
+
+		mutex_unlock(&bin->lock);
+
+		if (cancelled_bin)
+			break;
+	}
+
+	mutex_unlock(&cache->lock);
+
+	if (!cancelled_bin)
+		return false;
+
+	/*
+	 * Every successful cache_get() owns one caller reference. Since the
+	 * callback will no longer run for this waiter, release that reference
+	 * here.
+	 */
+	mali_vpu_fw_cache_put(cancelled_bin);
+
+	return true;
+}
+
 static void mali_vpu_fw_cache_prune(struct mali_vpu_fw_cache *cache)
 {
 	LIST_HEAD(prune_list);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
index f8b024222d2d2..ea7d35ef8ca60 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
@@ -168,5 +168,7 @@ int mali_vpu_fw_cache_get(struct mali_vpu_fw_cache *cache,
 			  const struct mali_vpu_fw_key *key,
 			  struct mali_vpu_fw_event *event);
 void mali_vpu_fw_cache_put(struct mali_vpu_fw_bin *bin);
+bool mali_vpu_fw_cache_cancel_waiter(struct mali_vpu_fw_cache *cache,
+				     struct mali_vpu_fw_event *event);
 
 #endif /* __MALI_VPU_FIRMWARE_CACHE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
index d268435432371..57aa1b3baf40f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
@@ -13,6 +13,13 @@
 #include "mali-vpu-formats.h"
 #include "mali-vpu-session.h"
 
+bool mali_vpu_is_coded_q(const struct mali_vpu_session *sess, enum v4l2_buf_type type)
+{
+	if (sess->role == MALI_VPU_DECODER)
+		return V4L2_TYPE_IS_OUTPUT(type);
+	return V4L2_TYPE_IS_CAPTURE(type);
+}
+
 const struct mali_vpu_format_desc *
 mali_vpu_find_format(struct mali_vpu_session *sess, u32 pixfmt,
 		     enum v4l2_buf_type type)
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
index 5703142b93b46..37198325ee481 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
@@ -33,5 +33,6 @@ const struct mali_vpu_format_desc *mali_vpu_find_format(struct mali_vpu_session
 int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
 			    u32 width, u32 height,
 			    struct v4l2_pix_format_mplane *pix_mp);
+bool mali_vpu_is_coded_q(const struct mali_vpu_session *sess, enum v4l2_buf_type type);
 
 #endif /* __MALI_VPU_FORMATS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 10481ba16d68a..b9a3960bca4c7 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -6,16 +6,20 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-session.h"
 #include "mali-vpu-controls.h"
 #include "mali-vpu-dec.h"
+#include "mali-vpu-firmware-cache.h"
 #include "mali-vpu-formats.h"
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vb2.h"
 
+static const unsigned int mali_vpu_fw_load_timeout_ms     = 10000;
+
 static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
 				 enum v4l2_buf_type type,
 				 u32 width, u32 height)
@@ -55,6 +59,13 @@ static int mali_vpu_set_port_defaults(struct mali_vpu_session *sess)
 				    fmsz->width_default, fmsz->height_default);
 }
 
+static bool
+mali_vpu_both_ports_unrequested(struct mali_vpu_session *sess)
+{
+	return !sess->port_src.stream_requested &&
+	       !sess->port_dst.stream_requested;
+}
+
 int mali_vpu_session_init(struct mali_vpu_session *sess)
 {
 	int ret;
@@ -79,6 +90,7 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 	}
 
 	sess->is_fw_ready = false;
+	sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
 
 	ret = mali_vpu_ctrls_init(sess);
 	if (ret) {
@@ -92,8 +104,22 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 		goto err_ctrls_cleanup;
 	}
 
+	sess->fw_event = kzalloc(sizeof(*sess->fw_event), GFP_KERNEL);
+	if (!sess->fw_event) {
+		ret = -ENOMEM;
+		goto err_mmu_cleanup;
+	}
+
+	sess->fw_bin = NULL;
+	sess->port_src.stream_requested = false;
+	sess->port_dst.stream_requested = false;
+	init_completion(&sess->fw_load_done);
+
 	return 0;
 
+err_mmu_cleanup:
+	mali_vpu_mmu_cleanup(&sess->mmu);
+
 err_ctrls_cleanup:
 	mali_vpu_ctrls_cleanup(sess);
 
@@ -105,10 +131,62 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 	return ret;
 }
 
-void mali_vpu_session_cleanup(struct mali_vpu_session *sess)
+static void mali_vpu_session_release_fw_bin(struct mali_vpu_session *sess)
 {
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY) {
+		mali_vpu_fw_cache_put(sess->fw_bin);
+		sess->fw_bin = NULL;
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+		return;
+	}
+
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_FAILED)
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+}
+
+int mali_vpu_session_cleanup(struct mali_vpu_session *sess)
+{
+	struct mali_vpu_dev *vpu_dev = sess->vpu_dev;
+	int fw_load_ret = 0;
+	bool waiter_cancelled = false;
+
 	mutex_lock(&sess->vq_lock);
 
+	sess->port_src.stream_requested = false;
+	sess->port_dst.stream_requested = false;
+
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_LOADING) {
+		mutex_unlock(&sess->vq_lock);
+
+		if (!wait_for_completion_timeout(&sess->fw_load_done,
+						 msecs_to_jiffies(mali_vpu_fw_load_timeout_ms))) {
+			dev_warn(vpu_dev->dev,
+				 "firmware load timed out\n");
+			fw_load_ret = -ETIMEDOUT;
+
+			waiter_cancelled = mali_vpu_fw_cache_cancel_waiter(vpu_dev->fw_cache,
+									   sess->fw_event);
+
+			/*
+			 * The waiter was not found in the cache list, so
+			 * firmware completion may already have claimed it for
+			 * callback execution. Wait for the callback to finish
+			 * before freeing the session and its event.
+			 */
+			if (!waiter_cancelled)
+				wait_for_completion(&sess->fw_load_done);
+		}
+
+		mutex_lock(&sess->vq_lock);
+
+		if (waiter_cancelled)
+			sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+	}
+
+	mali_vpu_session_release_fw_bin(sess);
+
 	if (sess->m2m_ctx) {
 		v4l2_m2m_ctx_release(sess->m2m_ctx);
 		sess->m2m_ctx = NULL;
@@ -117,7 +195,102 @@ void mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 
 	mutex_unlock(&sess->vq_lock);
 
+	kfree(sess->fw_event);
 	mali_vpu_mmu_cleanup(&sess->mmu);
 	mali_vpu_ctrls_cleanup(sess);
 	mutex_destroy(&sess->vq_lock);
+
+	return fw_load_ret;
+}
+
+static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
+					  void *arg,
+					  bool same_thread)
+{
+	struct mali_vpu_session *sess = arg;
+
+	if (!same_thread)
+		mutex_lock(&sess->vq_lock);
+
+	/*
+	 * A synchronous cache hit precedes marking the port requested.
+	 * An asynchronous callback acquires vq_lock after preparation.
+	 */
+	if (!same_thread && mali_vpu_both_ports_unrequested(sess)) {
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+		goto err_cache_put;
+	}
+
+	if (vpu_fw_bin->load_status) {
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+		goto err_cache_put;
+	}
+
+	sess->fw_bin = vpu_fw_bin;
+
+	sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_READY;
+
+	goto out_complete;
+
+err_cache_put:
+	mali_vpu_fw_cache_put(vpu_fw_bin);
+
+	sess->fw_bin = NULL;
+
+out_complete:
+	complete_all(&sess->fw_load_done);
+
+	if (!same_thread)
+		mutex_unlock(&sess->vq_lock);
+}
+
+static u32 mali_vpu_coded_q_fourcc(const struct mali_vpu_session *sess)
+{
+	if (sess->role == MALI_VPU_DECODER)
+		return sess->port_src.curr_fmt.fmt.pix_mp.pixelformat;
+	return sess->port_dst.curr_fmt.fmt.pix_mp.pixelformat;
+}
+
+static int mali_vpu_session_build_fw_key(const struct mali_vpu_session *sess,
+					 u32 codec_fourcc,
+					 struct mali_vpu_fw_key *key)
+{
+	if (!key || !sess)
+		return -EINVAL;
+
+	key->codec_fourcc = codec_fourcc;
+	key->session_role = sess->role;
+	key->fw_ver_major = sess->vpu_dev->variant->fw_ver_major;
+
+	return 0;
+}
+
+int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess)
+{
+	struct mali_vpu_fw_key fw_key;
+	int ret;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY ||
+	    sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_LOADING)
+		return 0;
+
+	ret = mali_vpu_session_build_fw_key(sess, mali_vpu_coded_q_fourcc(sess), &fw_key);
+	if (ret)
+		return ret;
+
+	sess->fw_event->fw_bin_ready = mali_vpu_session_fw_bin_ready;
+	sess->fw_event->arg = sess;
+	sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_LOADING;
+	reinit_completion(&sess->fw_load_done);
+
+	ret = mali_vpu_fw_cache_get(sess->vpu_dev->fw_cache, &fw_key, sess->fw_event);
+	if (ret) {
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+		complete_all(&sess->fw_load_done);
+		return ret;
+	}
+
+	return 0;
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 4dd6c8bc22dd9..0b810d7d6a036 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -6,6 +6,7 @@
 #ifndef __MALI_VPU_SESSION_H__
 #define __MALI_VPU_SESSION_H__
 
+#include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-ctrls.h>
@@ -16,15 +17,42 @@
 #include "mali-vpu-mmu.h"
 
 struct v4l2_m2m_ctx;
+struct mali_vpu_fw_bin;
+struct mali_vpu_fw_event;
 
 /**
  * struct mali_vpu_port - format state of a src/dst queue in a session.
  * @curr_fmt: V4L2 format currently configured for the port
  * @supported_fmts: List of format descriptors supported by the queue.
+ * @stream_requested: Port/Queue is being prepared for streaming or has
+ *                    successfully completed preparation. Protected by vq_lock.
  */
 struct mali_vpu_port {
 	struct v4l2_format		curr_fmt;
 	struct mali_vpu_format_list	supported_fmts;
+	bool				stream_requested;
+};
+
+/*
+ * Firmware binary load lifecycle
+ *
+ * Preparing the coded queue starts an asynchronous firmware request.
+ * The binary request does not require queued buffers and does not wait for
+ * loading to complete. READY and LOADING requests are reused.
+ *
+ * A cache hit may invoke the callback synchronously. An asynchronous callback
+ * discards its result if neither port requests streaming. A successfully
+ * loaded binary is retained until session cleanup.
+ *
+ * Session cleanup waits for an in-flight callback before releasing the
+ * session-owned binary reference and callback event. On timeout, it cancels
+ * the pending cache waiter or waits for an already claimed callback.
+ */
+enum mali_vpu_session_fw_bin_state {
+	MALI_VPU_SESSION_FW_BIN_UNINITIALIZED = 0,
+	MALI_VPU_SESSION_FW_BIN_LOADING,
+	MALI_VPU_SESSION_FW_BIN_READY,
+	MALI_VPU_SESSION_FW_BIN_FAILED,
 };
 
 /**
@@ -43,6 +71,10 @@ struct mali_vpu_port {
  * @ctrl_handler: V4L2 control handler bound to this session.
  * @fh: V4L2 file handle for this session.
  * @m2m_ctx: V4L2 mem2mem context for this session.
+ * @fw_bin: Pointer to firmware binary loaded for this session.
+ * @fw_event: Firmware binary load event callback structure for this session.
+ * @fw_bin_state: Session firmware binary status.
+ * @fw_load_done: Completion used to synchronize teardown with an in-flight firmware load.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
@@ -61,10 +93,16 @@ struct mali_vpu_session {
 
 	struct v4l2_fh		fh;
 	struct v4l2_m2m_ctx	*m2m_ctx;
+
+	struct mali_vpu_fw_bin			*fw_bin;
+	struct mali_vpu_fw_event		*fw_event;
+	enum mali_vpu_session_fw_bin_state	fw_bin_state;
+	struct completion			fw_load_done;
 };
 
 int mali_vpu_session_init(struct mali_vpu_session *sess);
-void mali_vpu_session_cleanup(struct mali_vpu_session *sess);
+int mali_vpu_session_cleanup(struct mali_vpu_session *sess);
+int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
index 19ad2667f2597..0a7481d97c717 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
@@ -17,6 +17,7 @@
 #include "mali-vpu-variant.h"
 
 #define MALI_VPU_HW_PID_V76 0x56627
+#define MALI_VPU_FW_VER_MAJOR_V76 1
 
 #define MALI_V76_MAX_FRAME_WIDTH 8192
 #define MALI_V76_MAX_FRAME_HEIGHT 8192
@@ -151,6 +152,7 @@ static const struct mali_vpu_ctrl_desc mali_v76_dec_ctrls[] = {
 const struct mali_vpu_variant mali_vpu_v76_variant = {
 	.dma_mask = DMA_BIT_MASK(40),
 	.expected_hw_pid = MALI_VPU_HW_PID_V76,
+	.fw_ver_major = MALI_VPU_FW_VER_MAJOR_V76,
 
 	.rst_names = mali_v76_rst_names,
 	.num_rsts = ARRAY_SIZE(mali_v76_rst_names),
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
index d316e010fff48..3c37cd70bd81f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
@@ -50,6 +50,7 @@ struct mali_vpu_control_caps {
  * @num_rsts: Number of reset controls for this variant.
  * @expected_hw_pid: Expected hardware product ID read from the version register.
  * @dma_mask: DMA addressing capability mask.
+ * @fw_ver_major: Major firmware version compatible with this variant.
  * @fmt_caps: Format capability tables for encode/decode paths.
  * @frmsz_caps: Frame dimension limits and defaults.
  * @ctrl_caps:  Control capability tables for encode/decode paths.
@@ -59,6 +60,7 @@ struct mali_vpu_variant {
 	unsigned int num_rsts;
 	u32 expected_hw_pid;
 	u64 dma_mask;
+	u32 fw_ver_major;
 
 	struct mali_vpu_format_caps	fmt_caps;
 	struct mali_vpu_framesize_caps	frmsz_caps;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
index acdbb06785f6b..4262758a5be26 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
@@ -59,12 +59,40 @@ static void mali_vpu_vb2_buffer_queue(struct vb2_buffer *vb2_buf)
 	v4l2_m2m_buf_queue(sess->m2m_ctx, v4l2_buf);
 }
 
+static int mali_vpu_vb2_prepare_streaming(struct vb2_queue *q)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
+	struct mali_vpu_port *port = V4L2_TYPE_IS_OUTPUT(q->type) ?
+					&sess->port_src : &sess->port_dst;
+	int ret;
+
+	if (mali_vpu_is_coded_q(sess, q->type)) {
+		ret = mali_vpu_session_request_fw_load(sess);
+		if (ret)
+			return ret;
+	}
+
+	port->stream_requested = true;
+	return 0;
+}
+
+static void mali_vpu_vb2_unprepare_streaming(struct vb2_queue *q)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
+	struct mali_vpu_port *port = V4L2_TYPE_IS_OUTPUT(q->type) ?
+					&sess->port_src : &sess->port_dst;
+
+	port->stream_requested = false;
+}
+
 static const struct vb2_ops mali_vpu_vb2_ops = {
 	.queue_setup		= mali_vpu_vb2_queue_setup,
 	.buf_out_validate	= mali_vpu_vb2_buffer_out_validate,
 	.buf_init		= mali_vpu_vb2_buffer_init,
 	.buf_prepare		= mali_vpu_vb2_buffer_prepare,
 	.buf_queue		= mali_vpu_vb2_buffer_queue,
+	.prepare_streaming	= mali_vpu_vb2_prepare_streaming,
+	.unprepare_streaming	= mali_vpu_vb2_unprepare_streaming,
 };
 
 static void mali_vpu_queue_init_type(struct mali_vpu_session *sess,
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index 88e706be6705e..d9196cc86cdf4 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -62,12 +62,13 @@ static int mali_vpu_open(struct file *filp)
 static int mali_vpu_release(struct file *filp)
 {
 	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	int ret = 0;
 
-	mali_vpu_session_cleanup(sess);
+	ret = mali_vpu_session_cleanup(sess);
 	v4l2_fh_del(&sess->fh, filp);
 	v4l2_fh_exit(&sess->fh);
 	kfree(sess);
-	return 0;
+	return ret;
 }
 
 const struct v4l2_file_operations mali_vpu_fops = {
-- 
2.43.0

