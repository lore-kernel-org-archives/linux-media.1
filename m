Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159021;
	b=xiH8ECC7gRDOmikAvk9zTCmZcLGkixRovR+TZbxOl9j9Mg+wC9swwnI8JEfnoCMHOYtN
	 G+1CwqAV/hAL9PtgVLZlQaz/dwO7ZjVl/sETt2HhFPqUbRbZuqJOQDM7Fnb6fbVJ/G/cx
	 hsw9v3NcxcSjhMhqkOvcCBVr9g/ajpS/eqL2tFkvDONT+IrPICNwSQNG+N6a7JiTTvrKE
	 9vmOzLfpfBQXa/mApEkTtkviGlApucLoi5yjP/0KjCVbMSyGhuMC1frTFFY2UJ8it7LhW
	 uAk+gQuP6RM/qoLgsJOOfs29brqcRYoQ9lgZsTqszJuGJ/0GsA+Yq4YZuuW8SPsR0bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NCfNFDiz5anKslE6LtWIXyi/+ISikbv6moJ2/L/2xxc=;
	b=MLuLYyt/GRy2QJTCV1+J3jPb7Z/hzcpBj/3U/ABBUtaJbwqEJZ1bAj/X6mEq987s/1UL
	 6eI91buJ47V6WjlNQKyTsjyTsLv7IrqK3e/O6cd5GIE4rI8H47bjN4eA2rmSvUHJuLLVl
	 iF43a8aHivVh9IOqzyOAM+OeCfyeXmSid/bAAyFZPeaevBBG9DksPXPzVkOpA6a4NE4vb
	 jiImoMUfJphSV3ujX8w966gZTHJTqYvD7SrsR4ZtPyZ3IKm4dajbmt5vZ/9rNf+Ajnv8d
	 v/L+iiIqgJbqlWW1f/zpOUjLy2Zne5oZFBQ6DCepLsYT/HSs0qj/2ji07bJYo3Mjgxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqvxGPWh;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007D606A331
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 03:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5007D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqvxGPWh
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a64f28d0so19176866d6.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 20:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159020; x=1793763820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCfNFDiz5anKslE6LtWIXyi/+ISikbv6moJ2/L/2xxc=;
        b=wqvxGPWhyARyaD8Mng7Gb3wOuF8WnHch2DceFI7VAQTvlwdhKcLA6kLkgA1BzNUy2B
         PpSf1L+8u2srkfRpzdQMiVqrKyx7FHH8T/rqVIy9kIIyy0Rn2QkofLZ/HL8UuhHgjG0o
         4yHbl5e2GWyYiQY0JP8RDg3J45ytBUm8gFjTU36rVGFiqvLj9sERyyS7gZVoCekGeYS9
         V4ntUJt/io7lUEvn6UeIJNkQnEFZ/0Zqs764Y8LHLE8gjQ5Oq7UtRT0VcB4qAKbTSPMm
         Z20GtynY5oGmxQz+HnzxKe1J9R6bkB1dgTEzyGsp/Y8v8K8cYtaQD/T2fDRLFf0XqOqM
         6/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159020; x=1793763820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCfNFDiz5anKslE6LtWIXyi/+ISikbv6moJ2/L/2xxc=;
        b=Z9HziP/qd5C29p9d1GgynywiAoB19OH7iQ/Z6mgB4dojppCOTmfcxQoO1KnvfYhX8F
         RTyqy6BUmqf3ws0sCWLOAwtmihbLMuQLX63dChe9wBfjN8Pizuec0LslQvFnqMxLNZVu
         VvxS6H5gmUl5LFbw/X90SopQvBzivA+XsR/Y7jSItD9qcOqSQfQxjnht7oHUjAC3lZA0
         F9weTu7zq82orHB8O4PvyEcN9snvz765ACZ1bMzXI13dBsGS3uE7J2zRxcshtAs+edzQ
         C2VbCZpnpgbugy7yOryNqufz//NPBM+jqWC3oDDFHKQUtrRc9xsitLOG6Tb8K1zaKZDP
         oPNw==
X-Forwarded-Encrypted: i=1; AKwUvBzSh6uLIHAq/XMyiRvFDuF80YVdTFgyXybwThDCTHy5o3MGf5WGdt4dNizsOjwdO7lJMMteXBwOmvROLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMO5gpFDOQgkm5fz9yqXaZWkh3/pQdHT57muI9p7940n7pamKL
	HrDGuO9lL/xTVGrnCbsDWbgOxTtzf253IKIl1ozNRes4gf8tUCyPz03B
X-Gm-Gg: AYBFou3SmZAUh+x0M5aTqMik2scYFkDqjNqKhgscvMDExr0O31aupGakhrcsVBOQ3kw
	MeynNnPyqXV4V+5PYdQWEmSoWwQUwTIVDzmvCbp+VIndGH519CN7bfCPQlrk22BswjwSf9yqCs0
	GEgXS++Z6JhW6Cdsb1isoJST2+JMdLQ3tzNsOeMqbJ4mFaesHuhYGUyFKOi7754ZGCw5KcwVANL
	PloAlzoCpaLuqV8r9U7mC8KVzkXU3c0GBVSQ+hGFMTY6Q4bK9tcVusgLaB3plPex7cJkOTZ251h
	mKYnSm/7T+iBQ439rsYPzjHHwCNTjS5GsHZ9LwJZrmCPpEDetQzPL11Kb1X+PaC8zLfG117RMRa
	uKJITvphKGPd7Xc7fg5WbzXCl7BHmSS22bATIwHYZMA8c6yoXg7RrGjIRprGc89tUdXBOpU71wA
	k3OCbTx2qAK+6K9NYEAoZfpH9MpMDkv4y2YH871ZRJA5uGyWb0/jJB97e0/ge996sDjgKuh8BOg
	aU7MGrBeLH7/6N2EhEFQzuvPb/EK+dAeEsOlAJN8RyjDK1nAOyCkhQN6XoTvyssgtQcI1T1m+ps
	S3q63Q96UpEPYlyJ0sRXLpC+T6UjbJBiW517cmgLb+ZaxHz1AdODg+z8x/80DASCipSAEiaX7EV
	PvDQ/Hg==
X-Received: by 2002:a05:6214:2403:b0:914:cdbf:b6e with SMTP id 6a1803df08f44-91c819ed1c4mr3215366d6.22.1793159020236;
        Tue, 27 Oct 2026 20:43:40 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c755b557bsm29991026d6.20.2026.10.27.20.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:39 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 3/4] media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
Date: Tue, 27 Oct 2026 22:43:34 -0500
Message-ID: <20261028034335.26075-4-ccortner@gmail.com>
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

V4L2_EVENT_EOS is queued, and the m2m context marked stopped, for every
LAST capture buffer, including the one that ends a source change. With
a stream that changes resolution, a client gets EOS at the change and
none at the end, and ffmpeg's h264_v4l2m2m stops decoding there.

Do both only when IRIS_INST_SUB_DRAIN_LAST is set, which both HFI
generations do before they return the LAST buffer of a drain. Use one
helper for iris_vb2_buffer_done() and iris_vb2_buf_queue().

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
 .../media/platform/qcom/iris/iris_buffer.c    | 26 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_buffer.h    |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c   |  6 +----
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..178e50eadcf7 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -870,9 +870,26 @@ static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
 	vbuf->timecode = inst->tss[inst->metadata_idx].tc;
 }
 
-int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
+/*
+ * Queue V4L2_EVENT_EOS and mark the m2m context stopped, once, when a LAST
+ * capture buffer ends a drain. The LAST buffer of a source change does not
+ * end the stream.
+ */
+void iris_vb2_signal_eos(struct iris_inst *inst)
 {
+	static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+
+	if (!(inst->sub_state & IRIS_INST_SUB_DRAIN_LAST) ||
+	    v4l2_m2m_has_stopped(m2m_ctx))
+		return;
+
+	v4l2_event_queue_fh(&inst->fh, &eos);
+	v4l2_m2m_mark_stopped(m2m_ctx);
+}
+
+int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
+{
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb2;
 	u32 type, state;
@@ -913,12 +930,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	}
 
 	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
-		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
-			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
-
-			v4l2_event_queue_fh(&inst->fh, &ev);
-			v4l2_m2m_mark_stopped(m2m_ctx);
-		}
+		iris_vb2_signal_eos(inst);
 		inst->last_buffer_dequeued = true;
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ab8e5d953101..a8d2002e00ee 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -120,6 +120,7 @@ int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
+void iris_vb2_signal_eos(struct iris_inst *inst);
 void iris_vb2_queue_error(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8faf709c26c1..bb713da20605 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -290,7 +290,6 @@ int iris_vb2_buf_out_validate(struct vb2_buffer *vb)
 
 void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 {
-	static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct iris_inst *inst;
@@ -324,10 +323,7 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 			vbuf->field = V4L2_FIELD_NONE;
 			vb2_set_plane_payload(vb2, 0, 0);
 			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
-			if (!v4l2_m2m_has_stopped(m2m_ctx)) {
-				v4l2_event_queue_fh(&inst->fh, &eos);
-				v4l2_m2m_mark_stopped(m2m_ctx);
-			}
+			iris_vb2_signal_eos(inst);
 			inst->last_buffer_dequeued = true;
 			goto exit;
 		}
-- 
2.56.0

