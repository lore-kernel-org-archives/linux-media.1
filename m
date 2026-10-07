Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5F490BE8
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372715; cv=none; b=MvnTadhLJrF9+4jBVmZ2fx7eiComID73LsWdkUCQydUIunydby1t9FBurTSeNAMEXg2Xxk0Ze/iThNWS8CZjcx71V0ObXmyGMm81Kv6umrnICqkGOQ/uNd4FqhfdnQGErnqSTysmU28hu8Q4fwgm19Z/gwJVvO6jeYTrm9DNXYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372715; c=relaxed/simple;
	bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOAJTA92/UbNJiFlH6QcE/2e6djiIyPSMOJewwd6nG5eXQ5quPHTvULLC/orNzfeBQbkW+uodcbdwdiu97B7Tn92KaJSFYcWPpbOO65gmHMpx2fu06J9Gea1AFq6353JIz/YOZ/xdwD7C/48IL68AhB+HgOVGy6Bi2RvkH7KrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gB+2k4nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9ftVWWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gB+2k4nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9ftVWWJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV2dk2969302
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 11:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=; b=gB+2k4nU+XxnX+n9
	czX54suZ3o0DkYYT11zAuwdCULDrb7tG/X9J8VnRTDvDgN3dp18utPmWBErIGMaP
	str95OM/0kIwrWVct2IVvFZUM+7ze5diQ4YkKbspWS6ZeBSn3kYOS/bKzQvUca+R
	aZQ6iJSDqh2/dBFpVGDrLtl/hCzC8lFKRtAqJ0Iw5SxBQJrSqqDjOfEy4997YK+D
	uWA24ql0Z9mzchJRpQmcBOOQ/xanKQI0u37f6iTarIDvCUEXSlnOWQx5DIWvPlsH
	xF4a3DjV+CVai0dQQnQDwmPcDMb56JCd1v93k3K7SBKJ3SIagJImomZd5BSaIsR5
	U3c4SA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1ur1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 11:31:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a82c7e8fcfso2638422a91.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372697; x=1791977497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=D9ftVWWJSLosGtz4EcNp0yXzjcJSm6+x4fFl9xd8yB/OB+h/pwZ/kU9X6jyz2ckSIw
         PiWBtare1k7TrZ8mQX9afcFHhSCx80Kz5EamS92yoE5cKsuR1LrbJPAG4z3SOxGv5JYS
         SVQ0ILUi+IHhaYckIy5yz+ULUBLWbvhyb2pLK3Z3T+PpHUeHFP84dx8tLR1SiUTrJQjw
         j+/kPE27mE9eAz0vz78YFJ9LOALpIEt1+GkO7+sc5amABpEN5jm5ttQnFo3ZMJQo0Ne4
         9xX6awTKv1k566CdRQTtGpfMcy5Wn9/ryMJYqbA1oUE9wFPGhpEr8noG9nln2BYplbKk
         hSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372697; x=1791977497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=beT/Eclwrj5FWvd5ZuVIIb1ty4xm/l6pvQRWdrVnbCxCLESvSLSc031jQzFmg9EeSx
         YI0uf4wighZK2Qed80T2Nl43QWO5LoUJIrLqZ5RetWgjljzH8E3iS4eyFgFdIAClOB8H
         6nczzSWbYPu9fkumlqqS7KsxBjR9dQV4jsSdJPzGWXcxF1OBu5skYVXnx+UbPHxTuv1v
         asWn/wQiH2R+JQj52xKp7sUlPV8+yvZAv+5VCrLAkIcKKMiNri4daqdRiXCPh3Wf28Vi
         38iwW60WrPfkMPBUuZRfF6La1WNP2lvyF6ops8PD/B/6ArNMPUbH2qZ8brsI3XAX0+vz
         jDYA==
X-Forwarded-Encrypted: i=1; AKwUvBxZYo2+VFV71yZ2WX1stRCZ6jS6VCNwlWafgV2QWHrc8PSKgwE8IjhBHuoCZkwAU2t/yhwmQYSWjDubyw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+79DiikOZF27hU5wVQnw/TVlSkFfUUhkB3GU5IPLR0ZDeMUQN
	nZyHxJaueZhANNmv1gKOIA/+IUqaX+OB27+CbFwqtRQcczh/XBaj5CzHXDH1gmTHk5JNmpr/azQ
	wZVrGq9wtoZaB6l14D1mSv9YgTdCVEjm9oJnQDAqbz0pvpmPolmJaBusX4JB3g/jEpA==
X-Gm-Gg: AYBFou2bd7qK7FnlYTpi9Y/c7+9BstRg4rfCyeYODg+JAxKEtsJaNNvGD/9qIuoXGoP
	u8nypr1hF00EYyh0Q/6nm7M9XQcHQhS1/a2ZZxbxSJDHnIHzZ1CpOGb10Vl05680OACkt2I/AoH
	BDJZ36e2jxON5w6eQmsLG2TiyuTnEf4NrlZE7MvEWzUZGKYG4n5Xw9v3prFIcCPFRcUaOn7C+j6
	rynNYRofKbNFVxzEJAU6cNDUn3H/Wym8I8HFJaK3y/aZSAP/Sue5fBFV7vowIiEUa5xtkI2nBQR
	YEbM/H1BDNBlPiZvUgeUL/jz5b8vIbL5vScB1ncBFOyY6lhDEKBsnSbXTSow7HxfZbdhvN+iDWS
	fCt3Uyi4ISF0y1zqnYcHuEX/pXAeifsosuA==
X-Received: by 2002:a17:90b:5887:b0:3a8:495b:d65e with SMTP id 98e67ed59e1d1-3a8a0509324mr1473458a91.6.1791372697137;
        Wed, 07 Oct 2026 04:31:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a8:495b:d65e with SMTP id 98e67ed59e1d1-3a8a0509324mr1473424a91.6.1791372696629;
        Wed, 07 Oct 2026 04:31:36 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0d9sm8388515ad.20.2026.10.07.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:31:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:01:05 +0530
Subject: [PATCH 1/2] Revert "media: qcom: iris: use disable_irq() during
 power-off"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-fix-disable-irq-safely-v1-1-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791372685; l=1211;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
 b=Z7GoTmlct4HZlMxWwHDHbrNoLZPNxj554mA5a1vTb/et2ymndTTHPJpHgH1Vzo+2yKEBfGRJ0
 VBrv65Ryv9YANHRUUFJWfqQJmH4ig4O0VHNeZgwGxA+S1eiXju8dxqm
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX7nmqgX4xZriU
 SnntVUHXxvdAP0lWu5w+I0i2cW5d8alhtfKmas5N04pmBzSuQHNCcgNEig7L7eoLZPCZxMs7dho
 6d82VGg6rQHHrBU89YZxdPrJZwb5x5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX97AD3I7ZhNpJ
 7Xb8IrSzsTipF+gFv7mdD15inDsTOklSogU7SgbEQXGwq00iBCa2Ayy6lpA8pRr7IkQr6di1CP8
 vsIdB9O/DNKLfwihHHFOaizDjHiB8if5UoqEdv2yd478Yc8l01JR+1xH0NioGW1YuQa0dRRMmUO
 khbv+V/ciGGgvKHykIx/Frmt9f0YHblzRqi2SsjbJdj2eyDPsQd8lURVuKP7KRy5t1RMNm7TOQl
 h2tXxmLtbdx3sf5ZWBbWQFpyaoC89aBY5nL0pw1tpYcrdcMLYz2xChm0W3H8v1kehHdQdN/xAP1
 JTtdbyQ2DtK/XWn1ZbbFv2YoZPTaGcf/UOaU5n3pjTRWbrrTRlR2xvHmK5r7tG7Cv6e5Yr0Vtf/
 jRA7+2P/yg99d4YT/nbD8mKWnbzwwNHG257BeZI8KFvwAvZctu7s2CbtvCs9Dw1ZqvYvp6pKMyx
 NnnO1yDso0NdYzVq4hw==
X-Proofpoint-ORIG-GUID: ReZorp3pyT3L5rACC_x2ITyQeaSr2NtB
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac62d99 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tjrYt7ayRFslicBUeoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ReZorp3pyT3L5rACC_x2ITyQeaSr2NtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045

iris_vpu_power_off() is always called with core->lock held. The threaded
IRQ handler also requires core->lock to proceed. If the handler is woken
and queued around the same time power-off is entered, it cannot acquire
core->lock because it is held by the power-off caller. disable_irq() waits
for the handler to complete, resulting in a deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

