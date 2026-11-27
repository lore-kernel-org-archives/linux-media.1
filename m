Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795925;
	b=g16T15FVgoYP7Px6xpVlXDRk/0P/Jqn6hyqyzGElgGUrUNgNjdY+ubTn67/zqXe+/FnX
	 PrAeMoK2kllEWiCYWXSMJyL0qowMnc+mpjbilmCt+0IdN7fLwwYglXuZmuuHBdkxR/95w
	 jlgBeO0tlz2lo10Enj9EBESVHVaGg69Kw3IX1xxS6b/ZU/3gpQAuXVFwrJTmH6MXNUvhO
	 pV9LxYjZrhqrOZR65EgPSM9xdC5MZSyEZ7GNmN+3x5HvO1U5EjiG3ndv8vSQWtNRuVjHl
	 UcSaSXz5IdIp3nXJNKvQZjoRgLowXJSj0XYIPqebVgkR88CdB4E0V3zlINKnWg01ucg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
	b=s22SRfjCsqkiYDtUTKz51WrhWqn9dcyJkYA6Yb0eoXwUpLeYRlJfo2EEluMOsYhbpcA8
	 sEqKBK0KyZuPG30vaZeS/ZJBeC9hUDXiTclmoF24g3EiK5mcoTIfn3EyZ6vsaSlroAMAf
	 7z+FuV2GMyunwQfNackw/zj0NY+01pvxVT6zOFCNUs3n32fd0/aeJXJgom0QfHz55w5+y
	 kaw2mWfosi27A3F+iWw/2kpEPu22liyeQHW04iZ5qhV7SHie8Bqqx/Vxl80Bba/0dO9wO
	 nLP3I7W00JamwJgm+bZlaMVwIPZPuqMb3LFBq/J5qMOHKE6TK8+QNmBArq+WVJq/hSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Op+TaJqN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy29BqEZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A5606A334
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69A5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Op+TaJqN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy29BqEZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp7fp925498
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=; b=Op+TaJqN86K7uc+a
	CG+aU3JjMprxZWOI8BU+p7NqK9+O9loTLA66hPVTPSQevla+Sy3NZizQpMixC51e
	7J4fcRmzIRvjBi88dvsqx3ZaKjOXltnQtQ4BAmAcgDAwKUEugw36ZcZjqAw0EWH7
	0LxRqm6dYpbtsoOO126aqa4AGpo9R1ZLlteIX8IU6iI6bY/VpPr9xi8ZA0aYjj/Y
	K7YBmKvPDz78i0fK+JYR1dYdDT++/Xjk1gsH5oCqrD9701S1tSXM7ob/duc3CVlq
	Pmsihsp5TiWWxpRbBLHdHitPKKHvPoVju20rtg/OK5O6AVttEvbRoJgpHy4/ULNw
	59snKg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bruj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:03 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5735cd94235so7216161b6e.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795923; x=1796400723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=Xy29BqEZTOG1INagFr/2rZIuJMjyI779KDxKvT18MU6YjAzk8sBLbA6W+HayDQ3JTn
         IC8pn+BG8U/Ql+3biOCVJ7/8qWjhCl0vZ0Um3k6ihNIjLSBk61JIIpV/9UwTeBESaWyp
         snTU0SiCDQ00Sokt/b+eoJuMWGllOCfFvkn5ZBFsKia88UxdLTfhDftW7byLVVeYaUDY
         U2hMzr8X0/3xMfY+gyd82dhpiuH20ETUTHduTuLOPncNQBkEwniXplLc8qOBA6+8iK8f
         OFKte3IGRw80IuhGoSlkMsYNsxoiUQl2oPMSVTf9w67a1iFIXycJkYsH6e3kuNu/zOJ0
         kyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795923; x=1796400723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=XZMJ7udEvXqSi4te5dtwTDN/RWiftOJcQY7Wnx3wdA9gThDc8aNiB1rxYEL3H8JY/3
         3W2nGP8sFv2Ny4i4Jwads4X+w7H5WJqRKiA9wGMKAMxpAgaoruZQnngUIYcTu0EUTuSK
         9z6d+mfn7AJaa20myhqfA1yu7ssDyIosRPCkzRNaKgGtl5rWb/zafU096F7iJGhzEDXB
         adHKg49MHVGKen0YiNdfBWXW0hnsJMg6yY3QHjtxzIyBxPWxSf24B670FXcBmzSeE3L+
         v08XF717qgGoTwctPZHgfYUa6XL6BoZf0umSInAsmyX2sfTUFWBCM54kEp8PVivAgjwi
         kWPA==
X-Gm-Message-State: APuU4Z9jw3PJiOXQBQJifqaYYsg7DykzpN5duUiJbnjRr6Nw/4gPJ8p6
	3TVP0Isrtmfqc6tBBvQIJmMZh8GDB/v47X4Ihfq0slA8dQxLxT1jScI+AZMLbzvBCpWgfRkQuTL
	qa6ZawIOKcSNsLp8VIN7vsbyCHmw78NZgMJ2w9BPOfN5rLc5d8YtP4Uf1zB+CFZX46g==
X-Gm-Gg: AZFdTZee58Dac54wNayk4V7+x3fmpv6LV/CiarkNhUUKwlZBv3BCchymIgT5YUZBqmB
	PN0uhR5ziYYb0ZK8m63K2Fyb4DN+74sEEGGsg5/2Nvz8hzsMmOXmb6yLCXAfOQDK2h4nUbQjKQv
	ytZXzLkBbCnDo5crLhCa3ihCFeCXE1SxOCVl1hXOup48xZuyBvVL+zw2JBi6nstSRogmzlC2r3I
	iR/jiR5q1yhELpeYEwY7cO28WLVA0SE0HquLbsLVjca680Oqp5nc+Bgi2RtCyt8CzvbpBL1ryFC
	igeLNl0b6bUOTumP7HKBmA6gERaSsE1K84UO8m5UYKYjphtGzRN0Kz+Y6sjJpWeievZvaJUDB7R
	ZtaNPN1lqWTmezfUdk2+xMO9TXhEe7ui0gVWMzRJlvupoEM3GfNceYJa1TZakc+HlfXRs0gtGtl
	yt5mqUwJ4M6rbFhksokO6zm4Lb2Eo8DZc/yngoIdSy7WHMp0CIpFOTcW3mB4LVUz0AjV9/WfXMj
	9UNZXjyFd9yxA==
X-Received: by 2002:a05:6808:6411:b0:573:f2e:2bf3 with SMTP id 5614622812f47-57a0a30b35emr25153142b6e.17.1795795922641;
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
X-Received: by 2002:a05:6808:6411:b0:573:f2e:2bf3 with SMTP id 5614622812f47-57a0a30b35emr25153087b6e.17.1795795922042;
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:54 +0100
Subject: [PATCH v3 4/8] media: camss: csid-gen2: Report the hardware SOF
 timestamp
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-camss-hw-ts-v3-4-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: FKFluOm-SFegx_VS5eZwB2aI3USkyHck
X-Proofpoint-ORIG-GUID: FKFluOm-SFegx_VS5eZwB2aI3USkyHck
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9aBrzvp5ItNs
 UcyozF4gsQg6gDlMs+HxKEyrJZq4Oz2pp0iXwsanbCcgK1xvcaADxdfKq5MiSZQHUSMnyZRBpuh
 UGl4jN6pLyI/g0tCkOPTgvWm6w/0xw0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX+c34CwosSEvU
 aF/3tCo4N5ythZfTw30sPWDX8zcuaYk0kQQAZTpp8hdnVpWANB61TtM5cwQs6iNccGjgF+wdEYQ
 ipAO/n6BBDydsuySuZYY2t01NOhYCnM4QhG1M1sP6lKuv2Lo3p+XcLXuLQU/sB9L0Zr0Ckc95xV
 eIobikSE2ZKdSF6B/th7doTs/wPlgil9zx84HOskoB2VyjeFCoaBZ4vLEtPh7WlxxQ8a4HN2rpH
 ceb6YRNI9jtqi+mRVjF40ejSr/+ouLDCpWJVmBoqNjfqmWzOWvDgzSm1Bd4rU8vvQJPMLPfKpP3
 4/MK/adxqCTSKQ2sIShIkbocztG5Sy6YQvLUbAKW+BV/fDqseANksyjlYuDNGntFmYfAeQJxQx8
 wc8Ntu+SyrVOEMXDA2TDED4lZ3iv+BSlUTiTv8U3tu64Bb0gxjHyoBSyYFDMPLzGVj3gJI8Isif
 jDnocPLiq9+FhOMRmYg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09abd3 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Implement the sof_ts operation to read the CURRENT_SOF pair
instead, and let the CSID core put it on the CLOCK_MONOTONIC timebase
the event carries. CURRENT_EOF and the PREVIOUS_* pairs are left alone,
following the reference Qualcomm Camx code which only interacts with
CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 85e9eaf78df75f95d5f44f83b45dc7a3633401d0..47b0881e9c9942eeeaef53d8aa6b466ca21a366a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return ((u64)hi << 32) | lo;
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -459,6 +473,7 @@ const struct csid_hw_ops csid_ops_gen2 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

