Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067590;
	b=wW5atgwrTdiVRlY/IwJhojyhyQHccvdYQZlHFlCLZPIoenaUpYl4RMgSbOAAcnBh0CrS
	 RqrvQn2x+5p/3IScIYeh0ELMr7eiEsd+xOnPutKm8gLC9OH+XmWnV4CH5OfX4csU8RJRW
	 w4SOwht4SQsa4hby3m/RZBmPIaWyLyYxn799gp2R5G49fIVHoAyTsadFgwwBG8fEwpXs9
	 jcHChQdqH0EmE8un5KmeQc/qBa2K3mIcqz/awmPXdBVVV3gRGz3OE1A6Kla/aD/ZKMu+5
	 V4AeWTxiTYjGsaA7EWR1ZAGww0mOdY8jag7eKEcjSGvreSLOQ0YgtRnmqz7fm3SPi9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aIr6VGZCD6Zqdzf2id5/elaTDDhPeT2RkxyHsRz/MS0=;
	b=shwmujfRaKYYhZAL5a8EB+Yp8NuiFAkO72BZ+dj01w1s3YuRo7BvCd54jlt4RI6vWbcT
	 0cJ9qwzNG0n/fd0AQoWyI0qpiFDo7OTsVSxRoaiIZlNkZbrn4kbpQ8R0Xyom//CqghhG8
	 BtzdaqjvrUWXFYgii7zG2o4brXHQl/z6RnVXZGmaYXk+1QjXaLSKcSPjRz8g39yUOolRg
	 GoPitzJWVToEww6nivgqnedd1TAm/AGV0UcSNWvBMiJDsuqOfj1p8D6+8kx2KMg6zmmm7
	 SJ4a5PvkqjGaCn2es+0bFUqKXKAoV4dbjGIpQPt6pNFPm/SF/11uxgkGevCBmvfblaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fnfAEFpv;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19722606A332
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19722606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fnfAEFpv
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8aea7b7ca0cso29653947b3.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067582; x=1793672382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIr6VGZCD6Zqdzf2id5/elaTDDhPeT2RkxyHsRz/MS0=;
        b=fnfAEFpvvDIV2ijkpO8JLhtLrA+HKcWBlfGMd+/xhZt26vLE6eWgPaDR9/NkwHQPp1
         jz63oPbX48fcqTFcebLj3KOcIeFdirnDJSLZ2Ltaf+ho8oSRPw9sS900Kmk+COgz9Y77
         E3LWzhjt7jByfD+w7GqmoysaRJ+bQsi+60RuJE+9LThW3IJ15cUVVPI+s89lP1It+rLA
         mQW1KPX5FTJ/OPvXFxbclOF3U2qeF7RwzRD3yf6a1y28y9F2ZvtSZMcrEGsmJi+H252h
         xyKlfwljwxn0np0vsKSfA1Nfm8ygzPz552YoIPpBAPXScdgIc9yrXim9F6JrEXs5bWAG
         tPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067582; x=1793672382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIr6VGZCD6Zqdzf2id5/elaTDDhPeT2RkxyHsRz/MS0=;
        b=juKhkRw+aeBsrY698GceU8g9JdCBZUjIuIlzrxLSzAjpmtlyNkGWxz7E9Qw2PrS8Mf
         bO1ZydOiLnA6KeTYH3zznuSjNoMUXwAJk8nAysJg5kBVZiLy7QNfQ2SOeDiZVkx8G4lp
         yFBHT/bzvpHYpaIOKIPoCUW8ul4afJ/M91Mezx3IDDgwp7vsTC+MrqyHsKY8L3vc2Plm
         H7MhYkcVMKcMxgd48ZocdKsF8zvnXUQwgil61x3vjjwJO6Ek7LH59XYbr+djxxCu4ZLO
         aG5F+S+XouoEjB9UAU2pSCiKP51+FRS6OaYVhAK6q9ok8DY+4SHiN6hYoip1uncDUFKn
         raMQ==
X-Forwarded-Encrypted: i=1; AKwUvByejh4yRFn7bG1/SFveUR8tGuCa/wWDJR3jf8R8bGgL/YkZrrkdvZzfYI0Mkw3Lbe8j2D3dTfzbPFTttw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIXzeDbU2ofhFHIkE0u35WfkDo0kwiy2limEYKCULngtkJqbH9j
	TsqqTOr4u8jpcJMNXp16Jk6J9DWQOgHMSlEB4vSXcfn4LyF2wc5Su7dfyjYfAqTvlLc=
X-Gm-Gg: AYBFou2j5ky3ydLNRHnsp01UdCRAQ/1w0d6xsf6cyFzF8GtPKRyfaI29fE8GxkU+lff
	Y1n6kf40jkZCH2I3O1OOTPwhG6soEDDhLxAw6ePSPsVu/69tpqW3VYrvqft/aM+lsM6mu8RkeS2
	zrNFmaV90SjJkDKjUYEa3hCPtXeqrEZr0J90UsyHL+vjianopxLb9qr4x7qI106gJvXQ6prZnan
	TGkWlOHUDBN4C4yCxq+SujqBmhoEnRNNhTXy5m0rAFeT6hm3lgaOKXTSxEJo9Da7x9grNfTnGRt
	RK40iqE1wUMKVBWG1x9hr3gDwisvOGtgooGZyTcKZiEP0lHwdQGrBsRfks8D4W8gjjZHLsSdWNR
	EGsZeBzn/BU57cAh61M7+SkkAmxs/3SfUioo5GSQVapfZHoLFWgw6zDoRdP5/oGKBXuF7W91ZM/
	77m7HkUdJIOeXY9NB3GzbKLaS9MHMF9lNA5S8WMS6rcNmSn27QmjgHsQ7QaQ9f4UkgHiaidVZ7+
	viU018useh4gTz4zO3RuRKUA0NpGVHfsXGZF6dG6Y6yuDmvmMM01Z2P1O7S0DY1jQot/nWJqGlA
	xXXYmoauMH/0x3T7SBF/yCwwROY0ml3s
X-Received: by 2002:a05:690e:4513:20b0:679:aeed:88f4 with SMTP id 956f58d0204a3-67a4519a355mr2838973d50.11.1793067582040;
        Mon, 26 Oct 2026 19:19:42 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a462bd9e3sm4463789d50.19.2026.10.26.19.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:41 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 5/5] media: iris: Resume the first source change if it fits the CAPTURE setup
Date: Mon, 26 Oct 2026 21:19:34 -0500
Message-ID: <20261027021934.22113-6-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027021934.22113-1-ccortner@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
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

The stateful decoder interface lets a client that knows the coded size
of the stream set it with VIDIOC_S_FMT(OUTPUT) and set up the CAPTURE
queue without waiting for the first source change event. A dynamic
resolution change is then only triggered "If the values configured by
the client do not match those parsed by the decoder"; vicodec, for one,
raises no source change at all when the stream matches the CAPTURE
format.

iris instead runs a full resolution change whenever the first source
change finds the CAPTURE queue streaming, even if the parsed format is
exactly the one the client configured: the client gets an empty LAST
buffer, and decoding stays stopped until it restarts CAPTURE or sends
V4L2_DEC_CMD_START. ffmpeg's h264_v4l2m2m decoder sets CAPTURE up early
like this. When VIDIOC_G_FMT(CAPTURE) after the source change event
shows an unchanged resolution, it resumes immediately with
V4L2_DEC_CMD_START, as step 6 of the Capture Setup sequence allows, but
iris rejects the command with -EBUSY until the firmware has completed
the drain. ffmpeg does not retry, and stops at the -EPIPE that follows
the LAST buffer, after a single frame.

When the first source change after S_FMT(OUTPUT) finds CAPTURE streaming
with the coded size, pixel format and stride the stream needs, and with
enough buffers that are large enough, still queue the event, so that the
client can read the parsed selection and colorspace, but resume the
firmware in the driver once the drain completes: give the empty PSC_LAST
buffer back to the firmware instead of returning it to the client, and
send the same commands as V4L2_DEC_CMD_START. Later source changes, and
any that does not fit, still take the full resolution change sequence,
so a new visible rectangle, colorspace or minimum buffer count in the
middle of a stream is not hidden from the client.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Assisted-by: LLM sparse smatch
---
Not for merging, and not working for most streams: this resumes the
firmware through iris_vdec_start_cmd() while the driver's internal
buffers are still sized for four frame buffers, so streams that need
more (x264 at its default settings needs six) end in "session error
received 0x4000003: fatal error". See the cover letter and
https://lore.kernel.org/linux-media/179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com/

 .../media/platform/qcom/iris/iris_common.c    |  3 +
 .../qcom/iris/iris_hfi_gen2_response.c        | 31 ++++++++++
 .../media/platform/qcom/iris/iris_instance.h  |  4 ++
 drivers/media/platform/qcom/iris/iris_vdec.c  | 56 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h  |  3 +
 5 files changed, 97 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 25836561bcf3..686bfe824e3a 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -204,6 +204,9 @@ int iris_session_streamoff(struct iris_inst *inst, u32 plane)
 	enum iris_buffer_type buffer_type;
 	int ret;
 
+	/* a stream stop cancels a pending iris_vdec_resume_src_change() */
+	inst->drc_auto_resume = false;
+
 	switch (plane) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		buffer_type = BUF_INPUT;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b4fe9066fcb8..dd4200f63cdf 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -385,10 +385,25 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	buf->data_size = hfi_buffer->data_size;
 	buf->timestamp = hfi_buffer->timestamp;
 
+	/*
+	 * The driver resumes this source change itself, see
+	 * iris_vdec_src_change_can_resume(): an empty PSC_LAST buffer goes back
+	 * to the firmware, and one with data is not the last buffer.
+	 */
+	if (inst->drc_auto_resume && !buf->data_size &&
+	    hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
+		buf->attr &= ~BUF_ATTR_QUEUED;
+		buf->attr |= BUF_ATTR_DEFERRED;
+		return 0;
+	}
+
 	buf->attr &= ~BUF_ATTR_QUEUED;
 	buf->attr |= BUF_ATTR_DEQUEUED;
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
+	if (inst->drc_auto_resume &&
+	    hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST)
+		buf->flags &= ~V4L2_BUF_FLAG_LAST;
 
 	/*
 	 * The empty buffer that ends a drain (LAST) or a source change
@@ -672,16 +687,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
 					   struct iris_hfi_packet *pkt)
 {
+	struct v4l2_pix_format_mplane cfg;
 	int ret;
 
 	if (pkt->port != HFI_PORT_BITSTREAM)
 		return 0;
 
+	cfg = inst->fmt_dst->fmt.pix_mp;
+
 	ret = iris_inst_sub_state_change_drc(inst);
 	if (ret)
 		return ret;
 
 	iris_hfi_gen2_read_input_subcr_params(inst);
+	inst->drc_auto_resume = inst->sub_state & IRIS_INST_SUB_DRC &&
+				iris_vdec_src_change_can_resume(inst, &cfg);
+	inst->src_change_seen = true;
 	iris_vdec_src_change(inst);
 
 	return 0;
@@ -973,6 +994,16 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 	if (dequeue)
 		iris_hfi_gen2_handle_dequeue_buffers(inst);
 
+	if (inst->drc_auto_resume && iris_drc_pending(inst) &&
+	    inst->state != IRIS_INST_ERROR) {
+		int resume_ret = iris_vdec_resume_src_change(inst);
+
+		if (resume_ret) {
+			iris_inst_change_state(inst, IRIS_INST_ERROR);
+			ret = resume_ret;
+		}
+	}
+
 	mutex_unlock(&inst->lock);
 	iris_inst_put(inst);
 
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 1013ed2911a1..db472f9f745f 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -58,6 +58,8 @@ struct iris_hfi_session_ops;
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
  * @drc_wq: woken when IRIS_INST_SUB_DRC_LAST is set
+ * @drc_auto_resume: the driver resumes the current source change itself
+ * @src_change_seen: a source change was reported since the last S_FMT(OUTPUT)
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
@@ -107,6 +109,8 @@ struct iris_inst {
 	u32				codec;
 	bool				last_buffer_dequeued;
 	wait_queue_head_t		drc_wq;
+	bool				drc_auto_resume;
+	bool				src_change_seen;
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 472e8e50830d..db3e506de7c2 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -299,6 +299,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.top = 0;
 		inst->crop.width = f->fmt.pix_mp.width;
 		inst->crop.height = f->fmt.pix_mp.height;
+		inst->src_change_seen = false;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
@@ -371,6 +372,61 @@ void iris_vdec_src_change(struct iris_inst *inst)
 	v4l2_event_queue_fh(&inst->fh, &event);
 }
 
+/*
+ * dev-decoder.rst lets a client that knows the coded size of the stream set
+ * it with VIDIOC_S_FMT(OUTPUT) and set up the CAPTURE queue without waiting
+ * for the first source change event; a Dynamic Resolution Change is then only
+ * triggered "If the values configured by the client do not match those parsed
+ * by the decoder". The firmware pauses at every source change, so return true
+ * if the driver should resume it itself: this is the first source change
+ * since S_FMT(OUTPUT), CAPTURE is streaming, and @cfg, the CAPTURE format
+ * before the change, still fits the parsed stream.
+ */
+bool iris_vdec_src_change_can_resume(struct iris_inst *inst,
+				     const struct v4l2_pix_format_mplane *cfg)
+{
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	const struct v4l2_pix_format_mplane *parsed;
+	struct vb2_buffer *vb;
+
+	parsed = &inst->fmt_dst->fmt.pix_mp;
+
+	if (inst->src_change_seen || !vb2_is_streaming(dst_q))
+		return false;
+
+	if (parsed->width != cfg->width || parsed->height != cfg->height ||
+	    parsed->pixelformat != cfg->pixelformat ||
+	    parsed->plane_fmt[0].bytesperline != cfg->plane_fmt[0].bytesperline)
+		return false;
+
+	if (vb2_get_num_buffers(dst_q) < inst->buffers[BUF_OUTPUT].min_count)
+		return false;
+
+	vb = vb2_get_buffer(dst_q, 0);
+
+	return vb && vb2_plane_size(vb, 0) >= parsed->plane_fmt[0].sizeimage;
+}
+
+/*
+ * Resume a source change accepted by iris_vdec_src_change_can_resume() once
+ * the firmware has completed its drain, with the commands of
+ * V4L2_DEC_CMD_START, and give the PSC_LAST buffer that
+ * iris_hfi_gen2_handle_output_buffer() kept back to the firmware. Called with
+ * inst->lock held.
+ */
+int iris_vdec_resume_src_change(struct iris_inst *inst)
+{
+	int ret;
+
+	inst->drc_auto_resume = false;
+
+	ret = iris_vdec_start_cmd(inst);
+	if (ret)
+		return ret;
+
+	return iris_queue_deferred_buffers(inst, BUF_OUTPUT);
+}
+
 int iris_vdec_streamon_input(struct iris_inst *inst)
 {
 	int ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 5123d2a340e1..0270456996d0 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -15,6 +15,9 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 void iris_vdec_src_change(struct iris_inst *inst);
+bool iris_vdec_src_change_can_resume(struct iris_inst *inst,
+				     const struct v4l2_pix_format_mplane *cfg);
+int iris_vdec_resume_src_change(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
-- 
2.56.0

