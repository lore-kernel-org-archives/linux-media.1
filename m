Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779704;
	b=3kbBqTP/9+LpueMSDnJzkkeqQL/jVIHVQg40wGwyJbvcn/L/qwwUBMv4R6NxJrzTB8aM
	 JJTJ+e+l3mrUuYYlagPUEMUcNf+SvYPQhInk9sQn7Y0c/TJ+p3238QQ6roC1L1nU0I00G
	 PRcJpvAvojQSV730bboM5mFwYNjhcskCSKKrJib6Pk7vxjEVzq+oT7xiedvuCYxhJlRqc
	 Q8srCfyelxcW6Bwe6CvQ89pUUoFjLvtndXJLHEmUx9cXB1h+iF4xJ9Gb/iq4klkRCzELA
	 /zwY5e29CSZTlUVwv+So6Eyb0YZmlj0lcYeIyVkLOS+D/+4LNATMQ/LmkXkqXs4O5uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779704;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=4dMkvqFMI+lr0Yu1ZwqbzWALRMZItsyPOQ2LJhwLN8w=;
	b=fE/l/nN17evduAv6ipsUOJE5Wb6r+7QeKWWmtgx3l/dn2rWhreknoQAUenYvceZXSXcR
	 YmAdTPgPoOkEJxY/go3xwpqzFnr0LFzSSRHRbO3MvDc3uejiGatfNyPlAwVfMX3cy18S9
	 6E1SGSFOAizFmTRChb9+Ts6Q4bU7D1yg64BwtyJ0zCleIardYilNnF3vfhco95kY7wp8Z
	 4UecAXqLMGC2wu5VKPx8YO23xyc+0Nbq5vgs2gE3HhoalNZvd5hGjVvSFtZdLRhnHhnMu
	 RTdE1plZZ5oDummbA7ltYs7MLa/857dUB4cPdvYn9++RPsWK/t743qQiO6ign/l3ijA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA7606A692;
	Fri, 27 Nov 2026 11:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFA7606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1795779683teaa78799
X-QQ-Originating-IP: pIQfLFMJpPw0dHknpm7oplcqe3ILtDyfjC7te9lTdKQ=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 19:41:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16290186260747655819
EX-QQ-RecipientCnt: 18
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 27 Nov 2026 19:40:58 +0800
Subject: [PATCH v2 5/5] media: iris: Recycle decoder buffers for
 non-display pictures
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
Message-Id: <20261127-iris-va-fixes-v2-5-385e8636c22d@radxa.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
In-Reply-To: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>, 
 sakimidare <ssmzhn@163.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5771; i=sophon@radxa.com;
 h=from:subject:message-id; bh=sBcFBFxUby0dkUV+LiHZOIYUzIKmr/fsxIRvq9UJBDk=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcOYGVIdzJ1h+nKl1wNtp20Wtb8aw/HMzFe29m8hgGT
 7xkUeLaUcrCIMbFICumyKIQzzCXvTL32lOxUj2YOaxMIEMYuDgFYCJGgQx/Zb6+yPnjfd1x1ibD
 kHU8+h7Jr4ofTSu03t9Y2+ywQKFCmZHhi9OXSy5dL4KE2Gtz+mImnr7y+OfHjEqfBTNfsrQ/+p/
 OBQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OLzt+G0KylFPSUUq3oNyVY/JC5ZZABD2y9ZwESbHoHravWId64C/A+1P
	cJFQsR+nvicMqa5lfy4Ewf9ragac1WsWtlKHHbGBMqJ0eyjGzphm1RflJuWZDhNePbXdkS0
	rBlcSug0GK+wbMgnEcmO0emOWVqkS+Co55gcDAduDlaK7KVmHS/MaQ7HQoTQca7KtpsL5oJ
	6zsKgEP6V02LK47VmBAGUbsHskfOG93/j0xFleeD9rEuArV0+8paEGSjXOMMY2rd3G94H7M
	ou74WAY+v3jBUY0yWYNXS+WPnjaMjDYq2eWu8nvkWcuoKe3IZOVGX/cC21+BEtnbPm7qPAb
	EsPKpJ71jasCorJT44U76NnGu6PuO7MAGjH7jUlpyktrJPLaPR2XGfMFRbZ5i/qKw2Dy57Q
	sS0KZ0Axm3oajAWeepx0Plpptb3BAHcuN3V5JAQwhBJ1PMP34wbMZa7hXZmDTmOiGfRhoWK
	TIrxPuLHnQ13v9BjtNjuXvaqAF0CDqBl3YqWlejdrFJnznZTJP7C8I8trzL0wmWX9Qmv0Fw
	yRb60kf5Cr18fQYO5R70bSnKnAz9+gXh7G/HUb/P5WMNOrwez+UKE2qGhZwg+pfPmPwt8OX
	EUXA8ohRaZls98bD8kn66gwGyx9ECVn8B/sS3EGV2dYI9mnFxLbgSOmIWmTYeFIBAq41h2z
	NPHH3MLNupRdsdxrrl0JqEzUSJsqFuNa/BH1skHbsSyPF/Tt0qVVtbPZTTTEAKVh5SVn65P
	SYho8J8U8uYjeHWGiJVy6LRmSCWxCY+WA4cH202s2TZOgP83dhWRc2WlxmzzKz0rCP1TFR7
	0x6pmv4fW/Rp2QkmnDhicUPm4cto2W6IndwUGNT6frCUh+yB73dfbNYWie4J9X2p7iHAWQE
	J0uCLO2AY6xp4GFNjiqNrvSOPQMyrLOE5jQ3Rzbz/OAsmGo5/wfG9bZAHnVFz6psEaXl6F4
	M5WmUtftbf/oiAE0RG/SKyfvLsNsqs+g0nToWXuRs6lHRCR7fqs/D7LVAPucSDb90LTOAz0
	NXWum/BZb2FcDP2Ekxe4hvTySwBKfGVfa/ZnLkpwx66b4i9UE+K4byMr/fqkQ7Cym4g7jla
	Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

HFI gen2 reports non-display pictures with HFI_GEN2_PICTURE_NOSHOW, but
Iris returns them as errors. For AV1, hidden and displayed pictures can
share a timestamp, so GStreamer's v4l2av1dec drops the pending frame and
loses the displayed picture.

Recycle successful non-display buffers within the driver instead of
returning them to userspace as errors. This also fixes VP9 streams using
hidden alt-ref frames.

Fixes: ac72ad9deafa ("media: iris: Add handling for no show frames")
Tested-by: sakimidare <ssmzhn@163.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  2 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 11 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 47 ++++++++++++++++++++--
 3 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 21ab58e0aa84..79aac2d4e500 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -20,6 +20,7 @@ struct iris_core;
  * @packet: HFI packet
  * @ipsc_properties_set: boolean to set ipsc properties to fw
  * @opsc_properties_set: boolean to set opsc properties to fw
+ * @output_stopping: capture STOP command is awaiting its response
  * @hfi_frame_info: structure of frame info
  * @src_subcr_params: subscription params to fw on input port
  * @dst_subcr_params: subscription params to fw on output port
@@ -29,6 +30,7 @@ struct iris_inst_hfi_gen2 {
 	struct iris_hfi_header		*packet;
 	bool				ipsc_properties_set;
 	bool				opsc_properties_set;
+	bool				output_stopping;
 	struct iris_hfi_frame_info	hfi_frame_info;
 	struct hfi_subscription_params	src_subcr_params;
 	struct hfi_subscription_params	dst_subcr_params;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a285e6fc8728..77ea153bf2d7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1172,7 +1172,16 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	if (ret)
 		return ret;
 
-	return iris_wait_for_session_response(inst, false);
+	/* The response wait drops inst->lock, allowing buffers to be returned. */
+	if (plane == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		inst_hfi_gen2->output_stopping = true;
+
+	ret = iris_wait_for_session_response(inst, false);
+
+	if (plane == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		inst_hfi_gen2->output_stopping = false;
+
+	return ret;
 }
 
 static int iris_hfi_gen2_session_pause(struct iris_inst *inst, u32 plane)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..a545410d1e8d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -101,9 +101,7 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
 		HFI_GEN2_PICTURE_CRA | HFI_GEN2_PICTURE_BLA;
 	u32 driver_flags = 0;
 
-	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHOW)
-		driver_flags |= V4L2_BUF_FLAG_ERROR;
-	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
 		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
 	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_P)
 		driver_flags |= V4L2_BUF_FLAG_PFRAME;
@@ -345,9 +343,40 @@ static int iris_hfi_gen2_handle_input_buffer(struct iris_inst *inst,
 	return 0;
 }
 
+static int iris_hfi_gen2_requeue_output_buffer(struct iris_inst *inst,
+					       struct iris_buffer *buf)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u64 timestamp = buf->timestamp;
+	int ret;
+
+	buf->data_size = 0;
+	buf->timestamp = 0;
+	buf->flags = 0;
+	buf->attr &= ~BUF_ATTR_DEQUEUED;
+	buf->attr |= BUF_ATTR_DEFERRED;
+
+	/* Leave stopped buffers for streamoff cleanup or the next streamon. */
+	if (inst_hfi_gen2->output_stopping ||
+	    (inst->state != IRIS_INST_STREAMING &&
+	     inst->state != IRIS_INST_OUTPUT_STREAMING))
+		return 0;
+
+	ret = iris_queue_buffer(inst, buf);
+	if (ret) {
+		buf->attr &= ~BUF_ATTR_DEFERRED;
+		buf->attr |= BUF_ATTR_DEQUEUED;
+		buf->flags = V4L2_BUF_FLAG_ERROR;
+		buf->timestamp = timestamp;
+	}
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 					      struct iris_hfi_buffer *hfi_buffer)
 {
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
 	struct iris_buffer *buf;
@@ -390,8 +419,18 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	if (inst->domain == DECODER &&
+	    inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHOW) {
+		/* A hidden reference picture is neither a display frame nor an error. */
+		buf->data_size = 0;
+		if (inst->state == IRIS_INST_ERROR)
+			buf->flags |= V4L2_BUF_FLAG_ERROR;
+		if (!(buf->flags & (V4L2_BUF_FLAG_ERROR | V4L2_BUF_FLAG_LAST)))
+			return iris_hfi_gen2_requeue_output_buffer(inst, buf);
+	}
+
 	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
-	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+	    !(buf->flags & V4L2_BUF_FLAG_LAST)) {
 		buf->flags |= V4L2_BUF_FLAG_ERROR;
 	}
 

-- 
2.56.1

