Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FCD279DB1
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509617; cv=none; b=cws7useSVp4zEwaNQAiOKTTQfiwK5u9e8qoUWwe0W54cJ6SF8p0pv54BNePPHzlaiqVzu/6nrz7RWrofNkX89r/WTChmw8fo7l9ny9geluYVDJ3Pxt6JpUClcVkqqsypSXUwUexyaaIJN2J1x2fkf2VEBEaVEPH9/ZICM5EhtwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509617; c=relaxed/simple;
	bh=2dSlcXsKlwUohkHpJICDFfgDxNit43kgpQmLWkSA25o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhM63DIRUf9xtZ+6L+hng2ViaVafHBv5XQf/3kUv64uEG5IV9Fhf4T1ogyUBgLgs3WH2zQwskpRARRWEJb9wGtz+f/kStEo4qMqm3KphJwWmVIfSxtYDoT1RwgQrbriLGqmZisR2xk/WfQpushY0DQJ7rLZVM9emSyGFowbSMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPRkJo59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6pqZiiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPRkJo59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6pqZiiD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYsAx1668879
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clp1l0jUnTtnW1IHAxiMGyyOMyW4PQV3W2y33REgbLc=; b=MPRkJo592Nmw/+tG
	qgHeB074+oBy6RBIwZ3JRkrQIj32gjiP6WP2I5T0syZJm3JSi+7pbys3t70Tq4ql
	2v93K4vIf08ACBr2kzXg+4nHpjjg7Z+bET1J4hLLGz4r8MR7REmt6XJiijeGLFSz
	6ZuM+f4EUj2PAGUUwZtLb9mgA7uopGFWba2gwWLIL7s8W6OG/1kiwTvF5BTm1e8S
	DF1AmmpeZ8gU4IQHKMpFE/f832d2Tf/v+EkAZ5tBSB00VFAwilnxd9FtoggzUAB1
	q3bXWxA76p48dqldpoNdIy7bnKRbNNTlfyxp2NVikyXz6xHuXcXtvtL73Q96ZekX
	TbZbHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc2n24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8d1600b3so1252017a91.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509613; x=1790114413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clp1l0jUnTtnW1IHAxiMGyyOMyW4PQV3W2y33REgbLc=;
        b=g6pqZiiD/Pk4e9LL9sLG2cj0UcaHSHkaxY+4YWfzXpuxD1jBG9Mh+oa8znygLy33vY
         tjYnJzlkSPx/OfFXMeeYUCkU1K0rBPyw1GdmUeUlGDrf3DfhlbNl8KaxcumWO56/cH/q
         zcBwnZNoPsWnQS1T4pJ9wxLah91bWqjO5LFwPtyVMPKDuW7sql2iJdXjfx1aAMxxxTC6
         06hNeoMPvrGu1fyM1xdSrt66vLkqFkNacbOx/RuNrjtcfLBrbZi6Fh/IDJdaNQlKGAMx
         UyiyFsumQyjCVBIMMBqVkHiyWKBQsn+vYKKwpgZtULE0ESri1WtdMf8PvNMxZ3nPN661
         Kvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509613; x=1790114413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clp1l0jUnTtnW1IHAxiMGyyOMyW4PQV3W2y33REgbLc=;
        b=rX5xFbDLkbl2KWGLwp7ed0uSJQPe0yxQmGQ+AoG/2p/hwRmGxYDWhFHB5LMZDP+Bm9
         eO8At4FFZeMlW0Mo+OcfKDyVIuujznTK7O5k3B3Ehn9g43gfPuJTGv1UDd6wvicuh/tz
         WIAiiLweV2F1V0Qeuxwsx7dwH98FRaprU1OXp2XB2DQ+MFX66ZVW5S/tzUFwrV56YtbQ
         WDBv8wqVyFE8sdWSkcswMDohTU33S+Z/q21strMtrHeCt02Z1JCMoyeQscrMGn3Cexx/
         yhAdsQOYUh/REs2Tymr8jg4MBWMPoRXjKJuXnolT9Jys5EOW1uM/loKLWrR5drC9hwDW
         PK2w==
X-Gm-Message-State: AFuF++nVIJR1FnhTrAPyEjaByySRpH2IOUoKR1lPGiZnZmBWET/Sv/7R
	ToZSLndkVrlnZKnONWpWlXLCk60dFvJDhGcQ/uWt0pefNQ3nB9rSEDPpe0mQmyLDlu/DcPYe7cI
	W+wBRvaLe5Nfb1yiGTOQ1ftA+FfDzlI6/6be4d9IEtSvLon7LS+2y2w7SgBvh4/1rNA==
X-Gm-Gg: AYBFou20BQkpnlJIyGstSalW6b3WgqjXPOjWybU2rBGNokBUY4YRfjXWvHQY+9gq7SG
	KqJAbneZCKkb2BhzF1YAxYWQ/kzx+1vSj3hu34AuE93bztEcrrbC/Gf0JPm9U06jpZ/E05YXoGs
	fuO6RBhLGnu5lLepxAlx3uuuoMGVBy0LbK2105vqatWpA9k1q4anp1CnzAfvThDxt15Xv14CrIr
	fAAiYmr1YqZTLvbWmlpxMWwvOUUXIKRkvzYzU1N6qVikVrVFnZjoj94CgH7gU2kST48FhM5Y65l
	lVPWw+/IPe1PMKnnDekbT/g3nqJEchdclm888YMCoPy2pUCMATKyTYmipLtqNgdRS/vW8NVgx8Y
	/TJvN71k2UoIhdMdhUWS/pjT4aTibWpqjgQfIQ5JPXTv+FjF64/PsUvbF/Fs0
X-Received: by 2002:a17:90b:5386:b0:39d:febe:7452 with SMTP id 98e67ed59e1d1-39e1e64b9bcmr311541a91.4.1789509613353;
        Tue, 15 Sep 2026 15:00:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:39d:febe:7452 with SMTP id 98e67ed59e1d1-39e1e64b9bcmr311488a91.4.1789509612776;
        Tue, 15 Sep 2026 15:00:12 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:00:04 -0700
Subject: [PATCH v6 2/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-enc_roi_enable-v6-2-29dd4c8bccff@oss.qualcomm.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
In-Reply-To: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=5812;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=2dSlcXsKlwUohkHpJICDFfgDxNit43kgpQmLWkSA25o=;
 b=QdQWSd121d55WR9ZYI7dQkRzxXSINssmo0nuRx5w+g1TqnIKqo0CMzD1sABLsjs68ExlT7rE/
 L6rWutxt5lCDUtkLcxGsyGfC4oyhQww3TkaHI65l2l2wQrmopLjD66m
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX6jG1fLK77fet
 4iMAZ2bYo2qgT2Pa92xFzklOHffNqnfbi5H7vupvWz4BgqWtH08cZCJtFf5o0rhAnGJo9IkuF+i
 W4dgZj6Al2xHJ/c8fiAr2oprlWioois=
X-Proofpoint-GUID: yOEu_uZSDJOxScQNscZbQx5UEhnKchO1
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa9bfee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: yOEu_uZSDJOxScQNscZbQx5UEhnKchO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfXztjsP42eG8+y
 s65rrwvDusi/60czgzFX+upnk9UObagGP/pBSb/gsRn+eaMqXPLCSAvPp8YuOIiK3dEIAcceFZx
 4J+mAvoty4A8+sz7Oi6Lf46U4rTLKywvnP1qzcfwcC8A3Qw+m7OP5yVk4XGXo1CKqZRcOz68SOk
 iP2jlL9Z8bDLleasyuOKst7IL81OPXqhikpnjc6nl6Spm+VWCuhwZS4Ff7ZxrMCKeNIKUSoPl/R
 vpT1ixldgkFxl5N049zHrFbGhdEC6Oej8Bifhhbls0Ut+RaZBwEedZSbuzVuJRCOvMlP0WmN72c
 /cXvxp9IiYskL6zaCIXe12a1+MkbSCzONTckQcbgM+fk7aiHqQC8piSTW6o49cEVzNmWCNm0yIj
 xjGS39LnIaY3CXTl6me6OCIMMQ1JR05wDmOQIuJObpSxjFlLMjWzqsFHgQUcDYDV8I37qB3I5t/
 QYSZnqPCfzph6TKAkMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150321

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
index b78992e32e21c79b1c70ec673b81759c9ca84206..e7376b52bd75dd5800d58941aee21534ce0b502e 100644
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

