Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506173;
	b=SySxIxIy2lPq42DJjI6/7PCjOk66uLY6N/6sLyjlIPBcDIlQC/mfxJ3jzGSndAsg1sNz
	 aFp4zq+TVwxOKXAn0zKCSl+lNnhZY5wcWn90ySOjysOjS0lp1J6wzxV1hHan4wIxIe+KY
	 bVZZTVDqcnr1udNowYDIzsjg/Mm/SHML0khsrVc6f08bM5Cjm911JpGu1KKK8fx40gtXF
	 Na/6AHUdJn0DlhahKSOLvZm60HQT/j4gCVg0hiQy5JisblrURG+m5yYh7dq4Ae5M2Hnt4
	 pUYY0qCWjuQbJWLgPGh3vpb62K7pxsiPp+9+O0apRhMMLd/jVg7uqtCg/kjhdCP72CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sy20HFe7sezSnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=;
	b=JFa7ghrkLJAleyz7IAv7Naz9t+FBTV+DtLZuWy9XpsYb5w8uqVRc57bFZRuDPhYmxkJx
	 ZlCiMFl6F6sGrkTdRPMGhdp3SKe/Af/ALQUgiQy7RNPeluhHHavRgs9FTeXoSTcwDinh7
	 JBD814Mzpm+LoESYS3hX8iUteGdhYy0aapDwjyHrKsXY1gBJUpffHq/8oHPTfftYxMuZZ
	 MVW5CXuRLTsp4ddqvu2nARPogQcjAItbPx5/VpuUz/i/Yk8FCTUzTe1xoCbw39UJnf1+J
	 6yLr9UvC9FB90JznCpwErDZ+D/U6Io1Oge3CpTP7T/0fliW53cUsiD3cu9sxCdAw2aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7C63gyl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0aZqIAt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634A606A33A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6634A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7C63gyl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0aZqIAt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAFeW702673
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sy20HFe7sez
	SnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=; b=G7C63gylrkLwNqEfcxXkdzjHe8A
	haVuAumVU0IOTeJ/RLg5tXDU0wjB/RdHKR16hqq0ColBs8xo4EJI19/VmkUb1WTO
	nwBayxyZOZgkgtWfMjW0s05cIQP4JQbgIzO5cJQZ6mVsNSzjw6xfzZVc5f0IJKeR
	6W4cOVW+zjmLOZ0zPg4J1zfa/+Tocew5xQI7AKoS+iJU1WsfvbLi28iyD7PQSqmS
	yd8UYUqEWUPiCxjFH3+B5DZvUed45na0JcIG1TlJglbuIXNappuEfAY1FlPqCv4I
	ka7XsbYrmHYZ6Tv4wJ3hoogn2a4JredGUxwo06UvKZGqb8/kx/aGCppkcmA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5sttx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc48fbca26so715740137.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506172; x=1793110972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy20HFe7sezSnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=;
        b=i0aZqIAtcPFkpYLAqMj1SbnMvyOfYBKQLG1iaJO/QNtaZ6tNJcSQZbEdkhXjxHSjW+
         rjwM4z1ma0OFySshZt9csmxHsDDzNLm1y9aqMHeikIl1hGekLKyTLrmUQ8gjbxlm6AZv
         Lsidw6QAPxrQpF7pkycLpNX7ZLthk911KtHdqxqP78AotgcPoLymPH4Og4SuibZ+glUg
         Z6sSbipMBqNtizpc1pNRju6P2oii4RjNZoW7nLRpywkDUHO3+rUHbsg0Wqbb74DThU9/
         AO8rNtWC8Hy6wR7I9X8jIz7gBuXXVzRSXS+8RvGIghgCvrZGJxDJYRfWyzvjVFD5gNWA
         Jf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506172; x=1793110972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sy20HFe7sezSnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=;
        b=vVALnxN7GU6IsmSWx4ChdA3bx2iao+obRHJhdFb2NPxEY/0c99ngJo3BKofewRHOhv
         QGCUcg1MQp8LKg4zCH8dPoynyD1PuY+WQxRykDCDp+ZBTz3A9tSL3R9sK9l3PhIPxT5A
         8jvw+4KDITwOnbumIuHhs89/JU4Qgh0MeN3N074MveaXSjqik7EdrZoXOTZbjCcrDgzd
         EGG9jR01SGtFAXMgx+Bs50vUIjBWIQBMMtTtXli4VnAF2xyW2VVI7oSIPPO/NTw9pq+l
         5tAiQaN78mqjC1P/MREIuGBCDKTrQ+jL8sOwE7I0UmCFcsXUTG2pZkRC3bUrsCGi6rBl
         hwhg==
X-Forwarded-Encrypted: i=1; AKwUvBxg4cNJPfNEeKSr5Z5V+fDTW/u7ledhCUuI1pmK6QDzYkPq1x8UYQnCxK6Yzj8rDKuZNEBwcM91Gc0cXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKzrYY+9lNAaAS78PSHqhHW+rcpVhJeeDwJ9FoWS+m5xUxPEBA
	RZGBTGiPdR6S41zZedI3KSZQeBUYew/h9nEamhpkIRF0WTYQlL6/Qe0zWiUcBerq3hiOdBuOMdj
	Y5ZTLVRqR9nYt7E2ez0dx6QhXIzsrfVRQBBFmFDNZJoN9n0MYeW3+4zHfjdTXsLhWsA==
X-Gm-Gg: AYBFou1040E5tvqo3CyDcRUK4UfwRTB1J0ypHXor7c4hVmd8zQaFPYeKfFebqw2Cukl
	97IlflLAZPOpfN/6AKYhG2buc1oMVMu0YXIlrI7/dxU9pGdlBae3U8VMepwUMbX+V/WFHgt8rwJ
	vhj0/dboqOVF8ChdNVUH6IBu0mPfgaQIaiJxmE9v2GjzQTxQZdbpDJXsJwtaHO8Bz/pvjiK5Hzw
	Y1pTJznELP7qItlxDh1h04Fky8ZA6vBWc7naP+bxM7zJ0ba3+LwgAKcciaA7UGKowAq0Y6SB0eV
	s7PgDvMaMqMiAFYYZ6JS4hcGvWfgLQZwGj4UTR3Nqcs8m60b9MnFDc2SQGIOIXd8ZuH7zHnR2Tf
	6RRHwsNVp/P4Nc09D32xy2em9HU43WVOGrhiaRo4IWI+J/dKjyF2xFGGOYCq2FxHIXNdjUWB2Le
	InZtdlcXVIR/MF2S4=
X-Received: by 2002:a05:6102:5488:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7cc36aba539mr2280604137.31.1792506171729;
        Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7cc36aba539mr2280590137.31.1792506171085;
        Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:50 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/5] platform/x86: int3472: Rename DOVDD GPIO type to AVDD
Date: Tue, 20 Oct 2026 16:22:40 +0200
Message-ID: <20261020142243.25072-3-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXxyzT7kUasMki
 bEjl6eqhKeJHct8EPtMABlptkJCiKUcVoS7WuiEtDJs7Q/GFnIChW4IFSw8eTC8HbrXBgeAV0tk
 0BpHHXbrDivrWqfjyzR2Y1aXldmbJ19UBZB9LgXwzc0HpqaC6LFWiIl2eXNYgkw4FJby89KrcPq
 Er7srlb1Leyv47oJOkmoBrZFBHHMMFATEm8DjOW5Lm+lirvciZbyK8XulRW2WR9LsRSeDgthSwX
 +OqroHXiI+SbvBFJsr/ZF8qTFcwrOpsFy9QNOTywAAYKHI3W62cyG69FGnGtOuXQn6nnc8Zpe5b
 JaxJ4uE2gRJKbwffQuJlOi4xsbSNOo2orXnMU2w6ciwi1cjs4/Ecwygefjy6/Gx8wTNSDyj6GQ+
 uBjdRv7P945woOMrcQpuO80PUqakI3R5CdfJ/u3C4j4Z4+EGXyvCFl7nk2kyh7/NTxUNCjOZbtp
 n3g1GOnNbTkm2jxQz/A==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad7793c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=5k0iGRGwmvYjmk2vAgYA:9 a=ODZdjJIeia2B_SHc_B0f:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 3tiKOdzjRCmQ8Xer5mj1ijXDEBAI9SdD
X-Proofpoint-ORIG-GUID: 3tiKOdzjRCmQ8Xer5mj1ijXDEBAI9SdD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX2nBIdYsNl8Us
 XGFAXOpHofpDIIrJXcJT13+xL8N86AGAZxCZq39CtpXnK2iz4ZWFkgyM4H4jlJMzEtZsoQjld8O
 vwhQf//GQlGr+zmVyXOaTCmO3rCwcA0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

The window drivers call GPIO type 0x10 AVDD not DOVDD, rename
the INT3472_GPIO_TYPE_DOVDD define to INT3472_GPIO_TYPE_AVDD to match.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 7 ++++---
 include/linux/platform_data/x86/int3472.h     | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b19ea6ee3374..f3d6c6ccad0d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,7 +277,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
-	case INT3472_GPIO_TYPE_DOVDD:
+	case INT3472_GPIO_TYPE_AVDD:
+		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
@@ -402,7 +403,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
-	case INT3472_GPIO_TYPE_DOVDD:
+	case INT3472_GPIO_TYPE_AVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -429,7 +430,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
-		case INT3472_GPIO_TYPE_DOVDD:
+		case INT3472_GPIO_TYPE_AVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1040e36deb8..e1d5c4915ef7 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
-#define INT3472_GPIO_TYPE_DOVDD					0x10
+#define INT3472_GPIO_TYPE_AVDD					0x10
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

