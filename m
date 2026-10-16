Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D24E06DD
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160244; cv=none; b=s+NvLoDwhjzEQPFNwCsn3rDLV+PkjWyIbrmwKvIVY6LZGLJ/oN9t+DXmMgqIaM9jh64UVCOnJpHSZ12E43Wg4EJVfeT5kjH8/m9sLBBWQYMX9mlMMLgFFGlOeZmftwr5Fcrs6Q2Ry9NQKR04TvkJnLln3nOKh+/QdOGa+8c5BR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160244; c=relaxed/simple;
	bh=NUneaeMkro41YBBJrbILDFHZrCCroRaL0stp9ywmjCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNHtFUXXmuVmy4qrotF+Z3nauGOqYW0kjZ3/obWDp9S8YWU4ZWmsQ+DXWw93Kw19h47xK0SXzG9M0JLYX5nEO83GsOKXdXvAPBmge9Zj/g4f7O5vWdkZd6DKIcD8cQAzB26ri5owPhtblw9zJFoJaXR/Ybgilif7z6A5Aj0gZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=no0VPDW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc1fZbTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="no0VPDW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc1fZbTB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5kG1996920
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oudz1CdP6yY
	TxbEMePva/E7QsVxdjGK26nlaKicEfLw=; b=no0VPDW5GlykMX2Y21vekc8t5f9
	346/cv3wGcp/fx3dIcvDf5c/17Wg7CyYqYGqRvUW+fDYchOngx9WMRQYFAiA8xnP
	N3Qf+l0ZlmpsudDPRQSZI6PBmr93KseaPJ3ekd0UaNjsk4ZmlrGNyJLIAHaGbWpi
	Biv24vitDFIxW+sdpQTTtE4Vk+XMMv8UGbkjrUiEhlRbNqB31kyz1CWLsasmNB9j
	iZMQ1DdKkd27DJEn5+Slt2jTuSmTCOXdijoZPFMvknaaZhKUOFtTRq98sgiII9CE
	tL1ogjgtXAQXFygYDvt7WCZwiftrAkHbe1kHNd92Caubrbu1C68j+eU/J/w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjta7j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:17:21 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ea8eae7d79so437927e0c.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160240; x=1792765040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oudz1CdP6yYTxbEMePva/E7QsVxdjGK26nlaKicEfLw=;
        b=Zc1fZbTBucxzUOZtT1S/DIIFR8c88podYlZT1TsbSbimgBVrAB5arzmZF6zQTirYEc
         htovF8trIP8s77TBCXXJjMRet9VUmByRCTxYo0e8QFKa6cFiPt0a0qcg4HhomWr9rXa8
         2MO4XYNZKW3ypYGa4oL6pOhh0feQOErw+lpjQbvyVH2fzTAA+0VIIENavGL8KkuyOQ6r
         QEgxq1RSYTbn+uGsTtcRMS5MmcLggGHOcL48SJiuUNJXQ3A+hXmHJYW0zVzQllnQTrqO
         QZbPYYZcFxcsMvJUOSHRoer980YWaltqJkTmMyZPTXEVlaAWLo11sW5jOsEZiQeU209+
         UN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160240; x=1792765040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oudz1CdP6yYTxbEMePva/E7QsVxdjGK26nlaKicEfLw=;
        b=IXS1gLVqXoSaMmQgdYPgoW0b/FEWgjqvHV/yJ6Fx/kv4Q/SYTAapG/TH3662vN4i2e
         Jglea63V0zGTSvJbRsWFxmBQ4OYrE2HHUhXW0kIszTg7mDXG+3uKXeOCOf9nfdY/zIZK
         St2pRz41h3Y2+yFf9NaCSV3DkQFtOopUXYpC04ZumqdnSxKUgv0+YzGDPlZOMH6aItBq
         b0UXV9oZhAc12hrz1VFF1iVjVK4h/2LoNsFDaxU1ivCRhfColTjzW7SFiDGJCB12NWCG
         MBE+qUbCDKA7qEELmAODNdW6kb8GqH1hn1d4AUK7Ch7c84YOYeXYi6yYV4x9gh33/ti4
         1yfA==
X-Forwarded-Encrypted: i=1; AKwUvBzMLGzxx3sXfcjSJEcA6RgvUwbtj091N1De/2xePzwkitWAJ0sLfIxdAt3MDyoGX+lGlNXxGA3Yw6Jq/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJNJqB62WCWPmUm9Y16LW/MVoilxvY4M4cAlqvBHDcgu62kzAfO
	rda5v2EUJ707d8gUgCnP3m21xFUoL63/CMLCLYHtn1YOHy2Fb5gVInBW0HE6R30y3iYppL/IubL
	Dio2Wd4MWKAhXt9m3FRe+X6HzOWvEFo5KEq2HkZeVA+iFOw3OuyhgvBWfpt0C0T+nNA==
X-Gm-Gg: AYBFou396vv+FHX23fYfE2jkAh6+J4QnynpJ71XWLOUdDzh2oOTBNRn7xB5hio9HCOn
	9AcCMsO3/3VWOzSNzBp5JT2DOZnRjNAodqL4F/c+APIlE9y768UWul/B6VmiFa7LSdolGwUkTcA
	XYvup5Q2SIRb/2dYcvkPHjDRYHQeHcPrQqdEik1ASarwUAq+zP4AHJyLLMNxgrVy7ok0sU7Kale
	VwLGc5VRza9DNceQlOsaPReiQVQs4+1vkewhFICbsLxCOTHCEnqkYGusPIF6I7qOntX/IFT/SBZ
	gcUsueWLQvEW4Sj87QALSMz4v0qJkEh/8DXtWTqhMt3+afL8Zoykc1VoHTulLbY1YFA+jCfjjN1
	Oo87t+H+zlEVuZAzYHeqQiP1tI6hYE+aMRhkiGD9PZegCOXmFzQUbD59QjdfpMIrRmGw3doPfer
	02EqO6lDyADBcrfQ==
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr77757e0c.14.1792160240101;
        Fri, 16 Oct 2026 07:17:20 -0700 (PDT)
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr77737e0c.14.1792160239541;
        Fri, 16 Oct 2026 07:17:19 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:18 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/5] media: ov05c10: Support full range of power rails
Date: Fri, 16 Oct 2026 16:17:12 +0200
Message-ID: <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8ELR9T8Kc4db
 o4FgQQhMfdMaOba+51HoS0ANSlxaWPQEDAGXmbrABCzzfNKtYCtH5H4QaZfpB9V/Pyl94ya6SpK
 OF2zx94t4VGJCH7g2t/wzr/gXoqs9mS65WDwtKvG1m74Bct3rueqypZyWGOgBucMs0+BhZBjMeM
 iMx2wsw5Vjxy6CIbS4F8GdeDFz9nwL+H4KT9jVX93QvrDCUklqUhAzm8a/zRx9EwomLmL+xRLG6
 46dLfjmfWkpRh8MMT+aftPfOy9DPeSlrfq2VsQDy22AxRi41t6Q9Hzxu3f5JmTiz9JwnX/q5WLz
 oGSw0bI34OFg6Hc/hc9iCQ12lnxK6CtK0RCNEdrocJEL7qpUwfXAFUffaeFEcLwK+rL3QbizpAR
 vQQ0XQVpz6m9RI1OFY6f3+RFE3rtlgK81CeCjnsP48lw77oMtQsMOeZhkufZ6p1lQWn2VHOfgET
 jqqIwaqPcypjrK8t91Q==
X-Proofpoint-ORIG-GUID: iUmM1SfsZzobRBYTYWhvtDWd9ZGTFEjQ
X-Proofpoint-GUID: iUmM1SfsZzobRBYTYWhvtDWd9ZGTFEjQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX6tQUMW8dZIUf
 rCr8WvgfC4vUvd2LQu40kIZxQ5EAsZZe4z/qCfmTD84DjQApmljQWcVRxRPXNhYCOo1DI/kdpWA
 0ePrzzN06nl9Z7gurAJA8GQoUhYWdSI=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad231f1 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=x68c91NkkiPh6XH7nFIA:9
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Add support for the full standard set of power rails for Omnivision
sensors: "dovdd", "avdd" and "dvdd", using the regulator_bulk_* APIs to
manage to regulators.

Previously the driver only supported avdd, but depending on the design
some of the other power rails may need to be controlled by the sensor
driver too.

This is a prep patch for some INT3472 GPIO -> regulator mapping changes,
which require sensor drivers to support all 3 rails to avoid regressions.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov05c10.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 8fe4dc0d9405..f94752dc626f 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -7,6 +7,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
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

