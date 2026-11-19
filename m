Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102745;
	b=zfwYneCI7n5g7DcGW42V8jqVgd10P+YRXBDJRB+m0kACukETaPgar/MNCz+YN4rL9dA2
	 V3vuv8C11F38Hh0tnsAtK+W8gtgid25olCQpoa4UgLhce6vsTq8eGvvy5oMRL8tgZTi5X
	 LhOI+v0nErevfOUUk0XfauHDzuMH1TPR9nVn+YuOzL+fYc/8+wbpYx0BlYfbDdsIlSger
	 Hva/6AKqshc4B3dz9Gy1ejWGxNLP84bk9BtAggE0gSKzJ5jLmtrSfYbiguhndZdZ6a1eK
	 BrrGHsMm2u3SMUd5QPUIJq7D3j+AUEmKsqi95qOf/Lg7v9oFVRazCnvHjR5Y771gKjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102745;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=faUlNFmkjkOKYiIsWufZ/Fj4P8ugW9ChhWe0YAe2m6U=;
	b=I8yNyjouXziJZM5k9SXclsRSFT6Hsx98A0VSBAN9o31iPZqmMRRhg/6vXRg/7A7WwMrt
	 FOfSgbSBJWtoOB+yRB+2c2wNjRUw6puRoAsiJhMQmoXBsbq1poNoaXLqTbnBLs8Z2Y0jT
	 l+cr7Zj6L3e7YEKEEfSWDu1CfPYgYlGFNxwyvXECNv5LqYm9wj8VJ6rvSgrZpGNSwck3a
	 vc3QR2F5jX9tcVNdLVfT4l5Ym+R0jMR5Y++6J+jQ74fk7TOFpfuTNUx+UOZqsIf53ZsKh
	 VCEZMrO5GGtSzwtY/hWY7GJyOThUgaGJ0AbWOA47VIdCwdYY5RkpR6otGbUrxcmQvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=k68YWRN6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C4D606B307;
	Thu, 19 Nov 2026 15:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C4D606B307
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=k68YWRN6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBC8F19F0;
	Thu, 19 Nov 2026 07:38:58 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3100B3F882;
	Thu, 19 Nov 2026 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102741; bh=ADToRRf6aVyYLeoKOSWxjIkUf8pU1nYZ1L+KX7iLF48=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k68YWRN6fKbBExACuwLEzfv44GDEzxr9VV+Eg+YE2OUheoKe2uJE8E7Ywsq/Yrqz7
	 uQBNdXhhkiWuLGBw8l28HZIfXbhuNmLL7TPhPk4IPR1Gcf7ne2U5MssDQiqRHMkFCR
	 UCUhIA3+6XgYMZamqNptuAOCTkfSu4NA1RtFdkZA=
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
Subject: [RFC PATCH 19/28] media: mali-vpu: start decoder firmware through LSID scheduling
Date: Thu, 19 Nov 2026 15:37:49 +0000
Message-ID: <20261119153758.1426673-20-charvi.mehta@arm.com>
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

Connect decoder firmware execution to queue preparation and asynchronous
firmware loading. Start the decoder when OUTPUT requests streaming,
without requiring CAPTURE to be streaming.

Activate the LSID and wait for pending option responses before requesting
the firmware running state. Track requested and confirmed firmware states
and coordinate shutdown with firmware responses and interrupt processing.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-formats.c  |   7 +
 .../platform/arm/mali-vpu/mali-vpu-formats.h  |   1 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 297 +++++++++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  12 +
 .../platform/arm/mali-vpu/mali-vpu-vb2.c      |  46 ++-
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |   2 +
 6 files changed, 356 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
index 57aa1b3baf40f..072e3b4aa9473 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
@@ -20,6 +20,13 @@ bool mali_vpu_is_coded_q(const struct mali_vpu_session *sess, enum v4l2_buf_type
 	return V4L2_TYPE_IS_CAPTURE(type);
 }
 
+bool mali_vpu_is_raw_q(const struct mali_vpu_session *sess, enum v4l2_buf_type type)
+{
+	if (sess->role == MALI_VPU_DECODER)
+		return V4L2_TYPE_IS_CAPTURE(type);
+	return V4L2_TYPE_IS_OUTPUT(type);
+}
+
 const struct mali_vpu_format_desc *
 mali_vpu_find_format(struct mali_vpu_session *sess, u32 pixfmt,
 		     enum v4l2_buf_type type)
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
index 37198325ee481..6901e295d7c33 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
@@ -34,5 +34,6 @@ int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
 			    u32 width, u32 height,
 			    struct v4l2_pix_format_mplane *pix_mp);
 bool mali_vpu_is_coded_q(const struct mali_vpu_session *sess, enum v4l2_buf_type type);
+bool mali_vpu_is_raw_q(const struct mali_vpu_session *sess, enum v4l2_buf_type type);
 
 #endif /* __MALI_VPU_FORMATS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 09ec6d14f4ad0..6d22a5d479008 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -19,8 +19,15 @@
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vb2.h"
 
+static const unsigned int mali_vpu_fw_response_timeout_ms = 10000;
 static const unsigned int mali_vpu_fw_load_timeout_ms     = 10000;
 
+static struct mali_vpu_port *
+mali_vpu_session_get_port(struct mali_vpu_session *sess, enum v4l2_buf_type type)
+{
+	return V4L2_TYPE_IS_OUTPUT(type) ? &sess->port_src : &sess->port_dst;
+}
+
 static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
 				 enum v4l2_buf_type type,
 				 u32 width, u32 height)
@@ -67,10 +74,91 @@ mali_vpu_both_ports_unrequested(struct mali_vpu_session *sess)
 	       !sess->port_dst.stream_requested;
 }
 
+static bool mali_vpu_session_can_stream(const struct mali_vpu_session *sess)
+{
+	/*
+	 * Start a decoder with OUTPUT/src port only, so firmware can
+	 * parse the bitstream and report its decoded format.
+	 * An encoder requires both ports.
+	 *
+	 * Use the driver's preparation state because VB2 sets its streaming
+	 * flag only after prepare_streaming() and initial buffer handoff.
+	 */
+	if (sess->role == MALI_VPU_DECODER)
+		return sess->port_src.stream_requested;
+
+	return sess->port_src.stream_requested &&
+	       sess->port_dst.stream_requested;
+}
+
+static int mali_vpu_session_fw_send_job(struct mali_vpu_session *sess, u16 frames)
+{
+	int ret;
+
+	ret = mali_vpu_fw_send_job(&sess->fw, sess->ncores, frames);
+	if (ret)
+		return ret;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+	return 0;
+}
+
+static int mali_vpu_session_fw_send_ping(struct mali_vpu_session *sess)
+{
+	int ret;
+
+	ret = mali_vpu_fw_send_ping(&sess->fw);
+	if (ret)
+		return ret;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+	return 0;
+}
+
+static int mali_vpu_session_fw_send_state(struct mali_vpu_session *sess,
+					  enum mali_vpu_fw_state new_state)
+{
+	int ret;
+
+	if (sess->fw_requested_state != sess->fw_state)
+		/* There is a pending request: is this one duplicate? */
+		return sess->fw_requested_state == new_state ? 0 : -EBUSY;
+
+	if (sess->fw_state == new_state)
+		return 0;
+
+	ret = mali_vpu_fw_send_state_change(&sess->fw, new_state);
+	if (ret)
+		return ret;
+
+	sess->fw_requested_state = new_state;
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+
+	return 0;
+}
+
 int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 					struct mali_vpu_fw_set_option *opt)
 {
-	return mali_vpu_fw_send_set_option(&sess->fw, opt);
+	int ret;
+
+	ret = mali_vpu_fw_send_set_option(&sess->fw, opt);
+	if (ret)
+		return ret;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+	return 0;
+}
+
+static int mali_vpu_session_sched_activate(struct mali_vpu_session *sess)
+{
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (sess->sched_sess.lsid)
+		return 0;
+
+	/* This maps LSID 0 and makes any staged IRQHOST visible. */
+	return mali_vpu_sched_switch_in(&sess->sched_sess, &sess->vpu_dev->sched);
 }
 
 static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
@@ -123,6 +211,102 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 	}
 }
 
+static int mali_vpu_session_wait_pending(struct mali_vpu_session *sess)
+{
+	long timeout;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	while (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
+	       sess->fw.pending_response_count) {
+		mutex_unlock(&sess->vq_lock);
+
+		timeout = wait_event_timeout(sess->fw_waitq,
+					     READ_ONCE(sess->fw_bin_state) !=
+					     MALI_VPU_SESSION_FW_BIN_READY ||
+					     !READ_ONCE(sess->fw.pending_response_count),
+					     msecs_to_jiffies(mali_vpu_fw_response_timeout_ms));
+
+		mutex_lock(&sess->vq_lock);
+
+		if (!timeout && sess->fw.pending_response_count)
+			return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_session_fw_init(struct mali_vpu_session *sess)
+{
+	int ret;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (sess->fw_requested_state != sess->fw_state) {
+		if (sess->fw_requested_state != MALI_VPU_FW_STATE_RUNNING)
+			return -EBUSY;
+
+		return mali_vpu_session_sched_activate(sess);
+	}
+
+	if (sess->fw_state == MALI_VPU_FW_STATE_RUNNING)
+		return 0;
+
+	ret = mali_vpu_session_fw_send_job(sess, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Map the LSID and allow the stopped firmware to process the
+	 * queued SET_OPTION requests before it can be RUNNING.
+	 */
+	ret = mali_vpu_session_sched_activate(sess);
+	if (ret)
+		return ret;
+
+	ret = mali_vpu_session_fw_send_ping(sess);
+	if (ret)
+		return ret;
+
+	ret = mali_vpu_apply_staged_controls(sess);
+	if (ret)
+		return ret;
+
+	/*
+	 * SET_OPTION is only valid while stopped. Wait for pending option
+	 * responses before requesting RUNNING.
+	 */
+	ret = mali_vpu_session_wait_pending(sess);
+	if (ret)
+		return ret;
+
+	/* Waiting drops vq_lock, so streaming may have been withdrawn. */
+	if (!mali_vpu_session_can_stream(sess))
+		return 0;
+
+	return mali_vpu_session_fw_send_state(sess, MALI_VPU_FW_STATE_RUNNING);
+}
+
+static int mali_vpu_session_fw_stop(struct mali_vpu_session *sess)
+{
+	int ret;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	ret = mali_vpu_session_wait_pending(sess);
+	if (ret)
+		return ret;
+
+	if (sess->fw_state == MALI_VPU_FW_STATE_STOPPED)
+		return 0;
+
+	ret = mali_vpu_session_fw_send_state(sess, MALI_VPU_FW_STATE_STOPPED);
+	if (ret)
+		return ret;
+
+	return mali_vpu_session_wait_pending(sess);
+}
+
 int mali_vpu_session_init(struct mali_vpu_session *sess)
 {
 	int ret;
@@ -170,7 +354,9 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 	sess->port_src.stream_requested = false;
 	sess->port_dst.stream_requested = false;
 	init_completion(&sess->fw_load_done);
+	init_waitqueue_head(&sess->fw_waitq);
 	sess->fw_state = MALI_VPU_FW_STATE_STOPPED;
+	sess->fw_requested_state = MALI_VPU_FW_STATE_STOPPED;
 
 	return 0;
 
@@ -208,6 +394,8 @@ int mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 {
 	struct mali_vpu_dev *vpu_dev = sess->vpu_dev;
 	int fw_load_ret = 0;
+	int fw_stop_ret = 0;
+	int terminate_ret;
 	bool waiter_cancelled = false;
 
 	mutex_lock(&sess->vq_lock);
@@ -215,7 +403,9 @@ int mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 	sess->port_src.stream_requested = false;
 	sess->port_dst.stream_requested = false;
 
-	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_LOADING) {
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_LOADING ||
+	    (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
+	     !completion_done(&sess->fw_load_done))) {
 		mutex_unlock(&sess->vq_lock);
 
 		if (!wait_for_completion_timeout(&sess->fw_load_done,
@@ -243,6 +433,21 @@ int mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 			sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
 	}
 
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY)
+		fw_stop_ret = mali_vpu_session_fw_stop(sess);
+
+	terminate_ret = mali_vpu_sched_session_terminate(&sess->sched_sess,
+							 &vpu_dev->sched);
+	mutex_unlock(&sess->vq_lock);
+
+	/*
+	 * The LSID is no longer routed to this session. Drain a worker that
+	 * may have resolved sess before it was detached.
+	 */
+	flush_work(&vpu_dev->irq_work);
+
+	mutex_lock(&sess->vq_lock);
+
 	mali_vpu_session_release_fw_bin(sess);
 
 	if (sess->m2m_ctx) {
@@ -258,7 +463,72 @@ int mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 	mali_vpu_ctrls_cleanup(sess);
 	mutex_destroy(&sess->vq_lock);
 
-	return fw_load_ret;
+	if (fw_load_ret)
+		return fw_load_ret;
+
+	if (fw_stop_ret)
+		return fw_stop_ret;
+
+	return terminate_ret;
+}
+
+int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
+				       enum v4l2_buf_type type)
+{
+	struct mali_vpu_port *port = mali_vpu_session_get_port(sess, type);
+	int ret;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (port->stream_requested)
+		return 0;
+
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
+	    sess->fw_requested_state != sess->fw_state &&
+	    sess->fw_requested_state != MALI_VPU_FW_STATE_RUNNING)
+		return -EBUSY;
+
+	port->stream_requested = true;
+
+	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
+	    mali_vpu_session_can_stream(sess)) {
+		ret = mali_vpu_session_fw_init(sess);
+		if (ret)
+			goto err_rollback;
+	}
+
+	return 0;
+
+err_rollback:
+	port->stream_requested = false;
+
+	return ret;
+}
+
+int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type)
+{
+	struct mali_vpu_port *port = mali_vpu_session_get_port(sess, type);
+	int ret;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (!port->stream_requested)
+		return 0;
+
+	port->stream_requested = false;
+
+	if (sess->fw_bin_state != MALI_VPU_SESSION_FW_BIN_READY ||
+	    !sess->sched_sess.lsid)
+		return 0;
+
+	if (mali_vpu_is_raw_q(sess, type))
+		return mali_vpu_session_wait_pending(sess);
+
+	ret = mali_vpu_session_fw_stop(sess);
+	if (ret)
+		return ret;
+
+	return mali_vpu_session_wait_pending(sess);
 }
 
 static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
@@ -308,8 +578,27 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 
 	sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_READY;
 
+	/*
+	 * A synchronous callback leaves startup to session preparation.
+	 * A delayed callback completes startup itself.
+	 */
+	if (!same_thread && mali_vpu_session_can_stream(sess)) {
+		ret = mali_vpu_session_fw_init(sess);
+		if (ret) {
+			dev_err(sess->vpu_dev->dev,
+				"failed to start streaming: %d\n", ret);
+			sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+			goto err_fw_cleanup;
+		}
+	}
+
 	goto out_complete;
 
+err_fw_cleanup:
+	mali_vpu_fw_cleanup(&sess->fw);
+	sess->fw_state = MALI_VPU_FW_STATE_STOPPED;
+	sess->fw_requested_state = MALI_VPU_FW_STATE_STOPPED;
+
 err_cache_put:
 	mali_vpu_fw_cache_put(vpu_fw_bin);
 
@@ -405,5 +694,7 @@ void mali_vpu_session_irq(struct mali_vpu_session *sess)
 	} while (ret >= 0);
 
 unlock_mutex:
+	wake_up(&sess->fw_waitq);
+
 	mutex_unlock(&sess->vq_lock);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index e6b9de3b272cf..e331965d32fd8 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -47,6 +47,11 @@ struct mali_vpu_port {
  * construct the firmware address space before making the binary READY. The
  * session retains its binary reference until cleanup.
  *
+ * A synchronous callback leaves firmware startup to session preparation.
+ * An asynchronous callback starts firmware if the required ports still request
+ * streaming: OUTPUT for a decoder, both ports for an encoder.
+ * Binary READY and firmware RUNNING are separate states.
+ *
  * Session cleanup waits for an in-flight callback before releasing the
  * session-owned binary reference and callback event. On timeout, it cancels
  * the pending cache waiter or waits for an already claimed callback.
@@ -78,7 +83,9 @@ enum mali_vpu_session_fw_bin_state {
  * @fw_event: Firmware binary load event callback structure for this session.
  * @fw_bin_state: Session firmware binary status.
  * @fw_load_done: Completion used to synchronize teardown with an in-flight firmware load.
+ * @fw_waitq: Wait queue used while waiting for firmware responses.
  * @fw_state: Last state confirmed by the firmware.
+ * @fw_requested_state: Last firmware state requested by the driver.
  * @sched_sess: Scheduler state used to map this session to an LSID.
  * @ncores: Number of cores assigned to this session by scheduler.
  */
@@ -104,7 +111,9 @@ struct mali_vpu_session {
 	struct mali_vpu_fw_event		*fw_event;
 	enum mali_vpu_session_fw_bin_state	fw_bin_state;
 	struct completion			fw_load_done;
+	wait_queue_head_t			fw_waitq;
 	enum mali_vpu_fw_state			fw_state;
+	enum mali_vpu_fw_state			fw_requested_state;
 
 	struct mali_vpu_sched_session	sched_sess;
 	u32				ncores;
@@ -115,6 +124,9 @@ int mali_vpu_session_cleanup(struct mali_vpu_session *sess);
 int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess);
 int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 					struct mali_vpu_fw_set_option *opt);
+int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
+				       enum v4l2_buf_type type);
+int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type);
 void mali_vpu_session_irq(struct mali_vpu_session *sess);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
index 4262758a5be26..b9f6968e9f13f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
@@ -62,8 +62,6 @@ static void mali_vpu_vb2_buffer_queue(struct vb2_buffer *vb2_buf)
 static int mali_vpu_vb2_prepare_streaming(struct vb2_queue *q)
 {
 	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
-	struct mali_vpu_port *port = V4L2_TYPE_IS_OUTPUT(q->type) ?
-					&sess->port_src : &sess->port_dst;
 	int ret;
 
 	if (mali_vpu_is_coded_q(sess, q->type)) {
@@ -72,17 +70,51 @@ static int mali_vpu_vb2_prepare_streaming(struct vb2_queue *q)
 			return ret;
 	}
 
-	port->stream_requested = true;
+	return mali_vpu_session_prepare_streaming(sess, q->type);
+}
+
+static int mali_vpu_vb2_start_streaming(struct vb2_queue *q,
+					unsigned int count __always_unused)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
+
+	v4l2_m2m_update_start_streaming_state(sess->m2m_ctx, q);
 	return 0;
 }
 
+static void mali_vpu_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
+	struct vb2_v4l2_buffer *v4l2_buf;
+	int ret;
+
+	ret = mali_vpu_session_streamoff(sess, q->type);
+	if (ret)
+		dev_warn(sess->vpu_dev->dev, "failed to stop streaming: %d\n", ret);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		while ((v4l2_buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(v4l2_buf, VB2_BUF_STATE_ERROR);
+	} else {
+		while ((v4l2_buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(v4l2_buf, VB2_BUF_STATE_ERROR);
+	}
+
+	v4l2_m2m_update_stop_streaming_state(sess->m2m_ctx, q);
+}
+
 static void mali_vpu_vb2_unprepare_streaming(struct vb2_queue *q)
 {
 	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
-	struct mali_vpu_port *port = V4L2_TYPE_IS_OUTPUT(q->type) ?
-					&sess->port_src : &sess->port_dst;
+	int ret;
+
+	ret = mali_vpu_session_streamoff(sess, q->type);
+	if (ret)
+		dev_warn(sess->vpu_dev->dev,
+			 "failed to unprepare streaming: %d\n", ret);
 
-	port->stream_requested = false;
+	if (!vb2_start_streaming_called(q))
+		v4l2_m2m_update_stop_streaming_state(sess->m2m_ctx, q);
 }
 
 static const struct vb2_ops mali_vpu_vb2_ops = {
@@ -92,6 +124,8 @@ static const struct vb2_ops mali_vpu_vb2_ops = {
 	.buf_prepare		= mali_vpu_vb2_buffer_prepare,
 	.buf_queue		= mali_vpu_vb2_buffer_queue,
 	.prepare_streaming	= mali_vpu_vb2_prepare_streaming,
+	.start_streaming	= mali_vpu_vb2_start_streaming,
+	.stop_streaming		= mali_vpu_vb2_stop_streaming,
 	.unprepare_streaming	= mali_vpu_vb2_unprepare_streaming,
 };
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index d9196cc86cdf4..0fcd3835e52d3 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -357,4 +357,6 @@ const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
 	.vidioc_enum_framesizes		= mali_vpu_enum_framesizes,
 	.vidioc_subscribe_event		= mali_vpu_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
 };
-- 
2.43.0

