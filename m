Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769347;
	b=A16fxr00/Xo7ZkBr4oYrFJXX2KZ6Xdqd1by2VWv7ovtXsl8Ia+aS3Bm7NFSTCcL0a6OT
	 ahn6q2zMiyhV7nFn6KYyczE6jbzAdPFJUz90rrkIlYKC85huACJAWTNNwyjkBD19nF1hm
	 uZRbjE37rS4Gvc8mCnmJB6cjrSl4/++wrGMQCJp6Sn3HqbvIK4MpVmJN+2Lyv89GEXMQc
	 DOeP7Wd3VxmrKN+73p3VcZcjb56803kLkNavCVJGyHErGuVADLYMwUUMgsN1vpGonLg1I
	 28JXPa1s/al1kl2qOtVR61+jK/Fv34cqi/aRdQ6FqxpQjb531kztQ7EgcSJkBq8B9iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
	b=TedMJe/Vr8rH3NKMXPbLaSFpu47jVRYb6eR6uVFJnISfptYkLkK//5X+E977mmELBr04
	 IrKXi/T3Y4sriW8qSUYbUgjTRxtuWaDUw8C0az4e0vdThcuCdmUfK9L8q3I8qPMgqe4c6
	 1ARUXaWXi0gx5tVbLQAFMs9bNrXLc4Zddxtiq1sDKBwiIzL+5z8lIO1zLhEQml1osgNZy
	 FIvTzuKySbkXQGi7WVupLgr6zbDSb5amrxaYtBKJcacQufX9H3s1YTDc4HdsFSb1945ug
	 ojt18Xak32YuMBTA+Hpy9H2/1VHuc7/xSGJvs6y0kOHpEn5QMT7m3IXxNIUUmkLjtrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NA52DDVJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MT/g4f7l";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B917606A332
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B917606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NA52DDVJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT/g4f7l
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5xA64063478
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YsJQSb2B+CK
	DpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=; b=NA52DDVJl7tU2Hyx/ae74dxyyYi
	jcGBvlB1BbLrxheNUgU+eZM5kTi5ZaHVHIL49Dqri/987pYIus2A2YZaMcThc8k9
	k8OpZXGuC8WIEuMH91Ov+AwJFfD6RJhr+rGDMQF4BgNii1k1mRvUEib24lNqvsBZ
	9MRajVU25Z36a7TY08mUiWtIgkRXc2afBj6f8cGGFKvbODmwxubAs3xEeLQuN4zJ
	WbKqvlzHZ3K5rh8ZhvjiUJsUrrhN3/lwS8hnDlNHLtp6GDD3s65VRaHi3eHJIDRQ
	QxqfeDoNgl78zdIHdWKAJ02dZ61koWbgNv0T+k/KXOwiDNvjbhaCTPwOeTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrca8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so235027285a.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769345; x=1793374145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
        b=MT/g4f7luUw1xqQFYjPksQmS/jZ4JaLljRQ+TjnIiLFtOa9VNJIz1WHgumL8vEbaUv
         nEetM+9zSXipzeXgbnUI72zg6bo6eYWipR5g7hsrIhENQe9YXWFiaPvZXJgo+KyHtHsT
         CELZp10XRjSnoTCwl4muUJF54ckJguAxLIIthc643HkkqNpSMUEZ+kRjyJlWAUzPrHdE
         ESvOPqqLmrrJhtAl7LRsqE/sremIdVQi76MnArcg+o/DU3rw0TRLWEBLgfnvoF/+0ywO
         iDInnT9AaGY4nMaDKgf+O1PYG1o7DG4QhpqA0k5NbigFsp/Krf0sPS78QtwLGp8T9yDF
         27Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769345; x=1793374145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsJQSb2B+CKDpbEf2xoX6pdiv98jadHVdh3+ouyb+E8=;
        b=bm1Twspetak/117bj+2HQZYhglARSYmS8mL9gjcSs4KoGTrIKsDM+6+WqMRU5BjjcD
         SkQx+F3VdsPjUgWHFxflU70oQErsKOjhzwfpacN6NDwF61opyGbDgtcN+QHjsadXLgeJ
         ACEbP16lOC8dZ68g2/+Sjpfu+cPSoCXi/vGaGfWmwfiw29Z2IZEUiAzx5P9uY0OrFf97
         bG2UKkbSLqiU+ZEKNv8kYtnYUAjwm4Mk+HzcsKK5nca03BOMtF1EjkH02s43jaIf6RPV
         3Bv+S9iGphI6+ZIPnYBHlpS81uybQ34tlVIJ6pvpJYfLBALA5CRlUSw728tkLJxVdOxH
         4FnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwod1PbzaM+NrkNgFovFEeIvhws8/6oERp/Q+B7DTdVGvEbDSCyIZbW/W41cgf6jPilcVHnVxbolbaaJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIXoXfLDSZH3FKL1Xi6GMnfHyVepC+4UCRTPFn2DOKYnx3odnZT
	PQcuCeS6Js6Q/aEZIk4gQ863OtM64OPlRj3n9LQ+acyqcGf7U3pt8Yv6rxl17DXe7UUJAjC2gMq
	JpDIpXW/AeTF1fNaEbuPMV4KzinijuhRWMA53thlE3bJVYbSQz9sqrGOc5YhC8kJDKg==
X-Gm-Gg: AYBFou2ExxMUzTuRGC+kkC1TNFTfa28ka497XpZ1L8mHI2EvkZawPSPcQxvpQkvVBaS
	5xBm9jk1P7S6EKTreLBeoHMdIv/aB3LKh3L3yjxh3ihnRvs0WDgb6ZIVk0yYhJGIOAPv9SKLaUP
	QRqSRO5W05RklkbFotxRotqdjSVTqWfVv0Ok1Zukt2qMTontVSOnOrzpM2BbM6at2gtwKfsZMYS
	C9d2uA1cA5WLTXaL4U3ALWcVQMkYiCg7KFim4U/yE6NpGPlFnFvrcQCtRIs50siQUtj/OxLovBT
	3BUTH/vm2dl9Wtq4WijgsoWAAsSbQFlIGYKShvj/r2JUu5wR5AFs74fK65wjlZINOqPl0WfBj31
	zKiV5VWOdMKeo3f1fpq15vsea
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr449465285a.56.1792769344799;
        Fri, 23 Oct 2026 08:29:04 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:c4da:f46c with SMTP id af79cd13be357-93f6f824b06mr449461385a.56.1792769344328;
        Fri, 23 Oct 2026 08:29:04 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:01 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Fri, 23 Oct 2026 18:28:54 +0300
Message-Id: <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -Sy4S-VG6d-YYeZZsCzoGaU9jOTtba5C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9nJMUycHvj5e
 vWkYUkKp8VMnZXVAmU1jBV9m+C4bZbhpJCXVCmhoBXXt2EXeD6D/SclR8vACpUhqdrXF11YnVwW
 UEHeau5mIGWX28fBYfeElbRi4S1HGyk=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb7d41 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yH3Gd9U0UaHnWrszFSEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwqaiVZBX5Zzm
 q9Q2wsVihY6uJHs8bShv4W5ngliTPt+98dkYqGF44954l7IW8nZSzOyaWp9Njl19GvCvK8Zu8gq
 XB+k1s88PBJ62y17dHa96THbrlYa+soN2sOO75LJuQPxZWTI9BjvaU57qF1yw3WJvugIQIhdGX6
 0hF0qUJHYZTVPqffoiuMdN1vSicQV6taPTUKlGNSGPHrp6fALH/Rx9oN5/5O5k1qVihcySNdHUM
 V5NwoJh8UOH6eQwR7cmMvAHEJ5PTPuQINfrnWwmmRyMqoG1lKVsu5ywPkzt2W6ksZGuXGWLd5Qs
 FQIgkLBCLJO3aDnPtdu8y9gtsQ6RvOu0HiM6Uj6g3OLC4Tnmr4viq0a02VPBW6fG8lYVuv7VqOU
 5WvS1fqO8tlmk1YyNMFU0gAyumW/lnAL4846gh2Q6SNUHR0gUgo9jFexX9TilhapV1UcjScaNJ/
 c3ny5qG3leoL0/LVPtA==
X-Proofpoint-ORIG-GUID: -Sy4S-VG6d-YYeZZsCzoGaU9jOTtba5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..87096095b1eb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 
 			camss_add_clock_margin(&min_rate);
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			u64 min_rate = 0;
 			unsigned long rate;
+			long max_rate;
 
 			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
 				u32 tmp;
@@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 			camss_add_clock_margin(&min_rate);
 
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
+
+			min_rate = min_t(u64, min_rate, max_rate);
+
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1

