Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506177;
	b=P3UxP16seFkPj/u8bSREc9iLVbHCWQwIHZJ8Rg4ZcuyOhBonmD62HPNE8w/NGsPC6FfL
	 mvm4ClXzly1nkVZB2ahV/FGMUdq9e8QO/c37p5A5pK+dJzHli5yBTJHHNvWYu6/NITKoi
	 K9yfL/hGpRlAlOc4yzAJJ8kDQ0xvuLhifYWcPyC0Vcjh/kOYK7Rwj7jnXFhVlptjDgWy+
	 lk+PfOOrbPqAWG9lcG0EHJXxbSn5hWcYgyQtvVGyh8iU7lC9y/11QcaH5DezJ3tbHbru7
	 SN1kmos0arzLtIdMtVGJP3MEceFQp0fWeWm5/ySK/+33R17RRM2iJ8ooBX/FxYQcxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fM3PLiGnnqUhaB0ZVpT3/vhaHjplzibrteXaHg1wWa8=;
	b=tQAkyyfe3HDPR+zIK0zM4s7WCqyFylIRdkX4Q+IBb9TI0OIfk02MRhPRqA6bZYI0SVcp
	 08/fmXXeMVgPBxUb29Fpwgm2LS04XDIGmILDTfyB2HHp2G6oY56pUFsAHAC0Hb7M5Oa0t
	 pQpWuiWUkDiYyuub5gy6+inIB5r9UQC0fP14oVP4IPTHFFYLjcQKAZK19jyUkS+CXENN8
	 u3GFoCpdpq8NYYd+0hynJaUtHB0ONX5ZW0JXmp6K0MaP3DxEAXQ2o9NqQMmproGvv0cPj
	 n3QB/GeXgzZhr73vx7atL6m5GzBcspL3TVT2qAUnZlgSwU8MWjcSBJ1fPyYGbzbLeiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6ezHx+Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsfDH87C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC630606A330
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC630606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6ezHx+Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsfDH87C
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9sNC882008
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fM3PLiGnnqU
	haB0ZVpT3/vhaHjplzibrteXaHg1wWa8=; b=W6ezHx+ZRV7aS1y2Lr5J1VDQ/px
	jx0sTtarpnCooQyzh1bRog8pnfx3R3jn+3yvuECXUcKCGCrKNwZBtw6iALxYwObE
	eTyU6bW2YsQxJYO8+OFv6DJM/95WT2GPekNRHiufEpNlyx8d/RqO2FCEmhIQ4bKt
	TRLE7P6eaI0WgGdYyewcbfVxzv5jPRr/NuroejFA3TvLFZAztTcZVGsoCgxjqWMy
	7AncWi/GmB6inhBUB8404mtaF2VVnK4qaHBCBSA46PP01Bn8j+hQST40iTrElIfa
	Iafzl7IJb6PEb05j620KSshtdgTqeXVihCGvSE4agFXeuxmxcE79ZSm0UQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2ukm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso140198685a.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506175; x=1793110975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM3PLiGnnqUhaB0ZVpT3/vhaHjplzibrteXaHg1wWa8=;
        b=XsfDH87CnkBy1iFNSIXVIDVb50lIdO0r4QT1OutpTWN2qPXt9m++lth16KYei64MbL
         rtksRkbjH/mQe41xtEgXuT/1p2CGrLnopBsd3IZgyVSNPJeckPKjVfm17+A3t8e0OrlC
         ecX1dP6MlWL3jMidNs0yIZy3zXXZymfQFPVe1wXujDEmtF551926XGXJVr85Qnkq7cfU
         TnH6KeSiLkn9oftAe4pSSbxeziq5EU6DbYXXNln7SO3azw8kTwfIpPpGGbzL/PBfdcdW
         GAl3A4WwdSCGKBHYeSff1hED62rEAO4hhbfPKw+rtQdHJOUWV20PYjrsTPDboMFuav4m
         +ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506175; x=1793110975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM3PLiGnnqUhaB0ZVpT3/vhaHjplzibrteXaHg1wWa8=;
        b=2ImxDzRPIM/xJMF3FHgide6hjd1biPQT/XggUmd+0tj1Emi1SfYwQ1i5a6tHC3jX7I
         wyWIUet/FMugNzj96nwomwEKUStuU8bPsZIAd5aa/OYSoS9JUYfxf4EDizZPT0C65OKu
         Kl8qQWebd2oS7djiP/MAHbSlz0JiMzGhha5c15NlGzPECIt7ry94PI3KaBOeaieXGEMm
         jor98OIYW69DlnwFnBTZ+TV0XD7dwqWN9BmxBcvIp9Y+6xiq3hCgTVpTeXv4leyXKIai
         GDiUH3mIAcQsWcc1E93edumkgR2+hAHWXn/TBU+hclWaXZVpF2GLKqmTJUv6oCkuvFSB
         YxzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBEYBS7takSlVc9UR+hL4ptEHLCngD9bq065ksJGHopmptJRrbf5rb1NA51ROdf8kU6Jb4QwXwYXkrVg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjI0ypH53qdFDWQWNIuNs2qjDpVkwZUmvICxj/YHFJTnZ+9mpx
	szAPJoNGKiJb78usEsFEqhZnoRO/Uwu0uCkfJXuCOZPkxP+lC/ArTnMtbji17Aso4DdyxKeXnOt
	EykJHLnjHrpZQIFU5YIsxTqWA9DfsY0v4YSmcmW8Ep+/QHn1Wk+84o/nLEhEWMtyGiQ==
X-Gm-Gg: AYBFou3Ty/wuegEI+APtOvAD9En2ixm+8FO0mXJ/qc83kpW/OpcDGHqgGonxokAQd68
	Ju09tZSuvQ51Z1Nvu41YNvuGE2jwqvMesv+hm+SERGe4iuyTie5Bl7q2zicJA15QX6w2YsxV1p6
	UbmphCurnIkVlqQ2L2GhUB5zUhfI1NC9l6MOIbNLhaTYV4JosRUmscYnJL3vw0Yfab+tpMK2Dx9
	FTyhelo5zeM7tSWSJE6dniGgA6Aje6H3zIHxOp217WbPjKPAGMMFJcL/xhFkiIb+bSbBZSL4AkQ
	4d0SciYFRgxFnl7kLoFt1rWxPjcKgtG8JuYYRP+r/zAAfn+wbia2dOr7UTR2iKKNThQtGzote3M
	eAB8eE0jndjN5qcM8Byoub+QIoeswMnDYajU6H842TzvQs/993B1DyAtoC699cLu1YkNMFlPNrf
	9xtLp3TRlPPTWxp1g=
X-Received: by 2002:a05:620a:178e:b0:93c:5952:5765 with SMTP id af79cd13be357-93f4c197083mr341322885a.6.1792506174772;
        Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:93c:5952:5765 with SMTP id af79cd13be357-93f4c197083mr341317985a.6.1792506174109;
        Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 4/5] platform/x86: int3472: Rename avdd_second_sensor to power_enable_second_sensor
Date: Tue, 20 Oct 2026 16:22:42 +0200
Message-ID: <20261020142243.25072-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
References: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad7793f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=m6U5Mi7_xXUadIKIrwgA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX+AUYGO/ahahS
 JTDTQQODQ6AXUQi3eWJrMmRcm8GhTsUgTh7ZPeUJBoyblLzn0FkNNJqoc3YeIxeM5UF+Q2KAfES
 /G4k6U4IHafPbbZ3QW8rGbked7pfvMM=
X-Proofpoint-GUID: RWmCS25BVTf1dDQ6A4-PjXcQvjdJUJTQ
X-Proofpoint-ORIG-GUID: RWmCS25BVTf1dDQ6A4-PjXcQvjdJUJTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXxaC0tz3ohTGT
 4D0PqFgpzYmlkpwKhA7EGztcSAN0xN6yn0xEEygE2Gd1RwW8bSbixYQxcigfg6bhmlPTKYb849q
 yC5AycetjiLGhz5PiTSyK8QiUySl+AviOG8U6zr/9VmcQ9Ki9bUf7LyMlfuDJJucxHdDxnvC0Ux
 VfZRgwPdaGwE5FE27xVDYUXpOHeDJaiDzEw+6l3Y1G3uOoE9hNtB5jg7s879j5FnpB/Gpn1gt/o
 9iK/bWxjB9oHY4I987mmUMmBcqN6u5JFQggsCtGVTS2eChtdbUKqzuC/TTvSUyMXRHE3hdCXDkR
 Pu0b7kAWHr+WdIo5k3zNNC6KyG0rYG2RZD47r6rJlYtuexjsugiaqEzAy4M+Nc6CM7ud4JgmjkA
 wZ/L7deetuPz8GBQSgtDLomspjpCTk9VN+sC7VF0BbSUqlc+MGPhGhR7hJsiVLB+sWVlAZGg0lh
 m/Xp5/Do45kFTJSFwCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

The avdd_second_sensor quirk is for when a GPIO with the power-enable type
is shared between sensors. Sofar power-enable happened to be mapped to
a "avdd" regulator. But that is going to change in future patches, rename
the quirk to better reflect what it actually is for.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c        | 2 +-
 drivers/platform/x86/intel/int3472/discrete_quirks.c | 2 +-
 include/linux/platform_data/x86/int3472.h            | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 046f93ed1c9f..18649ee448a4 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -437,7 +437,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			second_sensor = int3472->quirks.avdd_second_sensor;
+			second_sensor = int3472->quirks.power_enable_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
 		case INT3472_GPIO_TYPE_DOVDD:
diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
index 552869ef91ab..4e57d3f73111 100644
--- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
+++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
@@ -5,7 +5,7 @@
 #include <linux/platform_data/x86/int3472.h>
 
 static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
-	.avdd_second_sensor = "i2c-OVTI2680:00",
+	.power_enable_second_sensor = "i2c-OVTI2680:00",
 };
 
 const struct dmi_system_id skl_int3472_discrete_quirks[] = {
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index f0ec2e7c68fa..86b7510d5a45 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -98,8 +98,8 @@ struct int3472_cldb {
 };
 
 struct int3472_discrete_quirks {
-	/* For models where AVDD GPIO is shared between sensors */
-	const char *avdd_second_sensor;
+	/* For models where power-enable GPIO is shared between sensors */
+	const char *power_enable_second_sensor;
 };
 
 struct int3472_gpio_regulator {
-- 
2.55.0

