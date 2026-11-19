Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102758;
	b=pL5RvatI+pT4LxpnMWuL9YGUEk8PDSPV4DLq5zmQU95Q5sMV5J8BEqOrBT32bUkQOFGD
	 +Hnhn4JFINtReHy1LBmiAcJqxdNYqzLRvIjT5GofDfaRAk9T8AticpOrLEoGw7A8d+Ph4
	 yfNCoE4wMvRVqCqs+f5hJXdrN93Sb0COogcBxfNySa4yLEr6rc22TkiVEU3H0iLsQVokK
	 ZRJFGQ4i/2OIHjWAwfCkaxFpPwE1aQ5FHsvfxQFY6fcGv/vplcGfRnuNyVoMpFZBRJmGU
	 axwgxVyqKFWg53vhz6G5T3Fa/j1drFroksEaCnO7hQcMTNal5BIc9+O1dV2az16lKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102758;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1/+2BY2e/HjDYXMRWRAHF9mJPWdBJSbYdWvRm5Jut/w=;
	b=HRABcXZUntfW4pX2zl6FLEPW+QXcBpC+LJywM4l9vrNBE/VL1EXw+kJptrVQObBRXqZ6
	 91PXD2T038kA91LXJBeKwmK/9Wcm6NjMd9ZE8Hn3vTKIli1oVoY3zQCk1WgbJbGeNeK8o
	 kU9zNpOKokV7PIlKhEeJ9CgMQvWGkua4FoxDg2uIqc7E+cdj6GaCPP50qSMyNdensvmPU
	 RL23wSd/v/eJ2gmVwC5r5XcXiDmXZjKzuhCohhUJ6pjS+7W6HIIOWjPjtkNl2B9XIuebt
	 7ab2dcZsBWDyv5Z4+8jAHzSprMfX2sRbTOVNN1kJWxz6LthtjnAawuAf8l4R0uD8cCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QeN2WT4A;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8BE606A32F;
	Thu, 19 Nov 2026 15:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QeN2WT4A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22F3319F0;
	Thu, 19 Nov 2026 07:39:04 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C82E3F882;
	Thu, 19 Nov 2026 07:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102747; bh=Ldx70dpZsTVPdOzjL8c/76+RUEXZwluAYqizyfXN3UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QeN2WT4A16y0z3619jPTSoo2PtFGfO6cuUyVWyBDurovbSi3//dt5jpFscOjBgwLf
	 dxaavPH/vRl3kBqKPL4Xk3u0nTeJoZCo8i8Un0tzA3WVx4u3O1VMVBhbYJ4srtGvpA
	 /yH3XBGAiiOjpI488+M7Thq6HOgpM23jCDJrXSeE=
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
Subject: [RFC PATCH 22/28] media: mali-vpu: handle fatal firmware error
Date: Thu, 19 Nov 2026 15:37:52 +0000
Message-ID: <20261119153758.1426673-23-charvi.mehta@arm.com>
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

From: Rath Sankaralingam <rath.sankaralingam@arm.com>

Record the first fatal error encountered by a session so that failures
are propagated consistently instead of allowing firmware operations to
continue on an unusable session.

On firmware loading, initialization, message handling or response timeout
errors, stop the firmware state machine, terminate the scheduled session,
mark both vb2 queues as failed and wake any firmware waiters. Reject
subsequent buffer and streaming operations with the recorded error.

Signed-off-by: Rath Sankaralingam <rath.sankaralingam@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 97 ++++++++++++++++---
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  5 +
 2 files changed, 90 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 60e4b7e25eff8..9cbd116124109 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -142,6 +142,9 @@ int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 {
 	int ret;
 
+	if (sess->error)
+		return sess->error;
+
 	ret = mali_vpu_fw_send_set_option(&sess->fw, opt);
 	if (ret)
 		return ret;
@@ -307,6 +310,31 @@ static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
 	v4l2_m2m_buf_done(vbuf, state);
 }
 
+static void mali_vpu_session_set_error(struct mali_vpu_session *sess, int error)
+{
+	struct vb2_queue *src_q;
+	struct vb2_queue *dst_q;
+
+	lockdep_assert_held(&sess->vq_lock);
+
+	if (sess->error)
+		return;
+
+	sess->error = error;
+	sess->fw_requested_state = MALI_VPU_FW_STATE_STOPPED;
+	sess->fw_state = MALI_VPU_FW_STATE_STOPPED;
+
+	mali_vpu_sched_session_terminate(&sess->sched_sess, &sess->vpu_dev->sched);
+
+	src_q = v4l2_m2m_get_src_vq(sess->m2m_ctx);
+	dst_q = v4l2_m2m_get_dst_vq(sess->m2m_ctx);
+
+	vb2_queue_error(src_q);
+	vb2_queue_error(dst_q);
+
+	wake_up(&sess->fw_waitq);
+}
+
 static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 					  const struct mali_vpu_fw_msg *fw_msg)
 {
@@ -385,11 +413,13 @@ static int mali_vpu_session_wait_pending(struct mali_vpu_session *sess)
 
 	lockdep_assert_held(&sess->vq_lock);
 
-	while (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
+	while (!sess->error &&
+	       sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
 	       sess->fw.pending_response_count) {
 		mutex_unlock(&sess->vq_lock);
 
 		timeout = wait_event_timeout(sess->fw_waitq,
+					     READ_ONCE(sess->error) ||
 					     READ_ONCE(sess->fw_bin_state) !=
 					     MALI_VPU_SESSION_FW_BIN_READY ||
 					     !READ_ONCE(sess->fw.pending_response_count),
@@ -397,11 +427,14 @@ static int mali_vpu_session_wait_pending(struct mali_vpu_session *sess)
 
 		mutex_lock(&sess->vq_lock);
 
+		if (sess->error)
+			return sess->error;
+
 		if (!timeout && sess->fw.pending_response_count)
-			return -ETIMEDOUT;
+			mali_vpu_session_set_error(sess, -ETIMEDOUT);
 	}
 
-	return 0;
+	return sess->error;
 }
 
 static int mali_vpu_session_fw_init(struct mali_vpu_session *sess)
@@ -518,6 +551,7 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 		goto err_mmu_cleanup;
 	}
 
+	sess->error = 0;
 	sess->fw_bin = NULL;
 	sess->port_src.stream_requested = false;
 	sess->port_dst.stream_requested = false;
@@ -566,6 +600,9 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_
 			mali_vpu_session_get_port(sess, vb2_buf->type);
 	int ret;
 
+	if (sess->error)
+		return sess->error;
+
 	if (!port->stream_requested ||
 	    !mali_vpu_session_can_stream(sess) ||
 	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING) {
@@ -674,6 +711,9 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 
 	lockdep_assert_held(&sess->vq_lock);
 
+	if (sess->error)
+		return sess->error;
+
 	if (port->stream_requested)
 		return 0;
 
@@ -687,8 +727,10 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
 	    mali_vpu_session_can_stream(sess)) {
 		ret = mali_vpu_session_fw_init(sess);
-		if (ret)
+		if (ret) {
+			mali_vpu_session_set_error(sess, ret);
 			goto err_rollback;
+		}
 	}
 
 	return 0;
@@ -711,18 +753,31 @@ int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type
 
 	port->stream_requested = false;
 
+	if (sess->error)
+		return 0;
+
 	if (sess->fw_bin_state != MALI_VPU_SESSION_FW_BIN_READY ||
 	    !sess->sched_sess.lsid)
 		return 0;
 
-	if (mali_vpu_is_raw_q(sess, type))
-		return mali_vpu_session_wait_pending(sess);
+	if (mali_vpu_is_raw_q(sess, type)) {
+		ret = mali_vpu_session_wait_pending(sess);
+		if (ret)
+			goto err_session;
+
+		return 0;
+	}
 
 	ret = mali_vpu_session_fw_stop(sess);
 	if (ret)
-		return ret;
+		goto err_session;
 
 	return mali_vpu_session_wait_pending(sess);
+
+err_session:
+	mali_vpu_session_set_error(sess, ret);
+
+	return ret;
 }
 
 static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
@@ -739,13 +794,15 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 	 * A synchronous cache hit precedes marking the port requested.
 	 * An asynchronous callback acquires vq_lock after preparation.
 	 */
-	if (!same_thread && mali_vpu_both_ports_unrequested(sess)) {
+	if (sess->error ||
+	    (!same_thread && mali_vpu_both_ports_unrequested(sess))) {
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
 		goto err_cache_put;
 	}
 
 	if (vpu_fw_bin->load_status) {
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+		mali_vpu_session_set_error(sess, vpu_fw_bin->load_status);
 		goto err_cache_put;
 	}
 
@@ -758,6 +815,7 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 	ret = mali_vpu_sched_session_prepare(&sess->sched_sess, sess);
 	if (ret) {
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+		mali_vpu_session_set_error(sess, ret);
 		goto err_cache_put;
 	}
 
@@ -767,6 +825,7 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 		dev_err(sess->vpu_dev->dev,
 			"failed to initialise firmware: %d\n", ret);
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+		mali_vpu_session_set_error(sess, ret);
 		goto err_cache_put;
 	}
 
@@ -782,6 +841,7 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 			dev_err(sess->vpu_dev->dev,
 				"failed to start streaming: %d\n", ret);
 			sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
+			mali_vpu_session_set_error(sess, ret);
 			goto err_fw_cleanup;
 		}
 	}
@@ -833,6 +893,9 @@ int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess)
 
 	lockdep_assert_held(&sess->vq_lock);
 
+	if (sess->error)
+		return sess->error;
+
 	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY ||
 	    sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_LOADING)
 		return 0;
@@ -849,6 +912,7 @@ int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess)
 	ret = mali_vpu_fw_cache_get(sess->vpu_dev->fw_cache, &fw_key, sess->fw_event);
 	if (ret) {
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+		mali_vpu_session_set_error(sess, ret);
 		complete_all(&sess->fw_load_done);
 		return ret;
 	}
@@ -864,31 +928,40 @@ void mali_vpu_session_irq(struct mali_vpu_session *sess)
 
 	mutex_lock(&sess->vq_lock);
 
+	if (sess->error)
+		goto unlock_mutex;
+
 	ret = mali_vpu_fw_handle_rpc(&sess->fw, &flush_mmu);
 	if (ret) {
 		if (flush_mmu)
 			mali_vpu_sched_flush_mmu(&sess->sched_sess, &sess->vpu_dev->sched);
 		mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
 
-		if (ret < 0)
+		if (ret < 0) {
+			mali_vpu_session_set_error(sess, ret);
 			goto unlock_mutex;
+		}
 	}
 
 	do {
 		ret = mali_vpu_fw_parse_msg(&sess->fw, &msg);
-		if (ret < 0)
+		if (ret < 0) {
+			mali_vpu_session_set_error(sess, ret);
 			goto unlock_mutex;
+		}
 
 		if (!ret)
 			break;
 
 		ret = mali_vpu_session_handle_fw_msg(sess, &msg);
-		if (ret)
+		if (ret < 0) {
+			mali_vpu_session_set_error(sess, ret);
 			goto unlock_mutex;
+		}
 	} while (ret >= 0);
 
-unlock_mutex:
 	wake_up(&sess->fw_waitq);
 
+unlock_mutex:
 	mutex_unlock(&sess->vq_lock);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 5cabb7844131b..c6e1add34a8f1 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -60,6 +60,9 @@ struct mali_vpu_port {
  * Session cleanup waits for an in-flight callback before releasing the
  * session-owned binary reference and callback event. On timeout, it cancels
  * the pending cache waiter or waits for an already claimed callback.
+ *
+ * Errors follow the session error-handling policy. A FAILED binary state alone
+ * does not imply that another STREAMON can recover the session.
  */
 enum mali_vpu_session_fw_bin_state {
 	MALI_VPU_SESSION_FW_BIN_UNINITIALIZED = 0,
@@ -93,6 +96,7 @@ enum mali_vpu_session_fw_bin_state {
  * @fw_requested_state: Last firmware state requested by the driver.
  * @sched_sess: Scheduler state used to map this session to an LSID.
  * @ncores: Number of cores assigned to this session by scheduler.
+ * @error: Fatal session error code.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
@@ -122,6 +126,7 @@ struct mali_vpu_session {
 
 	struct mali_vpu_sched_session	sched_sess;
 	u32				ncores;
+	int				error;
 };
 
 int mali_vpu_session_init(struct mali_vpu_session *sess);
-- 
2.43.0

