Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612186;
	b=GggBFVgPqadLgS0LYc9hlL6Jp7bSiOh1vJJE0TJTdcV2l75FdJWGB0RVZzeyAvNjCl2A
	 t0cTSlRkl2DVvMqOJ0lj39+klTmwlBlA11t/J/AADdnTM1XOB5BB/Y8pFJYVKvU+28fW7
	 sxuF+GlDEdvLEuEBYNQmEkiFR6m5mvF16724HkImYVbqgFzV/Da0ejJHUzswms78WoS3P
	 B2h/7AF2+FHDceJmunSMz54JJe2ZgiAs3X/dNGHDoMfpA8Jae5srFCMzBSKKEoPTeHIyK
	 zdRkr3e+9Vh15v/5N2OxiWeJBhUon7hfU/Dk9MSx3kEgIOHIXcy/eyqNqSWKBQH4lUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cS7r7rCOCdLGahd/IAOlqFcl4cZmu++khrbmV7i67eo=;
	b=Fmgt3BG75coK9LjQ3sMi+JABJmXg9F5JeBacnA5ONJFtExhfsMpqJdm+ZBLLBYX7/qcx
	 klSyPceScf78coBPFEIVBHgVoL/mk4Tosj4r8TpdjKDSKZgOE9Weu3c+Yayc1o+/6CdU4
	 n37Gvifu9XHx0g4WN7aHSvQiW2vSh1pqAUmte7JiT5M56emG3x39shXUsn4EHtoepZLlj
	 QQ7dvJ33GWBj31ppDv9DUupeVC/vj6BGm7dh0dOJ93na3sxHLXQoBCDWEZ2/3ePVJD4eF
	 uKNHCdmqsssnt5ABBoS40cnje1eyrXNSYqsiUucrTEkwgjry8SwNVBrKEFQ1SDLqP9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gKx408+z;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F8606A6A2
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4F8606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gKx408+z
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3920235f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612183; x=1796216983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cS7r7rCOCdLGahd/IAOlqFcl4cZmu++khrbmV7i67eo=;
        b=gKx408+zAon9pAYt77YI9EFyQ6u1C+XrGOmV5M702Fm7yg1jTsyKNCrRaE21JmbZu3
         +9n/28sfST86qkE9SqWybj8xofZAaq8w970msxTBtfiVXZRDDaWezf4rsB5ZgLiVGVgD
         udTi+hRF/Ur1/PQgJOpgiLq/NvpsksaqA8tEXHQexUBLexkyiJ87369MeEiL2SowcbK9
         q0+WFoeWKQaBN6RYMv6z6cblOUf8RmWtYGcz5+uqfRXcVxy2Y8t076KfAxPC5Lt6aWOo
         uWrmjzORjURQLtTjPnpwoOvcBTHHWP3pElbQHRRxE48iBafxPYECg4aArG+wlLnfGx6O
         vC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612183; x=1796216983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cS7r7rCOCdLGahd/IAOlqFcl4cZmu++khrbmV7i67eo=;
        b=s7FpkZSjh2iY8zOJlowaQQSCjEEHISzNZRYUnQQcQ03Vk30eAx6DJiLbLcG4MykE5G
         5GEa2HsTp0ty0zocYQTurCf+0mxhmi3am91QCRzyiEazQDTs4bSniJa189u/Je/50iDK
         QxTh+6LtB9HweV6RnNLgVfnOu2zzFbE+c9gb8WPgZXZQDeO3NAtUSzUMja3Raobgcslz
         AmoK9jks2BapaQEqxXsqPx0WV1dMAl89e4r3uSRWpr3Kzwnn4jT1RJrwQjwY/K/GmvAu
         UTBJIYLBOpm5LhTtYa34F8/D5PoyLy2tiWqcGTFwUZsF/waHtPbum0Fho/HnSA0xyBoz
         t0Jg==
X-Gm-Message-State: APuU4Z+CDD9Dn5iAL6+crJH+pWtznYFG1qccDZGvjtXvePCy9y71lOns
	ynDD64HPP8Yi1MtH8H29iGHYVvIH37xKR0j8Vn3lOIZVbMr6xzXHutJ5gYcL3qJRBLs=
X-Gm-Gg: AZFdTZcSRXqv8LDTwGNu3vGysUF4zkETZuzpH1viH6BtHZWB8SXMVhfa35vkkR+zQPG
	TcvMyQ1rABUjzP9NUpmUk89B+YT/suDX64Ea1+7Azi0gVT8h/QAaCXZyUUoAk1WpkgxCtgo1/9o
	1rFQtOlwqwZbHHB9LEhRZACGFNYi/4TI2Rviz1KwXPxXGAlR6qiIYcfpnItQbG4mNvdSTQlURay
	rUYAV0oausFCwBav9/XEGVd8hmIGCfLQf4HO+zW0n9tDJla98XAtdR9seOdnkgO3LX2bvb/m0DR
	2EZLIMfWEokvH1yH5xgNckIi3bmhUqYT3bgDl7WGposfwjhGj6wc5wWaAA8MRyTbMCqauea6koS
	INFvy3zO1THo0HLLynKd2oDhDjgP4BkjR4/p+hXm5K49uN48UZmVg4+icJXg3ZW8rXsXFUNsCNw
	17lrdJI3neA5+9ZJVIYeK65v1u3v8Bk1Vtlm3QgMuGszhlviiPJlUNwkbnCF3GO21yX0MJ+V5Ev
	GaBwqnPcUZBVFXsRIBQ1oyTJ1UUo1w9a3kxRVyc2u+G7WLL1n3e5TVv0b5o9/q/SC3RJvcEEegH
	xuX04jKv9UxZuvun/SNo875/EFCui/EQu74z6uCYbOzE7/bTCLI=
X-Received: by 2002:a05:6000:40e0:b0:4b8:6c3e:95f5 with SMTP id ffacd0b85a97d-4b86c3e984cmr7309630f8f.30.1795612183200;
        Wed, 25 Nov 2026 05:09:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:36 +0100
Subject: [PATCH 09/11] media: iris: vdec: resume an unchanged VP9 settings
 change after a seek
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-9-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10846;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PAb54xWwMH3AV7bxWLoqg7GcttWtQHKqGajir65iu+s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4OTUF1RTxRGb3UXtPdMtkj3Y4Zk3YFgPz/BitT
 Kv3Aha+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDgAKCRB33NvayMhJ0QW2EA
 CbuRM9299XSt5zf6FehkMTwf/CigUNXrI6D9W6HGbcIzlzWEQJ5/vI1rjOvFSd8/sAFcUJHMfSKhwq
 vnBP3ws/bA4PoXNv19vHbDT7MA0d4XNAbfw6G38/SAu7RA5QzEe/MaPTUL1MbHmrYQdxdUSurtsN8v
 bPnIyvUWaJPPIHf7Hjd/xeK0kzYIU2svylC7oGuD+LKA7fvpR8RCoQBCqw6fnJ+fCx0u6KvIShUrIB
 EJ2V7OIFZRbvcfNDBHU1FFYvG350p7GWZJnIWgrG0p5LRpHl4t3YrIgHUMSIc/pA1+oo6NrXKNgppZ
 q49QwxMKVGQc0MauGJ+QiNAe1XwkvBQf+An4c2pzqWU4p5sSp5kVEQXuklg/FyJ9da7rLGnX6kVeC+
 XpL7vo3bjyHpeZhTYArA71bt5RR5c0ePsAuNcstQjTytqPR3x+t/HSXsIHFbeehY0/ZlnaFNwAuI3A
 MCwtT/4WSxX67gVbNcVAuCKDjS3q5J739pR9OHU1FzBBJJoOGvcFKXUAdSLWBWoxRCsj6OxGWW79n9
 qSD8Xa6oMzakE66WfSg6ZtjVUtCNo2iz000agsLHWZQHkrQWq6+KNjHPqg+GgtDleJT+0xhtni8+le
 Gl+POVi7vTs7QYpBCMmbP7Tknv35STwjr868UciSNYsuiGY47VWx5TTtqZOA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

After a seek, the VP9 firmware raises an input port settings change for
the next keyframe even when the stream format did not change, then only
waits for the input port to be resumed: no PSC_LAST buffer follows. The
driver signals it as a source change, and a client following the
specification waits forever for the LAST buffer.

When such a settings change leaves the CAPTURE format, the colorimetry,
the visible rectangle and the minimum CAPTURE buffer count unchanged, the
client has nothing to reconfigure: resume the input port without
signalling it. Other codecs pause the output port for any settings
change and need the full source change sequence.

The check is armed by STREAMON(OUTPUT) while CAPTURE streams, and ends
when a settings change is resumed without being signalled or OUTPUT is
stopped. Frames decoded before the seek can be returned after it, so a
decoded frame does not end it.

The settings change for the bitstream queued before a seek can arrive
while STREAMOFF(OUTPUT) waits, without the instance lock, for the firmware
to stop the input port. Keep the check armed until the stop completes and
do not resume the input port then: the next STREAMON(OUTPUT) restarts it.

Should the firmware still pause the output port, resume it and do not
return the PSC_LAST buffer as LAST.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 28 ++++++++++-
 drivers/media/platform/qcom/iris/iris_instance.h   |  6 +++
 drivers/media/platform/qcom/iris/iris_vb2.c        | 10 ++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 57 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |  5 ++
 5 files changed, 104 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index baaab9608da0..4f685efbeae9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -350,8 +350,8 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
+	bool found = false, unsignalled_psc_last = false;
 	struct iris_buffer *buf;
-	bool found = false;
 	int ret;
 
 	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) {
@@ -360,7 +360,15 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 			return ret;
 	}
 
-	if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
+	/* The firmware may still pause the output port after an input resume */
+	if ((hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) && inst->drc_resumed_in_place &&
+	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
+		ret = inst->hfi_session_ops->session_resume_drc(inst,
+							       V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (ret)
+			return ret;
+		unsignalled_psc_last = true;
+	} else if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
 		ret = iris_inst_sub_state_change_drc_last(inst);
 		if (ret)
 			return ret;
@@ -381,6 +389,14 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	if (!(buf->attr & BUF_ATTR_QUEUED))
 		return -EINVAL;
 
+	if (unsignalled_psc_last) {
+		inst->drc_resumed_in_place = false;
+		if (!hfi_buffer->data_size) {
+			buf->attr &= ~BUF_ATTR_QUEUED;
+			return iris_queue_buffer(inst, buf);
+		}
+	}
+
 	buf->data_offset = hfi_buffer->data_offset;
 	buf->data_size = hfi_buffer->data_size;
 	buf->timestamp = hfi_buffer->timestamp;
@@ -389,6 +405,8 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 	buf->attr |= BUF_ATTR_DEQUEUED;
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
+	if (unsignalled_psc_last)
+		buf->flags &= ~V4L2_BUF_FLAG_LAST;
 
 	/*
 	 * The empty buffer that ends a drain (LAST) or a source change
@@ -665,6 +683,9 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
 					   struct iris_hfi_packet *pkt)
 {
+	struct v4l2_pix_format_mplane old_fmt = inst->fmt_dst->fmt.pix_mp;
+	u32 old_min_count = inst->buffers[BUF_OUTPUT].min_count;
+	struct iris_hfi_rect_desc old_crop = inst->crop;
 	int ret;
 
 	if (pkt->port != HFI_PORT_BITSTREAM)
@@ -675,6 +696,9 @@ static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
 		return ret;
 
 	iris_hfi_gen2_read_input_subcr_params(inst);
+	if (iris_vdec_src_change_after_seek(inst, &old_fmt, &old_crop, old_min_count))
+		return iris_vdec_src_change_resume_input(inst);
+
 	iris_vdec_src_change(inst);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index d852299d3f05..53693bc53a8e 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -57,6 +57,9 @@ struct iris_hfi_session_ops;
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @vp9_seek_psc: a VP9 seek may raise a settings change that changes nothing
+ * @drc_resumed_in_place: a settings change was not signalled, its PSC_LAST may follow
+ * @input_stopping: STREAMOFF(OUTPUT) waits for the firmware to stop the input
  * @drc_wq: woken when IRIS_INST_SUB_DRC_LAST is set
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
@@ -106,6 +109,9 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	bool				vp9_seek_psc;
+	bool				drc_resumed_in_place;
+	bool				input_stopping;
 	wait_queue_head_t		drc_wq;
 	u64				last_buf_ns;
 	u32				frame_counter;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index b56c855567a6..c19de89945e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -262,11 +262,21 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 
 	mutex_lock(&inst->lock);
 
+	inst->drc_resumed_in_place = false;
+
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
 		goto exit;
 
+	/*
+	 * The lock is released while the firmware stops the port: a settings
+	 * change for the flushed bitstream can still be handled meanwhile.
+	 */
+	inst->input_stopping = V4L2_TYPE_IS_OUTPUT(q->type);
 	ret = iris_session_streamoff(inst, q->type);
+	inst->input_stopping = false;
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->vp9_seek_psc = false;
 	if (ret)
 		goto exit;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index f7f3171ed6ad..edd58c0dd4a5 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -375,6 +375,60 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
 	return ret;
 }
 
+static bool iris_vdec_capture_fmt_unchanged(struct iris_inst *inst,
+					    const struct v4l2_pix_format_mplane *old_fmt)
+{
+	const struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
+
+	return fmt->pixelformat == old_fmt->pixelformat &&
+	       fmt->width == old_fmt->width && fmt->height == old_fmt->height &&
+	       fmt->plane_fmt[0].bytesperline == old_fmt->plane_fmt[0].bytesperline &&
+	       fmt->plane_fmt[0].sizeimage == old_fmt->plane_fmt[0].sizeimage;
+}
+
+/*
+ * After a seek, the VP9 firmware raises an input port settings change for the
+ * next keyframe even if nothing changed, then only waits for the input port to
+ * be resumed: no PSC_LAST buffer follows.
+ */
+bool iris_vdec_src_change_after_seek(struct iris_inst *inst,
+				     const struct v4l2_pix_format_mplane *old_fmt,
+				     const struct iris_hfi_rect_desc *old_crop,
+				     u32 old_min_count)
+{
+	/* A pending drain goes on once the input port resumes */
+	if (!inst->vp9_seek_psc || inst->state != IRIS_INST_STREAMING ||
+	    (inst->sub_state & ~IRIS_INST_SUB_DRAIN) !=
+	    (IRIS_INST_SUB_DRC | IRIS_INST_SUB_INPUT_PAUSE))
+		return false;
+
+	return iris_vdec_capture_fmt_unchanged(inst, old_fmt) &&
+	       inst->fmt_dst->fmt.pix_mp.colorspace == old_fmt->colorspace &&
+	       inst->fmt_dst->fmt.pix_mp.xfer_func == old_fmt->xfer_func &&
+	       inst->fmt_dst->fmt.pix_mp.ycbcr_enc == old_fmt->ycbcr_enc &&
+	       inst->fmt_dst->fmt.pix_mp.quantization == old_fmt->quantization &&
+	       !memcmp(&inst->crop, old_crop, sizeof(*old_crop)) &&
+	       inst->buffers[BUF_OUTPUT].min_count <= old_min_count;
+}
+
+int iris_vdec_src_change_resume_input(struct iris_inst *inst)
+{
+	int ret;
+
+	inst->vp9_seek_psc = false;
+	inst->drc_resumed_in_place = true;
+
+	/* The STREAMON(OUTPUT) following the stop restarts the input port */
+	if (!inst->input_stopping) {
+		ret = inst->hfi_session_ops->session_resume_drc(inst,
+							       V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (ret)
+			return ret;
+	}
+
+	return iris_inst_change_sub_state(inst, IRIS_INST_SUB_DRC | IRIS_INST_SUB_INPUT_PAUSE, 0);
+}
+
 void iris_vdec_src_change(struct iris_inst *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
@@ -418,6 +472,9 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 
 	inst->frame_counter = 0;
 
+	inst->vp9_seek_psc = inst->codec == V4L2_PIX_FMT_VP9 &&
+			     vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->m2m_ctx));
+
 	return iris_process_streamon_input(inst);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 4b903da58056..5b55354cc25f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -15,6 +15,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 void iris_vdec_src_change(struct iris_inst *inst);
+bool iris_vdec_src_change_after_seek(struct iris_inst *inst,
+				     const struct v4l2_pix_format_mplane *old_fmt,
+				     const struct iris_hfi_rect_desc *old_crop,
+				     u32 old_min_count);
+int iris_vdec_src_change_resume_input(struct iris_inst *inst);
 void iris_vdec_update_min_capture_bufs(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);

-- 
2.34.1

