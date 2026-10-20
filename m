Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506175;
	b=KcG+PCbjEXm8FpIiNgFCaLjLAqrffAbIBtqL91EmDD6F2bq7Hfl4Ume9IL+TJGHFhfLY
	 SQtP/8xE4mJeqls9ha+WV50OwCSS+n+A5aQubeA5nejECJEexZ0cbRj8rTATEQPtOJonN
	 qreybjyRNNXc5GFcCPJ8WHwSfHOKpCCPGC2T0in3BZ8PkWXcaT5neq5DI2e3U5Zr+/8Ir
	 9EK7gUH1KOl+b+xse6794SgS2rdkv01KBwI/oR7aRubrNJ0l18Un6do4GMxHhRkknvDNm
	 sVTTBR0Y4641+8aPq1/cFaF56YZ5zTi8JDz8erEB3zpI0pl9oUKmHIXLSAawI208y1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M5XXT9PbCeShoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=;
	b=eD7Abn6pP5zjRxgt8jC7fFWfsLCp/kMaLYGOoPosjstttv8YNlUo/vpvPk56PuXN83Wu
	 uLU/iCskz7LL76YoVk3WmHBjy91DLcOIAGdVcBs9HPqBXwaQtA2ycgtrgD2vt4fA4ApRT
	 YXx1CFTaWb4/F7c2psHlRv8NoqKhI+vibAPm3UYgvCh+s6C7NRmsx4EAqGIsPlh3jStfu
	 ODyjTWtroXBhnUuwFUxTYWivHb22IqeRIWZQaMAGkpQpr1Oh+lZ9uA6Btt3hFtNydPgzz
	 LwdHBDss0jsS+fLxwb8r4jsyznNqcIkxmlTrZp/2hFWKI2jY3GqPvyHgsvGaLmZWg2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1rzwpgc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3irKt8J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E8606A330
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1rzwpgc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3irKt8J
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA58S2809827
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5XXT9PbCeS
	hoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=; b=k1rzwpgcShbZVs1T0vw8SpnpmMC
	lrNHDta41iLXknGuWHIVkKq5HQ/yYCfJ+MrZJd1xPxmN5vcqCVt+ANMTJ7VGLQ0d
	xrLfFgnGz+fk+BP78IObH2QWjJQR9Xz4sa9G73oenfs9UVPntfhJcEuNWvgucFCL
	ymfDZ4GISKOFCnJK8pHg9Bq93WHrKgO0VN7OSabQ7eBvjkIX+zx253vUXQPOuyBa
	6zrFSf0lQlRQGC3RwqZH5WUoIibhM7kQ7+1kxqOsvtL4+6d2nFduC97SdfaCXhKt
	9fYgQDNM2lMNTl5KIa278TDqPXZ5dR174rxQlWTSlUcJWlPnHdKa97dYExQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2vvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so573644485a.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506173; x=1793110973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5XXT9PbCeShoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=;
        b=a3irKt8J9zTFcvEgaowSY0f9PEcvPF/xgBzA/nUn0SW5tAWqNYkQY9PoXdaeK0LODJ
         pSs7t5jteIgw7rkdeUJRmiofDQ2W2ZKsL0de+YIIsXpsWMtCAn7FZYg1tJX3r2RbnQUf
         4TuIsBNRpu3f8fG8uFDqBZ4s9IFAVbvMddmfQ0oSZUL8b3jsZjg/S5aXPOylf3a7wujL
         HhofK0umwkAok9Z0cvzGIcF5XNFM4C+LNyGCHCGYuZ9TdcqzR9wTyjlaU/rkbRtiC7X6
         +he8kq+t94SW4gQNic5X4AdyfXtmnWvEqq/inrNLYUW0g8K1+hL7jDr7NtM82eHlRwiz
         4jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506173; x=1793110973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5XXT9PbCeShoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=;
        b=BIUqs1Cgp9NeaeUHutRqJnsHWsOsp/MWwVwsKwNz5LuuGnFy6ilG8QIYQe2QsYoObp
         a9CxM+QIrzhA9NLr5RBlOe4hPsQQshOtaLz46JS16XQzuCHjhKKeg0dOWQhfEwuoNHTs
         kOns1nhqL0zGiPb8QlYpgR2dK262gHJHno5fiwVraD9UJLzm5TRUXtvyhtKYRkwzh29C
         PToQCJgkUA90PGOXnGwQamnjxMMeBgkHkjBK/UtZ4PLmF3W1/FKDqwCiYw3MYo92Y/WH
         V6B90bJZWrIFZk2xtAQQzlzCbrR4Fzr8IZdLM5mBYxt57elKiGCpuvNaWDPnEJ0Qs+TR
         vCzw==
X-Forwarded-Encrypted: i=1; AKwUvBxu7lTpFPlyo0LL+bz66YjUJoK4BFK1cX0PBJhLkOkaPINldDJ1T+rp+Ful51WJFYEVC7amKccStLGT0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZpETZK7Hxiqy4+Qc4MYOJ8ZdHgWA8ZMA4zMpNqLLsOgoPHSwT
	7YpCgNc9sYfxmIyM9HDkPISiTI1LYE0n+n4GesqBRkuKsjtIsEHQnW6WePKYx7N3SSr7Kj8aZTV
	ywxhedjhFSUSomidPjAW340FaD4cnpAQzCdyR7LiPIBYeeL5Mg0LY6+0O1C6lVJ7j0w==
X-Gm-Gg: AYBFou1J9bmHyMjxk5ylO4PB3Vbk9RtTBHHKDABKZUqqOyqBy5a3w+fWsviHELwAN9Q
	uqB6TQ7xxIo51AwzsHN7IXZ824e1vSYrmrnrbMjvaEVKr97I+gpowvMEHVISjJ5Mq55KCrdbrsH
	bctuofUpbBFImSr83m26Xyuh/N5lTl+88XKMsDvC9z97abIxw67lENeB5kfMQaaSoSxjfW7CXDv
	Uu4DniSl+NNT+gZkfVGDmrubuohxwRiCdaldc2HxYiKi/dz1ukmfckWzYe0TkB/rDazLoTOL/5a
	mYrqLyslH4sF7hjzjT6kraRCvCEROPTM+UJg/T2TS9dfRjwAyRre6F79HTHUObBEgrTz4G8PpC0
	VtIbjGtp453mFVhtxa1QrSGlCuLIxnkGK+TzUlq3vxwWV4xyhX60IKLye8h+6B/4VYYKnqsx3Xv
	5JCIdp/d8/lmGg4hQ=
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1795257885a.83.1792506173074;
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1795252685a.83.1792506172509;
        Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 3/5] platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
Date: Tue, 20 Oct 2026 16:22:41 +0200
Message-ID: <20261020142243.25072-4-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: LKLmy6_ofp30slrvlFspTq2ejqn-S57m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXzYreNfl5sEsY
 xLuTrGvvEnFGgDssKQDzqjy0JP/FKsQm6Z/0fmUXi+UGLIy/6FdBGKxzUvwvUvS3B8UHaA8ovet
 VYKDRJlqR86qFa/3xwcqjUV2DRKIpkM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXw1eXxziHa/n5
 II3X8nenyGfnGf73pFPnTZ1a2VaxqpXSu2ZXSF5tF8WOrXItRGTtRpFKRsd1t00n9SbzpLZA8S0
 u4DpV3XaaLL2E4BBVtSUW/4jD2z1fV4T8abAWhpPUHzlwJBkGscvBVE5jOy1vn3qzKQFlUxE4+c
 ziry29tSu0Ynzvhs6748Sp9aU1YNr7ov8bmU0SVtKcH65zrWkfOz4BspjutReWvVMbLB2EZGgGK
 f0evLGrT7OW28/i4KZyCC1A2XtqQcRabOZ8CNhR9mPtDVpSELublLfl5IxCo9WpfW6cWHnNSk9U
 G8POAPV+up/E7+szBDyZSRBK6o5qKbISG829KLL+359N5kPQ3pN9g9MoPgnrGJvsjwCVgZMMGNM
 5IlyUb3Tjmb0vc/nMonZYUjB1JoTr6g1t+bzzPAghNeaTQc0L6EoXpOp+9AEst4AiCQWMUBK7Fu
 jLli/G7+gMZIamThBEw==
X-Proofpoint-GUID: LKLmy6_ofp30slrvlFspTq2ejqn-S57m
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad7793e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=1kVSyC6lAo2a8Bx00SMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057

Add defines for INT3472_GPIO_TYPE_DOVDD (type 0x0f) and
INT3472_GPIO_TYPE_DVDD (type 0x11) and map them to regulators with
matching names.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 12 ++++++++++++
 include/linux/platform_data/x86/int3472.h     |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f3d6c6ccad0d..046f93ed1c9f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,11 +277,19 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DOVDD:
+		*con_id = "dovdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_AVDD:
 		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DVDD:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -403,7 +411,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
+	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_AVDD:
+	case INT3472_GPIO_TYPE_DVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -430,7 +440,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
+		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_AVDD:
+		case INT3472_GPIO_TYPE_DVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index e1d5c4915ef7..f0ec2e7c68fa 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,9 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_DOVDD					0x0f
 #define INT3472_GPIO_TYPE_AVDD					0x10
+#define INT3472_GPIO_TYPE_DVDD					0x11
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

