Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612181;
	b=5JRgXJKZ0FuMmvPA2CL115YoXQyHLDShPkfS2pArIoefVajsZLHmMnEnP9Ff55X8miiz
	 nif5MNyvisFEsXFHXwriGqos4bNqg/3eUMPVhFZIom7oN7GCrSJm9Kwu6b1jTxx3A2gMb
	 2UqPI2TQ5I8P3OXduXqi2XswJRcFZAieHQMXy0APYlRFwoeMEig4ctZ+7zvVC9989dnWT
	 OMQOpitYSB63pGJde/8B1cis8hdZCmkgxZ1Q62WSPifpJCVdhA9D3KrTHGcNaHG4ORD1i
	 ZYmsj8VmenUTaEoUTpzEEYEgSEa1p5isiV664W4VHna6X8sWH4bWS7nDxhCvs7wDGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ZywXvAFwEUemsHrXzBdGIC783yZetHpR4bFqH72y36I=;
	b=yauQZPdKNrbJ8zi/DENGqi7zNtBb21SnqDa5nZ9//IJsnJAR+/uuo4TzZ0aJUKpNrEmY
	 iJjTh/Lg2s1F9G/Ti8o9DfPlofItE6Y7GDvTTrksLEKdFnciiEmoh6cnj7GOhiAbF7KWp
	 cFooCIk04Rs69XSBOvcrwrSzxjNMRZwHsnFzIZpCChkxRIfZvhJHPPGR1ESRZOphNdpKX
	 jZM2l/cAGaS78lMux8wirOpK+2FLytNNFv4tDC2wRiQk5dtefcG+lPZxDct28rAoHQKS2
	 0rv81YDrrfQw7p8vuLmmarbV+FiBi2DqSDO9FBzJQbHC/AUrwk28A25yKR/iA6WqLww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zJ6rQHCP;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C98606A68C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C98606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zJ6rQHCP
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a32576da88so3309500f8f.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612180; x=1796216980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZywXvAFwEUemsHrXzBdGIC783yZetHpR4bFqH72y36I=;
        b=zJ6rQHCPTWeIZccDhVH8VVgj6p5RW2zDrOgCbmsXc8UsmGoV9gQZatNWBwGL0guapv
         tkgTWJSV6lKpsiwyc+yee2I8+cJXUrNoro2q4hgqSyAFnCAEjPd5h1oLlyFdffW3Y4ZD
         /2LnlTOJ6ad1PdnH1cr0NRLmv+Jztq+XB1XMRaDPoUQGSo/LCtPNg/fw3ndTnPLaZg6u
         FVUaxFOzaSuAjVIe9WpmDpVbVFioYRYzrlT8RLGz4PaSkfaP836fFrdbiskG5+rmVerR
         WrV1xhpyrcAqeaVJLb2Q8M9rn4nbOhXQNlSJlxC08CCMe6HhO+KBoD33pxU2IuFEe8uQ
         noBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612180; x=1796216980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZywXvAFwEUemsHrXzBdGIC783yZetHpR4bFqH72y36I=;
        b=FEr6RdOP5HO4Mj6W3PQMxnYFq6MG2UkQiscYerMObrrFQRxXcI54qMgzUWiyqzp5nH
         0XBmijbJtUhVqP96oUC+BC/XxpYfiLpnhDw4p4VLH3cI7FC746L0YQziAmnlZRw4RCH1
         v0x9gUYWjchyK2WP3DgfhxP5JvxdEHPK6I/ARNf07Ms8c2QNpdSL91f3TxjAjImVxKTE
         Asniw1kGUr4xn4OQQusMG7Unkipd5Ck9TAPMYBwxk8oEL/9+GTAF+E25jAyzgOEI3UiT
         kxfYxJf7dLKp/g8XlTCBSGumifVGroHhCp4zI3T2P18aGyrgNxLhYIbNce/H1aBJadr7
         RiMA==
X-Gm-Message-State: APuU4Z9qsnEfl+f3Z0jKs/ZBKRNHG+VH1pqP1WH6Gco1u2z6T8TUgwY3
	uj/Qn8impdyuges5rq8rbJdcLRpKphba+X3i1yKFCSF3RoUPYpQ2p/VyMONnf5B5uXA=
X-Gm-Gg: AZFdTZe1tOHLmt00wDpCqPPf0flFIwEW9Qs/l4kyFHqnKIGJoSOm15t9QUZwKT3PNAw
	I/snWnBZ/ftEvUNV+qZfmz43kl9ksxvqSed/IlvOf8CKxG3zcr9hTFCoT3WJ22V4zbfTLCzStue
	GSh8qGKnfWW1OCyT7VHgErTqgQb6AL6hwxb4iUAtiDjkcX3gWyoDKAaJlFp7047OsJQeOgV8Hy7
	OOpzBt9mc45YwWwtmvE2v/WWrCPsEWcbjaJr3qbR/0cPfoxAtpPSsxpOERK30Fl3q5Yu7L6W02N
	WVd4j8XvHRTfHEZ9qIIsytCP+yA4lAJZ2ZKluqa/gNSUKqGW4GuppUIBOPlqMLmLZtk++DlhXcg
	Z1Vhqx2Fw1c4thFO4EkjClDmDuB/ZuJLR7eVqBRbP+EmbzsZR8t1cS+aqRKWux4z4ZN042r9R87
	ryjArldycpw6h4EvwdBT5KZ16DkFxghl1wt9K/+CGbK4JkBl4Sa1hmx/04Zo8N5Jgd5sOVIvAgy
	1uRHo5973kHJAobcZvklZEKCiqvxLhrwWN/i2HFbdKnN0kjOq26BYD0+Tn+zW3sKO2Ly9vsJTNu
	r+VRZEJhl4mpXNnCL1G+3S7eTOJL+5Ql72WgoxwRzhm304Qh7Hjy3tR1+IyPoaTFtX6NJG8=
X-Received: by 2002:a05:6000:2385:b0:497:9e2a:b1e with SMTP id ffacd0b85a97d-4abb36787a4mr37263053f8f.9.1795612179580;
        Wed, 25 Nov 2026 05:09:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:31 +0100
Subject: [PATCH 04/11] media: iris: vdec: reconfigure the decoder on START
 after a source change
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-4-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5363;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BQVsChRVKEsJHf555U+Pt2d3yuSUpYK6rZfR2Io/x8U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4M0rmGalmZwbvcuBax3f7Sn+I5qKyFHbxoUCKq
 f85qjVqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDAAKCRB33NvayMhJ0aRaD/
 4sS8XwmgW1nY7NeT9lwRAmWJTGVRDqqmoFzKzJxsK5+ubCT3REyeTYgMWT9weJF4TwAJt8kqAVWAHF
 3N6LbMogWbeKWPwByCxFx0/Ah5YWUENjAaj3ApWHE9LjBr3mkLy5eyIVlnL22pGfJSGLiEhI6gtmkw
 aqoOMnrazNALDNrhpeF96+/CuuU8es6FOXzTWZ0IIOhaam2y3f7cCpz6FfHt9tWi6j+5s1UA6Ncrnx
 wPVR3J7gxCPrFvWfKhPyA2O16BbWST1oYjGWVmk9KjrOM2IJxFlaygU1KzspFXnCrsG0U1FrKQnM0Q
 ZG6KMJ2Co9XurxqhtEOzDH7FRF4uTKzA/LkbOBA/FrHCmljNRcz0A8fW0HlwlB3ntBkU2E3NVsBqvM
 4jB5raNFvAiQZ20sbX+HkNXb2aSCEEZD/rgBkGZrHZ01KrPum3IDowCGiaDO3ohtJDW38uY4DeEaB5
 qs+d3gsTjFoBGZFjfVZ6Kq+6X+OmgXwq5YzZr0DLsPkTBAPyu/P83f4nyCMTBmk8Gq405L9zzqLjOy
 NMLF5QNxusJPNp8eX3olguZmHcAU6txRCeECKATzk6a+hadnnlunZYnxs5siuQx/ZPNxFDb30HQNTQ
 /32NPRKyAGKsr5kc3NZEA1d/hN/XvseRBbk/T/liz985lG2winYrE0YsbSmw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The specification lets the client complete a source change with
V4L2_DEC_CMD_START when the allocated CAPTURE buffers fit the new format.
iris_vdec_start_cmd() then only resumes the firmware ports, without the
configuration STREAMON(CAPTURE) sends for the new stream, and the
decoder:

- writes the following frames with the stride and scanline of the
  previous resolution;
- fails to resume with HFI_ERROR_INSUFFICIENT_RESOURCES when the input
  internal buffers are too small for the new resolution, and the instance
  goes to the error state.

Before resuming, send the CAPTURE port configuration, reallocate the input
internal buffers, set stage and pipe, and add DPB buffers of the new size
up to the minimum count of the new stream. The attached DPB buffers are
kept: the firmware fails to release them while the CAPTURE port is
paused.

Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 37 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c   | 29 ++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 178e50eadcf7..38bdf366b384 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -747,6 +747,43 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
 	return 0;
 }
 
+/*
+ * Buffers the firmware holds are kept: it fails to release them while the
+ * CAPTURE port is paused. Only buffers of the new size count for the minimum.
+ */
+int iris_alloc_and_queue_additional_output_int_bufs(struct iris_inst *inst)
+{
+	u32 internal_buffer_count, i, count, fit;
+	const u32 *internal_buf_type;
+	struct iris_buffers *buffers;
+	struct iris_buffer *buf;
+	int ret;
+
+	iris_get_int_buf_tbl(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+			     &internal_buf_type, &internal_buffer_count);
+
+	for (i = 0; i < internal_buffer_count; i++) {
+		buffers = &inst->buffers[internal_buf_type[i]];
+		iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+
+		count = 0;
+		fit = 0;
+		list_for_each_entry(buf, &buffers->list, list) {
+			count++;
+			if (buf->buffer_size >= buffers->size)
+				fit++;
+		}
+
+		for (; fit < buffers->min_count; fit++, count++) {
+			ret = iris_create_internal_buffer(inst, internal_buf_type[i], count);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return iris_queue_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+}
+
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index a8d2002e00ee..7cf69046f036 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -117,6 +117,7 @@ int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
+int iris_alloc_and_queue_additional_output_int_bufs(struct iris_inst *inst);
 int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 656e69d2c942..d35a1eb62d30 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -495,6 +495,31 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	return iris_queue_buffer(inst, buf);
 }
 
+/* Configure the firmware for the new stream, as on STREAMON(CAPTURE) */
+static int iris_vdec_drc_reconfigure(struct iris_inst *inst)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret;
+
+	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		return ret;
+
+	ret = iris_alloc_and_queue_input_int_bufs(inst);
+	if (ret)
+		return ret;
+
+	ret = iris_set_stage(inst, STAGE);
+	if (ret)
+		return ret;
+
+	ret = iris_set_pipe(inst, PIPE);
+	if (ret)
+		return ret;
+
+	return iris_alloc_and_queue_additional_output_int_bufs(inst);
+}
+
 int iris_vdec_start_cmd(struct iris_inst *inst)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
@@ -506,6 +531,10 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 
 	if (inst->sub_state & IRIS_INST_SUB_DRC &&
 	    inst->sub_state & IRIS_INST_SUB_DRC_LAST) {
+		ret = iris_vdec_drc_reconfigure(inst);
+		if (ret)
+			return ret;
+
 		vb2_clear_last_buffer_dequeued(dst_vq);
 		clear_sub_state = IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRC_LAST;
 

-- 
2.34.1

