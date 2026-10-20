Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506178;
	b=yt9UYywqdDCNklUg5PfeuTYR4jo32ujSDmnfajIzYTAIzmqN5ONIT8/6Zl/iMFUBPsgh
	 fEItn14Cp0ym1Ol8KjOZssz2TJkfN1BT/HNJYNFyhP64UcBDHOqXP5n2kE2Qv0o0m8OKt
	 joW0EzVxZTujcN7Hn7bDxBitmAFsyhLs6V0zzXlb/w7rB/+id0PccSP3ZyOtVKl5rQKEx
	 53oDmFKtsdsL0y/yrIlkqlXF1UwTFOCIzabuHHHogIK4Zb3J/xjFGURA8NpmhF84kKVqE
	 cWHYN86mTr4mqjWL5VAhWkb3xfsJ8WRdGxsL5P+hgm4ALa4gVIVzFY2DIQhtMee13fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YRwYv0eC0+iPIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=;
	b=lbvMagEmFUTRxFR5EHHyucO6+cgIuKEMCcqluZqEFoszYO0oVu2XaYT+BfnaUGIt7V1o
	 tTGePdnzSapKaChbUHPb2DaIurs4B2sm8KXEvxocUO/6OCs7dN3r3LjMI3hgnsJ5nK1pc
	 JOfjV7ALTUAd5+oiM8PGZHqFa6G+dgGyzdcKxUOZBSdEqI+MIKiqCauYuhCLBYrhccAlv
	 RmC66trQbrw3Xzokr+wG3RRZg+uidExU1s+/+4lXz78K6Ly6T6JWHd/wqlP/nHkDNL1vR
	 z7HmBMUibAiDaCFGtBgAXdwP0rctovPzqpw86j8/S5cK+DZvH31YN/hM5zjJiYpv5ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U8T/6XgB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5N1xsL1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA860A2628
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDA860A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8T/6XgB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5N1xsL1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA5B41575214
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YRwYv0eC0+i
	PIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=; b=U8T/6XgBZERzHClTz3nXp6rEjyy
	MNkbEdxki445QDqQ/6C+mbzHo9ohs+MNO1IZlMhhHQCiOuPK0cv5OB24/JFldDNq
	Xi09wQM8yWoJci0SyY+O1XxlPW6OgIOHYjGfY6qkNeLhmic6Yh7RvT3Oti19zf/0
	JylwSdUDD/efYBmHjSt6OU9/M6dRn0cav08XeNsAms4RqjhoIwXD6nqwNUsZURxg
	KHYjuW66OvUXdGa46VIQpjxVoIBsuBYDNmVR2/iCjrWyTByTE5qq5lQEiCwSOal+
	FwWuimmloCQemjX6VygQmYPfaEy3agOmpOivRlXVm0w7XmUHgPmAE7eWguA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2vwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso1102831885a.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506176; x=1793110976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRwYv0eC0+iPIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=;
        b=T5N1xsL1sNb775J1uuBHb/sMjE32iZxoBCrCwesibrwQGswCqUUSiAqOG21m9NXj+m
         0eGGYNfvW7yDlGXeIfRNWGebOZ+skYfk0qOIKiD0gm0dGlkpRcutz3mQT2A7RRMEQPfV
         Q+QVsPxvGnlRc+Sg9UfFhPxfj+gJFLYdaUQ1DAJSnflOF0tfFGOyDROChiKPBPaAWcuX
         CAFfLIQJ7cJmpGnnSMWXaaM6GlMq0Vje+DYZ+3sXCg9X0pimc5NWI7ScGIjE3rj8tI5k
         Hx43jA3GYR1j5ddHEHJ5wqey6uZviE6aFtjgpGNjZMKk931tYiQYJZBIAyvriasn/aF7
         XZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506176; x=1793110976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRwYv0eC0+iPIM7Fh4ok36xGZCCJPDQEatB2sCGwZQI=;
        b=tAbDl0QiOCRErnYCYiojNgOjNgJIgxeLiHgaBLo9xwcW0WjYumY1Nqu3eEVYANxccG
         khCC80wlIZ5x+0k1lhNzLnVEGJhOF17pjVnqT8qjQa0WgVpliZBDqcwxKZblfed680sf
         Jl7eNbHXigvTj8nqdqFOMdIlLt2eHCKfE/OoRVAeRJe9E5/ckWm4VyjB+XtfyhUpsNOZ
         R/YMAaxLV7gkNDjlF6Fhc8VG3rznk3jkD9yxo2NdUIDJMh14dBGeXQbGGI6oYeStoDB0
         k9lIZb8BRGsMvznU3W6U+hcwtBGCGYIhv8kG0yxlQAcVDoTltlTCI4Yo0JOr9lbgtJZ9
         ixMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVbtZPURHaXNQqH73VYITMWWLFgc9SAQxXwxFHlA8Oxf9xjHB8x7+TLaxu5vt3db/79p8CLTQIRESTqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJh07hpg65Ujsc6YXEh/JKvPOWcmybsSeSTFMfUy8JbinE/sTeA
	S6SktIYSYBDhKn/a/OVuiRIwnkzBdMJmDGeIXX5rUjCVKpbfiDDEmOvLRtfVhzrmYSkyk12Cfjz
	3vg02XerLq/FZnj+7AFEvCOFy2hw1aolvkF4ZbwEIAV+Aa7mo5fxJYR5FJtmnjFTjDA==
X-Gm-Gg: AYBFou0cM0CQdemiS+kZ8IQG5rYXlGE9P+dyv7LxlT2vkhZEq565t1ttwmgFJJ1uCOI
	lS364wTJ6yPmjxk0fPnbruZyB3SHcoByrseY3SlK23oCfoZNh63e/bqpA774ljkv4hgilfgOMtJ
	PyIvZLFS5ovgNlrXV3snAvRon5/AlJNPsKrqYHG1JDQrgvsL8vZrcvl3DV/UfIA4FqdNXJgurNg
	U5fly9iwFj445CJLJWZIKO4xd85+cnYhD0ZCB8sno+1cbqZL/ld8LUlycdydIPlnk91/+Wymhuv
	IIEmzBpdYLO4edu2xnFdHsp1tQGyluBT1owAeiuQv2urRNbGD8/f2EdbPpbF83hH7qhUqNZEflY
	R2xd52J+Icu6UCOrAO8OfMbhpx9IITUx2vHfGvYzPdNAcbhkE7HgSTl0PUAwl6HVG73QHbTl0fa
	/6mJHNNuZdwxpaCGg=
X-Received: by 2002:a05:620a:6081:b0:93c:6738:c2c1 with SMTP id af79cd13be357-93f29b7348emr1815569985a.2.1792506176383;
        Tue, 20 Oct 2026 07:22:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93c:6738:c2c1 with SMTP id af79cd13be357-93f29b7348emr1815565985a.2.1792506175888;
        Tue, 20 Oct 2026 07:22:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Alexander Patrakov <patrakov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd" regulator
Date: Tue, 20 Oct 2026 16:22:43 +0200
Message-ID: <20261020142243.25072-6-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-GUID: MQ5bjXy0b7EUGNak10gDYAho2BWPCXwo
X-Proofpoint-ORIG-GUID: MQ5bjXy0b7EUGNak10gDYAho2BWPCXwo
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad77941 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=QxxHkoVCA9QCKdrcC6kA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX/jyMXQ/wHo3f
 11G66u13ljpzpAgtCqsBVvA75yLFNRtO6jpQU8BDuw7jxHrwlqQt2sr7/rgs1As4At2Qv0dc4qh
 izOAtPxQoEpcLHiSybPNB+wBO7RJHd8cVrgheyiX52Ep8QuI/DloiLUcU4sptkWu6lX7YZwkowA
 NRAHCRidpcdcsnC2KsHIMkfIWVozJMShCR4x5mGgIWLBWBxiT/rOrb1I0ixsIlNt6neUsv4sguz
 zCVvLSShlqnkTYUl5rgTe1K5X2c4WDLURFAxhgNefhLu57JAe56Osp7k1FoUf09e9xFystvw9PW
 8mvIuTKxE1nzqshMPfX7IIQbuCVy6WkXdlgHWczq/qVDw84u7I2ZI/2oFJuNXi0KXWxPNai+Q2i
 Q3EpPfe+byLLNqyn/j9yDUE7iRLOW4eIZnBT/8xaOvq54hDFiVmukhcgt70nlZNBjwKErNMrujP
 JYvuBXWRKwEPH8cE01g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX6sf+M4msc4bq
 tMs7i64CiwPWxQgFR7Hmtj3/JSP34zo5vOVUCLbEEjEZyJortYmhvZfgGYWpYIBf71GD46xEQra
 eAuWsX2Yw2SpvJ8mLi4i6omJWFoD6w8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057

Before commit 34e31390a3b9 ("platform/x86: int3472: support the POWER1 GPIO
type") the int3472/discrete.c code mapped 3 GPIO types to regulators:

0x0b INT3472_GPIO_TYPE_POWER_ENABLE -> avdd
0x10 INT3472_GPIO_TYPE_AVDD         -> dovdd
0x12 INT3472_GPIO_TYPE_HANDSHAKE    -> dvdd

(with the INT3472_GPIO_TYPE_AVDD define wrongly being named
INT3472_GPIO_TYPE_DOVDD in the past)

The OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6 uses the following
GPIO types:

0x0f INT3472_GPIO_TYPE_DOVDD
0x10 INT3472_GPIO_TYPE_AVDD
0x11 INT3472_GPIO_TYPE_DVDD

A previous patch in this series maps the DOVDD and DVDD types to "dovdd"
resp. "dvdd" regulators. This creates a regulator naming conflict on this
laptop for the old AVDD to "dovdd" mapping.

This patch fixes this by changing the unfortunate mapping of the AVDD type
to a "dovdd" regulator by swapping the POWER_ENABLE and AVDD mappings,
mapping POWER_ENABLE to "dovdd" and AVDD to "avdd".

This is safe to do because all sensors which may be used with the INT3472
code are listed in drivers/media/pci/intel/ipu-bridge.c and a manual check
of all drivers for sensors listed there in current media-committers/next
has found that all drivers either support all 3 of "dovdd", "avdd" and
"dvdd" or none of them and enable all 3 of them at the same time. So this
swap ends up being a no-op.

With the exception being the new in -next ov05c10 driver which only
supports "avdd", this is fixed by an earlier patch in this series.

Note this change does not impact the recent adding of mapping POWER1 to
a "dvdd" regulator since it does not touch any "dvdd" mappings.

Reported-by: Alexander Patrakov <patrakov@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com/
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 18649ee448a4..ff94dc2ad8a1 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -270,7 +270,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
-		*con_id = "avdd";
+		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER1:
@@ -282,8 +282,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_AVDD:
-		/* Should be avdd kept as dovdd for now to avoid regressions */
-		*con_id = "dovdd";
+		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_DVDD:
-- 
2.55.0

