Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324401;
	b=PLIrZ8xVdTOeBNchG+uaas82ecJufLmeXuv+71km/GUGESYlsKb7nloBOV8SV3fgYQz/
	 JnCoSfDMGKcHoRQ6Z6PaoK3h0liWIqBYfvwFa2wtopPFyDbx1P9kGqRaAVyVK2Dme1p3P
	 YHmIlZdsorKQBgW40QPhMzWp9geo7Nxt8GSSOiVGANKhvR2V9Bht1bmB3ezxUapqrYnQH
	 oqROevrQW7Q8CiWntDQUhpovlFZD3BWQrCso32PFmAtHeUfsXXTVJoE/imH/YXFrJekZE
	 xTiwrzgAywaEZE/TNRXQ8tkV+XXlhHTST7cCMe8WdxzsXpkREOBIUYXOYpuW1JQzQTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324401;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xumUc1z4t8VZUjAW7jTjjy2eWJ033Qs4zdr2uCuvqy4=;
	b=GrvvmpfhH6vtqnwwQx9ZIw8SMUy0gyAFpejh+yJEpA4dMNV+y7+mXgLBV7SSEttZnzW0
	 knjEIkhIxtgmYMJoopCBAl7tKdQiSjdkLS+cjeVA8ZeEOFBOKhdZvNZU1YNM3G6e23bDZ
	 FpwK1w80WuMTslrX7AAiyj4TpF0tsXLmkBPnFHHRRDBhc3g6yMqKkv5pyEY7xP4/EfcCQ
	 2bg3+oEv6totE8/qTYwPNE2/iL3UaG/RqyNqOeOTDANK9FjYBO8zfbp2dmHgVmF+RhB8a
	 no38X2REDdryDD5yygx5ATDRI8owwuSghJUWbkZLUQ3UDfvzZ90MEaOYt7Nc9o0NoNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSy48WZd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6113E606A334;
	Sun, 22 Nov 2026 05:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSy48WZd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324401;
	b=PpbgP/a0nILS8ZyDatcGel/mhmCBvXhBfPxWhHPJNhiuvfoOP7ToNbxgHFC7HAe/iUEw
	 FW8yzcxqStUNjeYdPfFJ/+3FnkZdDzVK9geeqzmGbgsjbq/aOoH2MBkkfHI8dlvVC4BNN
	 fbCBpsthLS/WLsAftcw7bCfRJLQyswiybfJsUlFRRrhbx2wfbirz6NJ75p9oZACZNxPR2
	 Dfdkr4Lnt1Yf0OGIiMUPFc9BnLLuJ4uooOiQpfjJYK70RG0H38S8A85CEkNrNa045GvuL
	 WBVz3fLelaHhJC7+GLiHt8l/CSExZ162HIXgpPkkwUAKfNRX3NUPhCeTU6NyuOS/GPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324401;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xumUc1z4t8VZUjAW7jTjjy2eWJ033Qs4zdr2uCuvqy4=;
	b=ZRLXdJzmw6E3MQqhi7WxQDi2vr3wbFy+du3DJ93YbObomGKMVUPpa+IMO9fOmlnhRXLE
	 GJleNqxR7EztLhPAs59FuGaAtNAYp+SxPsFZUPMV8z7y5CiGcq+5ga7TG35BRWbWhc6mF
	 CsnhBd/4j+2uRhjVwRDIzfbE6Sof/VzvHV22BG6c9DNRw8OuNJW7y2/gjUkIu3p5R0fwA
	 Chdum4ZpNDx9R9UyEpuzsFGpbnlPk1+KkgLxkuRgYYBmc6w3TlZduaRebosknaEdRCGNj
	 uvz4UMdb3ZBq68jws0lMoYkJynn6lOUt2kbfepx9KSMLulnkmS6xB1RFP3CPgycjexA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42AF11F000CF;
	Sun, 22 Nov 2026 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324401;
	bh=xumUc1z4t8VZUjAW7jTjjy2eWJ033Qs4zdr2uCuvqy4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XSy48WZdbwAyUjL7jONld4E8f1qPvDkX/No0RVPXX6gdcuQdbpIsb3hNxYnCixq68
	 oiUwbsDddb09G4PCY6MdAmeyAR3AjdV5h7Es3LG3AsffIRiQG5Eo7sX2YGsKvjdB5n
	 Cm7mEP1WSYsIKj97ahgrX+Do8QPO2v00iDKAb0jOFzgpgmQVEIpBjWTor08GAkYIvr
	 TDJzh8bVADc9BWE8T7eZisdHHbUcZXs6fojOudIdtjZXgvUiO7xvvA+knbOig574b3
	 NgJ5fcpEd/h723HKlvsP55IInXrM5VWzBKFOXq2o1kZ2o5O+2dNdQGglrduPjJhFS3
	 LmTpwbMprXtQw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C3AF44BF3E;
	Sun, 22 Nov 2026 05:13:19 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:17 +0000
Subject: [PATCH 2/2] media: venus: vdec: Resume CAPTURE restarted during a
 seek
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
Message-Id: <20261122-b4-venus-eos-seek-v1-2-2e38912c7cf9@enser.io>
References: <20261122-b4-venus-eos-seek-v1-0-2e38912c7cf9@enser.io>
In-Reply-To: <20261122-b4-venus-eos-seek-v1-0-2e38912c7cf9@enser.io>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324396; l=5323;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=3/BXWrEXd2DCO3KyLlWUnPPLDGGlTHRZ1gN4n0ZsF4w=;
 b=sDSfBsLC7bfj/YWIu4AnREfHjXZwskKQsEmeE3u+GfvyGX2kpdtY0wALgkzn5SkfMPQGc7BDE
 9+b6OoQk4+vB8AYP0R/Ymrkq6j47bVTxWgxKxxKi0fPHlR0G3BtLLm4
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

GStreamer's V4L2 decoder handles a flushing seek by calling STREAMOFF on
both queues, then STREAMON on CAPTURE, then STREAMON on OUTPUT when the
first buffer of the new segment arrives. On a OnePlus 6T (SDM845) the
seek never completes: the decoder takes two OUTPUT buffers, produces
nothing, and the pipeline times out waiting for preroll.

The driver loses CAPTURE in that order:

  STREAMOFF OUTPUT   vdec_stop_output()    DECODING -> SEEK, flush
  STREAMOFF CAPTURE  vdec_stop_capture()   SEEK: buffers cancelled
  STREAMON  CAPTURE  vdec_start_capture()  streamon_out is 0: return 0,
                                           streamon_cap stays 0
  STREAMON  OUTPUT   vdec_start_output()   SEEK -> DECODING, but capture
                                           buffers are queued only if
                                           streamon_cap is set

so the buffers CAPTURE was restarted with stay in the m2m queue and the
firmware has nothing to decode into. A seek that restarts only OUTPUT,
as ffmpeg and mpv do, is not affected.

Remember a CAPTURE restart that happens while OUTPUT is stopped in the
SEEK state, hold the capture buffers queued meanwhile, and hand them to
the firmware together with the DPB buffers when OUTPUT restarts. Clear
the flag whenever CAPTURE is stopped again.

Tested on a OnePlus 6T with this change on the postmarketOS sdm845
kernel (6.18): three flushing seeks through GStreamer's v4l2h264dec, to
5, 2 and 8 s of a 10 s clip, each preroll in 0.04-0.07 s with the first
frame at the exact target timestamp, and playback then runs to
end-of-stream.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful codec API")
Signed-off-by: EMCP333 <emcp@enser.io>
---
 drivers/media/platform/qcom/venus/core.h    |  3 +++
 drivers/media/platform/qcom/venus/helpers.c |  5 +++++
 drivers/media/platform/qcom/venus/vdec.c    | 22 +++++++++++++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index f521bccfe3..a6e898ca83 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -461,6 +461,8 @@ enum venus_inst_modes {
  * @pic_struct:		bitstream progressive vs interlaced
  * @next_buf_last: a flag to mark next queued capture buffer as last
  * @drain_active:	Drain sequence is in progress
+ * @cap_resume:	CAPTURE was restarted while OUTPUT was stopped for a seek;
+ *		its buffers wait until OUTPUT restarts
  * @flags:	bitmask flags describing current instance mode
  * @dpb_ids:	DPB buffer ID's
  * @eos_va:	CPU address of the empty buffer that carries end-of-stream
@@ -534,6 +536,7 @@ struct venus_inst {
 	unsigned int pic_struct;
 	bool next_buf_last;
 	bool drain_active;
+	bool cap_resume;
 	enum venus_inst_modes flags;
 	struct ida dpb_ids;
 	void *eos_va;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index e0bd2b0478..425caf6b34 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1512,6 +1512,11 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 
 	cache_payload(inst, vb);
 
+	/* Held until OUTPUT restarts after a seek: see vdec_start_capture() */
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC &&
+	    V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) && inst->cap_resume)
+		return;
+
 	if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
 	    !(inst->streamon_out && inst->streamon_cap))
 		return;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index a49acef5db..9c076379ed 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1044,8 +1044,17 @@ static int vdec_start_capture(struct venus_inst *inst)
 {
 	int ret;
 
-	if (!inst->streamon_out)
+	if (!inst->streamon_out) {
+		/*
+		 * CAPTURE restarted while OUTPUT is stopped for a seek, as
+		 * GStreamer does on every flushing seek. Its buffers can only go
+		 * to the firmware once OUTPUT restarts, so remember it for
+		 * vdec_start_output().
+		 */
+		if (inst->codec_state == VENUS_DEC_STATE_SEEK)
+			inst->cap_resume = true;
 		return 0;
+	}
 
 	if (inst->codec_state == VENUS_DEC_STATE_DECODING) {
 		if (inst->reconfig)
@@ -1130,8 +1139,17 @@ static int vdec_start_output(struct venus_inst *inst)
 				ret = venus_helper_queue_dpb_bufs(inst);
 				if (ret)
 					return ret;
+			} else if (inst->cap_resume) {
+				ret = venus_helper_queue_dpb_bufs(inst);
+				if (ret)
+					return ret;
+				ret = venus_helper_process_initial_cap_bufs(inst);
+				if (ret)
+					return ret;
+				inst->streamon_cap = 1;
 			}
 		}
+		inst->cap_resume = false;
 		goto done;
 	}
 
@@ -1236,6 +1254,8 @@ static int vdec_stop_capture(struct venus_inst *inst)
 {
 	int ret = 0;
 
+	inst->cap_resume = false;
+
 	switch (inst->codec_state) {
 	case VENUS_DEC_STATE_DECODING:
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);

-- 
2.47.3


