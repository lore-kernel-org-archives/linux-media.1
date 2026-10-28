Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159022;
	b=izYrAgDF3JXfZmKtud22+xt6GIEurrWc5MjK5yi/Ot1f6igu35A0GaXR4K7qLDezKZii
	 w414jnV8kBaeO9L6p+oilpJC5Rmw+E5k6b4V2kfCVgTYRAixqhaA3Ug0/gtQKopJ9YJGp
	 fQehXZHTzeUKVMmSCJj3itqUwKsFcjSdK/P0D7kmxtUI3MKfg5s9MMYs4L9gIMdSECkzA
	 LqG2NSZ7OSLjUFtX3mGkFDqYz2/TIrlqa8dWk4XoZ1rME9u1+z9w+PNhhY3PGZty5RXVb
	 DTblhRtEBeSaQZgBojq5CtdPjU3+AaUBmZvn148igTt+jFbuWwL6gi9oyLZ+POhVyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaOpWJe9BYizt5y9M/hbwYylDwywAkBKHjHx+OyYsmo=;
	b=BjSifowJ3w6m+N33qbrE2YeGE2CRF/uu8laxHIVYQMrKOsqLzHagYmzMniQsSyu04QUE
	 KbWRYHWsKdB6q2jIhH14SSyo9jI45YDqweWJiSyuqJWJqb1dliR0/3o0+FPztYWIAnj4d
	 OErt2Z3vS7Kzfh/opLQ7Libtv98n5pPiaJDGBlOwBzz5SXHGEnRTuHiHEgY8YGF/UfkVs
	 fxv51C89GEDKEYr3GLYRzEvy/TzIkn6QAUXdU7Qpgwq2LBk4MHH03ik1B5cW3ih/aTcjj
	 jUFTVYMLkAnkGkxho5LZFRDZT2YJ8fOl/wBYu//v4Rx3dO6EJS9c6WvyTSjPWoZUahQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcC11mAH;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83D606A330
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D83D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcC11mAH
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c67992ce5so4588996d6.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 20:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159021; x=1793763821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaOpWJe9BYizt5y9M/hbwYylDwywAkBKHjHx+OyYsmo=;
        b=DcC11mAHCNUT8/PeFl4ImzHwvwSddVpIyB55q00ots01fzDxF0iFB/UTdcV8UoSAkT
         jWnKMZWvznhSbmuQ6j8g9b19czdvHjWc6w/JoCETe0rkAK+FX6HvMqSttKStZvFHFrid
         SonF7UCBIzIT2Y0GBtVycijBhjJe2sq94WrYv/mSQq+Q25YKBtRcN/SnljMGwQ/odEhT
         ge73bd+1VM+dg4eUzbQ+1LdeKY6BZqVwdzrlw7unHlsawBsPNc4jcWubibAwsCsxXysW
         coyROvk785u38Qn6ayfFL6w/4Np4xNdUnByBg+uAwQsd8Vux+WVXf7lrKJ96GYAq9cVf
         26wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159021; x=1793763821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaOpWJe9BYizt5y9M/hbwYylDwywAkBKHjHx+OyYsmo=;
        b=cG/taK37Stdkgk9nWcf5goLjzH+hkehJ8tVkrZmtxMKRDakSwYNXLFc2pHOm9TmeZV
         VmTGtr2jcNfCL/ttySRX31rb2et7dGWc7th3GE57T7btKoE/XOouy4+3/2f6Ydd8rBg4
         B5Kv06We730AfgbDC5WvhaKlCeacqh6wOPf+ul1VAjZVzCHxatoGCyVqGmZkrHi+hQ7l
         ylPq54nCuW+T0edahoIV87Qukgz8WP2SRCTRN9W8vZhEu8XhzDQitFxpIRdujx1DlIAT
         qgKe3H7qH09dxgX3KaylwP4IffFnsVAPVKKoXtl+7KCWZ65t9JKH2lZN90si+Va3KDm5
         SI1w==
X-Forwarded-Encrypted: i=1; AKwUvBz4RdEZkZ0eNxfjxFaEWKlmp3iYaGrDB2ryF0BgKXYuOOFSMuV1PqlNxGrRtX/o/ZD+UKlaR6xZSmTwDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0AQdjgijxDLEDblI/LLb/XGmBFyI3jN4PdR8AA9bVogtzKRJ1
	wQ9j8eOd4pV5FZ5bhpCiCFn/s22QkBVPo2drWR/QdeOIfAOCQAjLIuziOyyFkG1LNEOOHQ==
X-Gm-Gg: AYBFou0wRjbPK+GR0v4e7Bjhzz54uiAWsPn19fuJpqYhbpPzoa+N4Cs2nz10YvY9KiR
	tAH053C/pfsUY0eUtur/sEOvCi7h9Iw6vyByBvKA+27/hNUqAr7eNclGFC1OaGduQR9DKu16Dfv
	fComyr9F2OYS6aOzLuZDMD32vwqA0aTxU+RtRxu3QDm46xwd0ibGZevDHzw7o5xNumTAv1hFdJX
	aAqdMk9bQBsZk7rkbZIwumXrejTqQ2SexSToUXbO1GTpfEEIVo5JFXM2xiO/kof2RIzAfzgVvs2
	ADp3a2+Y9ErTxybydqGAkc0aGDSBcPE79AgSNeXy2T6tN4iptcXNOxnzJXOHsMV2QsHsJK4h+Fd
	E316QVnzUOIGM32xAG/O1x3or2aFHmNkGUoU49OcpcLkZFAQe3YTmSj02JZyOUR+TLqAAqjJ2bz
	wS6Wg3lUwb8ZvcT+qSW2h4OyIvCkn/wt+zTMHzVLbQbXwzsWAx3wv7U6ieZIjKnAwLspmH2qtcI
	jjHNW6Y/LWr9AALwgmO3g5O4jItw3mJDEdXXQfOAByH1YrXeh9blommqE8tekMoZcDdx2kpe76G
	M8QcmWImCb9SwOhL5gCAyYFD31/Xin3QtrCboV8aSc/dwK9lSmftHaBmfWrcggpaeSwcp6P5G2J
	1FIF9og==
X-Received: by 2002:a05:620a:3188:b0:93f:3163:3e37 with SMTP id af79cd13be357-94408a71d5fmr147885885a.28.1793159021334;
        Tue, 27 Oct 2026 20:43:41 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1159899985a.10.2026.10.27.20.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:41 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 4/4] media: iris: Let a resolution change drain before stopping CAPTURE
Date: Tue, 27 Oct 2026 22:43:35 -0500
Message-ID: <20261028034335.26075-5-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028034335.26075-1-ccortner@gmail.com>
References: <20261028034335.26075-1-ccortner@gmail.com>
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

ffmpeg's h264_v4l2m2m stops CAPTURE about 10 us after it dequeues a
source change event. If the stop reaches the firmware before the
PSC_LAST buffer, that buffer still arrives (1.3 ms later in a trace),
iris_inst_sub_state_change_drc_last() rejects it, and the instance
goes to IRIS_INST_ERROR: no more buffers come back.

Wait up to 500 ms in iris_vb2_stop_streaming() for a pending source
change to drain, and warn when it does not.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Assisted-by: LLM sparse smatch
---
 .../media/platform/qcom/iris/iris_instance.h  |  3 +++
 drivers/media/platform/qcom/iris/iris_state.c |  8 +++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c   | 20 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.c  |  1 +
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 771269e705d9..1013ed2911a1 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -7,6 +7,7 @@
 #define __IRIS_INSTANCE_H__
 
 #include <linux/kref.h>
+#include <linux/wait.h>
 
 #include <media/v4l2-ctrls.h>
 
@@ -56,6 +57,7 @@ struct iris_hfi_session_ops;
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @drc_wq: woken when IRIS_INST_SUB_DRC_LAST is set
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
@@ -104,6 +106,7 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	wait_queue_head_t		drc_wq;
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 5552725c614e..dd8e0093b972 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -209,6 +209,7 @@ int iris_inst_sub_state_change_drain_last(struct iris_inst *inst)
 int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 {
 	enum iris_inst_sub_state set_sub_state;
+	int ret;
 
 	if (inst->sub_state & IRIS_INST_SUB_DRC_LAST)
 		return -EINVAL;
@@ -222,7 +223,12 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
 
 	set_sub_state = IRIS_INST_SUB_DRC_LAST | IRIS_INST_SUB_OUTPUT_PAUSE;
 
-	return iris_inst_change_sub_state(inst, 0, set_sub_state);
+	ret = iris_inst_change_sub_state(inst, 0, set_sub_state);
+	/* a CAPTURE STREAMOFF may be waiting, see iris_vb2_stop_streaming() */
+	if (!ret)
+		wake_up_all(&inst->drc_wq);
+
+	return ret;
 }
 
 int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index bb713da20605..2460778c408d 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -228,6 +228,15 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
+/* a source change whose drain the firmware has not completed yet */
+static bool iris_drc_draining(struct iris_inst *inst)
+{
+	enum iris_inst_sub_state sub_state = READ_ONCE(inst->sub_state);
+
+	return sub_state & IRIS_INST_SUB_DRC &&
+	       !(sub_state & IRIS_INST_SUB_DRC_LAST);
+}
+
 void iris_vb2_stop_streaming(struct vb2_queue *q)
 {
 	struct iris_inst *inst;
@@ -238,6 +247,17 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
 		return;
 
+	/*
+	 * Stopping CAPTURE before the firmware has drained a pending
+	 * resolution change leaves the change incomplete, and decoding stalls
+	 * after the next STREAMON. Wait up to 500 ms for the drain.
+	 */
+	if (V4L2_TYPE_IS_CAPTURE(q->type) &&
+	    !wait_event_timeout(inst->drc_wq, !iris_drc_draining(inst),
+				msecs_to_jiffies(500)))
+		dev_warn(inst->core->dev,
+			 "resolution change drain timed out, stopping CAPTURE\n");
+
 	mutex_lock(&inst->lock);
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d..0df0a5915e16 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -201,6 +201,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
+	init_waitqueue_head(&inst->drc_wq);
 
 	iris_v4l2_fh_init(inst, filp);
 
-- 
2.56.0

