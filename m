Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7ED21ADC7
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616657; cv=none; b=uVqhZoCAk3DoZoz7O/1nhFpNRWTjwrgQ6Y1sbERWI+yDqqrl69M+lqeUx478LeJUcD2klpsJGuEWMMkWudhRQ5VeUWfbTY/OnL2pvBFrjjtQRC8c8J6s2JUAi01FcRQGNzYS1GwyW0Og4PuK6IgL8VyKmnAYxXKQMhcMW3gnL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616657; c=relaxed/simple;
	bh=ikHgJDa2Qm1BlxjM4lp7UIe+qHcDX+O9Bj4MCXtoyEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N8UqMseH9DjS7rZIDBsvRz3eH8ITNO8TM64ib2LdOvH57xvr2gVl356TE/lw4wPma9axAri71UmAJTzXTSTi6f9FQ/jUChvaF3JaeBLq0WxcNB7LWqNx7UgGfAP+/aR86MEngKdn0OE6Frp/QZn8TVRXbSP7xcac6Cilmy7PzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHpd8Mus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGR3C7bn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHpd8Mus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGR3C7bn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BViWM2243335
	for <linux-media@vger.kernel.org>; Sat, 5 Sep 2026 13:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2LFZfCamiBEggn0dx6WAfW
	rq2n/TLdV6C1L7akXdRhs=; b=SHpd8MusjuT7TRRx4QSNxt7eCL4JLOrqmgIWbs
	rEtBf91my9cbDdLuQoP8maTv9c6LuuNqgteZeG4iPP/r3Bep9CkWVigFqXguXdM/
	bsX1MU9Jqw55Y+yABfQkOlDQxIv1JSSYkQ8/siwRcTxA5+xeX8KFXlmk+alXKN1h
	ccQWbRvZSK5JetD9659k7Umv2chDlg5wcKmsIkupOaF03M5iDERJoKrTSrQkpdm/
	lMtUS5PzDFKd/9QE5hKcJeUIAQWtf8q6GP/b1ST1hQzF7BDEDlyGkbuK9j+ad+L5
	95SboIKyr5/sFHVSQl8wWQEJy7T3LX19M6xu1Xeu6kSAauQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq1mm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 13:57:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9336581a2so31007185ad.3
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788616653; x=1789221453; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2LFZfCamiBEggn0dx6WAfWrq2n/TLdV6C1L7akXdRhs=;
        b=WGR3C7bnmGoPp/6zgz+UU6yoPkZXruPnywpFD+KY4kMYwcKgJFq/ynqgVmaeAOTSho
         JRGuxy+1Z3oiQHB8+xLEnGbKU3ylYQ+cBDLx7Udmiaf8apbe1LVhk/Iix0TLW71rsz+M
         bIKoeykwrOWIVH/rbYQq4UEVUlGUQyBqv8y02YRTJGypfBnQoV+HjsOqiDeiwwHvQ7CN
         EPD3d1aMJu4Mb/OTFThA1nM589sbyTNo4HQcXzvv4kQRZqNINZrNXgNyIw7ZV1/ixL/j
         3Pwa5ckztVl2jVxW2Ssg/k/m4t51AuKxz/f1MYEeKbkFZ76/wF6+oDVfqIBZBQtWhuT3
         A/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616653; x=1789221453;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2LFZfCamiBEggn0dx6WAfWrq2n/TLdV6C1L7akXdRhs=;
        b=B/lBAQjJIxGRkSm51iD3B7xu1OtJAPNaybt2cPIeQAyx7Sxhp+UhlNIUXDkrjcisCe
         CuxoDYH8WOfqOcKp3eH/tkhQOLKJ9TuGBYw3CwK5rj+DS82s/094lDvwZQOCYx/mva8g
         W5brfJF0sKog0LaGiPJA22wlrTJCYfNNAR/cu9NDLvVQkMyptZr2yKewczjGXOqqfgJ0
         3BBa+U+lRSSsPoTa1UHxuUsVoX/kYuJIUvm9Q9wRa8hkrm6tnFr3MvEc1eBYmrBH6MMX
         PoSJ/CVbZABOz5knhZkI4VpHSodlv7m8udoDBqtVP4FvrPU9pQr5zvJjron5vEwt7iRB
         ULYA==
X-Gm-Message-State: AFuF++nL6pgUZIHVxhvX71F0kAQLr54w1iOYpPBVedYjrRCQ5xgPwgec
	pS6ecAu9OH1h6MaR+DWkDisac/zxKxDy1YwUtBjDmYLa8xy9VeWaDR9yKdSs6+wU235ZFVgsq68
	6vbaQdqQjf9y8hbMpHkfbCvSQRgeREJNLagVSdld9xGa3xRCjgQJ9SLco+O25PJEh0w==
X-Gm-Gg: AYBFou1Q5udDdpoeAO5G5y+ZgIl781cNXOqabNDG/9Ezxxs1FMVzrctLL7GVbr5BY4u
	SepXxfcBwZZnPgebgjhDk4zkUN0AJA4AY7rei0y9kFxcyOM3TLZMvvYl2gc68q/Bvfgu1pcL/iB
	g0jvoZQOPMjSAr4DV3iZ9KiQ0NH+O0SdRX77X9WG5m+sCNaTLQLv4a4AXkaSt4AQXBfb6ocVoey
	P73Pepv3HPUAcfbIdf2DLHmb2072P6Pf7SgBKRd1QKSgyOyfn8LqRdW3EE1alqt2NKl9ie607DR
	pEMYsIRLJfNIE3aQuMKTriFr7YxvfENK8050q/d1WdvW5wqMTo+ECNEHAepYMDv/es5U+nryEIA
	n2I9RlMS2MZmCn/XQUfhKXzl9YQlSV4S6LA==
X-Received: by 2002:a17:902:fdab:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2db122edaa3mr190314595ad.3.1788616653378;
        Sat, 05 Sep 2026 06:57:33 -0700 (PDT)
X-Received: by 2002:a17:902:fdab:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2db122edaa3mr190314045ad.3.1788616652901;
        Sat, 05 Sep 2026 06:57:32 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm14374895eec.27.2026.09.05.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:57:32 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 19:27:23 +0530
Subject: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMIfnGoC/yXNQQrCMBBA0auUWRsIoxb0KiJhkkx0hDQyaWuh9
 O6Nunyb/1eorMIVrt0KyrNUKUMDHjoITxoebCQ2A1rs7cWejTJFN0vk4lLRTKNLWrJLovlDyoa
 D90dE6lM8Qau8lZMsv8Pt/ned/IvD+M3Ctu2UAQi1gwAAAA==
X-Change-ID: 20260905-read_video_format_from_firmware-ecbb322a6fd4
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788616649; l=4284;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ikHgJDa2Qm1BlxjM4lp7UIe+qHcDX+O9Bj4MCXtoyEg=;
 b=b5j7Dk8CIc8X2niZYv3TvY98C7P+rVqYeL9ANkw8vr/uv3GL91RREHxn8PyBGswkYM3NBcWQI
 eeE7bgU+NQjDNp5M9Z2JjJ78bke9O4CEW2Kz2HN1Wyz3I4YVgxg9MhU
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9c1fce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UrH_bzIhgnSsKCIZztAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE1MiBTYWx0ZWRfX8Ke/uz8vLcsr
 YoBNEwB0zOyKxlcSSHxt+YgGLJKOOdqu+Hxr1hmVBdnQhGIcRgeS6yutgOGrTRly8Ra0zac6uV3
 zovfD+Uk1XqyU+AGx+tWXDclG0OqRS8=
X-Proofpoint-ORIG-GUID: Tmt5VAlCVnoUm0MQEBw1Y8q2a8qW2xUa
X-Proofpoint-GUID: Tmt5VAlCVnoUm0MQEBw1Y8q2a8qW2xUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE1MiBTYWx0ZWRfXzDIfZ0APf3J6
 Jt88z1IsS021zx0JSSswQ8r41TPpqJvfVWPfG7pU5CElBR53xGWHPLKWhDfWq64vqt6Lf5G4r8a
 RG7gnLp5v6wQzBOw4TOLYxiSbJuUzz9vZO7fqBXGlEdX1zLZ9/svTLSh4o5Q66Go4IO9kjLONJe
 Gpygs2yb0b8QlFvo5f+4osYFKqNjaV3aAE4sNoE9H87zHTaxriFG0n7WrCB52HlYelg1BXOxV4s
 zvdVeH5QvEnq9+PEW2XTQK8R7BusMWJfPReIwMAWYG/0dhtVzZyVpVlfeDPUzoD2QYtycIRuZvk
 r4mAeT3RVNGrYbQ+bJwFNQ/s1uOU9Qtu+fdx7Ftwr3ie/m7mfC60AAH7R2nwqTumhYxWEukCjWH
 20XCz14xY9wvG+0ZXV2kdiy5pr4/Riap94r8WZmKbLsaMqyTd/+1dsptyJyUalPi0G25vuqhTpm
 XKNXixIqlkTAegyY3Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050152

During speed-based rewind, the client restarts the decoder queues once per
group of pictures (GOP). This is because playing a GOP-based stream in
reverse requires decoding each group forward first and then showing its
frames in reverse order. Each restart makes the driver resend the colour
info property on the bitstream port, which firmware always treats as a
sign that the stream's properties may have changed. The driver never
stored the video_format value that firmware had last confirmed, so it
resent colour info with a fixed unspecified value instead of the real one,
and the value firmware received kept differing from what it already had.

On every restart during rewind, this looked to firmware like a real change
on the bitstream port, so firmware sent a settings-change notification,
and the driver treated it as a dynamic resolution change and paused the
port. The client then removed its buffers and built new ones for a
resolution that had not actually changed, stalling playback once per GOP.

Store and send back the same video_format value firmware already confirmed
so both sides stay in agreement across every restart, avoiding the false
settings-change notification.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Updated the commit description (Konrad)
- Link to v1: https://patch.msgid.link/20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..439197e9e199 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -141,6 +141,7 @@ struct hfi_subscription_params {
 	u32	fw_min_count;
 	u32	pic_order_cnt;
 	u32	color_info;
+	u32	video_format;
 	u32	profile;
 	u32	level;
 	u32	tier;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..a43a9d7687ad 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -358,7 +358,7 @@ static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
 	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
 	u32 video_signal_type_present_flag = 0, color_info;
 	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
-	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
+	u32 video_format = inst_hfi_gen2->src_subcr_params.video_format;
 	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
 	u32 transfer_char = HFI_TRANSFER_RESERVED;
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
@@ -806,6 +806,7 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
 
 	inst_hfi_gen2->ipsc_properties_set = false;
 	inst_hfi_gen2->opsc_properties_set = false;
+	inst_hfi_gen2->src_subcr_params.video_format = UNSPECIFIED_COLOR_FORMAT;
 
 	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
 	if (!inst_hfi_gen2->packet)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e8..8b1ff253a560 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -581,6 +581,8 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	full_range = (subsc_params.color_info & 0x2000000) >> 25;
 	video_signal_type_present_flag =
 		(subsc_params.color_info & 0x20000000) >> 29;
+	inst_hfi_gen2->src_subcr_params.video_format =
+		(subsc_params.color_info & 0x1C000000) >> 26;
 
 	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
 	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260905-read_video_format_from_firmware-ecbb322a6fd4

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

