Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612181;
	b=AAkDqTk0rSPF66/UkLbQ3wdG2TOA3hPlgCKClStTHJHYz5q279WTFe29q0zDRmiMzqMf
	 9oseJJUxe+2ThmNZGUspKw6UZ4/KmMm92pNDGPFEVNdADnOLEMbOCjinxMlD2QTjYatqw
	 +FjYX/gHlUqRtGDV+Mv3LhOcW5p/AuEqWGys9vKbsgAHtVlxuVJJncXnp9IxNQUHrf9Dh
	 5Yz36F31g0NkoU1kZbi4cH47zj4fb3HcuCK0V75Uz8UZ375Y0zC+qF/jjtBS7HvrzUWR5
	 DjSapglK++ZDEOBtb80tA+JxHseaQ3gBkfhagjHmq/jZtTPz0Q9t7J9S6IK2VQoBOHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1JnaOvzbLcP2sNcJP976acP71/2cngYyNJU+YtGyJdk=;
	b=yLGHjvjSEnsdL5lAUkvl7ouPQlFN9WACyYAD8ZkG8vxeq9E/Rf+JBREf1+WAZgpWLlh6
	 Wj/S0w2cfQSL/bGSeelB/6wdYCrKzTQLxnjpcZuywMol0lEpu0VYCzlaV/wK+ARF0gPgv
	 na40XHW/L+saApLebFYEH8v+a9XfWZKjj2tk2ofSEpPmZeSr6mF0zLSQIuUF5zAty2+wg
	 5HK13WIS0kW8nlYIGHFVgrH0DJh+I6Ev41/EgDsNLwSLwhoQTMg3gJfxjlbQ86ZD80maS
	 pi+E7kw+GRcjwQCAHA3snJrrRFrMs67suyzrC7Dza88TCJfeVGy9G/KXUT21iir24FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbaI0mzv;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B0D606A686
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B0D606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbaI0mzv
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3416859f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612179; x=1796216979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JnaOvzbLcP2sNcJP976acP71/2cngYyNJU+YtGyJdk=;
        b=EbaI0mzv9QD673NFTbDjtC8hootssIeqFAp+yVWUM17sBxfOH9Ky93rUtaqMVmDcGu
         jVgWphl8Z8s4K8Ru/UixvMwj2E+cugNqVG+PWjCkyHU2FMrahqn+ZdI98Owi7wscYJxA
         bhpR/WxYFp1kjnPJH0PXi1KMrYmiT+tVkLm+46VLyhTW97BA99B14AIT3ofwtXpPeFnS
         JHOta2tooiSV04y7D4s4jm1muYBKsQpHF/Sy14h0x3NUgXhorXjrk2FhiWuBXrxYyBZg
         KE75pcKUKq2NOzN3IefjdQkGIwyg9dGIFqIvxOXCk04Os7xamg+q2+U8a/jDOpJLuQ2t
         5r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612179; x=1796216979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JnaOvzbLcP2sNcJP976acP71/2cngYyNJU+YtGyJdk=;
        b=VZi0m2ezXYavLEFTAKA4gTUHUUBx0xjr5hJpjJ8h915r7RGTI8sNqVk18Hp8iXJ9Zo
         CD4D+aaZFXxIsrluz2gF2ptUg+bHjROPoGyn4kF7iCV2NoieoncpH4iFoD8H3/AojPYs
         Fz2S65f2ULQd90R6YbDZITMxVYJMv3Mmu93uw14VdT4fHzRP8q40JzYw8iP2X7CIBN5l
         wBYTFoRn2uAQG8ZpTqYRa3OLnb1y+z1OK8bz5UT8VmOJ4fN0hM6OVe4zZR4CVpKcTTFd
         /vWq8gFcqi/DuUDl02bKfn2hfYqMIpkpJs2akPaaAQOvSZ1tuGNj6awGaX6cw8pz+bcB
         29ig==
X-Gm-Message-State: APuU4Z+4bs0QuIOhjsnkxEYHrjCBujV3hk3rJnH643M8mM1vEXHXwYMk
	xeB+xFgGw4q3PAXIcLN/RXzST91ZJMer5dPRd6rYua2EXNJKClxGJIbRG6sNhkkMWIs=
X-Gm-Gg: AZFdTZeiqMpQ1k6j1BSKxJHzPAx7+72noV9a9Kip4shtMz/HZyWmqL+/P3HPy3cJBhd
	VidPumu0cUUv+uD5Q73DMwDGbJf7pO6WpulRmOb6MJl8DnbThxdlJhwf6SoGZ6wHSKhkjb7IZK8
	Qe13mlbkxI8yJBh28frSPQGnyTx3Q7EjdAQJLCyaOxEOlichYWwd6IhpwXCmKOJDVsZJduGgyTt
	ub8Pnoxx6pLR5nPDi8wfUNAL8qlduOptOMvC3E0dmg+qA1yBINBvl9Au0MdftgwdC392yoDQXgc
	N+qFh9g81aqLZ9WwC2q8Y3Y9bzHX27ob48w/DvqEY4PDjTTj67kxThi28S1jVpH8j9zLhKOoc8j
	ON+4vEFaWINa4I8Bq4U8vgwx8UKVOFI9Qg7k6na2V38qiPGTMSeoAUwH63aOKOd28Hl+9so7HLb
	RiJ4J5PSmQZ4RUKZVx21HjOTBZd/cbkH1gusY/rqCXMUsIdveELEmv9DVhkAjP2pZX9NzT1rlr3
	mZdQkk87Gy6Vd0fxMSJdK6xzBX6GeOYalVkZdN8x2YCPfiE6tuSDq7mm+F68r3Ua5f0ic+T7zyJ
	IKkwAOz9W08Mw70Y1/1Wzm+IrqiZ874C99/525nIdPB6fkcncw==
X-Received: by 2002:a5d:5888:0:b0:492:5ef7:5d98 with SMTP id ffacd0b85a97d-4abb6651686mr32474274f8f.38.1795612178820;
        Wed, 25 Nov 2026 05:09:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:30 +0100
Subject: [PATCH 03/11] media: iris: vdec: update the minimum CAPTURE buffer
 count on S_FMT
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-3-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6575;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nYHUBJsHcHafB3LNG5mNYke12OYzvMxrg+k8D9QxsnQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4MXnN1nigUPpWW3dPL+MKiiCTJHAKjfUO9u/UY
 oJgrCM6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDAAKCRB33NvayMhJ0bj8D/
 4iDBarraz5ico7ycdwYYlX1R1NgLLT5oViAQt8WW89zNnpOQiCfTHzKUw7RaYpoGBng1e48pnHWofO
 V3YE3iIWkRk1nXq8V3kT7V0OcRN9tOg6yhHAidAodKjYZ7gMWJg1nbsn98wKsRuQIePSiAuYCILrn+
 rRoyMTWUnjM4skJqegaFFG6EqexPAqrpJEANY+YmdDHcb/ydebr69u2GCBmAAIDSNsbi5/26f0Vq6A
 GbRDs7SIvz5A0MczQzlET2cynDY4nlgAQQ7lXFojqLduQ7aOFGo1VCg0KpNysbIa6yjZEfYuDv4rGp
 iFwx/9z8iYYN9RYMxGZDzblO1sQL+dNFVktSeUSJkw6PAlNwOKxYKxEuCV+I9UIgpAfqAS4f3ss4R0
 DSm4eJ44iRrxBNmpxcqZfm6PwLTlDmkZYQRXVj3zm/uj36JAG0Mniuy8QySnpVa0e0LEmhXfN71RGX
 TyhxhnQTxsOl/Ybhp624KISG9FcQXYcMfIbpYY1YMaG6o6wnq+y8kFM+hJl2wfYyfr0wMcZ1bhFNOn
 8xSiVjtEUGEyGcE+552iCzv6TeOXNXg2IkDdvcH+tSrnVHYkDkqRxEhEGg9Vs90fjkxzAfg7bE1Brm
 Y0Kysqx5HhCBsEw6+wuaxT/pttcMU1+5eR7qqtm3y7rNeQ7R0oJzpx6V+PDQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

V4L2_CID_MIN_BUFFERS_FOR_CAPTURE and the CAPTURE queue
min_reqbufs_allocation are only updated on a source change. Until then
they keep the default of 4 while S_FMT already computed a minimum of 9
for VP9 and 11 for AV1, so a client that allocates CAPTURE buffers
before the first source change gets fewer than the decoder needs.

After a new S_FMT(OUTPUT), the firmware count of the previous stream
also still sizes the CAPTURE minimum, the internal buffers and the
minimum output count sent to the firmware for the new stream.

Update both whenever the minimum is computed, and reset the firmware
count on S_FMT(OUTPUT).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c    |  9 +--------
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  9 +--------
 drivers/media/platform/qcom/iris/iris_vdec.c             | 16 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h             |  1 +
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index ffa98139f0eb..70b97902ca2d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -32,8 +32,6 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	struct hfi_bit_depth *pixel_depth;
 	struct hfi_pic_struct *pic_struct;
 	struct hfi_framesize *frame_sz;
-	struct vb2_queue *dst_q;
-	struct v4l2_ctrl *ctrl;
 	u32 full_range, ptype;
 
 	do {
@@ -158,12 +156,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	inst->fw_min_count = event.buf_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
-	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
-	if (ctrl)
-		v4l2_ctrl_s_ctrl(ctrl, inst->buffers[BUF_OUTPUT].min_count);
-
-	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
-	dst_q->min_reqbufs_allocation = inst->buffers[BUF_OUTPUT].min_count;
+	iris_vdec_update_min_capture_bufs(inst);
 
 	if (event.bit_depth || !event.pic_struct) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b4fe9066fcb8..baaab9608da0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -537,8 +537,6 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	u32 video_signal_type_present_flag;
 	struct iris_core *core = inst->core;
 	u32 full_range, width, height;
-	struct vb2_queue *dst_q;
-	struct v4l2_ctrl *ctrl;
 
 	subsc_params = inst_hfi_gen2->src_subcr_params;
 	width = (subsc_params.bitstream_resolution &
@@ -661,12 +659,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->fw_min_count = subsc_params.fw_min_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
-	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
-	if (ctrl)
-		v4l2_ctrl_s_ctrl(ctrl, inst->buffers[BUF_OUTPUT].min_count);
-
-	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
-	dst_q->min_reqbufs_allocation = inst->buffers[BUF_OUTPUT].min_count;
+	iris_vdec_update_min_capture_bufs(inst);
 }
 
 static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 472e8e50830d..656e69d2c942 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,6 +63,18 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
+void iris_vdec_update_min_capture_bufs(struct iris_inst *inst)
+{
+	u32 count = inst->buffers[BUF_OUTPUT].min_count;
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&inst->ctrl_handler, V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, count);
+
+	v4l2_m2m_get_dst_vq(inst->m2m_ctx)->min_reqbufs_allocation = count;
+}
+
 static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_NV12,
 	V4L2_PIX_FMT_QC08C,
@@ -271,6 +283,8 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		inst->codec = fmt->fmt.pix_mp.pixelformat;
+		/* the firmware count is the one of the previous stream */
+		inst->fw_min_count = 0;
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
 		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
@@ -294,6 +308,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		/* Update capture format based on new ip w/h */
 		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
 					   f->fmt.pix_mp.height);
+		iris_vdec_update_min_capture_bufs(inst);
 
 		inst->crop.left = 0;
 		inst->crop.top = 0;
@@ -310,6 +325,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->fmt.pix_mp.num_planes = 1;
 		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
 					   f->fmt.pix_mp.height);
+		iris_vdec_update_min_capture_bufs(inst);
 
 		inst->crop.top = 0;
 		inst->crop.left = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 5123d2a340e1..4b903da58056 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -15,6 +15,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat);
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
 void iris_vdec_src_change(struct iris_inst *inst);
+void iris_vdec_update_min_capture_bufs(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);
 int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);

-- 
2.34.1

