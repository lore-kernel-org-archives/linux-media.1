Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8E35DA75
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775367; cv=none; b=pSYzHxDUJquOzVNpH4vUMZw3+bSD6uUPRK1fNOHM+B39A24XnOlYGXO1Bd37Nj4+/bxIp54YNPx2DKUGKtV10YwPfvapvD6POtFIWc3w/S3viBmzmPDjZlrxDwl7RpRxpD/CFSEx0H2lUT8EyYQN3qLNVPEDF9sYumeNlJHzqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775367; c=relaxed/simple;
	bh=67T+j2UaaqerqBmfkIf5ha2iI2hIJXUPaaxcGjCzXpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3NBujvk23ypBTqrnDst0QccDn8dmmyjraZl2fBmxL9c4ac30HeU7kQ/QOi1D63yYvZsMJ76It4/gc/QpFZNmp6bCuGvcq8NbHtJCCJmWifEhwcvGawktlZJbPe7yEmtfXFPmN0/zj7u4GUmQh/t8cExP5CKTN96Fh9fM/nT+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HT+x7s5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRxixDtT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HT+x7s5K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRxixDtT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X9AD2264585
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/A2BPK33hk+N6cYzrrKnqQx5oEu98QF1RBTx8l3A/c=; b=HT+x7s5KOM3iBrc0
	gyBonF9IRHHokzWtfZ++yrE/NAnrMytUQReG9W72MVOXoGNVAOXJv3xgA4BV/tUp
	DWg0DuDovZFi5nQbLKa0iffQ0ufEvh9BBGj+BmZFIC8gd00fimQE3Ukgua5y1pJB
	k9OzcsceFkel5SOVH3P0qFkoX6ZZceBIwaeYeRFDnmC8z9v8p/vhVjSEx9IL0qdG
	5YfEixNHmWXVR8J9WKAxe7kaljkoRzkOKyYbQg36Gsd1vrtxfEBdn5Swa97sdTxE
	dQseIy8XIP/f/Hmpz+5hkVhzzxgRyjWn4rrYmQkG9d41yn+ayOiRUDHQLgHum0X5
	nUNEaA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2v6vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84865f326efso217817b3a.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 19:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775364; x=1785380164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/A2BPK33hk+N6cYzrrKnqQx5oEu98QF1RBTx8l3A/c=;
        b=IRxixDtTuI/8oh/ixKhnH3gOPkKuBzLJTj941JKpYB8gk7v52diGze6IiwQl8+rbup
         bTwmHvXriL0CwesREROzO1Gq4r7cl21W9J7BTwIz+wTxuYG13jZJC0YCOvzwmwzuOX/g
         xmOYK84DdLxAw4Xo/WhYPfEHe6K47+nDFp/7eOR+jdVtZiCEF1w/9Alv0p0KrDtrmlge
         hsXB6wIAfxbTb40T6z48TbgLzASBJ3Cqhu22/OGXn7vV94ZIriGQNH3R4e/jPZxw7Afu
         DGitaamJ3EyyOvU6omuV30seGWU9YCXXewAZBRt03rKCATuxxCMHUtxcK6OuxwPRLm8m
         RG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775364; x=1785380164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/A2BPK33hk+N6cYzrrKnqQx5oEu98QF1RBTx8l3A/c=;
        b=JXo/f2Bizas91bsHxKEoJLvspvEVhYD3b8PdA2XjkrrQ1f7JqH8xu9V/QUtTlwmmeV
         evCRAm+IcAPGM8Yn2ZeoLzKPwklmRGM7jfR0EiFe6NSeVxuFZs8SDjaOmLEzO5vzcjzq
         IAkcaA8TPPsXV5BLUuw0BnUlWrK9+ZrCOUnXYj7m2T0rpkJ+uRQwa9Moqb4Gk87KLqHY
         Bjl/hZPR68fwC2Dt30eGNYrnyk7/dr8UhcT6VE/qj6HEykvwqxXPvR6s4BOtOmqLJu6/
         v95jP0XYE9PJU1qzSl6ETza8CaxSBvQRYMP08nvhjCN1EJiXprY5U+BZt7dj7dXKSh5n
         Kysw==
X-Forwarded-Encrypted: i=1; AHgh+RqFYzoU6Gii3TVg7a1DelTOOFT1BcgrfHxhbX4WGZ946QqaG3EzaO5v1qw7qOS5jCR3QiDiGyW0s96GDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEk43WiubNU0R7NZkhZFfFM0iZs8blTuLwzjW5/et/hJv9m0Li
	fAKVusAgMnQLnFQ8f/Ljp+uIVd5+9qVgMPuD2kQ8RPxhOoQx9xlX9bYMTTq8A1gVL38D6we5AJS
	gTsg2uHrVnOTw4sS+K4rnSp6Mpj33piollZTvuc1a092P9TPMSVym0bwQKaGpwAUvh6Q9qGOiie
	wG
X-Gm-Gg: AR+sD10U/gN/VevzYWPWeN0Y+C/aMwVfQzkBKYwdv4otdDl+rUv7zDsdugGTlWfbqXP
	zgObQYLYTNI0XmbuhUcrK3nVKds6PfF/Mq25e3vE0p87K8ABVxGCkz4UGIv8XYi09WHD95UdXmN
	E3DpTbRW/nerFSKf0OQCjyCAzjw/hGO6W3+eXOd11iqm2xPz2SA4ASfpsyAZc0wYhspm1vkiqB7
	y4T6b80IGXwkhGzpWiNHdtDfUGnKWxPw1wqQwy02zQ6jomq30HmuJHc9xuFgdVZ+j1Zpmasw5HD
	xLlGeKAS+fSTLE1+1F6j4DH8XnTp6FFlVriaoUX9JZE/CZ3VGZRsSEF7eJvstg1yvZa1EkgF/z5
	7LGRdrJbARiFxZUmL9TQOGfuYOzBNfnQNVCWHk+SXcvA6m6EZkqxUL9Y2d6V7s4Tkx2cnLuZEMc
	Y=
X-Received: by 2002:a05:6a00:3485:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e2b7e4035mr1636929b3a.6.1784775364175;
        Wed, 22 Jul 2026 19:56:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:3485:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e2b7e4035mr1636900b3a.6.1784775363728;
        Wed, 22 Jul 2026 19:56:03 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2233312b3a.14.2026.07.22.19.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:56:03 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:55:54 +0800
Subject: [PATCH v4 1/2] media: qcom: iris: fix missing hfi_id in gen1
 GOP_SIZE cap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dynamic_encode-v4-1-5fd6bd549ead@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784775356; l=3363;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=67T+j2UaaqerqBmfkIf5ha2iI2hIJXUPaaxcGjCzXpo=;
 b=W+lJtvX/IEwTKMwBbvG7yvu9DoJZt2JOo9VXsO/ljnBqXFYqD1ZJcZ9f8r9gTx/+g35QikzhE
 Wft6NJTl6aODTrJ4mYPtIm45m6ei4xtpjB2EjqzUXMsdjtkow4tLpHx
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX4A7uH+rVUPnK
 cC4CD0au0VlnatPB3b+RrULGC5rHU6lywspqzyrDXR90CrT16anzpX6tMJAeKHdLPZpz+ajHe6N
 ZcZ/bAkV12URZ0fWnyp676XOTdw7AGuN4J7MpVIy4t2nxjRXnojAZ9YlTbflcbOYQ8Oipnkn02Z
 eAYlW8BmmVEdr+iB8Yy5OL1tiqr6Mce+cE/KaWxM8uHCH712XxX6tzCp7Qv1AwDNPUdOalNa0bE
 I403o+bsrtb7EB3ZHlutr27XcWjWxouDY+pW1sHdN6+KHA6p6Em7V6xK6tEHpQdAvUxTsqx0hG2
 cdvSIV3G+2eKtrKGRfPyJovd6+hYT3M7/M9y9/HVjHHcEsEqoUN3qyIdyMmmtlXbFoqzvczK7tq
 r4tiovPtjiH8rZ/+P5rUldYRGL175Tkp7C3bR2fIUk12DGIB5v/0z7Fm5b4/gO09L9z+uwLT5ld
 1RoMffXo9CEZUnFOi9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX1Te2amvkJxvO
 5VKOAVxqfEJK+T+Gd8S5vr/1B/aWR4MvBO+/OeqHtbloHi5+H5mGXRN6qdyv+3l3+WL7aui6T6L
 iw+3lSjGS58iwzPt8dSsn/gniu3qL/w=
X-Proofpoint-GUID: tEKfvqgjaB0I1sS4UomC4EEecVo1go-b
X-Proofpoint-ORIG-GUID: tEKfvqgjaB0I1sS4UomC4EEecVo1go-b
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a6182c5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5DhQ7PjHRkpX_HN-Ky4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230027

Add hfi_id to gen1 encoder GOP_SIZE cap and replace the set function,
remove the redundant INTRA_PERIOD cap.

Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index ca1545d28b5310d8c45a905287dcb69f6184d9cc..eff9216bb50143c0d752051a6400605bbaf3803e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.step_or_mask = 1,
 		.value = 0,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
-		.flags = CAP_FLAG_OUTPUT_PORT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen1,
 	},
 	{
@@ -281,16 +283,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..ff48333ad089894c3393e8ad45903c2603288eb9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,7 +165,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,

-- 
2.43.0

