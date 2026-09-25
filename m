Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B210211A09
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296091; cv=none; b=QhKPhrdDDHEFCelb126MUsmPfT2tf1SQZ6nTWaz5W5sF1e41uwRIR66nC5OitW/1ETMVIrgww5j0FJazRpmnF7J7747xnrbPHnTHeqR6jXoYk1l5gKLAjeh9myY/74taXGKku/lIyIlR8YGr56mN/uSX72DNS/MwkLSb4YocK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296091; c=relaxed/simple;
	bh=zsWqRKtlrZSWGWqLaRyE0mDAEmZ07PgIoNKYlaI+SjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkwvIjcYcFwQ0BjYpQ+iVLJ9UBdM55qQplE36MeFA3M69RGkOZaELotvglt6r2UeLa4e3u9LObOBvKu8WH88bpZ0JB/XsMqMLZSKLqMsdHYWJVuoScSgEfT3uK7s2+91/Ltm5J/F0UCwLTbXayEIfSDmUOabV6yn6nPsmw2xKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwgME2YP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GISgvpev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwgME2YP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GISgvpev"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOoKo280370
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxnyWlwLC18eg+ibLHUUYwSrMx1l90B1bOPKgOZtRY0=; b=GwgME2YPg3gIp+fy
	LHlHdTyTlgqtcH5R43YFGqx7HlT10bUrbqthf7WbOii4t4KpASZt/JfNYg6dEAQY
	RQHxt0TAk9jD96Mb473ZGuozbmvCVZjv99KxrIRXscB0jKxOKWnYvLOiYuUIJiPN
	ZdwJCwgDKExcTt6dbZnS9EA1x1+KejsrlqZRIntnLCZNW8LlXxkP+C+Qp+X/LfMj
	1HzpEmlAH8ICpcMkbrAb9vxJS52Q3UbR1SL7hxd8NrfREjsMk38Og8NcshGQ2Ti1
	msYHP3ezT/cK4amj7zgPCuGlOtiuHFtpwX/COaJGrMabMQMgFPdTH5HtbxMvklwT
	jXDeVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce78awh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:28:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313c7315becso17057eec.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296089; x=1790900889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxnyWlwLC18eg+ibLHUUYwSrMx1l90B1bOPKgOZtRY0=;
        b=GISgvpev93mLnOSplySK6QxGlrs/7RVLSxK7PkIHwsuRbjiZNdiPayMPzVQOMdCwMk
         BQSOS/b7pPRKC4d5O4mGYNh7QxRZ4dxzYmwGoOrvKUr5c8opXyCqSq7UlnRr9n66WE3l
         0/uasld7cknBHZ7wJKoEgRJqd9T+5gpGIrkhUDSfI1t+rRfvapRzb3BOt0YJsLSiOOiP
         OK6cP0rSjeMMCOXX9URhyDBDzEd2KqXhwtSC46E/VKwl/IDU3Rd5iKDXhT3JRUiswzSm
         9Aagw/Rnb/Hb6+bmQVXI9/ZvcQxuaG6Q2B38Xf0mC23x/f4dwhpqMiMxcY3YAgCbshO+
         YntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296089; x=1790900889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxnyWlwLC18eg+ibLHUUYwSrMx1l90B1bOPKgOZtRY0=;
        b=PTcYPBFooiC0R8dcay+sLmH0Tugp4/9P/W2Jo4GpIkMjGPkrijY1diL3KQ8sQHUP5n
         J9a9rYA+i1wQDoFRo5FqYJ6lDFSL+O7sXxaXruQkDkYow7OLAn37wnSyoAHqfcSgqpnp
         UyhtB65w7U0M5vZXxF4BfmWIkgz16aA3jDKIVPPuGZ2l8JsRR+I9ThdZtd870wqqAI8i
         kX6bcxrQlD4QCHuioKvCBynAAUjWawUYPFxyRtoroL8LNFK/6ewc6kDRzUgYoBTJhJ4K
         VdJ3h5hl/HwjMuLhFBRHNzjNcxA4PXHto7MLDJwAXycJURYjDo/D2Z3ZaeyPHuwNg0i0
         65PA==
X-Gm-Message-State: AFuF++nISojFha3m8WZywAOzAJy5T7CVg1ga1haAybhHLaDDq74aDEBD
	Vyivn3Lq3RYohDJTW6rYZGHZi9U3J9BqwHByftCPIKfNjjyNusAMzK1xejyAFOgDAcW9ulk8ESN
	hRCp53l4XkDgrKDIM0dCnpV/xmBB/T9LDfyS6C82pVkCnNJwNUvAebYwUUzpYZ4B8wJdHZuwShQ
	==
X-Gm-Gg: AYBFou1+BXUc3iVjH8FIU9e/XIKrNMl+guc+N7nnX803bU+1D2ucDAzVVy2EZFASct1
	6TekrxFZnMuRAgf6pV5QKI6aGO+HOc/RtCBWg+YoorJxmihAfgCes5w0N8fnqgPY+ICarSWWL58
	/V9hIRskPKUPid+QP8HiO3fxlYML0aC8OvYs6sr2QC1djIhheYSTVoeD9GK6+bEaxtsR+lxuOLi
	HbZCTlRFlFo1JKN/kbUrqDrEuroGRdiIKDUR4ZKHhwBjw1FPJy7hA9lBJXBXjwwXWOC08ETQANM
	PLxaSanE4hUqadFcBRFiBumEQDXXNhhrc+UI4Pi0HF9BQNV+kXTAd9Pn5hn+AoxduWRQg9zY2hJ
	GWwSoSHx1kD7VIu3KY60FiX3Ym0JksaxsL8xOxvmYlK4Fm2ld06+aoe6kL8i2
X-Received: by 2002:a05:7300:6c12:b0:340:f698:fd56 with SMTP id 5a478bee46e88-3414a792afdmr1655007eec.2.1790296088708;
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
X-Received: by 2002:a05:7300:6c12:b0:340:f698:fd56 with SMTP id 5a478bee46e88-3414a792afdmr1654969eec.2.1790296088035;
        Thu, 24 Sep 2026 17:28:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414485a9cdsm1873736eec.16.2026.09.24.17.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:28:07 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:28:03 -0700
Subject: [PATCH v7 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790296085; l=5812;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=zsWqRKtlrZSWGWqLaRyE0mDAEmZ07PgIoNKYlaI+SjI=;
 b=T19hABZoOOOVC9RMfWOwjm8t7O5zOziPM7uC1FwzeXh3KXJnF2yW07mnILxd5IcmX8HrCRb3R
 MhwXXEVu1JZAB3VgttWOAqqx6KO9GZV+pNqrM6Z/j/p9VHrX0dezcsA
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: Y_kg-s9PISYPhsPE45k-XhS1pMmTzYdz
X-Proofpoint-ORIG-GUID: Y_kg-s9PISYPhsPE45k-XhS1pMmTzYdz
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab5c019 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX7jQg44ltrY3w
 n/xZrA8Pn4nN0Di35e3G6g8i8auzLy4B/ZJhdy6r9j1FToZb8QaCqQtDW/iSD4Vw1G9vqyF+L2K
 ypWQvQ/R/TqoD7S2O/elDm+5y7fQH4jFHKi1CgnOL2TzSnUML/xZeMR23AHyLqtNCPgZ6z76qYu
 1kya+r77y7wyN75NSUfMNdP9CVjIIGi+RFHl6WI2eeXF7/zkk3CRZHdjpNpetlMdg/C0lC0DGHo
 3rO3wDYvowOxaRvQhryvHCmoAfbtqdmQsM5CerDVsZaHLoYx0ag+VjhhKgucMmxwetdyRceeWkR
 YkjQoiwxuhmQ0i8CQmfohWVzZifAICFzp4dtYtk4GTS4naDCBG1qaO8X39Yv+TiHUgf85+Cw9Gt
 JLnElMxPnhWUMmGvLWSAN7DMPUUdnwQHgDV4Kzo3FcZ0JszahRd9rvWKiducuC/udnc3NZmTlIm
 7NvpShB/yW/7Auxiosw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfXz/z6sG8MQh2G
 FBysPTj9XghdRM/FQEGpoPST7uisV1S/3G/lpKTxZ1Bk7cn98gIfj7J220Dc0iAzvch3FAGeZhs
 y2I7Y69YwQUyjkmdavlvTEyLjxXMfMQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250001

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 26 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 +++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 41 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..a02ec20ec18f0e684973964d2de1759ad179b819 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,32 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent.
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

