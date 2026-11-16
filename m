Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848771;
	b=FJk/e2ycVitFwNl7IxcbSynGwtQ5FXEyHygGx315xBbayNoMJgW8Ifx3ghxJgxE9woix
	 1fPri8+ukMVIaTQ719Rn05ccPKqFmfT4IAJVT0f6KVTxdy/gv/miWbhMA/46ElAy3pAOk
	 QRcOLd4KR3xv18BFp3pqM2Q6syPjwwA5trIPCo50dAW5lCPGMXAglSzuFP11ZuCFfefnS
	 Jo86CpJtAKbP23nGzYZZCerCjOeiBRsazr/FD/7wshZ2w0vr1JduEU6bg8kfcSt2AAFVi
	 KXwIP4FO6vruad3FxFfYdiaYIB+s6nq8P4I1tPQbjOJh7lOv5CrUetFatt0QtiqYEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1rnJQILgJv8DGe2x99261bhnoPg7Cxtc7U6KjazxZGU=;
	b=K7YBkVkPtH7kwho7LVEsZ4rKtSrBFii4YSVbUO6FXMny3DoYWfiFKX1WBigFv0Bz36uV
	 dUJg7/xyDbLmX1LCEvxLzkfv8ka2571MoqmhOyNzODsWDEgY1otbR0rvkdTjhMNEDXcXS
	 fbdVM7qTu27Le8Ym4Rc07mm/AwVmox3QuJJWK1qDEw38J1wMYM/i+lOyS0VCbTIl6p77b
	 6C0irCLW6PqJ7OqWSWq0BSO7Bxns1wzLzQVrud2iNtwCjstc8061Wjik16n4niAstWKz5
	 vX30Dq5mG+nzSKmdMfKpMUSSpvyMHzTnXqPqISSnSJiOKVhXGPFeO9KLWqYhv4R/8Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l/cwsCz3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfI2UMZ6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B2F606A32F
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B2F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/cwsCz3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfI2UMZ6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK5xc3692946
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rnJQILgJv8DGe2x99261bhnoPg7Cxtc7U6KjazxZGU=; b=l/cwsCz3jK8MBVME
	NvG1Q1GI0F3+isUg3NKK/gUVuJbkwQNnzXyEbMq466JByCBRDr14o6Pfy4c+asBM
	GbXVdkkhOWCCuKVWLLjqosEK9rxUsv3bLDO9XKwiud7u1nR3RIzPywjKdqdtIG70
	YCAqPYVav97+gZ2j/ijAxgTPshF/zBJtjH2duFYqmu0Pt6jFFp+w7na8yTOXD7EA
	S1Sl+OguQHd1EnNgBVENcJi4wiEgR4wA3ow8HethHMrMtvaRUc/q6kJ81um3q/wC
	R0Y3nl4MMYHpRRhTTGNJC4g6ERzyvuajWuvRLHrO1t3R2I7RUpo5tKhzDxJa+x97
	71zEZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f815xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed05b3eaecso26058585ad.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848769; x=1795453569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rnJQILgJv8DGe2x99261bhnoPg7Cxtc7U6KjazxZGU=;
        b=MfI2UMZ6GlcARSXyyNUciJeGXEOLzStpEUBqLRKyNWa13hR97RzyV0cv5JsDL3A0Ly
         L2oP7e1jGh1Gbt5betXS1AATjiDbtvZt3Kcl1ebEzLaeAcLyX1DmQpQ4OHaz/dH598op
         P52oRVDtEMmEbdM2Bm/8zOIpoh+3zcl/1IyLgN9/gcD+6429m9CXiSPNhimOuktJgb5c
         JKXR4e/TAu5/ittCZDkHyNn/0OTDyYj5mEEFKowBfe3nU0C6Fk30rgwQwfnZCrS4d1of
         y9CWgSiJ3Zz/y2503kRkf5fqrOhebnYcdMjT/QKAGCjmnzRK7o7ONFtLhla4glrKzD5s
         btHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848769; x=1795453569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rnJQILgJv8DGe2x99261bhnoPg7Cxtc7U6KjazxZGU=;
        b=rhXFqpMyx4PddtMBzRnAYB7uwsBDbAsBkLO08WIRXadO3T3nVMVCmp/8be3j5Zs8nS
         G0ywmPkXZTgAefclEZmp0JPl7R/CFDZWoAVlEhh30FEsfJPvbi6Q5x/nALvbEx+B4CmJ
         wxOM3Ddv9qIAulSy3wFOFzV3dT3AWEZ20q7/UqmPImsdR7iC5D1dCezVivH24VKHrTjM
         r6on40kjZZ2UvbQvtoYpDjc9hFqCp1rSrkiyWjJ7WW+UCsSzvKWWgAPBCw0L7khHIgkG
         TZsR70BGgwROh2Dad6YTrN4j8ID4VLFgXIdOfLGu8chQ8sw6RQ7Lcfa5ACmROcxWkT5h
         kC6A==
X-Gm-Message-State: APuU4Z+Bc9qFZk1Mb7T2vy4ZNJlz8vgcwKTPuqWRo41iK+XBZ2KhED2b
	GY5FeDS1oBD/1RrgJsRC/YuTnLLaWlFITLl1SQFhaLReoh9fDskUgH778S1mmfqZSFX+j4l2sUc
	y+28cnSdLOjEQyUEcQbAYbeJPV8lHPDPCu+FPd7QQjwcbFvwBhz812VTd6ci/wPIYbw==
X-Gm-Gg: AZFdTZfTiksPkNw5CBZmwOwpe9HUOE/pqh0opKN/I3mbgarusUMVY9QYexu8yfhQISn
	RUvCihPEY4e3a49XT+UjSY4YTwhpI49l7p/C0TV6wXF8UdG32FTVRzb0i+tcttmeIzt6YJ+VIgD
	Edl4IgJoTWWwyzSdbz82XDd2DE02OpSXkgnd7VZUMkkoWzMVWU4dl+S40mg+Jhj0P5h0o3bSUfQ
	hvN1pm8o5GsWkEzRtIFy1rY3guS6lOWME79Gj0TD7SHrK85+ZIRYTI4+iNSziSKohgTz60yS8n+
	K5Ec1JEkguMMcdnh7LRaORGPSgREjYpOXwkMS3V8HsEAhafid9c7RxN3w9dln4VflWPLG3EeWTQ
	y26HTFW+gq949qP0pr5YWjdLgNI9E2ADkTsFkf8Eir96a12b0GeCkBlmwYEgaj7tY8wctoCitaO
	BYngS4
X-Received: by 2002:a17:902:d4d0:b0:2ed:948:b68 with SMTP id d9443c01a7336-2ee0de12017mr109761235ad.9.1794848768883;
        Mon, 16 Nov 2026 09:06:08 -0800 (PST)
X-Received: by 2002:a17:902:d4d0:b0:2ed:948:b68 with SMTP id d9443c01a7336-2ee0de12017mr109760905ad.9.1794848768286;
        Mon, 16 Nov 2026 09:06:08 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:06:07 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:35:53 +0530
Subject: [PATCH v4 3/3] media: iris: add new rate control type MBR for
 encoder
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
Message-Id: <20261116-b4-add_sc7280_mbr-v4-3-636fb6bc8772@oss.qualcomm.com>
References: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
In-Reply-To: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=11798;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=DNN38M2BDvoT2vLZwVspuR5TmdlRJ2JSadp0vLon/U4=;
 b=hLkcGIBdCO4EsL8ONK9SZoaZXIJvENGR/8qN4MZXXNWrC0+Qs+w8EX+/97pybooQ8k6wqoyCc
 TR/mTVdVPZwDtP1VgxvzzhWSvadwA64LZlr26x14hRFGQ0i16Rnkhie
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXxF/XWHnJttJw
 x9hZVkVyJQH8p+e0HrOhSK3XLeXaodROMOoRxuFkGFGD5g65w8LNLvqsek0frkfKjikgOBOdcze
 itFtcxb1GUOOmDul/SzO4zs3D/9OJ+dQrjlMrj7y/dyHWq4PlxPREnMLew3NPgxQX0It6qFKZzb
 t6laeDLK1F9qDxjO26guiXbrM5PxLaYhUoyMmSFwG5QIizFBodzB7blbTpBZ9PhKT5tFfmvXK5k
 yNx1D51FE1/KAxOzhfDeNMgFhZd1NeD+z7Tn35LXIYJQKRDUnKJVleQeIy23/Ccv0+bBviZpZ7B
 i0SEueCCuvRaXssvpqHVNUjQ3C1OUsHpl+gWb9wwa4mHvvSviOAuU70GXICu3uwNT4A3Pbp9c/D
 jMwSOVTvVFlt8MdxU5drVVLtFw/s0ao7d/NPKXL886feHh+ebD/K+s8XcMbNvckZ1KzgKLUUD7w
 0LLemzOkYR78Wz0C45g==
X-Proofpoint-GUID: rp2TDP3Vt--hbZWwLJdeQNTUiHZddvCl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXxkg1YKMYa6MZ
 oynWWc3sZY1hnyn0LvT4pbl03CQ+9oCOcDJ42xtvc8tV93jx9ldCIn7HVDk3gitBZzg7lbthh4/
 kPbz/ILaLYc8B16zbO/1GgWRrDcwb6A=
X-Proofpoint-ORIG-GUID: rp2TDP3Vt--hbZWwLJdeQNTUiHZddvCl
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb3802 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nrbAtSFVY4uyUaQ-iQYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

Add support for the MBR rate-control mode on the encoder.
MBR has no corresponding V4L2-spec definition, it is exposed as a
Qualcomm IRIS vendor-specific control rather than a generic
bitrate-mode value.

Implement the V4L2_CID_QCOM_MBR_RATE_CONTROL boolean control, defined
in include/uapi/linux/media/qcom/iris-config.h, to enable it. When
set, the driver programs the firmware with the MBR rate-control mode,
taking priority over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are
client-set. MBR only applies when frame-level rate control is
enabled, and V4L2_CID_MPEG_VIDEO_BITRATE_PEAK is not used in this
mode.

MBR is currently supported only on sc7280. Rather than duplicating
the encoder capability table per platform, add a mbr_rc_supported
flag to struct iris_platform_data, and merge in a small
platform-specific capability table containing only the MBR cap for
platforms that support it.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 108 +++++++++++++++++----
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 6 files changed, 95 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f..b86dd11f7293 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -6,6 +6,7 @@
 #include <linux/math64.h>
 #include <linux/types.h>
 #include <media/v4l2-mem2mem.h>
+#include <uapi/linux/media/qcom/iris-config.h>
 
 #include "iris_ctrls.h"
 #include "iris_hfi_gen1_defines.h"
@@ -163,6 +164,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
+		return MBR_RATE_CONTROL;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +317,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case MBR_RATE_CONTROL:
+		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
 	default:
 		return 0;
 	}
@@ -352,6 +357,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
 };
 
+static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
+	.name = "MBR Rate Control",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 0,
+};
+
 int iris_ctrls_init(struct iris_inst *inst)
 {
 	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
@@ -385,7 +401,11 @@ int iris_ctrls_init(struct iris_inst *inst)
 			goto error;
 		}
 
-		if (cap[idx].flags & CAP_FLAG_MENU) {
+		if (v4l2_id == V4L2_CID_QCOM_MBR_RATE_CONTROL) {
+			ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+						    &iris_mbr_rate_control_ctrl_config,
+						    NULL);
+		} else if (cap[idx].flags & CAP_FLAG_MENU) {
 			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
 						      &iris_ctrl_ops,
 						      v4l2_id,
@@ -428,6 +448,38 @@ int iris_ctrls_init(struct iris_inst *inst)
 	return ret;
 }
 
+static const struct platform_inst_fw_cap inst_fw_cap_sc7280_only_enc[] = {
+	{
+		.cap_id = MBR_RATE_CONTROL,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+};
+
+static void iris_copy_enc_caps(struct iris_core *core, const struct platform_inst_fw_cap *caps,
+			       u32 num_cap)
+{
+	u32 i, cap_id;
+
+	for (i = 0; i < num_cap; i++) {
+		cap_id = caps[i].cap_id;
+		if (!iris_valid_cap_id(cap_id))
+			continue;
+
+		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
+		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
+		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+	}
+}
+
 void iris_session_init_caps(struct iris_core *core)
 {
 	const struct platform_inst_fw_cap *caps;
@@ -461,23 +513,12 @@ void iris_session_init_caps(struct iris_core *core)
 		}
 	}
 
-	caps = core->iris_firmware_data->inst_fw_caps_enc;
-	num_cap = core->iris_firmware_data->inst_fw_caps_enc_size;
+	iris_copy_enc_caps(core, core->iris_firmware_data->inst_fw_caps_enc,
+			   core->iris_firmware_data->inst_fw_caps_enc_size);
 
-	for (i = 0; i < num_cap; i++) {
-		cap_id = caps[i].cap_id;
-		if (!iris_valid_cap_id(cap_id))
-			continue;
-
-		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
-		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
-		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
-		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
-		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
-	}
+	if (core->iris_platform_data->mbr_rc_supported)
+		iris_copy_enc_caps(core, inst_fw_cap_sc7280_only_enc,
+				   ARRAY_SIZE(inst_fw_cap_sc7280_only_enc));
 }
 
 static u32 iris_get_port_info(struct iris_inst *inst,
@@ -524,6 +565,13 @@ int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_value, sizeof(u32));
 }
 
+static bool iris_mbr_rate_control_enabled(struct iris_inst *inst)
+{
+	/* MBR_RATE_CONTROL takes priority over BITRATE_MODE when both are client-set */
+	return (inst->fw_caps[MBR_RATE_CONTROL].flags & CAP_FLAG_CLIENT_SET) &&
+		inst->fw_caps[MBR_RATE_CONTROL].value;
+}
+
 int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
@@ -537,7 +585,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 		if (iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
 	} else if (inst->domain == ENCODER) {
-		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR &&
+		    !iris_mbr_rate_control_enabled(inst))
 			work_mode = STAGE_1;
 	}
 
@@ -758,7 +807,8 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 	u32 bitrate = inst->fw_caps[BITRATE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
-	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR ||
+	    iris_mbr_rate_control_enabled(inst))
 		return 0;
 
 	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) {
@@ -777,6 +827,20 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 				     &peak_bitrate, sizeof(u32));
 }
 
+static int iris_set_mbr_rate_control(struct iris_inst *inst, u32 rc_mode)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[BITRATE_MODE].hfi_id;
+
+	inst->hfi_rc_type = rc_mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, BITRATE_MODE),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &rc_mode, sizeof(u32));
+}
+
 int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
@@ -786,6 +850,9 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 rc_mode = 0;
 
+	if (frame_rc && iris_mbr_rate_control_enabled(inst))
+		return iris_set_mbr_rate_control(inst, HFI_RATE_CONTROL_MBR);
+
 	if (!frame_rc)
 		rc_mode = HFI_RATE_CONTROL_OFF;
 	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
@@ -813,6 +880,9 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 rc_mode = 0;
 
+	if (frame_rc && iris_mbr_rate_control_enabled(inst))
+		return iris_set_mbr_rate_control(inst, HFI_RC_MBR);
+
 	if (!frame_rc)
 		rc_mode = HFI_RC_OFF;
 	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 47e9147a9b6d..50d38fe89792 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -621,6 +621,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		case HFI_RATE_CONTROL_VBR_CFR:
 		case HFI_RATE_CONTROL_VBR_VFR:
 		case HFI_RATE_CONTROL_CQ:
+		case HFI_RATE_CONTROL_MBR:
 			break;
 		default:
 			return -EINVAL;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 6981e6e84fd8..33c238a1c9bb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -132,6 +132,7 @@
 #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
 #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
 #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_MBR			0x1000006
 #define HFI_RATE_CONTROL_CQ				0x1000008
 
 #define HFI_H264_ENTROPY_CAVLC			0x1
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9..cac2f3225754 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -64,6 +64,7 @@ enum hfi_rate_control {
 	HFI_RC_OFF		= 0x00000003,
 	HFI_RC_CBR_VFR		= 0x00000004,
 	HFI_RC_LOSSLESS		= 0x00000005,
+	HFI_RC_MBR		= 0x00000006,
 };
 
 #define HFI_PROP_RATE_CONTROL			0x0300012a
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..c150dbb559f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,7 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	MBR_RATE_CONTROL,
 	INST_FW_CAP_MAX,
 };
 
@@ -348,6 +349,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	bool no_rpmh;
+	bool mbr_rc_supported;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index becbe3776544..35a5c42c6ab7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -132,6 +132,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.mbr_rc_supported = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.icc_ib_multiplier = 1,
 	.max_session_count = 16,

-- 
2.34.1

