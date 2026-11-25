Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612186;
	b=jJTcR4mD0lfoIN0eCM+WUdbeU3FgBeC9XoyaULe6ZSsw+AKRR0nQid+H105mTc/FaLjX
	 6ObLORtIojNgCy9zJqrGUCOZ7x3hwQu8yylOAVnblB/VpAQXza1776wIx8r9asbFhTP3Y
	 s1LVyzUOu6VCl8VF0EDyz5kLTmogMTXPTXj+dZFR6qBSMhsJmgxXbgoI81SgXERk28fE+
	 9vtmc2x7Va3e4tJA71sG/Va8NsK6qKBnEpuh7qj+x9QEFRLTLuXF0+9c17TGX/L58a4M1
	 oYhwAsOBiGNNkhnETMLAlwZE+QZsnq8ek7bySDRy546ClvuF4YHy1lcbtwEyyg3YkLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ypqh5JLbCUVt2KcUVLNuP+rQ4zNQNHHdmlYnlEePayU=;
	b=b3sd2USb5aZ8JmQwei5DK6CYYVhoHQ04ejtEPURvxedStMHMpg0meQuu3n0Z16i2M39r
	 OENb3Zpf9YcWsahzwcIHOdvqXZjA5e1ldJkjLZfygomlxsrj7s8pwX7Ahu295rOFbWASc
	 uSusH23ykj5r6y/9w5OmTWTclq5Zrrij++5ACt7dUSIpyDKb3xOgk7Mh0eYnkhUfxbM35
	 E1I/aFjKvxz/6a668ZX50fuN/fh1EUSeY/yNW2RCgzPOeo1WczAU3fpSQPPRe0SfAbns7
	 HrNI0XrMzy/mOaf4PlK+juUHcEPyq9qqwIxiliCik0V7pyDmiLNqRKvrxPZRf1KhDnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ydfbX6EE;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910C8606A334
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910C8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ydfbX6EE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3416929f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612184; x=1796216984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypqh5JLbCUVt2KcUVLNuP+rQ4zNQNHHdmlYnlEePayU=;
        b=ydfbX6EEUyA6kOfo5SHQSouYrbT+xJHGNZP6kIP6FfHZnn4Tl02dL13W2DNy4a17+l
         RdtsOXVJg7FwXNBC9T48uLY594gNMNws0s9iqgC/iz51ukAox8gRgPNzRXUXnVneLQSr
         ImQUB840GSE1RnoPF9f5WbVZY6R/SKKm1OVyfmufTL1pSaIvfFImt1GFAGo4dM00yp7d
         KmriN234kDfLJKOuRNwDZli9KzVea1cmsCQ5Y6/PZ70SqochQGX1+QX9gN3X2qxmsrqF
         0bWieMhw5/D7eXbS10m4uYSVY7eeYiEW76iCvdF9patEY72cDhYVAWPS62l05Q2vRHw/
         Wl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612184; x=1796216984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypqh5JLbCUVt2KcUVLNuP+rQ4zNQNHHdmlYnlEePayU=;
        b=JyYqU9hOOCxqz+1OXQPutfm7knYyHwGQtTF82VkXGD0Cpq/u+jnM+SJbSz4SAKttPC
         hH//uUxKXCqsIkpQdW3T8Usy4UrEH20UztxX9SyBSfKgDCXcWkHcDLXcV3iPewldo3GK
         JoJrxC4HmFWNxG/JlnZajNIF9s/cTSHc2QzoSJ0XjZkMTBxpYLTdTRp7cuUqm5llm+eS
         elsKs1vrMC8AyfrRZoKLbsb6xCAcSYfO1rxXTgHBqN0zMP3cZsn52lsMiC5Hyner2xWi
         h1PMBZ1aYNa7lLQXn0CrnB/Tk9U4ceZi3YF3sOyACjKVQgy+Pvzxk6ZQKiHvKwCg3RV1
         90dw==
X-Gm-Message-State: APuU4Z8A1qdEStUDlc7oGmUnvVo+FIbh21d+KYz+MTb4fvQgj7WPlmBt
	xM4zVAsXtMU/Xj8TiwGfCYytDjX1ObjeTNtamlw/Npdxc+3vyl7IoSjop+T8Jb/I3Sg=
X-Gm-Gg: AZFdTZczmIY5QTAYCds9k2o8pI05b9fr2/RMMMLYDsanpzsGptxFndw4P8R5UDEy10u
	ImuXTaFbVmFzGTgO7Tau3HGQS2FnmrLou3aBf/jh3GZ0pntMuZqtuT8jfWm46xGcEmCbZQNYfnl
	Jwdludw3IJcsV9NL+ZwxugDUNMp7VO2JfpegxK7VweIb60DF9mox0NDXF5v46YNtqcPJxi7dsvL
	Zbui8eTkBISzAG7lUYq12qTQwJyrgIobmKTjHOyukhCSSpOibLl+N6VJ9DlCn/dCa8XySvJ1zr3
	gSgIsumEf0MNQQwb44I+QENUor6STl+0e0qe9ihQzSuXHrfi6QUVdUu9tk7bOYArFmNflQ9bzvs
	bLeika3eFOHaEl/sj2W1YFXq02ys8jh1VAzcbf17q9zz89mn5zTRKIOvInnABO1dVsdbLna1hw8
	V5fTYhwv4RWYxIsma7KXiE3ynsiT2AiJLgHgibRfnLUBAcwEOUkK51isZu28t9DusF6izfOL7Zs
	PunJCNXZ1iM6WSGRvFgbjYWVzZ+qcYy/QKvfAw+b2IX2KlPMv/XNx0axmY6XXG122o+tAGQnL3S
	mKcT45zfXAJKAvNLXRIHr5YeVVYK+fKhR/AvVAqToZTLwbesFsGblVsHyC2cetiYz1qhDf4=
X-Received: by 2002:a05:6000:2b87:b0:487:13f:f612 with SMTP id ffacd0b85a97d-4abb6095d9bmr20744901f8f.37.1795612183928;
        Wed, 25 Nov 2026 05:09:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:37 +0100
Subject: [PATCH 10/11] media: iris: vdec: complete an unchanged first
 settings change for FFmpeg
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-10-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8134;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=y134dMdSyY/lJDzxDWcwo8wMGRX8FYxyYyA/TkY9KNY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4PmLaXF1N15brpwa/cavzXN1kWHbTEC1dk0BHO
 /3IEcFKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDwAKCRB33NvayMhJ0bWaD/
 4xyXWwuq9ZBHQz5LQIWqLR9yaTDoG0bcO9XdgUbDvsk3eyTmlCk+9hpkLX+UZ/FaKQr9D61mw8OXfN
 kbPs6sg4KogikrXzgrAu27w3Sb8km+vCFXtbEPLGmtmetwncr0DQ6+PR13nlzHxzCTs+sOQoIDdWnD
 65uwAu8ThhK9GWw2RZ277luXIcUWRea1Iuq/ETiWcZmSvKIqcNT7jM+XL8KTzj4XOg1PcjT47u8ZpT
 /WPvlzFs4tqPIsc/QOXO0w0UG5BeMw03sK3h9J/KPuztwNj2nuAkDTEe8jQOsfZDfMGklnBBfLJKw7
 phBnKmE6kDTVemKKZjFJaJBpHQLlV/FHFpZroivzQO+Z0CMAkazNhlwl7cweVqbae7Ecq3ID53ioDl
 R/UFk1Xok/cgmTo2mWxofzTCfxZCQfnJR5GpCSKy27MNkKMN4BaHEwBwhJbMItYQsFZp/s/u/TprLK
 mau9zETLk1oggdmxe+kiXC+GmxkFxz9z5eeGYNqiyr27YnFEWz7qaLeM0p24WVC96mZTjsVVd3Jsqy
 nU1ASNmrkKnkEg6s6ET9ric7aSEF+vhCWzrzWt76+JBG4zA9XN2QlK2SC5EbGF9yKoqVQR/tdFiyx+
 G04mr3VvdBbaXSXhwykyiSDcxTfL8F6YBCZ4uBgezP3+wdbHMBvBgFLOM22A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

FFmpeg starts CAPTURE with the size from the container, before the
decoder reports the stream format. When the firmware parses the first
sequence header after that, its settings change pauses the output port
and ends with a PSC_LAST buffer, and the driver signals a source change
even if the CAPTURE format did not change.

FFmpeg then sees an unchanged format and sends V4L2_DEC_CMD_START at
once, which fails with -EBUSY as the LAST buffer did not come yet, and
takes the LAST buffer for the end of the stream: it outputs an empty
frame and stops decoding.

When the first settings change after such an early STREAMON(CAPTURE)
leaves the CAPTURE format unchanged and the allocated CAPTURE buffers
sufficient, do not signal it, and complete it on its PSC_LAST buffer as
V4L2_DEC_CMD_START does. The visible rectangle and the colorimetry, which
the client could not know yet, are updated without an event. If a queue
is stopped before the PSC_LAST buffer, signal the source change.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 16 ++++++++++
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 +++
 drivers/media/platform/qcom/iris/iris_vb2.c        |  5 +++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 37 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |  3 ++
 5 files changed, 65 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 4f685efbeae9..b1c4e68de2db 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -368,11 +368,18 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 		if (ret)
 			return ret;
 		unsignalled_psc_last = true;
+	} else if ((hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) && inst->drc_unsignalled) {
+		ret = iris_vdec_src_change_complete(inst);
+		if (ret)
+			return ret;
+		unsignalled_psc_last = true;
 	} else if (hfi_buffer->flags & HFI_BUF_FW_FLAG_PSC_LAST) {
 		ret = iris_inst_sub_state_change_drc_last(inst);
 		if (ret)
 			return ret;
 	}
+	if (hfi_buffer->data_size)
+		inst->early_capture = false;
 
 	v4l2_m2m_for_each_dst_buf_safe(m2m_ctx, m2m_buffer, n) {
 		buf = to_iris_buffer(&m2m_buffer->vb);
@@ -686,11 +693,15 @@ static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
 	struct v4l2_pix_format_mplane old_fmt = inst->fmt_dst->fmt.pix_mp;
 	u32 old_min_count = inst->buffers[BUF_OUTPUT].min_count;
 	struct iris_hfi_rect_desc old_crop = inst->crop;
+	bool early_capture;
 	int ret;
 
 	if (pkt->port != HFI_PORT_BITSTREAM)
 		return 0;
 
+	early_capture = inst->early_capture;
+	inst->early_capture = false;
+
 	ret = iris_inst_sub_state_change_drc(inst);
 	if (ret)
 		return ret;
@@ -699,6 +710,11 @@ static int iris_hfi_gen2_handle_src_change(struct iris_inst *inst,
 	if (iris_vdec_src_change_after_seek(inst, &old_fmt, &old_crop, old_min_count))
 		return iris_vdec_src_change_resume_input(inst);
 
+	if (early_capture && iris_vdec_first_src_change_unchanged(inst, &old_fmt)) {
+		inst->drc_unsignalled = true;
+		return 0;
+	}
+
 	iris_vdec_src_change(inst);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 53693bc53a8e..b85f7ad460bf 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -60,6 +60,8 @@ struct iris_hfi_session_ops;
  * @vp9_seek_psc: a VP9 seek may raise a settings change that changes nothing
  * @drc_resumed_in_place: a settings change was not signalled, its PSC_LAST may follow
  * @input_stopping: STREAMOFF(OUTPUT) waits for the firmware to stop the input
+ * @early_capture: CAPTURE was started before the first settings change
+ * @drc_unsignalled: an unsignalled settings change waits for its PSC_LAST
  * @drc_wq: woken when IRIS_INST_SUB_DRC_LAST is set
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
@@ -112,6 +114,8 @@ struct iris_inst {
 	bool				vp9_seek_psc;
 	bool				drc_resumed_in_place;
 	bool				input_stopping;
+	bool				early_capture;
+	bool				drc_unsignalled;
 	wait_queue_head_t		drc_wq;
 	u64				last_buf_ns;
 	u32				frame_counter;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index c19de89945e3..f83ea1a5f5ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -263,6 +263,11 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 	mutex_lock(&inst->lock);
 
 	inst->drc_resumed_in_place = false;
+	inst->early_capture = false;
+	if (inst->drc_unsignalled) {
+		inst->drc_unsignalled = false;
+		iris_vdec_src_change(inst);
+	}
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index edd58c0dd4a5..8512693e3ff3 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -429,6 +429,36 @@ int iris_vdec_src_change_resume_input(struct iris_inst *inst)
 	return iris_inst_change_sub_state(inst, IRIS_INST_SUB_DRC | IRIS_INST_SUB_INPUT_PAUSE, 0);
 }
 
+/*
+ * A client may start CAPTURE before the first settings change, with the size
+ * from the container as FFmpeg does. That settings change pauses the output
+ * port and ends with a PSC_LAST buffer even if it changes nothing.
+ */
+bool iris_vdec_first_src_change_unchanged(struct iris_inst *inst,
+					  const struct v4l2_pix_format_mplane *old_fmt)
+{
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+
+	return inst->state == IRIS_INST_STREAMING &&
+	       inst->sub_state == (IRIS_INST_SUB_DRC | IRIS_INST_SUB_INPUT_PAUSE) &&
+	       iris_vdec_capture_fmt_unchanged(inst, old_fmt) &&
+	       inst->buffers[BUF_OUTPUT].min_count <= vb2_get_num_buffers(dst_q);
+}
+
+/* Complete an unsignalled settings change on its PSC_LAST buffer */
+int iris_vdec_src_change_complete(struct iris_inst *inst)
+{
+	int ret;
+
+	inst->drc_unsignalled = false;
+
+	ret = iris_inst_sub_state_change_drc_last(inst);
+	if (ret)
+		return ret;
+
+	return iris_vdec_start_cmd(inst);
+}
+
 void iris_vdec_src_change(struct iris_inst *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
@@ -483,6 +513,13 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
+	/* On gen2, fw_min_count is only set by a settings change */
+	inst->early_capture = inst->state == IRIS_INST_INPUT_STREAMING &&
+			      !inst->fw_min_count &&
+			      !(inst->sub_state & (IRIS_INST_SUB_FIRST_IPSC |
+						   IRIS_INST_SUB_DRC |
+						   IRIS_INST_SUB_DRAIN));
+
 	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index 5b55354cc25f..24dadee0a19c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -20,6 +20,9 @@ bool iris_vdec_src_change_after_seek(struct iris_inst *inst,
 				     const struct iris_hfi_rect_desc *old_crop,
 				     u32 old_min_count);
 int iris_vdec_src_change_resume_input(struct iris_inst *inst);
+bool iris_vdec_first_src_change_unchanged(struct iris_inst *inst,
+					  const struct v4l2_pix_format_mplane *old_fmt);
+int iris_vdec_src_change_complete(struct iris_inst *inst);
 void iris_vdec_update_min_capture_bufs(struct iris_inst *inst);
 int iris_vdec_streamon_input(struct iris_inst *inst);
 int iris_vdec_streamon_output(struct iris_inst *inst);

-- 
2.34.1

