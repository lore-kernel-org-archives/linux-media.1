Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6755416115
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236296; cv=none; b=UbP/NqT/E3shMxo6a7fb+Hg+seUjSaq/5uKTXRTvPWB2LD14J0UNE65X9hWmpdcoxe/tl/drUZ/OfZDd3tNa6KRAbatldN15Bh8uPTL0oAGl8hEIv5+x/cua0e9ixbq6LzLmWndtHtNzg65CZlcmUAIgYwQGxvJjHzj8wi6X8Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236296; c=relaxed/simple;
	bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfNfUatRwIfbLxD67bYoUNPe81dcnaIyA1hwUYIgxRV4wx1ArBoysFFiVypcuOPa/Y9cTO84VPEvvMmFgQX8uZc+WhOS2tzGVBcJ1AOUSWLky8gRLs/3vMsUVMoSr9BShztBz+o/DdtVFsBZfglG+CjCiICJrm3yrQ0PeJdPAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiy0VQcY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMBk3JzS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiy0VQcY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMBk3JzS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMpGl2359910
	for <linux-media@vger.kernel.org>; Mon, 5 Oct 2026 21:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=; b=eiy0VQcYuMkY3TzI
	lS/hRmPb/kM4z98tfrbtWCqAJ/vwTIHladMveftJ/erS3mcnRE6fZL1X8IWrHKRr
	EXqKaM41rsuGsiIx5TYOXmH3V54pNCnkRP+KLRBYJF1n0OdwlwSQ2QfnWivth2iC
	dNpXk9wM92zDJS77wj1CmOkiimxO7ZVOa3XLChkX2JEp9r7ZT4n6qIOt33YWoz+c
	bjH5sZUEvk7FBNStR0EAFYU3zMQP4G88sV9hyWsu5s4SWkNk9NbddPsGs99PwRxF
	VQonYjn26b87+Jz5osbXrW0HNK9bdLm/XPp6naaXhjg+N7x+pkjpGn5sXzayMLP7
	q9jQSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4j1nrd9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 21:38:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313c7315becso352350eec.2
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791236293; x=1791841093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=gMBk3JzS7vVajARzcwpkRLIFiddgkcpoa5YCgGAqmrcwIDWNxUBuNrUtvwHkkd/en7
         aN/C6EZqM+gT9q3OpjFgH8LFgA3lsxbTx9315jB1Is9wcLbrcspZB3+rKVxB/CpsLnDM
         9iYviKTZxuSh+8uVNxzjrSXtS802rEMvae16bOEh32U0O1mClxgES9n76/39XIvpj2dv
         N2M2qmYejEGsga5YAHg3R+o2g9JZZs7TUInmM5jjS/Fz5Xw4YMjC+BNpO6idAG8YH6DI
         SFMkFsDVHzb8YKN3eEIgLyeogOVbkH0etAOHsLwnmTDY5Ke0RkUmszXiwLdhm+8ssD3n
         O7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236293; x=1791841093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIdDbQ0a030tGIztsk80MJxUgSIuVM/lJl+WZZaorT8=;
        b=GbLUPjsv5JOQfSn/w3/4XPeJzzxAxcu/N3WWUhjcMktNXWWkX+mhgq1u5gBvmNqE1N
         dC90EdawYpoL/M8BrDGvWnE+AjHtnORGh8rOj/E9mW8+RtMRZW6U8HNlERss1MQSJkqJ
         S2xQYBnuKV1lxU1s0FunAB25l76tewzCVQisBUdCuMWeybE4yPQ/s1pVfMQmxxXndz3X
         DCq2MYI9lY/I00HodntWy9jfV3+G6gzjzNMA8rkRSNqpZGUtPPDDtCP1z4plPRZuAQIN
         9sKWGd4x/nMiahuFODUn3N3kQdoXNSzZ5lQlkb8Lz6HSCKmB2aEq9nWhrdDt/T228zPv
         6r2w==
X-Gm-Message-State: AFuF++lSklMOWX3YVP724NYd+qd6qoZUOtDi5AK/ATlgMo8VEbgJy29X
	NJ0qi20UnqJAj3XpRWjUXSP3CNfWndBWVsvxPOp3TPo6/J/aJ49sJimPPrfYYpbmAZeaTb/oyr1
	8KdqDgH63sNWK4j8959e+yuxS2RpjecpBLc99y6/LfwJOArZojrOMjctobO7WdQqXXg==
X-Gm-Gg: AYBFou2/t2v/8gh9YW3yUc1oqNNVOBEDsPvR7O6GccxIfaQctOd/ZL5e9s+6AOBCCJd
	6+H0zW2uUl9ctYisgc2I2Fm7B150ZxyZL8oo4/QD/5q6fyNuYeDzFq2vfHWOekc60Kgw47gdwT0
	yNyPYoz7qsovif1wPW0AXKY7xMzlghHuTbFeTjScaii4ngb29slPKZwAEVawTV6V7dGCI1E80rA
	zQqr4g06jo53NKIKMgaCnYatbzLmOhtfVYCnmi/n9b9XUd6U32GN4fL9bb86SRdnYGGJkVjaZaV
	cPaKmA45Ew1cJCgxGlCgESWXsO+RagF6E+oqa76kSSwPzUgxd9b7v1SUN28oyfAXkQ4DJwOuD9a
	xRaOETcH3mHyvrxG4TGnpgYP9bBx2LVTxiLXXXsJ0Q0u4JxA9nqNyEBYyfP7I
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34f1507015fmr19988843eec.2.1791236292961;
        Mon, 05 Oct 2026 14:38:12 -0700 (PDT)
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34f1507015fmr19988747eec.2.1791236291458;
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm1064954eec.14.2026.10.05.14.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:38:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:38:07 -0700
Subject: [PATCH v9 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-enc_roi_enable-v9-2-831c24135cb1@oss.qualcomm.com>
References: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
In-Reply-To: <20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791236289; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=HzzxuNAdlf8qRBuj2dqxE/dfovVlMs9BioEyTDfdR8Q=;
 b=TBVGJ+j0HTCzE2fbTEQ4WQvXkKIIp19cgDKxu3OYpxYg80xZFEfzeCfFQkzvmJsB5Ax+lCs6H
 HFa0806SNuCBAbtW4eDwPGD0viBZBDTqqEt4YGiuU3t8um2y1peM4Xb
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX6D0Q1V0Nw/Ml
 nSd3+JchQAOFH3SQ4620iAZ9RvnmMXeDx7z8cHud0AZnuPQEHRMWI9gcrAsNOGC3b6yR3iWxvhI
 JxTQ4QtyTZAJ7+dCKYJr38KGmQ+kNCg=
X-Proofpoint-ORIG-GUID: 2hfVHskicu2ym7luhXLPYheHNkZ7Fb6D
X-Proofpoint-GUID: 2hfVHskicu2ym7luhXLPYheHNkZ7Fb6D
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ac418c5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4NSBTYWx0ZWRfX/UYwlSs4Vfp1
 axR0CHh+Dkb1+nmlpuM9lWY3sGC1sTUzspwMCEvft1z5C7jJvnz/o5b0VRQYLJZx4nH2FizAN9h
 jx/VrCCqD06US7aE2q+BNMUocwRXm3HLKnkXkKWJS2vkD+hIC8mpYIjvrx4D9kQ2zsJoFJNoPSV
 VIiVigndPYc15KBZizm4sCBvab1vtbxyrxOeYCKzSgSfG053mKxSRzU9BxY5UqG+KAOs4GErsmV
 5qH1pD1+aIWa8TiS+D8zpyYmVPPahHoRAh6jNMMjMaGywCzt7joF/NJDgeJO35kzQdYPRow7xgP
 ugY7c8HfLSBC9FZiF5T5QxQm+Pp7lJY1UfRnp8u5r428Mm+rpbTX/MP6mla3ts3bZk0lxuVitlA
 hWIcsWbIAfpFYDY4RlNO9SpFChL8AWWvlUJSqJnPtEPYnM6KHuu+F5UsvDsuCXO4Sr9MmePZ5Yx
 0F6/FqaA7CuwmnBE9BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050085

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 27 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 ++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..28a47ca7b14397d3b7358c6a105f13092c6770f7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,33 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent. Driver can ignore the control if it is not set
+    along with the current frame.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
+    A read-only control that reports the MB Size used for the ROI delta_QP map.
+    The supported MB Size depends on the encoder codec.
+    Only square MBs are supported. The value returned represents the
+    width and height of each block in pixels. The ROI delta_QP map provided
+    through the ROI control must use the MB Size reported by this control.
+    The number of entries in the ROI delta_QP array is determined by the
+    frame resolution and the reported MB Size. If frame_width or frame_height
+    is not MB Size aligned, they must be ceiled using ceil(frame_width/MB Size)
+    ceil(frame_height/MB Size) for calculating the array size.
+    For example, for a QCIF frame if reported MB Size is 16,
+    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/16) = 99.
+    For frame resolutions that are not aligned to the MB size, for example
+    1920x1080, if the reported MB size is 32, the delta_qp array
+    must contain ceil(1920/32) * ceil(1080/32) = 2040 entries.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c5df0e0a54f81c73975f427957b7c99fd421d5ad..2318a548f16ebc1ec582f829c7945a8998b96708 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1410,6 +1410,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad24fd224cb5a8a0cc 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)

-- 
2.34.1

