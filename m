Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F04A33F2
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 20:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873951; cv=none; b=Ezl/MMGC9MyhLHd7s2F1HJQ1+UEbf3F49voonQLBz++E1oPPD8FG42We59uW7QeAM4hNFr7NdOzmqSFhiYdqWglxcF+wsMHFgh3dOmD/7nV1k50nZj5q5oK023APdA9TPEU++srvfS7VmJC4jhtiRYcplTH8bc27E4xjQ4vC6yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873951; c=relaxed/simple;
	bh=AEQbEaqL6s8XVzFtK7xiDDtHZMh6pgp0ImMIzT9yu2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujiCH85w4K3xh2LvewrjoARsGLWT5964bYNY1GCInq8umBLdDjDBBx/pBII4LRIIIj/P9YgOHIdRuT6Bd9nqAWBgal25IK+KL1ZYrqzpjFD/aQTTXKxS/DAECOKnSDp7idDCZ/qx16RTzpvysO7LnS2FDdhB78rWnbTaMUfreQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3nhAe+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXR2a+Ql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3nhAe+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXR2a+Ql"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlTJc434371
	for <linux-media@vger.kernel.org>; Tue, 4 Aug 2026 20:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4fW4leE9QRoaDLpQApMvHUrK+iVcRR9MeXEPa9+OZo=; b=L3nhAe+E9AleFFd+
	aQca3xP+i1XBmZ6tpL2RNxJ1/5NPG1RbiyleX+zkgbZuccMhPodGOO1NHAiIhqKF
	Jy1ib5hXfs3kYix35k3QjoDmkkpNypUe0z3a7zaiXCpJbeLKTHnaHmtTMppmgRYl
	SGlD5XaLuTab3yT6thN3PisCExXjB4BhVsMStK8sm5Sn6RUY8HRkLy2jFr/GMPrU
	1QyG5mbs7Y7+DhTExkKoVDyrpcmsHKruYSSQA1XWAnUbvMltPYWNGPhQ+1RS6fLn
	D1I7CoVhTk3VgOr+B4lZzAk6BxXBAMLzMncIgLxhK3IEd4OMCCYKwFLPbgKjEZoG
	zT4a8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568vjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 20:05:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ceb3d20b7cso530825ad.3
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873947; x=1786478747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4fW4leE9QRoaDLpQApMvHUrK+iVcRR9MeXEPa9+OZo=;
        b=gXR2a+QlaCl1uKOjhYfVcKfpVpewkzu6eaZsGloRn1QUN7zO2FV0uRlmrOwwJkZbN/
         wResNRyzzv9B6LwR8j54gatJdYM0pfwAobl+k2/stayLQ9Sq9WfohW1M8BuINzLHvg/R
         F0iCsp2go3aELgbAkS/tHlZ5hWk6o7AvCO9IVz2vpKkjCMNw2ldprRqQhglaf+Xljpz4
         3Bh6Mglv3jAILgUPRWzGW3o7gpro3JOrRsCtJt33H5w4sf1q9FsEOHTgOAGtjSSnlJGa
         BY1FGAXnKYsu3n7A2m3LfJzOaAPTb8t97m61cSiWmepQ9FDBxAsLDm/aUxtZMxPy2KTy
         CdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873947; x=1786478747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4fW4leE9QRoaDLpQApMvHUrK+iVcRR9MeXEPa9+OZo=;
        b=idjqE/g32DOidsBKRPpyJdgxEuyK+iQjSH9hf0D0dZM36siDqPNHxFSZqN9Z8xE9fn
         I340PUg2CFjfc0FN7M5WWCVS4nroQo64sNLo0o2cLaNbTYDElNaOOE9lDDUnVH9tvhYw
         newQphYLZTXDPHFVg4JKvK1OaFOJIMDECkl+cQQgUYHUejDZL/hGfd5KzN5dbcFsoQik
         oeX8ObZDjMoMKe0fODk3nyPskjvHNfTnlBKHUQcghf/19bPMUB6Q5OXvfBJceky5Dp8l
         m7mLmReVyitB7TnY6y65OFygD+qOYJuYo0Vk48I4ychmhGaM1bA7jEU9IcW7pLShUW3U
         PF+A==
X-Gm-Message-State: AOJu0YzhOySzHcboo2tJHw4glYthtmceJQrc2zbw7iUxxayFvk6t3cby
	IZ5XCnvLTQn3bCr/+GD5AbOOVrz910vn8UEujZeTJhsfa6rRufSsC06zG6A5EHp1T0kfB4hCgo0
	kAqqffnOagHahrB25o9xSkccCOrKWTNlhfRHv9j5S/8av8/ark7n8My0JlY3UM/HBjw==
X-Gm-Gg: AR+sD11E0LTq7MU8JqIMEunFNE02qQuy7AkpGWsnfdE+zh6MfsIvOz111vACN42zn6Z
	28SrlbCNzgh1v4ts3ZekccdsN1Hn3PmZLBpA4pb7+HLNLemaexx+QrU4vDMhOpyWGGMXnJfQzeO
	/PWhxoUAgb3ukzObNNnQiFBBhSW+2vc53bylDH057jXKXvB/3BBs1AWutlfFleTnUwhRol+0RXM
	7EOu+uWFO5h0c9thOAFhgJ/pNc+8goBJF98PJhpzafgBLvbfrJx9PkL7ZwClj+5V8r74Yf7YfZ6
	y91mF5ZREyEK+kAnvxvuZGVB2FXXEamPfknixKbyZRFwSuMlnj7aJg1dG+yORjpmIxQhj9GFhFv
	0gALbsB35uYMEYz8QPmj91myVn65AjbJOHPIYQYmHfhE68ZDNzQ35tCrXgqta
X-Received: by 2002:a17:903:1b43:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d0ca9ab066mr9888915ad.2.1785873947323;
        Tue, 04 Aug 2026 13:05:47 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d0ca9ab066mr9888485ad.2.1785873946911;
        Tue, 04 Aug 2026 13:05:46 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm14457146eec.15.2026.08.04.13.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:05:46 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 13:05:37 -0700
Subject: [PATCH v3 2/3] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-enc_roi_enable-v3-2-e03b622a2d48@oss.qualcomm.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
In-Reply-To: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873944; l=5978;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=AEQbEaqL6s8XVzFtK7xiDDtHZMh6pgp0ImMIzT9yu2A=;
 b=iu3UzEjKv5obkZ/g7xy/1nW3KxjIxtm98odNCb2SROo9jQ6Ph1YjbsjgHouHOmEUe8ckmP4xO
 p1LkIEYoMa7CdCpPKJRkApLINaG6b5OO7HW9tUteuc15pyxEnwETKVy
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MiBTYWx0ZWRfXxQhIC7iTKNzP
 wT/k3dS1qHLxdF6JrSVYaSTi7rlbV0oQRTGOH0dxdAjZjHHdnrctSaCT5vgvv7WQz+oBtA3jnP7
 fB6Ci+rVVrWQHVbTxBgOSpHccTg1v5S26CvpZZ3yie/RzVjRkxCe3dkybcMKzMyXNsM5oh78jCi
 AUXD1upk1A5JYUVUdMWWUxwZzp18RjjtWkc1MaMlcKpB2+Mu/d321E8PxJdJ76hQeJuhbdCG+38
 3cs/bN4cxZr0+0qJhnxnlTGi9g0Jt3E6AGkpQjND6ncp8FVgHMoqh8vi+Ck6QIt7M3eiMP+BMC4
 Vjnq/sI2tUIW7pEkZltfxvtaq9YNr0c/s3IvvNN5nu1A2ng1gTAMFezajfDMWZXe0RaqajxTCwL
 ZtinhOH93iybbAVkwIGclrK+tfcilno01QqevEm4OWzgoDZO8mC2T2KLXhQmeCl3mg/ZQ8wHV46
 ONIZUTKIh7ercxNs9vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MiBTYWx0ZWRfX3HGvkMacTxTH
 VfTQFVEwo0VX79GKRfmiT7joP5vh5anOb04yv2m2CYUxhBlUEMkoSIAmFUGI1r0mREDO76wkl9Q
 RijROGr4uZLYG4BsnzA2pkaOIUwJmFk=
X-Proofpoint-GUID: zIrX-3pMVt8Jv_7YvkDIMrtAnCEluvdo
X-Proofpoint-ORIG-GUID: zIrX-3pMVt8Jv_7YvkDIMrtAnCEluvdo
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72461c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TpB5no5GdMG_ur0tQV4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040162

Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 25 +++++++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
 include/media/v4l2-ctrls.h                |  3 ++-
 4 files changed, 36 insertions(+), 3 deletions(-)

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
index 5b8a594fb9e24e16128c9c763a3b1dd311fad2ba..5c0e23500f99bc820dc4b36dc809a6a3c8691d95 100644
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
+		ROUND_TO_RANGE_RANGE(tmp, s32, ctrl);
+		ptr.p_s8[idx] = (s8)tmp;
+		return 0;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
 		return 0;
@@ -1588,6 +1606,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 		return;
 	if (ctrl->is_dyn_array)
 		ctrl->new_elems = ctrl->elems;
+
 	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
 }
 
@@ -2030,6 +2049,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
@@ -2247,7 +2269,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
 		void *ptr = ctrl->p_def.p;
-
 		if (p_min.p_const) {
 			ptr += elem_size;
 			ctrl->p_min.p = ptr;
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

