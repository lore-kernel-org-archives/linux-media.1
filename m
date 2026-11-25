Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601589;
	b=fjL97hQX6OvgekSx023xU8K1fvN45ODk6EOUIUTblEnxO/AyxWUCs8VVTn/wtO9nsCzR
	 W0lc5+ovGQsKmAj22sFpF3IUK753uZ0j/L5QgVt3u1Zmto+m+ETxn3KAYeiqhSqSCX81D
	 O2UjyZBOeiYEHkPU9+kWmbrLYZ9DDBuA0leuV54ofUnPLO6q9ZVMs0HxDfJ6tnyIXm+yx
	 9aru6pCbDUy1w1fAAakdpNaqDbJQofrGZuHF+WUQjKEexsSCQY8sbKQ3f1FdIUOTmIMCV
	 utW8BqKSlRMjIkiQutMdWyfki1trNQ1XvH1xR/v3k2mk+k3Rv/sRwh9ZsQjuaDTzPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jx/LCxfv8eqgvuidoesHPcbW6O8gpIEcjfCZ4WAhrfk=;
	b=acrRUNKEE7rqEwXTiTqVuJFipQpH38kxKGrarilFKlqFUw925gm0uWpA+bwj3dAQ6Zjo
	 2h1HLAKVF+6qAPqrxfSLbJIh8A0tU7Il+jZudkkc0wzQWgm1eiLRAv3WClqs+u0DPXeFu
	 llH33E6o9cCZqmCTlxzmVeojEzDR+X7XkeKVlfsCI0IuEcsRw6DKJzscdKlcTT6m6OR+8
	 AVF7A4s43Vd6uU7ZIF3Q/KWCe0tKejma1/SL2wC77iXW/u6LfZmlbFhiMoB/YXDZyMcBK
	 6kbbxY58NtKbxqzfJEAn2C8veBZjl7m8BMv4xT3cdz8C9Bq5sTor5ikhYukeE9oC0Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C0XudE5F;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFF606A331
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AFF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C0XudE5F
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so71499835e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795601587; x=1796206387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jx/LCxfv8eqgvuidoesHPcbW6O8gpIEcjfCZ4WAhrfk=;
        b=C0XudE5FRbpkN2CJ2rjDl/Rg7FvqNkhoZrhkG0mcbtLVDsTBoLXFhArJOQqDF/alZA
         D4c545Wpi/QnJwWUbzA3X69j2Y4GIJ13cBwAnPY+2I+Ql04RJL5A3tjOipi7VX0lV0cw
         TWLcBZy7+i4qSC/z9zlLjJdXoKz2Rtqj+RAVPYCvIWlXbVssVV0+KGxIyKB4U4/Yifq2
         dorFSt8EUxT79fg1Wmq+5igA/QcZUM8T6HnZ5vny7z6Ju63XZL4FfCRc65pJyC8kVsD3
         S/tjTyxl9OwMDdSlABWb3+uY/L/u0xpjgPepEPNWR7YGAqUVtSAeg/fmcoIwV6JOYz7U
         Tg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601587; x=1796206387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jx/LCxfv8eqgvuidoesHPcbW6O8gpIEcjfCZ4WAhrfk=;
        b=wKB8ht6YPqa88t7UodVhzzaULNSZBgefdI36kr5Um/aqYkOUg3K5AYkUJ5o/hnSnHd
         mF8AMNIMJheFdJvrwE7WoXgWiSRP6Z6OA1QrGVHI7bH/hAfKsNdHKUY44ojvWKA6c7cn
         j+HHSyN/6KIXdKnOtmTK0nWJU+py0+QN2bJG9CYpOlYsyIoHH87HMaGR+g0ah1PwABib
         z7YSGpevQiDH17uxtVOIyMg41LMirrdyMP2+D5wRkMNPVl4CakanlGzJ3I4hb+N/6wJt
         OqnAo+ijuoLLzmeUle+IlIqON7fb6F5YCB4JcxIWcpF4F1bcprEcgXx1o5NkNHx4K6AX
         XtvQ==
X-Forwarded-Encrypted: i=1; AL+hErFWAAtMJki1RYo/mDRlaRBkeSOsWAt2IQpGg5OVya7ZrzG/9tK3XCnVSB+BRX/BKaKoldQtbQBIn+XFyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kO0v+jl92k3+KfDqQ/WBNM0mPxVCBKzalYo0GQoqPakirFTPJ
	i6j5aePqbFiKf5lk9/z+zox/xMLjyExYrrub+2kqlh/GDnYSEaKNIsj18IYhFvh24Fw=
X-Gm-Gg: AZFdTZcFHbpxhMjAB/qZAhLAcurmJWBVjIht9E32zK2Qcml1ExdlBdRsK0Rjl+gbI/l
	TIgD315S59PWpoHN7AuqoRdcEmxwgx44+3sZXHkPgZdy3cCsIaWznMZeNIb8R5aVWoZNU43DmCs
	bKzDfpYRsBWNYXRhyrydqnsfC4z/jwsTsdA8DCf52PDq1EvTXvz5yrTSPwPaLVjePDF9VMbSmH/
	RjwF2WlEovKkQs16cxfTUp5IPMs9X1e6PxTtFG2h23hIW957tVpoJDkUIUoW/y10ceD4EVrxPGd
	yILoa9U2KdP0J+5nBK6wLWcnaLcxgRqK84d8FC3tCY7XsmFNw7BMMm0q9/yLFLJgB5en0Q4x8C1
	7RptQq/SQPTKsXZ6DN0vz72U0xyHzRKP/bezjH/8/iTjjZo2ydH6nFW9lRZiylGR7BGFwWaHzKs
	YzZtFBqkSlmmiTDbbBTQ1+2DeEkkg6EwWf6UK0l97RGg1zYEzcBdiujLkE6mS/9cjHKa4oALk8b
	v2WlLAlkubqBQsmX81637ioptS6UKuRkI4ip2iOWH5us9qKJZPdyFYGcEmEGA6i0Iq3Nhk+Xi6W
	OjYqcGd7KQgLreXCtvt1jcr0KXfg3fXdnR5KkVWjJOBxbmg8HsQ=
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr171421085e9.2.1795601586867;
        Wed, 25 Nov 2026 02:13:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm31713382f8f.18.2026.11.25.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:13:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 11:13:01 +0100
Subject: [PATCH v2 2/2] media: qcom: iris: venc: drop operating rate to
 match spec
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
Message-Id: <20261125-topic-iris-encoder-fixes-v2-2-fe6af9761f83@linaro.org>
References: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
In-Reply-To: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11172;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=twRK/1r4OljDqwYd5XcRUTKV3Rgp0yFtrtsck2t9GXA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrSwqx1lKKMtgruw57n+8P26MZWfR20jRjxqtcrm
 nwEtW2mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa0sAAKCRB33NvayMhJ0aQ+EA
 CSlOUe2N3aidgNxeHIEwVaJXLTkyPTt49qkSOjgXMAGXNf+9P5vK4O5XVVC0L/S0KkeXKWQO3eBUbW
 2LTtOvwrS7Zvm0/4MxBM3LBGAaNWmVq4/x1cRFnXPnovJ3r+ZS8uykOZADxo5QKmJklNDlXAD2hhBw
 Ja/dOq/R5kwxHdKPaZuHfXEl+sionynqC6QhGw5+MYyogli2pT769ASc9zE1VN3ZJVZ8mxIQ5Ut0SF
 hoF0N0JTy4K3UWP+NtKs/6KnbWeXkHQAK6bCOZtR4xpwIYyfRyFjJBpGzT60sBe5JsTQLsS0wAEpXd
 doZlrOB7X22uRaTh9bKrJNad8deCu8rY2/Cw6zERCQnpTZFoXakC04FGcEfQm+G+F1hLuU7tRdsv/Y
 ydvn2Qoi0EZvyw6KYj6iMulWkjXRheZHVw29EbVuUdSCNnazOhX6OnhZUdBgJWNMAuDojuVaCnW+nG
 6Jl0iF2nORnWWoLF2vyAblhQz3gRSpdYtypgweUMh4YwUQxmL6HIMFO6ndXj/Ze0E9gfsuUo3R3yZY
 PqtvGA0NttSMaMDjGQMhIt7VLYbby2vz54HmmgFRrNbFuwv8RKJ4I0RRJ+XulsoFwq3Pwr/IGo81h2
 o9yeMe4oqe5oOuj0TApmUvL2AB01f2dtxLbQ83MvP37Cebvg2UrRSdi3fk6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Per the V4L2 Stateful Video Encoder UAPI documentation:
  Set the raw frame interval on the OUTPUT queue via VIDIOC_S_PARM().
  This also sets the coded frame interval on the CAPTURE queue to the same value.

This implies setting the frame interval on the OUTPUT queue _should_ be
supported as a single operation, and setting the frame interval on the
CAPTURE queue can be considered as optional since the S_PARM on
the OUTPUT queue will set the same frame interval on the CAPTURE
queue.

The current iris implementation maps:
 - inst->operating_rate to OUTPUT
 - inst->frame_rate to CAPTURE

Only inst->frame_rate is set to the firmware, and inst->operating_rate
is used in combination with inst->frame_rate to calculate
the entire iris bandwidth in iris_check_core_mbps() plus
returing the frame interval with G_PARM on the CAPTURE queue.

So per the Documentation, the two major V4L2 Stateful Video Encoder
client implementation (FFMpeg & GStreamer) only calls S_PARM
on the OUTPUT queue, leaving inst->frame_rate to DEFAULT_FPS,
and only setting inst->operating_rate.

Since inst->operating_rate is currently useless and breaks the
conformance, let's just remove operating_rate entirely
and just set inst->frame_rate only with S_PARM on the OUTPUT
queue.

The two rate variables were probably added to allow scaling
the iris OPP to allow faster encode speed, but wasn't yet
properly implemented and breaks the S_PARM compliance.

Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 -
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_milos.h |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 -
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 -
 drivers/media/platform/qcom/iris/iris_utils.c      |  8 ++-
 drivers/media/platform/qcom/iris/iris_venc.c       | 58 +++++++---------------
 9 files changed, 22 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 771269e705d9..8eaeae5aff5f 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -59,7 +59,6 @@ struct iris_hfi_session_ops;
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
- * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
  * @enc_raw_width: source image width for encoder instance
  * @enc_raw_height: source image height for encoder instance
@@ -107,7 +106,6 @@ struct iris_inst {
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
-	u32				operating_rate;
 	u32				hfi_rc_type;
 	u32				enc_raw_width;
 	u32				enc_raw_height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cf5ae420f646..d346eb668f6a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -123,7 +123,6 @@ struct platform_inst_caps {
 	u32 mb_cycles_fw;
 	u32 mb_cycles_fw_vpp;
 	u32 max_frame_rate;
-	u32 max_operating_rate;
 };
 
 enum platform_inst_fw_cap_type {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drivers/media/platform/qcom/iris/iris_platform_milos.h
index 8a45a4aa9e86..e92dac972389 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_milos.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
@@ -21,7 +21,6 @@ static struct platform_inst_caps platform_inst_cap_milos = {
 	.mb_cycles_vsp = 25,
 	.mb_cycles_vpp = 200,
 	.max_frame_rate = MILOS_MAXIMUM_FPS,
-	.max_operating_rate = MILOS_MAXIMUM_FPS,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 3cfecae80d1e..5cab6df0115c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -16,7 +16,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.mb_cycles_fw = 326389,
 	.mb_cycles_fw_vpp = 44156,
 	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index 3c9dae995bb2..46fed17b611e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -24,7 +24,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.mb_cycles_fw = 489583,
 	.mb_cycles_fw_vpp = 66234,
 	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index becbe3776544..e31f27fa6a15 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -58,7 +58,6 @@ static struct platform_inst_caps platform_inst_cap_vpu2 = {
 	.mb_cycles_vsp = 25,
 	.mb_cycles_vpp = 200,
 	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
 };
 
 static const struct icc_info iris_icc_info_vpu2[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 43460b82ae77..aebda855a549 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -80,7 +80,6 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
 	.mb_cycles_fw = 733003,
 	.mb_cycles_fw_vpp = 225975,
 	.max_frame_rate = 120,
-	.max_operating_rate = 120,
 };
 
 const struct iris_platform_data qcm2290_data = {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 1096cc4b01c3..6384b4a438b6 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -128,13 +128,11 @@ int iris_check_core_mbps(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	u32 total_mbps = 0;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
+	list_for_each_entry(instance, &core->instances, list)
+		total_mbps += iris_get_mbpf(instance) * instance->frame_rate;
 	mutex_unlock(&core->lock);
 
 	if (total_mbps > core->iris_platform_data->max_core_mbps)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122..7393505087a8 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -66,7 +66,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->crop.width = DEFAULT_WIDTH;
 	inst->crop.height = DEFAULT_HEIGHT;
 
-	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;
 
 	inst->enc_raw_width = DEFAULT_WIDTH;
@@ -174,7 +173,7 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 			return -EINVAL;
 
 		f->pixelformat = fmt;
-		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
+		f->flags = V4L2_FMT_FLAG_COMPRESSED;
 		break;
 	default:
 		return -EINVAL;
@@ -396,24 +395,17 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
-	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 	struct v4l2_fract *timeperframe = NULL;
 	u32 default_rate = DEFAULT_FPS;
-	bool is_frame_rate = false;
-	u32 fps, max_rate;
+	u32 fps;
 
 	int ret = 0;
 
-	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		timeperframe = &s_parm->parm.output.timeperframe;
-		max_rate = caps->max_operating_rate;
-		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-	} else {
-		timeperframe = &s_parm->parm.capture.timeperframe;
-		is_frame_rate = true;
-		max_rate = caps->max_frame_rate;
-		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	}
+	if (s_parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	timeperframe = &s_parm->parm.output.timeperframe;
+	s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 
 	if (!timeperframe->denominator || !timeperframe->numerator) {
 		if (!timeperframe->numerator)
@@ -426,18 +418,14 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	if (!fps)
 		return -EINVAL;
 
-	if (fps > max_rate) {
+	if (fps > caps->max_frame_rate) {
 		ret = -ENOMEM;
 		goto reset_rate;
 	}
 
-	if (is_frame_rate)
-		inst->frame_rate = fps;
-	else
-		inst->operating_rate = fps;
+	inst->frame_rate = fps;
 
-	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
-	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
+	if (vb2_is_streaming(src_q)) {
 		ret = iris_check_core_mbpf(inst);
 		if (ret)
 			goto reset_rate;
@@ -449,12 +437,8 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 	return 0;
 
 reset_rate:
-	if (ret) {
-		if (is_frame_rate)
-			inst->frame_rate = default_rate;
-		else
-			inst->operating_rate = default_rate;
-	}
+	if (ret)
+		inst->frame_rate = default_rate;
 
 	return ret;
 }
@@ -463,17 +447,13 @@ int iris_venc_g_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
 {
 	struct v4l2_fract *timeperframe = NULL;
 
-	if (s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		timeperframe = &s_parm->parm.output.timeperframe;
-		timeperframe->numerator = 1;
-		timeperframe->denominator = inst->operating_rate;
-		s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-	} else {
-		timeperframe = &s_parm->parm.capture.timeperframe;
-		timeperframe->numerator = 1;
-		timeperframe->denominator = inst->frame_rate;
-		s_parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	}
+	if (s_parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	timeperframe = &s_parm->parm.output.timeperframe;
+	timeperframe->numerator = 1;
+	timeperframe->denominator = inst->frame_rate;
+	s_parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
 
 	return 0;
 }

-- 
2.34.1

