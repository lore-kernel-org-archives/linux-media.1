Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212AA29B795
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821756; cv=none; b=AFuiaBmBqrrXmgMVdrxn2+1icxG0IJkPTRHmeiWltuqGLshsVh+RuuUSOC96tZF9y6tASI838qEd5PbxtoG3aVSDH1UQRf49dS8ML6T95D1DDjW2nrEdCXkqkhsRtVXIXDNuNKoKLIWAz8RBSDg0/mIqLaFjfgdSHkPFDLgvPKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821756; c=relaxed/simple;
	bh=h/hrq8tlOmQSxbosQzmao/buysKRFdIVJfpNMxLFuHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9neHfXTphTaHp8wkqqbLUg1+JP239I1kVftD8DaPa/RiwrkJb+2Heqh+grg7k/n9ZfDvXzpWzl8VlAjli9eZMncdeIg9n+Dr7HlnrZSp9qR3R7zJL6AuwQlcJybnFCCH1JpwSG0F400xa040jz2fAetS18DlYu6sMp0ckHJNxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgENgFTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=be1Zj2tW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgENgFTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="be1Zj2tW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGSott1550686
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=; b=JgENgFTqBkrVZ4pQ
	10rJ1iCkiWGE0AEFHWfdBuyC7h9J2zvpGP4y7MQDksjmhaqfXHRlzR+egk9nR163
	Q1e8PwFp6HhlKmTE8CWChLjk6SH62btKVcPcdAxqqY5aw1MEeeHQO0AZEjctOdUF
	p7Kgbt4byJERUj0AapTNRQukeTNpPBhJwm6S92xf9TV0hEi5oU9z/p6A5bH95nem
	/2k83EFhPjl2Cm3Eg7GMktIC86ChV5KyFwJcJ3w2cEaFw5ur4zh+pX9LgJJ9PR54
	YMbp93pCxEPf5uHA5DkJZF4oU7uGfWIajW2bznjiZZrEYIES8Gc4XmnHi0ca+NjO
	IXT4Pg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwhuk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7ea29141so5594835ad.1
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786821753; x=1787426553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=;
        b=be1Zj2tW3o3KVoUqhs2JWtKpBbz50aen80/LnjOEkKXG8jaE1fSBc05NsLKeEanHit
         YBNXzmTxpmrIAeNtXrLT+1EnuI1nG/ll8X/p75lKrmfaOGTJ6aIZbPoXR80i45ZQ9ck/
         Nbj/WVQ82p+nqryoVJISknTBHsb2Upog35MOq7SkyQLXp4wrNj6zktrPRDFPW0BmLpjT
         yeADaExnKmUaC2RQ1B74teHcy2rN4uomhSEHWGfYYGiSSzYe7I9tge1bgGgRyuH+aWh/
         HXpHGkhLfSn0eAkUUFM8ZN9fx178SSNOEuoWJEtczevKQCdGym4I5zQNkUHKbhKg8+3W
         IdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821753; x=1787426553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=;
        b=lTMmUtngT5oizhUUM0YPlTMLN1Z8SJ5Lu0ZfSXm/6NOXv216kYzQ8Fegl2RpbJShXI
         oKOXUxKpyK+ti1WimMi7y27yOUTP0vaqKL/CyylbGst0dZ42c9zSi6NQy8HQb2zGvYgV
         QVNtiB3h2OLQM4KtnPb2tkVfqsau5Yayd7cUKhODlCwh31Zm0Ts4hnFslTheSWzeNCCM
         F8JGfCx7SL2GJcDqH/n7c5CHvSbT3+a+I3fDiUT+bGCp8KfVfuyWNWyZqz5zoUrLX2PT
         Ec1A9M+pyzpXcjjeaY8QBlMD3e5HwpEYIel9r6cxncGeDSeUeB+i90ZHDT3ONf2jijpX
         bKYA==
X-Gm-Message-State: AOJu0YzjwQSuJqmdSTRtQuoRJDNhmYdEQ3mlNaryeRLr6R3UBn/aeYE9
	f1/8Fec/cZlUqwwGBcEdZ+d713mxmScIIPVpZu3hQPxQc5z39x45cfDQ3bCe/RjXffX1A6Pnv5q
	zL24oWp26I3rWi0HNn+gllswRqEX0gu9et4ogtnBGL68Ok9AOFP8Lml8ZUASUqUWDmg==
X-Gm-Gg: AR+sD12SMg6Kpd5EZCPIz1eOKCcpLMzEMIj/PP4cuHRhQ2ttiszLohvL6hm1NUYaDRP
	oBxWMCRZ7i2OR7GN0b6dnF/p+EWWnOfHn2WZ6Btgi2CBlK8YQZO6qaTSkIiEWOpE+Qqk37Ajylx
	CXiSxvLTBZcDKHrXpK21uFsgEjVRAP2bm086Ur70QwhF0QWtdVhcBuYRPD6g22qEt3iONLGFCDH
	5nUITlPp+ARKqNtE9o1LvlGvROIWYvQMS9rT77ZwyhxuqUhWvq++qP4JtoBUiL+e7YyNqzaexEU
	5UTpzzIVcnH80T+LXA4WD8i1f1wXE6MgXPzRamlBrlPXOuNvCgg5Opj2qCBphKuexvszDajcT1m
	r/MAFZybTmKQ/gjkmC9qkGZCr9KBrfSynkN+GrCn131gLfaaL3EncmEyokQpY
X-Received: by 2002:a17:902:e805:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2d3b0ea0392mr114160785ad.3.1786821753327;
        Sat, 15 Aug 2026 12:22:33 -0700 (PDT)
X-Received: by 2002:a17:902:e805:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2d3b0ea0392mr114160445ad.3.1786821752846;
        Sat, 15 Aug 2026 12:22:32 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm15889350eec.8.2026.08.15.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:22:32 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 12:22:25 -0700
Subject: [PATCH v5 2/5] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-enc_roi_enable-v5-2-ded944f0fc7f@oss.qualcomm.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
In-Reply-To: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786821749; l=5504;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=h/hrq8tlOmQSxbosQzmao/buysKRFdIVJfpNMxLFuHU=;
 b=IyBDgddy+CnXftBn0kIZAqcQoki+kDNIRI9aVpR/k3kq0/z7Psf2I2xpgbx+oLVXKUPts9scw
 YCbj27a4mltAwx2csNAjrAAxuTVsjtR701qgLLT1zk4hqtQn5+e5N0s
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: qp8GLM-B4p3pbSq9uqnQ64uXpucHLK0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX0dNuOJxgqdBL
 qXRl2ly2N8cA6O5N6Z2sAMJDDnHquqDMZ+Q9/vWJj8Rcx4j2RFGpxAJVPPcW3aL1jrD7Jlpd7V1
 UJWnmaHp6vrAgo5t/kk+x1V4zX+e7+zFY5r7TPGM8GGzo02mQ+hJzcaZ0oroIWraK74JD1GMvXx
 qIpmhKMdpsDbcEgQoaUYvDYhFsGGdew8sAudwvybQy/ravAZaYdFUbfIOMXXLcY+PMXqvcEtbUd
 NiU4BukrO65fVQTIaaadK1muc5RNkQFTuTRW27J/uYdjX5MQfHl6c/kujbaVjZUHBU8vwE22lVN
 xKKNLrR+blLv38Qbg+bbgdkFhbj35pyrnVfpAa1guLCtAm6MTIF+dFVbIzUXaJFMNWH2z0RpXUF
 DetTFLdwOZ6weH1AmWnQ+nzqVLEg52v3GTnDpuuA635aod5ij/c+racz3knqcsooLATmGZ4lOVR
 NZWHdY+K3PAvyApKWnw==
X-Proofpoint-GUID: qp8GLM-B4p3pbSq9uqnQ64uXpucHLK0V
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a80bc7a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hEAr28SmMdMltZAvPKQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX0b5WIKV8DKdu
 6PIfJx0cZ220snpvoOymF1nC5lYmg89vwgNLy5N13Jq3AoiYNTQYTHjY5bRugggmEP75+Dcp/Lr
 Ztdtst8+S3hffpQzEc79HnN7kkrWj6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150146

Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 ++++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
 include/media/v4l2-ctrls.h                |  3 ++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 5b8a594fb9e24e16128c9c763a3b1dd311fad2ba..db6577070ebd2eb6a60599b3b2394fe128236705 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -290,6 +290,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (value) {
+			for (i = from_idx; i < tot_elems; i++)
+				ptr.p_s8[i] = value;
+		} else {
+			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
+		}
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -370,6 +378,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1397,6 +1408,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1410,6 +1423,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 	size_t len;
 	u64 offset;
 	s64 val;
+	s32 tmp;
 
 	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
@@ -1435,7 +1449,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
-
+	case V4L2_CTRL_TYPE_S8:
+		tmp = ptr.p_s8[idx];
+		ROUND_TO_RANGE(tmp, s32, ctrl);
+		ptr.p_s8[idx] = (s8)tmp;
+		return 0;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
 		return 0;
@@ -2030,6 +2048,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
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
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -27,6 +27,7 @@ struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
@@ -61,10 +62,10 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
-	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;

-- 
2.34.1

