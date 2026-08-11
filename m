Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC8381E91
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473017; cv=none; b=Hi4bjtobx6sU48ItUDBttfJkb6Rn1c9lP1JXYrR40/dHV/lrEMUYShGRkIUub/MTNIDdH3kEFtaVEDKEOcLCJaDGQBTXinZgQ1MOZ2tXhvEF1OPZYiqGKKbdjl5e4+3UZa3PI0TWnB4ypQBCedNTMU6eve3E4jMm3R+E0XFf2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473017; c=relaxed/simple;
	bh=h/hrq8tlOmQSxbosQzmao/buysKRFdIVJfpNMxLFuHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSs1MsSo3BLkJOvJz7pBcarhXQECzFhEjtcSGoffMjHgm8KrSTKLX2G0UNJyEINTuhF/rEWOdG38jkjQES0zz+d9chL/oGrbbZwt0QyOblHOUffalSNe/SPH5xUIQ746fB2cSIAcu+TZNcbcYSGslPrUctyeaRWtXEfcIFkUih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRXfdPA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fv/tLewR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRXfdPA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fv/tLewR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGOD2h1093879
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=; b=ZRXfdPA+QOYCT+A6
	q3LXGrd1C4edZrFdNOf8js3IHTzu+5PCCT3Xu6IQAWkv6OwzUAcSDRfsh2G3wwak
	8fWzmQcqdpeRoLE86xNxkuGwe7NGX0CHuLMP6OBnY9GcYBqUB25nv03AVwVCwty+
	mtLLEHExeUaFkKgKkrQGLBE5UAqMYSl7BDYlVH1RzwriQrvDxc/hrbiE1z6vjofX
	6WH+KAVbmaA0WEed8Zfbhc0op5mfZNUIH6UcnBMq5xmzqtkKEvOQlNK3BjfNVHzi
	X/9+hI/yKW7+1bKaZqn7luquFWUAakdyGgWrjJNJKKMM8PYRMa7GgsSb6rx2SlQV
	fQPg6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gshjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d01666c1b3so532055ad.3
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786473013; x=1787077813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=;
        b=Fv/tLewRewNIEV5mzfDZN5mEpuX3uYwwlpluQDaxFFO2cj1ZdcWu3nFuGDniMAWG8J
         YHM/FKOZhSxxAwPTH9twlW0ps4Ttz5Nd+Zzk90xyegeMghcwIfJ7TD0Wzts8gZLwxqhl
         MRFBwanTvn03O9B0v/lL6/1GUV6Mxq0iiivxOV2Ff4nm4rLeFHXgpnDVD8NSHuojJQ9y
         LINDtHPnvlI7Pmi+LEyqkmdLNUHaY0v8qOntEa2GMQeQ9oWQYxx7TVGIP7wh//AdLjFs
         7z6lTHM5c9jB4597rSB97y/Ohwuq15FWkFSvuWsduyDw8LnzYzo0QpPRfDMyUbaEMj6a
         JtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473013; x=1787077813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=;
        b=LcVimmWhkdHCRwFjhCqSvQDErOxprupAvYdFaZQU7jjE86iH7tT/HC78aTJoiqXzWH
         MBM9lQPvcuOXsFkiFbK5Qk3rD5UIMK3a/GjTpL7A5HEEcpVwkJCxTAdIRbImTSic97Vt
         EDN6NeceOd3THXzsBvAco4sJzpdq/tM/n2iHiXBmzVkyq9JzdzEJYkRll5YmlBZLhpej
         RWmhv9FhnqsjVyTqIaqU5KGWY4sCGxdQwPdfbCQNxAVcsn1dg7BjCq4FSQkniRK9qjt2
         R70c71OSgZDzzsGXFlZ4KywHT6s+zbuaUsVOll8wkgXKCok3yrmSpPpIT6OqmKjZhesB
         5eZQ==
X-Gm-Message-State: AOJu0Yz0dakbmkx3BUrhZexSH5eSWkxCVt4rbhOgwxCUtnWcd2kcSgDB
	AOaWhOPig4+en3uzgfSDu9BWtGVE/+n9T7rUxmpq0/BdAUw119wtnjgmQ/IxBlcpmAb9+SzQI3E
	UzshJMLPLU2HBs40FOg2I4SiTRxp4/+g2OWKcETVqP4McfWipgSL9mGVGj2Hcd8Pi9w==
X-Gm-Gg: AR+sD11DwsR7iKp1gxX+e3SDdxXb77OEKiYCbFAYNVY4HbJEFXk1as0GNW/QcSEwMXQ
	qqvHS/QOf5tzrYPWGMqmIKcZXtESE3W+vL44F3Qh1hEyM0WRvQQXd/4xTvPPE66Axt4nJzRPoZN
	iOdt9Br6xeBWKz42xZK4y+g+EnPoKlLewoI1I2G2tZ0masvjkJaajw2vw3/VBsC7A5XWsqapZQb
	A2+yxZV7fzidygJMLDU6j1w+Vqyk2M1bl1B8SRZSHz14kHYzzyHpr82GRc3unrIw+UMnAE4xOXX
	ynC1/Ix2IoVZbBxd5juVuWAa1P5y3UgjLIhxsUE1cVFhOKBP09cA9IGm7uhKGDkpCbeSnT2ksbB
	euRs/I6e+Z1/lZiUQUdzj0eEbk/p+6N0JRPVMBtfzdQkg+wwqxPj68wYhe52+
X-Received: by 2002:a17:902:d4c5:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d31778f048mr45284025ad.1.1786473012641;
        Tue, 11 Aug 2026 11:30:12 -0700 (PDT)
X-Received: by 2002:a17:902:d4c5:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d31778f048mr45283635ad.1.1786473012237;
        Tue, 11 Aug 2026 11:30:12 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315d829c4sm11759955ad.0.2026.08.11.11.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:30:11 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:30:07 -0700
Subject: [PATCH v4 2/5] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-enc_roi_enable-v4-2-1c9ea2405bb8@oss.qualcomm.com>
References: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
In-Reply-To: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473008; l=5504;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=h/hrq8tlOmQSxbosQzmao/buysKRFdIVJfpNMxLFuHU=;
 b=RkRExIDm2TKww9ONIRUdiuGU8rcAxn3HBYw5kBb37aI+yM0l5a8wp0mSenLaqjCWwmJfK3AZ/
 ySuZDpckrfgASmvE9p0UwXeo56/2KX+zbUQjczTOswdFQQWJK1EQBuv
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX0g7r/GYDPmNY
 6BrtEt0dAT/QooRsjfh68gDGXXEc2vJ7FO+SLTKy4RWSvoiNO1QYoAepN0hnF7aF8JAZqx8tlpO
 imT53ctWW3/br52qmn4T8qBHAXCFWAM=
X-Proofpoint-ORIG-GUID: MFuH5TlMK1rkMtv0Mn42ht-e6yb982l3
X-Proofpoint-GUID: MFuH5TlMK1rkMtv0Mn42ht-e6yb982l3
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b6a35 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hEAr28SmMdMltZAvPKQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX5KXMDAx8WbFm
 8UXzGzAB1u5UnAq1fIj3/KebDYva5HkKKDrzlq8YkL6bAh8md9LtpXuFmmzGPTKjnqmWyEiY3d3
 ALeIS3Xp5tpBka8KORozdYru0I8B7V0MT20W8K36dysJT0XcA8RlFshP6K6NWPA10m4loexbL9C
 dnJXco7pQus1GlnFnDo0Q28KQXlC0V7uX+RdhNCXWQu8jXI4YlquTi9ncCxYK8kXIxlbyIjJZYU
 YsRKA2Q+gejdCo/yyk894tz7m+TSgTnin+B7+aARY3AeGUSY5REqT+4n+YRrN5lyugTfUu862cU
 FVj+/EaoNnGYE+UQhso4xeq2gA263vFZahlN15unQlT2KCcvjZmmqIRu1K0iyLPWf/MwCWV1raW
 xs7KizjDXa5MVYsZR/nAGUlBf4cL5vqFwTsPVLVOsYrayrGwqV7cD+bZbtZypOiOvvmkAaXLnK8
 ITrPZAjKmmcBUUhfbaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155

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

