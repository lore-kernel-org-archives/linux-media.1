Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404353C2BB9
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600465; cv=none; b=qYqcqgzmU9zW3Gd5tKOt7aBWArAcLLqeTKQ67r0T0mlcTQNiJ5F5yMHO6CCopn/h68W6nalhoEf3rbQWCm8J78bbWRgmnpECD8CvG8T7xIZ6dSLZlOnZRHsgP3nFTQTi4+6+apAwBObRxQBp6NKDFjJYDurb66Y+KDO+Gbpdu94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600465; c=relaxed/simple;
	bh=n4pE/PcvEWZzeTpoSlY6lKxwxe+uSs/55pPo3p5h6bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/m8MCJlO4JfdmfzjSWmPzUju7vPXcPyrY7DtOpydZg9xOuxTryFT9CFihNNCMgNJqyleC3fTQN1psOmWyjU2+tntMT9ZWXARDjnZYOcSeKL8rFQy+LyapqvuOQ6jFMXqEliRsUgm8J7JuFCULefw00IVewfBnSRQ23N+aJY+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0mCRd5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HETeU5Vw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0mCRd5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HETeU5Vw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDaxZ4023488
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dyzeFwy2wmD478Vk6alHIJfSDAHvMfyn/TPlmSNSoA=; b=C0mCRd5Lvcsy75kY
	g8ipwuENVXrOj9Wff+gTAtG86PdvveZzUhhvkFvZztQDTX/lppkSWA22wnG5U13W
	fzY59FXA4xkZr87/UHRIwlU/EH2d8F23dAvfy75WXSeSOX7SDYPsPLd+Ni7OHf7Z
	yC9+q36+DvCsc9oQV+GnABNQpui7o64vl/KTr1Fhna9EI7mXUbPq8WnJWYTwJdqa
	Bn9gXP8n0ZS43xQiSs22FQTkYgcs68gAqRFTAn8E4yICeYRT+rc/LT9/zgUMcq1z
	Y9r2U6TdtN18uZQwgdgiDZYHnb3PofZvmviZGmT3tjsKNdHFs4SXvQI4t8xEyHI6
	qFsBkg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2fbcbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so16371441a12.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600462; x=1785205262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dyzeFwy2wmD478Vk6alHIJfSDAHvMfyn/TPlmSNSoA=;
        b=HETeU5VwZSUwJwtw+GsGW9FgiBYTBKwAobg7DS2YC7ZMnwd89UuOuM0NBzPR+NvuGU
         BuXNwIv6VL+a7IrxeOLA8nXDZi4g5TOV0cDzYi3Kcbn8Pcq2gjL8OuNE/pHKBsUkESjW
         Ym/TzFSYzTF03/5AmojI2p7mdPN5eAFaw5QPiX/+z6kctn5KS2fyVM0QvHxLNHfTYqc6
         4b8N0QZz2lRlzPXUKfL/2aPbhbLGWQ8IFgE4TXdiZ8kqTleVTeDrOwCp6Vor230yTcat
         dbHlL3+7dBhVG62US7K9d5HXvdvgUupIrCXcs+aAB3h+8UzVPlubHcwxiVmlKgH3PWzl
         WeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600462; x=1785205262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dyzeFwy2wmD478Vk6alHIJfSDAHvMfyn/TPlmSNSoA=;
        b=gcPeotDhVZZ7F54fsDJG6lzuYsbA+F1DHORQhEr0ZlO6TsBWiO11TiSVqOCez0GkWB
         tcFutQjTgBbub9TL1F5uXXlVsXOUHqTEaL5htkpgLPop0Ib8uOLt9fc9zTL6BZmhS0Cu
         lRUF8R+T87D7+w/kHQdbGugQSh87DjVr3Ixu8VZlEHoICsp8qgW4fTW66B0d2pM92PcE
         bdrChYAlG9gxZfoLR9qE00rZ53XjSyATzFsynSShGJx9dvXguBfl+Js2bCC0yDuq6yZQ
         71p963ODRHPtG/ZSrqpAJqM9T/xR+2SnHbq1wk3PTn7B5ToVOr3OmLo2eNIMzBpV2egf
         HxhA==
X-Forwarded-Encrypted: i=1; AHgh+RqCR/m5Ed4fysUr8C1o1toQVOpwsxZ18UT98KZ6+bzlTETcecWkU416pPVDT+pNw+gU/BxZmhQSB+gnLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7T5p5NQtO0bTAH7VlDRGuOflm2hm5He3aTos12GKbMaLa1N6
	LYBg5g6C6QyE+3x+Nx6ZKlQJpxiErRLG1oI5vpVqz8WICcKpSLA5eiTNVZwwPn28hya0LkTZl1+
	bLqma7S1zjuMSWLS7H0d3tLOkkzzKLKF9yoze+eN2k1o2v7KRXkg9Kb7GohUw1Qx/+mapG481dA
	==
X-Gm-Gg: AfdE7cnY70599MMh2zf5I2baDWSS8YY4q8i8Slw7W/kYcBL5FlTy5nvSQfz1f2irLJL
	w1wbLORLaiiVVPpudAB7W/pELjmQTa8Bi6WuphKAcyD0jtifuu+ClY2QEDYTex87Sd2V7E/9pns
	sapj4h9VZ7nnt/r7Gbu6aeAVRlugYRjyBrqz4V+rp7/SPzVhgTUh0ABqoJo7kd8KJ1FceJ86oM0
	kkN22kZ1/kbeYn2q6bJCajUe+IDOsT40YdB012SCChsgz67lcA/KZGvJhsAL7aATTaM0lw/4kZp
	sjeibJtJKaCP7ajhndrcrNT+UoV/W0ngIDqBJaPSDrC87+kASsJp9tQ0xadJTy9Qt3SL8o1Dqy9
	ydlkACruQbgK1eCnxs8k33b80Wvt+FAr0sg==
X-Received: by 2002:a05:6a21:6110:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3c3ad947df1mr19336661637.41.1784600462205;
        Mon, 20 Jul 2026 19:21:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:6110:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3c3ad947df1mr19336624637.41.1784600461732;
        Mon, 20 Jul 2026 19:21:01 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:37 +0530
Subject: [PATCH v4 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-4-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1375;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=v4TGOIryXJf1jaLweQz1Bljs0ZWldGVTXkq+HRfD3Pc=;
 b=61Y6QivPlqFo/0AUYQtPBKGHghQ4dCDAQYllnRGuKr/fNysu4E5F6lzkqmBhY/mgktmk/oJvP
 0mdHmaq5vzAB+B0HcfBMz9PRgMAhhWiYU0h7uzpw3J6nCwwLdbtNLzc
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: YJ3P2lkZNqCCJb0-XyEzdk8V6_uBcKoN
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5ed78f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7A-KeLSbcoVXy4yL1OsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX1vDYKS3b/l2Y
 LLHpVVX80CAiNJx8Qgiz1K8Vj/pWB1onn5wijFhx2pPxScVEEFpr3hnKQmswjAzfZ9MfgJ487Qq
 mWb549/VQL67RBBR/qo41zG62V7sFJo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX1+8/1msy/Bmp
 oo2upfkbuNbLEeuFtYT8OIYPfM5pYTLKWTw0P4OPWMXvFKQ8RC+1aDFpjsE2SCGWHa7IRpZbPAO
 iJyYqOFqlBJYDJCwNxsC5vwlKErt9te3j5CoCIIhkGJq/mPt/ksLll1C7hZpESzlAfEofakkCNC
 cT6givDx7Y0WaKbaog27gcrRDD130m4n+yUXIRVtCdXD6EVhExDDNWEw3bDujDuZQkJM/HpwLx2
 BIYcAQPqL36qxyVYEcwCqQElHwR2js02/S7Kiy+2F7Sfy4sfBdUhcL0r4ZZ6zPsLevB6xF8lQRy
 co3lwjcnEsm5QefjyyB59/OsD4fiJj0vuIIoBZuUsY5r2KMD0I78fau8Rwq/WRkFk68j9f1xpOZ
 UgmySqarPQ+LmS7BtbzkqYDW1ID91HL+HBsbsqfdYlmZqnmE/nUwJop7Yh/VFfeW2PGoRtkaXUU
 cE4qTomDIrxJGPDg04w==
X-Proofpoint-GUID: YJ3P2lkZNqCCJb0-XyEzdk8V6_uBcKoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index ca2954f8bd3a..62283bd448dc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -603,10 +603,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
+	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
+	u32 tier = inst->fw_caps[tier_cap].value;
 
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
-							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1

