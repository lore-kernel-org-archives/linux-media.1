Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F93CFF6B
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068505; cv=none; b=lTqIM1gE6/VcuCnWmB04dMq/f3SWnJzW7hz5Me2kPzDkaZyUZHrK2ZzRjjTWhYkph16l+C4EwhkAQ4fijsOqhSfFxN3bTke5CdznE2y8uepIFGbEJ3EXv/7TnlPhKDf96sOY8pfsm56iP5NjAAPJQQ4ZKsars65MRs/5Y0xKZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068505; c=relaxed/simple;
	bh=oZTefR/5KZdPemiGpbUvpVCazLZz7wSby+xVQN9JpOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llacsoLT4aNraHzbWjfZtgrLOaksZAHOAH3mpF8AXOoKoBvWPgDolBfj40Z70vdYsO9MAcsHZfM49jRXZ5WsaGRX8AZQ3P5CRXtOYtquihdJrPD1KmScmA85Zi8Eng7A05S1GSn2CSXUzM0qzT+HKS5ZBRZ/qNHYasQc4665IcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5i6mEah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9hJpmV+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5i6mEah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9hJpmV+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0iso1427091
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nt5vfztKEXyZ/EZLhnIuWwUGzJoCvT1w4EXFSWZSD9k=; b=V5i6mEahNVsGRW0w
	BkX0qTmp/HMeRUBuotkKjJmJrPOMA6uRCswlBrz4DYYQC5Oh8Gr+T5L7OZLiIngC
	lrtJkarlTfwMYFk6G06keUSb6q9UlSck3IPhBH9a5crwyHaNHN0xrm6CWIUngIL7
	eM+Z6vLPDA4y3tp+xzcvOWQhu/KqfK7ioSfgRdRm2K077jrU01m2BofuGzc37ly2
	vA/fZTI9UwkaZS68KUwtQDoFhF27EWGED7qgl52UoLMwO99x0EGpbgtgVn7m3LL7
	ZOPG6wVofNM9/FIJOPRO7a21tO02v9Im/GcY58wLWz9ZntgiW0fVCYweskw1elTD
	F7b/Jg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb19fun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:55:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so142404a91.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068501; x=1787673301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nt5vfztKEXyZ/EZLhnIuWwUGzJoCvT1w4EXFSWZSD9k=;
        b=Q9hJpmV+7Ine1rpXr86O2BpXWieFQRoaZnlHK8qN2uUFi/zSoUTJUajhKcphkvf1hG
         IxmT8KwrGUEEJHSKeeUcxpT0A/75LcXCglkjA/zEaXpaU5cE09Y4OK39+VA8V7tUcEz5
         YPl+vn0xt4Gb58UWWM3iRqeai6ZfL+ZvMUHQS9lxyO6HBCt/UkDH5XzVgkSgwLwtE2cE
         mM/tJq4eWWOBQ7aTqhGJparSmacnQC2wTwCiIe5fCaiNtoN0P2bWsH9WwEQ63DUapAr0
         J5RlFuP/oy/sZkADMOfH3yCV2mtLXX6uducd9EMH5XwlNdDfYkbYVmLePP5y7y/B8Cyh
         E/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068501; x=1787673301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nt5vfztKEXyZ/EZLhnIuWwUGzJoCvT1w4EXFSWZSD9k=;
        b=Z8PknjKaaDBs3cAvd7DdiGaLIZFdEKIgrQv/7U6Q6hnhLC8XTq2E7A5Mg5KUnJe1V2
         vJr8ilKTMQytLcNv6Ywez2I4dKARgdVLVdK4vHWPLZUxemxGtfv1WYaemUpO0ebqm+Qa
         luY9JA6M+I48XE5OsBnEH0FqlAIzFbbDd/f73nM0Ai/cdWrJJq4c6rtLmFJ1gjk8tkiw
         DscWH18YKA4PnNK70khCAmTK59sax6yBUTUCsfonPZEAUV+39D8jsV3T6202+d1CTNxT
         MKFZnuGTJQ7ZQjXafT4DyW5Y/ba5XRasLCKPyyCdk3uWBIljGNYaMeT8vLXXXb2Q0rx0
         N9Pw==
X-Gm-Message-State: AOJu0YyUdpNbdDqQFZ7GCUKtT6SJ9vDy8y05qp2oHjGSs/f6o1Uf1jSq
	uJ0Gn50Gu4iHYh7Agj+jnkekQWpk5HCi55GjLZiGJ0FskZTJ1vYQ8GBD+3fB0hqxqGPyXCsEBwV
	ywDG8ikRTZmfUWQQw/FP0GQMEivI104D8bb51f0orJWHmGQ2RhxdpjkqdgvTlE+xCeZNL4cI0xQ
	==
X-Gm-Gg: AR+sD10J69yszyMCIecKwS3LXMp4lLga45Ki/VMx3WKKN3GLAQg4zrFLUzSc9hVB93P
	AcP24RcUrObtzhI1honnhmpc+Jn5L/JG4pCPRb6ZoSLKzUUBPF26qwDNigeyC6Iljc302BJTZSb
	Ctk2ccFlMm0DPCOMG+qj8oeupgyksS9VRUQoH6fI3RCpzqksJGiwzGPeOvkFDGoyU/lM01lvGmi
	AQmpveAP9nY9O35aFC/IRGAi/3LvK5hueDNfMyQaWfrDYqNvKrqdR88Im2t6PmtQ41Krm75eG4c
	DUiHdbjbfha0GvqyTHx/x/x3JtN4lfQVeqlrze5FIQ7Q6FhpFz+GOMTuu3zRzB0jvpxm6+WPU/R
	4Puk2igN8hm9wJCpvl/e0SY7B9CPx3iEqYg==
X-Received: by 2002:a17:90a:e7cd:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3933b87224cmr34639676a91.13.1787068500740;
        Tue, 18 Aug 2026 08:55:00 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3933b87224cmr34639565a91.13.1787068500087;
        Tue, 18 Aug 2026 08:55:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:18 +0530
Subject: [PATCH v2 5/5] media: iris: Fix frame interval enumeration for
 non-divisor framerates
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-5-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068461; l=2282;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=oZTefR/5KZdPemiGpbUvpVCazLZz7wSby+xVQN9JpOA=;
 b=QZOmU8jQM5TE2xRprsP1ccg2VlIppe2h57LdibGJhA1DO5lUrpH3q0hGl444T0Uv4DdhwFQqd
 6gjGxWNcWC+CiTjj6FJlRiossxuLDukCJbtnRKYL3DoNwGx3NL3LCXT
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX5KQhH2nrKizg
 2gB/ZE84xmoHgywbCFEjgzacY/IQd/W81RpqUFY00jJ5f7haQhrYrXhr7c0KRVvwYPieXx4wSYq
 P4+UM6NT7hJ9rQLmLabucXGswNW5ZJDpofKEp0YGJXJZlbTlPff1dH7Np7BCZ3W+r8yJT+NjzeQ
 B3bMa/AwLDHeO4Dn896s/feFkHz5oH4hdH03psnN9kkxwxuHZVv0gfcCR+1eCBoK5nIdOdB+2qk
 wIrrrcSL5nMjHgHdshFZbJAgs9yjeRT7Npv3dAjf7z8zI/evS33ujU93vvFx5F5eElY76lh0qdv
 QvI0WYungpKfxdpvOMLmoADwC9vPjCqasqeGpjbfiLdsStlSBINtk1dq1uIqKUx60FEmWK7XS6r
 DGGYeWo4LwZrpgR3cu0dMfCHFVbunosXDLv/a2l0x+nQTcpP4ZkwUhyAp75+42hK5ECsrDr5DCd
 9+kIXxVI+3MWBU0aUGg==
X-Proofpoint-GUID: q9WcYx-6JkEYd8DK4XuUlLoho9Z01gJC
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a848055 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SOCO_u0IuGyKYXpwI1gA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q9WcYx-6JkEYd8DK4XuUlLoho9Z01gJC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfXwi+1l/+vEacc
 VtE31g2wMedkqn684kiqPaZoFvUn83J5easjflNAtFvEUa/kDAjesqpPdvKEXkyMKmuyl3xx4qd
 2aVfNjNYg1S9O6lyUekaYYW3VT4kJSA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

iris_enum_frameintervals() advertised frame intervals using
V4L2_FRMIVAL_TYPE_STEPWISE with step=1/MAXIMUM_FPS where MAXIMUM_FPS
is 480. This caused client to enumerate only framerates of the form
MAXIMUM_FPS/n (where n is a positive integer), restricting support to
exact divisors of MAXIMUM_FPS (e.g., 480, 240, 160, 120, 96, 80, 60,
30, 24, 1).

Framerates that are not exact divisors of MAXIMUM_FPS, such as 29 fps,
25 fps, were excluded from the enumerated list. There is no hardware
restriction to framerates that are exact divisors of MAXIMUM_FPS. This
caused GStreamer caps negotiation to fail with an "internal data
stream error" when encoding content at such framerates.

Fix this by using V4L2_FRMIVAL_TYPE_CONTINUOUS. With CONTINUOUS type,
GStreamer creates a continuous framerate range [1, max_fps], allowing
any integer framerate within the range to pass caps negotiation. The
step field is set to 1/1 as required by the V4L2 specification for
continuous frame intervals.

Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016bee..8f20cb281a93 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -438,14 +438,14 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 	mbpf = NUM_MBS_PER_FRAME(fival->height, fival->width);
 	fps = DIV_ROUND_UP(core->iris_platform_data->max_core_mbps, mbpf);
 
-	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
 	fival->stepwise.min.numerator = 1;
 	fival->stepwise.min.denominator =
 			min_t(u32, fps, MAXIMUM_FPS);
 	fival->stepwise.max.numerator = 1;
 	fival->stepwise.max.denominator = 1;
 	fival->stepwise.step.numerator = 1;
-	fival->stepwise.step.denominator = MAXIMUM_FPS;
+	fival->stepwise.step.denominator = 1;
 
 	return 0;
 }

-- 
2.34.1

