Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506172;
	b=DRQeAfS6/r2hRzHpkvyPVSItWEC4Ui8ESx+CpMFJtgIfO7XoL8UNbObIW97g5KN3P+n2
	 fj3ZaJKJVud5yhXRPMSVlGyUN8L+KyxudQI/1sRcgfWnXvkYDqzYhKsLwRFyELUUXju4y
	 pYrBPwSmC3cnPOgnY2q0kEXrQjSh3PKTpMYBb5Y/viEDFgneq5FYbL1J9cheoIT4VM32N
	 BOmcTJ7FihDFCWGQ3QvNfo9vV1OXFji/i9oAT7i3lxwGypxK9BTDiM+cJLngU1dWPpwHI
	 F2Az0Y2OvXMUpSqz8NoTnJ5TR1MnzT7Il5t2gTCgG68IONOofhWmkoEYRWV4mqKuAAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506172;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t3QwRypyG5hdNhyryM2cUCPh/DQQyJTpak2CgyiFvJQ=;
	b=3nPnLhm+fVCB42U1tpGOfpx7WAlVLe/NMRupOltQflRJpR8fRwZvpIuf+u02JBWSaCCs
	 v/e2seoZ3TbrO7oQpo6FsnpgsR4vNGk458Z/ANPUfXoltfn+TmNdXcvgkr7mECHdkRK2F
	 nVtdeq77BUILdCuOvoF0n/YuQF7Z2d+5mEu/qvx9usb1m7pVXM+6vCGRCcxBSpNr3Fe3+
	 mTYRpLE/Trdk95qxFwmB5kRmkxRkXD0uGnjmeh44UTkGRD9XfqvhhzwIg8jTUcNh+BsR+
	 qVy9xK2rJGWwCkKg4SRYr/h1CpvzWZtzgcNHDv12/JQznGmIrgPSq/qToOOhVA6571A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KdpxIfoT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dx9jDKcp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE9606A321
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KdpxIfoT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dx9jDKcp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9vjG2809597
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t3QwRypyG5h
	dNhyryM2cUCPh/DQQyJTpak2CgyiFvJQ=; b=KdpxIfoT+RbKznjdARDa0cUYTp/
	Q6KXyic4atOfa0kURY6QSCyA9DM3wnqofgrAnDnGnHyev551k3kBJByqdayehhrr
	1r/qxQU/8C2LlbdWlEoijZQ3xQX9n9hnZkoh6IEzE1TIX+4PbjI5IatD6NB77zc7
	9jkk8L9gvyTLjY8ezb5zxvwpClTUt1FyMvKnzw/AlJNFjdbKHBF+6ScFjWwZ4lLD
	84H0b7gRxZ84BgsqCOCb1Epp4qcf/TDRmsQKPN24VyKNNKE4NbLHrPnqFLqHUibb
	8P9N+OwY6CWIqpv4MsZKeRlYxBX3Fh2bjRpW/L8FG2B66oKios0rHK7wYGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2vvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so149988785a.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506170; x=1793110970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3QwRypyG5hdNhyryM2cUCPh/DQQyJTpak2CgyiFvJQ=;
        b=dx9jDKcpf08LLqW6AuXuywXPpjwEImwcp/YccpouqfDZ2Fsb2rcKumZBeRmOWbe5zL
         t+qVcpsr5/1bhMmP4iyIJ2nGlAy81KLtHcURoMDu6+x6EGosxRr6h+JFbUwAc/BzDwJf
         M2Ezxl8NTksHfNQ5KFmpDAnBnVcpMPCNFtoj+C7xEKjYpG2YOq7uw1svsfpmCtTrYLiV
         5iwWV+tv50svMIW6mDR4BfKbXQXYaowoI6rGwPfmyiqDCf5cGS9VGxMmeq/eUM8Q6Ld/
         leX88Pu2vHmUi+Y3Qip0W0LJe7suHL/hKIsWTLEgMxbbrCgE/k4q65AB6u+ySpmdT/QR
         iEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506170; x=1793110970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3QwRypyG5hdNhyryM2cUCPh/DQQyJTpak2CgyiFvJQ=;
        b=LRkUJkHVAYZ+Co8jBb1wxWCTwF4K/WcFv55A14E6atHdZBBrgpWPvZv4Jvb+SU1CdQ
         nU1aYEQ7gXjx2LZhtiARJscGcUmdarWzcMequbsLE6s3mD2uW8ZazDWyT/JtdzSQUiZr
         Cxj7eZwz5oepdgHRORWp3Dss4OajLA3uOTVPGjv4x0FP1jBojOfTPSsCE3FQ+HowwEMQ
         vPnTCRpqbnBaq7UCIN4MyeLGzUXKgARW1G5oKpcxYnr1xxPuiuDFSUOfwAkVv6j4t50k
         huM/A/StyqRQ5PgUEkY1p9HNWwvv1MbpCpEqqJfFIEYfy0BMV7wjYUYZ42a/UpxUHlAG
         zJXg==
X-Forwarded-Encrypted: i=1; AKwUvBzR+IqPJLJ105BLDooza2T+xzsPVHPjZ4ee1j9unala5RSMAEmCVLD4zszQUBpIX4fF7Te6Rf0QbOZcpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Kf0C/5LuBVa6ZHL7im2mgnV3WpEC4/3EGNmm2DnyK62L76D9
	Tysi4b8RZawt9VoKHjuIE9ItRnaMW+F7bSZkm1e/Lfr5zxQ6JfRkLJYtPF4uWOo8thV92/TEghr
	nnZhLILT3yxSXTu3Uwu2SOD0I7vja5y9jteXOKZUqY11jkv/5ZQiFyNeILXUPsaO5Kw==
X-Gm-Gg: AYBFou1tiL4CbN42XkB9wltCNMeyMhXJxCjrEZytuo30J/BXaPnp8YjL5KC4eUGvfpN
	KrUmOZnk475S5OFPrjNGrgH9nDuk2qUaGeoz4bdjwYtLat+cxLYs8ZQBvVG2EQKXrOK98LYX04c
	r+I6D0cg81O5Jdzl/Y6N0mF1r3wTlNbtT7WURJtFLFhQvjxZnKafwJGBcS5j4hacJ93C5Dx6uE9
	vVuWAd+G9zJNIed22YApBIQt8XV/VQqiK38PtlzN+rCBUbnyOojHnVBzxy1/M4IEQjt+b8Y7hLn
	mkmzz4hk9r4htUjKWln57s8NHNLx7qIcWZ+O+Ly6ZiWVRzH7sF6pQIKiK+e+bSxZkn10aY+wSAP
	m0MaNC6TBdtBeobw2I8jetaHXCwN/+GJsVnTkSeCmrtNlqfIt4q50Y9Zv2cQMZyUHKoPcjlnkaM
	xPPrGALTxZqQbzZUY=
X-Received: by 2002:a05:620a:29d1:b0:93f:2b65:593b with SMTP id af79cd13be357-93f4c99db44mr385123585a.38.1792506170147;
        Tue, 20 Oct 2026 07:22:50 -0700 (PDT)
X-Received: by 2002:a05:620a:29d1:b0:93f:2b65:593b with SMTP id af79cd13be357-93f4c99db44mr385117385a.38.1792506169615;
        Tue, 20 Oct 2026 07:22:49 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:47 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 1/5] media: ov05c10: Support full range of power rails
Date: Tue, 20 Oct 2026 16:22:39 +0200
Message-ID: <20261020142243.25072-2-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sLltiAkf7pWf3BORjFaTZkYAdauwZExR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXzkjp8JMU+wXJ
 rO3UbunEBmKwi86TW+Ia60XPiqL2tbStwuMhSOVctS7ZywTUoM2ROtqakCXKQEdU/Xlzlms5bNQ
 6h4MMPdU18WUa7u8NJ7WYOKRC2aYzK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX2McSK9yWShyF
 CIsIq1mPLj0DdJDhy0REas3mJ6JSYxoP8bakUfCd4VI0pA5ssbMeo/HR3QYZmwSAZgChCrbYKlU
 zP+L+JQsFYQCttEiDlpHqzVNq5dV+Uuv138HieFnATrqXGZB2efw2Ky7535Jh52oyGNLSUa6pMP
 s8vFBqFtEmu/5a/JU8OdpjnpcgT44/C8C49VqW46kiW87Ri5sxrUqDepN6av1oIq4e5aBayedGl
 vnmvh37iV53/OYUHbp4ngZaPF+AunPKT/K92LSrPp2diTdHaVGPlP1pJkdJii1SAUhjq9/flGnG
 9m87MFUsEAIw5fV3Ky0EqIS6YoqyrngJWofgujbF9fsGdT0PULx9hGdCOvho4mfwKO9YnfE6K+1
 I8pVik/MU8PNK3f0ccDnzkH3mkMkMBSnC68cSc1GqugGV0C5hnwhFrJ1+tf1SumLaS5GQ6+kCFW
 DwOU2cWotcAUEb/beIw==
X-Proofpoint-GUID: sLltiAkf7pWf3BORjFaTZkYAdauwZExR
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad7793b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=x68c91NkkiPh6XH7nFIA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057

Add support for the full standard set of power rails for Omnivision
sensors: "dovdd", "avdd" and "dvdd", using the regulator_bulk_* APIs to
manage to regulators.

Previously the driver only supported avdd, but depending on the design
some of the other power rails may need to be controlled by the sensor
driver too.

This is a prep patch for some INT3472 GPIO -> regulator mapping changes,
which require sensor drivers to support all 3 rails to avoid regressions.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Fix sorting of #include-s
---
 drivers/media/i2c/ov05c10.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 8fe4dc0d9405..c1b99a7aaa94 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
@@ -279,6 +280,12 @@ static const struct ov05c10_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov05c10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov05c10 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -291,8 +298,8 @@ struct ov05c10 {
 	struct regmap *regmap;
 	unsigned long link_freq_bitmap;
 
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov05c10_supply_names)];
 	struct clk *img_clk;
-	struct regulator *avdd;
 	struct gpio_desc *reset;
 	bool identified;
 };
@@ -753,16 +760,20 @@ static int ov05c10_get_pm_resources(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	int ret;
 
 	ov05c10->img_clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov05c10->img_clk))
 		return dev_err_probe(dev, PTR_ERR(ov05c10->img_clk),
 				     "failed to get imaging clock\n");
 
-	ov05c10->avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(ov05c10->avdd))
-		return dev_err_probe(dev, PTR_ERR(ov05c10->avdd),
-				     "failed to get avdd regulator\n");
+	for (unsigned int i = 0; i < ARRAY_SIZE(ov05c10_supply_names); i++)
+		ov05c10->supplies[i].supply = ov05c10_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov05c10_supply_names),
+				      ov05c10->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	ov05c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov05c10->reset))
@@ -778,7 +789,8 @@ static int ov05c10_power_off(struct device *dev)
 	struct ov05c10 *ov05c10 = to_ov05c10(sd);
 
 	gpiod_set_value_cansleep(ov05c10->reset, 1);
-	regulator_disable(ov05c10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov05c10_supply_names),
+			       ov05c10->supplies);
 	clk_disable_unprepare(ov05c10->img_clk);
 
 	return 0;
@@ -796,9 +808,10 @@ static int ov05c10_power_on(struct device *dev)
 		return ret;
 	}
 
-	ret = regulator_enable(ov05c10->avdd);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov05c10_supply_names),
+				    ov05c10->supplies);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable avdd: %d", ret);
+		dev_err(dev, "failed to enable regulators: %d", ret);
 		goto err_clk_disable_unprepare;
 	}
 
@@ -821,7 +834,8 @@ static int ov05c10_power_on(struct device *dev)
 
 err_power_off:
 	gpiod_set_value_cansleep(ov05c10->reset, 1);
-	regulator_disable(ov05c10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov05c10_supply_names),
+			       ov05c10->supplies);
 
 err_clk_disable_unprepare:
 	clk_disable_unprepare(ov05c10->img_clk);
-- 
2.55.0

