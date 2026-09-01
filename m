Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D57636B91D
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269528; cv=none; b=ZsN8rsa+cWpCmpIpe+jsvdj32As8azaDVqvwCSb9Z/YuQ1RLH4rKFksiOSiTR7rYy4neysDQ6yvDNrNuJQ7gC2QIOAg57CKPu+V+O4Eat3c6ofu2jmzpiQLIr2VB41VHq0GcpC3ka1DpCKXrfs6wr8v06fOycdB1UJSN4aREecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269528; c=relaxed/simple;
	bh=+N+cilYyQbHuJoaaWFaNazIPpJsdORtxcUl2HGSqIFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BG8CE6sChfONzmdEkNisb+jD8G7DUyJvFATY64KbQ4DMDIdJoQ87KAQjpOabBDcbSpkG6vgvt86WXEbE+Abnb+LBa3QncW1fNL0IBncnCaXG/hkx5O+U/BYIPhBs8jih8bN5ht112g0RyN5+MmSD0PLVeV3J5HDqOtTT4AP9PCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+SR8uKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e09HO0Ka; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+SR8uKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e09HO0Ka"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DVtJu2136326
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 13:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8481fa/+6Rig4PjhZ7+XmO
	5H1WL+uWbYYnS4eJ0PhSs=; b=o+SR8uKZh8/LGYOB9RQ9Wr5bzk7Ok/2gonJQdY
	DN8eEmeXWCpBgRIcEP03pkzaESXpABzQzIDmvOf6Amdb1QZvTLfuwqEq8xWNtZ0X
	l5pnkIEzgwVMCgG3EnBt97y8JP9rz0flTKaXmYzNFPCA8QewVDdOP/T5RCCzvZRd
	ivOo5HYEFG49cD59iv+kdnjUhz1ZZNFmRjLHBX5XYtrR2uTd/lXfLRsPQKVJiKut
	ATHgAsTTX8/ZepnC9wO11Iu1vE2wxhm1/HWqiEf2k2Qx6TFd/NNZFx7rj3bOt/g2
	UtQ5re04BORIIyJOMCSk1eHmAdJPDevjyzGo9Zf/T7MobFtA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxar0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 13:32:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so3650322a91.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269525; x=1788874325; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8481fa/+6Rig4PjhZ7+XmO5H1WL+uWbYYnS4eJ0PhSs=;
        b=e09HO0KaGyBXa7cLDhGvrnj6GTE/1qhxfNfL5VuECIT0dzdB1C/xY/SXe5DJjiLoDb
         6nUiLCjxUQGflbD3VGonSOFXPJCf84tQkv4oPJGse1brWvaXKCaGwofLkD29mpfzoWYE
         gRrKpFomvvInXbdgcdgszbE1ZPRZoIzA1/AXNLJy0+t0BVXe6w6rVSxX8lvi5s1kvTac
         9eyT5gVjjDpBUj2Z9ZFDWfPHB26ysgcHuxtTyqKmhJ/Dxe9D3CiiLLow3jwTLMLLhx7U
         jUa1kwOJqH0aYR9cK7nUOwfu0MbcIvSrp0BdpEKN69hvFec+s4dOCtIFlm2WHDq1rEMH
         bH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269525; x=1788874325;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8481fa/+6Rig4PjhZ7+XmO5H1WL+uWbYYnS4eJ0PhSs=;
        b=D10PnTPBIUm/u7HdQhwIny6MPYKXkY7OTW+GwEGDwwbK09aVOJ0UIuWH2HETDZa2yv
         cv7ngiB/4XdiRz/Di2mfePDOn++ivfxf6jOLbVdua+UL+fPBDQidkGtLkY8+US/AuEeo
         phxMrQUtN0/Jc47KeqeDuHsImGqJVLpUwmQjp7kTYjx9fqRHZNOiQqLSdXbSvuEzr4VO
         YCXHuUwXozRl7rCYGrjoX7actNe89kGxA5ynslise7tWdwz/BrWkiSNA//N3BIiUVDAU
         8aFet/qwE6V5tBDOPMBuOMIDv6ItLb4f63pEfLl5Kdj1v9yh4srfq90jDwRDvIefW18x
         zkUw==
X-Gm-Message-State: AFuF++mCUAoIHnksVO+uZJ9Yg6A/4AQ4ZGLNbv0oKaTvU6+civCchUcC
	pOgYQvACEVXieGz8/wcyfWU0FMD9lNmHSGc9y2MPTvKhZPoRnTIo1yhSn1CmMUN4tNps6H9rzgy
	P7AlGIrriT2o9AG9stpQB5MpiLczvyLH0AkmWmxSLBH7Gl1k3DxJCjKf+aewtz0H5Zw==
X-Gm-Gg: AYBFou3LdkstGI5UfFkY8bIqwzHHKb3zhotOR1EDumivLZG8nyvJSGbRZVgptczJbSX
	jFfwJ6iP7BMVtYbG0/VZaK5LuDtlT+cg/dL09ya0fpTjTZFIt1kG7hxpKPIvxinO7ps/Z09N5IQ
	+05HgXdbgnUCIbC5IRs3B6DncZ7HwQfd2UqGLonBPsa6MGi/hApdviX+OXWtCPYhJKuhJcHiUS0
	2qshcbTGQ7NpvgooIspoZnABUxnY9JsRgcmO44m0rMs94VqZmfpb/lyzFNPC6nhADcqc4+q+1y1
	nBnsO7dvpoj1frYtHcF9b9L+dpGA3lqgWONvbWCtAJ0HqCSV4QdniCHdRgFmb0kFBfPcn35GAHa
	DOuxmkoW9jopDVQSoOnVdrxHGNvF75a6QfA==
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr57266137a91.4.1788269524460;
        Tue, 01 Sep 2026 06:32:04 -0700 (PDT)
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr57265975a91.4.1788269523781;
        Tue, 01 Sep 2026 06:32:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d463798sm5904477a91.6.2026.09.01.06.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:32:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 19:01:34 +0530
Subject: [PATCH] media: iris: Retain firmware confirmed video_format across
 GOP restarts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALXTlmoC/yXNQQrCMBBG4auUWRtI0ijoVURCbP7oCGlk0lah9
 O5GXX6b91aqEEalU7eSYOHKZWwwu46GexhvUBybyWp70EdtlCBEv3BE8alIDpNPUrJPLPkVBAr
 73hn0vXPGUqs8BYnfv8P58nedrw8M0zdL2/YB59skHIMAAAA=
X-Change-ID: 20260901-read_video_format_from_firmware-e5341e334412
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788269519; l=4246;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+N+cilYyQbHuJoaaWFaNazIPpJsdORtxcUl2HGSqIFM=;
 b=pkd98ewclbt65UU3JOQXMsz/Dlzg+rnocjJTdxh5giMyWO18cOk+eSxiiKykTwafpkXwSjfcP
 9yMu0rxk9IYDTx5Cvv2EHyKKZAPs46m8Bu+F7hfs43wwC1s1cnZFH5P
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: YFlY_pCWlKmUtw2qoPtauIOs_dvh9dUc
X-Proofpoint-ORIG-GUID: YFlY_pCWlKmUtw2qoPtauIOs_dvh9dUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfX+r9SzyXeeTK+
 BYsmeRRDJBTqoGQbcaV51ZvicV+n/rC9/ASxYVqRAKThM3pW2pQUm1scIgzmqPpVOzMW1zUobyW
 76QZeqOo6DbPaCHo62PpyexuSx3UQk8=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96d3d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UrH_bzIhgnSsKCIZztAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMCBTYWx0ZWRfX4qtLNA/DsP5m
 chhvb7K808weDfk1vPZHOUW0IaxTEIMJgLBcr/vlXFCx4DaTDCzCi3PHH6tCa2HwcsW6rva+yLh
 v2NCdvYoznKawx+WXbGW2pLV2OaZTpMFBfp8JWlN+kKulYp9guGqEFobzMBux6DzP1NPWIKIV4e
 Y5lJrhnlX2WhSV1DgKGWxIUpnURWkYFXTdsHdGhU5slIdlxScuPUXyyjsY3cC5l3uxWNyPKXr6e
 XOCwuyNzeQ7PKcIMlKfiWhv8f1BgHfnVgFNWtsXsqfdiXqW3vB3/84eDI5UBXClReE4RqlHLHWX
 2vKDTGtBLhgazC8jWuF+YtI892qh5Ad/65xuw0PsjnyGXd8PjSiDpDoFlZJe7skeRL74WN/2tFi
 kxpqINcsud9pjtVqaS4jPnAphdyVeMLPHPkBylyCPyOX/Rx9PMZ6qkpqsadFko6BMTtkf4D1FyC
 KI5UEs5OWwgz0r5pnRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010120

During speed-based rewind, the client restarts the decoder queues once
per group of pictures (GOP), because playing a GOP-based in reverse
means decoding each group forward first and then showing its frames in
reverse order, and every time this happens the driver resends the colour
info property on the bitstream port, which firmware always treats as a
sign that the stream's properties may have changed. The real problem was
that the driver never stored the video_format value that firmware had
last confirmed, so each time colour info was resent, it used a fixed
unspecified value instead of the real one, and value firmware received
kept differing from what it already had. On every restart during rewind,
this looked to firmware like a change on the bitstream port, so firmware
sent a settings-change notification, the driver treated it as a dynamic
resolution change and paused the port, and the client removed its buffers
and built new ones for a resolution that had not actually changed, causing
playback to stall once per group of pictures. By storing and sending back
the same value firmware already confirmed, both sides stay in agreement
across every restart, so a normal restart no longer looks like a real
change, firmware does not send a false settings-change notification, and
rewind can continue without stalling.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-read_video_format_from_firmware-e5341e334412

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

