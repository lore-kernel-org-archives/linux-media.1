Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003213D8105
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210664; cv=none; b=Ad4xa9Ndfm+oeWVAMU4MOunOyzMMY0EqNhSSIrYR8E89lq+1qZT/p4C4NiV1W4vU2R40t6/8t033XMRq6YMhH6kUx0tldhiWkLt+9XhrtmdGKTK6CISiaYdJaoFt3ThEMv6843lz7cSC4j+NMTTr68q19ZEYHqUtZFWDrEsl8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210664; c=relaxed/simple;
	bh=ssOnPoaE7XQ12PG+oKJemRa6BALjXKzZFHhUDHvPFKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNx2oQ315tC5JQNX5paNIMaaBheEW4SGfdSqHo+T+LDypcW+/V48Bi5VxHRbnJIBpy46End4zNzjBko2tJIBFLyPi5Vs6ppu0Qf2FUokDq+NjfxIBkjY8vNONLGPGU/ba1cKK+vGA+9SZoQDTpAV+YvvYiK9tga2BxGU5IToVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtDnVZy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nn01Oydp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtDnVZy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nn01Oydp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H4Bdq13682061
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QnYl0yZRVPO
	gMVYXy+G0YJRx73FHQQiXmwwHhcUoJxo=; b=AtDnVZy+SDjS2lAzXDMRWP5EWMK
	PiompGSgwP5a7wPCWbEcG1jAacrKF07pl7uGkLYshDXmCN7Cy+Gp+v8Kr8m9uZZJ
	bpnc3mLbEyfC47EtsEZ1wdsX/hfADSn4WBUWZML6UhYjQIMbpenLrE5jnWaPVuVq
	MfQ8FfyE5fbrZvItIqy9COXyXDt+0zWVAHdiGFIyqhYjpU1zbr2bZXoMoAadlraD
	czQtYz8xC2jcR5P0SFmzNcNopMizycgIbL+itR7mcwO8nywfRuiA0adyULNpmhDb
	ofYrVbyy6prYpwEihI2n4mnLM2d12sLE/Xz1VBvOsJZ381ZGgwkNVYM99/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se00bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 04:17:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1479061eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 21:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210658; x=1792815458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QnYl0yZRVPOgMVYXy+G0YJRx73FHQQiXmwwHhcUoJxo=;
        b=Nn01OydpQbBxzQ1Es/s8jVB2fvAWqZCFlUAXfApIlLi3KPFLJg9BcdKClpnIrug/BU
         USqAvuE/hB4f3gbNB/ewJKYdUey84xzuzjcfwfNXPBSbboC7MYFm09fu0SNpn2/k60nn
         pB5iu/b13jFo1KoDSUr3iWpCHm0/qGDn5+8kCcTlaHD4OPbRuDLtsXNXXvCYdQ8kKm70
         fLyMm5ASAIN219h/sPQRBXj29vtRXZVyoFGvYCdpfXh+P2matMdjU1Yi8F8Wp7jOGv9i
         h0fRt2XyRgXI9PcTgD+csnPVuDVoBW1LzSefHtFdcrffv370xUcarAtCg52zaBZ/y9YA
         LXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210658; x=1792815458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QnYl0yZRVPOgMVYXy+G0YJRx73FHQQiXmwwHhcUoJxo=;
        b=PiKpjppu8rjzgYrR7hsbHxC6AdJgyx6UHDPFgS3p4eA5VhnkKoBiyW5J+r1aYAmRyi
         jMwLvUecdvchcwf0hkOCRddZ8vOi+v5nOo+BzV06eUtLFR5wF0YtmjoJAFv6xzK60lPn
         04VHTt4MqI4IqD4x9TwaDe1hj0MbcK4Yk0sbxxmbr9qLS+ruITPnvJepK4hBOVU2eATp
         L6J0nMENZHhIqp0d2HcHxdcZng7lh56Z6WYhadLqzikeJkw3SjeXwnN/YbqV56GkKOlS
         GYIC/9sodEfrSr5JUzii2zyNY2lBLw3ArFGzVD36De/N2AXPbtf+VcbIUGXJqWVJmk6x
         Yxtg==
X-Forwarded-Encrypted: i=1; AKwUvBx8BpfqpIUGaFGy04lcruCGcp15fzISC2t8y6gG0xDslQ3XfkHdPtZ1raaj540voYabWq3tl5ivwr2xUA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0Qr10Frl08r4IZtB5kBA7rqJujkij97jeeWzJiLsqcMIFpXDY
	huwyv5+nuKG4CpVmh48BpD78zzV04c0C13PtUkSsDyDcT7eMrz1xb1IN6MJ7XBHt1tixivp5Ay1
	aTbpfhRK6sBktkEBNIlxFWW9YWofig1/wbFIrowKMENV5jAVZvRv6qqVtLPf1C5RBSEsj1qVhjw
	==
X-Gm-Gg: AYBFou3muYPvNoEOCjL6q5DJ9Kn7igvg+y+4AHd+Lq87Y5CxtDxZC0OPqQkWRNK3vPN
	7UhUxsYD0EUjMM1ff0Bfc4tOGU0yAE/HncafvkEERvq1y/ng1sN3oJvQwkpo/jfQHfl+gB17kf+
	oPk55RSslWt798LWgu54uZkLW97w4CC6Lc3IsUN+S2OLxDRvJ1wvra1PRkSVWgblOSkXbemib7S
	kshikvNppX2WrXYvPMnIOd1DmUJplRsqlw/WEgu+tT8dz4cE1idxGOlDowK4jkqpawF6ovmyRd4
	j/hyvQCKmM9hJZyTGLayytWHxakIvsJsb/1FDOIXOhAYNTPnvJoPPoccOJ1NMxh8KtiPKMY9yw0
	IELHu+3H9NzzWPoi449XJFcbwiaYbGM4GwqsvgvO8eNjmJaX6QiQF3w==
X-Received: by 2002:a05:7301:380a:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-361a1c50083mr3057148eec.20.1792210658067;
        Fri, 16 Oct 2026 21:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:380a:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-361a1c50083mr3057110eec.20.1792210657319;
        Fri, 16 Oct 2026 21:17:37 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm10867636eec.18.2026.10.16.21.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:17:36 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
Date: Fri, 16 Oct 2026 21:17:31 -0700
Message-Id: <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FVRDkX2nGbMQfU289-NoHxJ56KJOng5R
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad2f6e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Z_sKr-ctKYL1et_evLUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: FVRDkX2nGbMQfU289-NoHxJ56KJOng5R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfXxipGk5KbXlUZ
 bTVHYu55A6lr9qt2C6whz2Y/Zzfx6HROJ3cITmEsNQoRU642zOIvEqgRFwqI0bp0jDR/q8hrbse
 vrmZrFCe+YNJNEKIiFI2vBq55WDcUfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX1hysbUmo/pLy
 d5aQLWF2ota3Y2ITsUiZ/PmxfQzvjzzEoVnFuMKIaLPSlJzv5/Z+f3h3jU0DxRCf8dMfcaN6IkI
 ILLpEE7DyArZs6JQDyq8j2uQtFi+zwVl74YBGHS9OJpQN4EqnniKjSqgj/SQI8jy6oOoetJgiGq
 P42b/see/gQkHab1xT17x2T0byi8CNc/MUsfpjw2hmip7ey4Y+XeGtAgSs17GPIYXcPIccIAZAU
 KjLtGqeI3W0A/P7ODKJdukF+yERTCfJuPM6HSKWiOd4KxDhCA0msuQbj4oMVdjIlGTg4kFu5mus
 FKdiPYxL2+n2ojrcVe9DFy9iVsN3pPD/TJnLIlagtZn56zWAS3d7d2JqQML26mBPi6VknSLi4Q1
 DA9PFFxbT0Vkcx+SCapENkeu1hp6CI7m/d38eX66UOf6S3o/w8JcgsiLhXh6Kib2h+5vD1cVIi+
 wGdM1KTqeTB1ndILKnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170016

Add PHY_MODE_MIPI_CPHY, struct phy_configure_opts_mipi_cphy and three
helpers: phy_mipi_cphy_get_default_config(),
phy_mipi_cphy_get_default_config_for_hsclk() and
phy_mipi_cphy_config_validate(). These mirror the existing MIPI D-PHY
generic configuration API (phy-core-mipi-dphy.c) so PHY providers can
be configured for C-PHY via phy_configure().

C-PHY encodes 16 bits per 7 symbols across a 3-wire trio; the default
config helper derives the required per-trio symbol rate from the pixel
clock, bits-per-pixel and lane (trio) count the same way the D-PHY
helper derives its HS clock rate. The timing fields are filled in from
the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
Operation Timing Parameters"; unlike D-PHY, these are not data-rate
dependent, so phy_mipi_cphy_get_default_config() fills the spec's
minimum values directly rather than computing them from the symbol
rate, and phy_mipi_cphy_config_validate() checks each field against
its spec-defined bound.

No existing phy consumer or provider selects GENERIC_PHY_MIPI_CPHY
yet, so this commit has no functional effect on its own.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/Kconfig               |   9 ++
 drivers/phy/Makefile              |   1 +
 drivers/phy/phy-core-mipi-cphy.c  | 131 ++++++++++++++++++++++
 include/linux/phy/phy-mipi-cphy.h | 177 ++++++++++++++++++++++++++++++
 include/linux/phy/phy.h           |   5 +
 5 files changed, 323 insertions(+)
 create mode 100644 drivers/phy/phy-core-mipi-cphy.c
 create mode 100644 include/linux/phy/phy-mipi-cphy.h

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..a6b0749a40cc 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -46,6 +46,15 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
+config GENERIC_PHY_MIPI_CPHY
+	bool
+	select GENERIC_PHY
+	help
+	  Generic MIPI C-PHY configuration helpers.
+
+	  Provides a number of helper core functions for MIPI C-PHY
+	  drivers to use.
+
 config PHY_AIROHA_PCIE
 	tristate "Airoha PCIe-PHY Driver"
 	depends on ARCH_AIROHA || COMPILE_TEST
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49..a94dc1b352e1 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
+obj-$(CONFIG_GENERIC_PHY_MIPI_CPHY)	+= phy-core-mipi-cphy.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
diff --git a/drivers/phy/phy-core-mipi-cphy.c b/drivers/phy/phy-core-mipi-cphy.c
new file mode 100644
index 000000000000..303b9a02f096
--- /dev/null
+++ b/drivers/phy/phy-core-mipi-cphy.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Generic MIPI C-PHY configuration helpers.
+ */
+#include <linux/phy/phy-mipi-cphy.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+
+/*
+ * C-PHY carries 16 bits per 7 symbols per trio (lane).
+ */
+#define PHY_MIPI_CPHY_SYMBOLS_PER_GROUP		7
+#define PHY_MIPI_CPHY_BITS_PER_GROUP		16
+
+/*
+ * Fill in the C-PHY global operation timing parameters based on the MIPI
+ * Alliance Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
+ * Parameters". These parameters are not data rate dependent (see sections
+ * 6.14.3 and 6.14.4 of that specification), so unlike the D-PHY equivalent
+ * this helper does not need the symbol rate to compute them.
+ */
+static int phy_mipi_cphy_calc_config(unsigned long pixel_clock,
+				     unsigned int bpp, unsigned int lanes,
+				     unsigned long long hs_clk_rate,
+				     struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!cfg || !lanes)
+		return -EINVAL;
+
+	if (!hs_clk_rate) {
+		if (!bpp)
+			return -EINVAL;
+
+		/*
+		 * Total payload bits/s = pixel_clock * bpp, spread over the
+		 * active trios. C-PHY carries 16 bits per 7 symbols per trio,
+		 * so the per-trio symbol rate is the bit rate scaled by 7/16.
+		 */
+		hs_clk_rate = (unsigned long long)pixel_clock * bpp;
+		hs_clk_rate = DIV_ROUND_UP_ULL(hs_clk_rate *
+						PHY_MIPI_CPHY_SYMBOLS_PER_GROUP,
+						(unsigned long long)lanes *
+						PHY_MIPI_CPHY_BITS_PER_GROUP);
+	}
+
+	cfg->lanes = lanes;
+	cfg->hs_clk_rate = hs_clk_rate;
+
+	cfg->t3_prepare = 38000;
+	cfg->t3_term_en = 0;
+	cfg->t3_settle = 95000;
+	cfg->t3_hs_exit = 100000;
+	cfg->lpx = 50000;
+	cfg->init = 100;
+	cfg->ta_get = 5 * cfg->lpx;
+	cfg->ta_go = 4 * cfg->lpx;
+	cfg->ta_sure = cfg->lpx;
+	cfg->wakeup = 1000;
+
+	return 0;
+}
+
+int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
+				     unsigned int bpp, unsigned int lanes,
+				     struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!bpp)
+		return -EINVAL;
+
+	return phy_mipi_cphy_calc_config(pixel_clock, bpp, lanes, 0, cfg);
+}
+EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config);
+
+int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
+					       unsigned int lanes,
+					       struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!hs_clk_rate)
+		return -EINVAL;
+
+	return phy_mipi_cphy_calc_config(0, 0, lanes, hs_clk_rate, cfg);
+}
+EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config_for_hsclk);
+
+/*
+ * Validate C-PHY configuration according to the MIPI Alliance
+ * Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
+ * Parameters".
+ */
+int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy *cfg)
+{
+	if (!cfg || !cfg->lanes)
+		return -EINVAL;
+
+	if (cfg->t3_prepare < 38000 || cfg->t3_prepare > 95000)
+		return -EINVAL;
+
+	if (cfg->t3_term_en > 38000)
+		return -EINVAL;
+
+	if (cfg->t3_settle < 95000 || cfg->t3_settle > 300000)
+		return -EINVAL;
+
+	if (cfg->t3_hs_exit < 100000)
+		return -EINVAL;
+
+	if (cfg->lpx < 50000)
+		return -EINVAL;
+
+	if (cfg->init < 100)
+		return -EINVAL;
+
+	if (cfg->ta_get != 5 * cfg->lpx)
+		return -EINVAL;
+
+	if (cfg->ta_go != 4 * cfg->lpx)
+		return -EINVAL;
+
+	if (cfg->ta_sure < cfg->lpx || cfg->ta_sure > (2 * cfg->lpx))
+		return -EINVAL;
+
+	if (cfg->wakeup < 1000)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_mipi_cphy_config_validate);
diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
new file mode 100644
index 000000000000..7627602eb57f
--- /dev/null
+++ b/include/linux/phy/phy-mipi-cphy.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef __PHY_MIPI_CPHY_H_
+#define __PHY_MIPI_CPHY_H_
+
+#include <linux/types.h>
+
+#define PHY_MIPI_CPHY_MAX_DATA_LANES	4
+
+/**
+ * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
+ *
+ * This structure is used to represent the configuration state of a
+ * MIPI C-PHY phy. The timing fields are named after their symbol in
+ * the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
+ * Operation Timing Parameters", and are all time values in picoseconds
+ * (microseconds for @init and @wakeup) that are not data rate dependent
+ * (see Table 18 and sections 6.14.3/6.14.4 of that specification).
+ */
+struct phy_configure_opts_mipi_cphy {
+	/**
+	 * @lanes:
+	 *
+	 * Number of active C-PHY trios (data lanes).
+	 */
+	unsigned int		lanes;
+
+	/**
+	 * @hs_clk_rate:
+	 *
+	 * High speed symbol rate in symbols/s derived from link rate.
+	 *
+	 * C-PHY encodes 16 bits per 7 symbols across a 3-wire trio.
+	 * Consumers fill this from the sensor link frequency and hand
+	 * it to phy_configure().
+	 */
+	unsigned long		hs_clk_rate;
+
+	/**
+	 * @lane_positions:
+	 *
+	 * Physical-to-logical trio (data lane) position mapping. Entry @i
+	 * gives the physical lane position carrying logical trio @i. C-PHY
+	 * has no clock lane, so all entries map data trios only.
+	 */
+	unsigned char		lane_positions[PHY_MIPI_CPHY_MAX_DATA_LANES];
+
+	/**
+	 * @lane_polarities:
+	 *
+	 * Polarity (0 = normal, 1 = swapped) of each logical trio. Entry
+	 * @i corresponds to logical trio @i.
+	 */
+	bool			lane_polarities[PHY_MIPI_CPHY_MAX_DATA_LANES];
+
+	/**
+	 * @t3_prepare:
+	 *
+	 * Time, in picoseconds, that the transmitter drives the
+	 * 3-wire LP-000 line state immediately before the HS_+x line
+	 * state starting HS transmission.
+	 *
+	 * Minimum value: 38000 ps
+	 * Maximum value: 95000 ps
+	 */
+	unsigned int		t3_prepare;
+
+	/**
+	 * @t3_term_en:
+	 *
+	 * Time, in picoseconds, for the slave to enable the HS line
+	 * termination, starting from the time point when the A, B
+	 * and C wires cross VIL_MAX.
+	 *
+	 * Maximum value: 38000 ps
+	 */
+	unsigned int		t3_term_en;
+
+	/**
+	 * @t3_settle:
+	 *
+	 * Time interval, in picoseconds, during which the HS receiver
+	 * should ignore any HS transitions on the lane, starting from
+	 * the beginning of @t3_prepare.
+	 *
+	 * Minimum value: 95000 ps
+	 * Maximum value: 300000 ps
+	 */
+	unsigned int		t3_settle;
+
+	/**
+	 * @t3_hs_exit:
+	 *
+	 * Time, in picoseconds, that the transmitter drives LP-111
+	 * following an HS burst.
+	 *
+	 * Minimum value: 100000 ps
+	 */
+	unsigned int		t3_hs_exit;
+
+	/**
+	 * @lpx:
+	 *
+	 * Transmitted length, in picoseconds, of any low-power state
+	 * period.
+	 *
+	 * Minimum value: 50000 ps
+	 */
+	unsigned int		lpx;
+
+	/**
+	 * @init:
+	 *
+	 * Time, in microseconds, for the initialization period to
+	 * complete.
+	 *
+	 * Minimum value: 100 us
+	 */
+	unsigned int		init;
+
+	/**
+	 * @ta_get:
+	 *
+	 * Time, in picoseconds, that the new transmitter drives the
+	 * Bridge state (LP-000) after accepting control during a
+	 * link turnaround.
+	 *
+	 * Value: 5 * @lpx
+	 */
+	unsigned int		ta_get;
+
+	/**
+	 * @ta_go:
+	 *
+	 * Time, in picoseconds, that the transmitter drives the
+	 * Bridge state (LP-000) before releasing control during a
+	 * link turnaround.
+	 *
+	 * Value: 4 * @lpx
+	 */
+	unsigned int		ta_go;
+
+	/**
+	 * @ta_sure:
+	 *
+	 * Time, in picoseconds, that the new transmitter waits after
+	 * the LP-100 state before transmitting the Bridge state
+	 * (LP-000) during a link turnaround.
+	 *
+	 * Minimum value: @lpx
+	 * Maximum value: 2 * @lpx
+	 */
+	unsigned int		ta_sure;
+
+	/**
+	 * @wakeup:
+	 *
+	 * Time, in microseconds, that a transmitter drives a Mark-1
+	 * state prior to a Stop state in order to initiate an exit
+	 * from ULPS.
+	 *
+	 * Minimum value: 1000 us
+	 */
+	unsigned int		wakeup;
+};
+
+int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
+				     unsigned int bpp, unsigned int lanes,
+				     struct phy_configure_opts_mipi_cphy *cfg);
+int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
+					       unsigned int lanes,
+					       struct phy_configure_opts_mipi_cphy *cfg);
+int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy *cfg);
+
+#endif /* __PHY_MIPI_CPHY_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c480d6cb42c5..f12337834031 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -19,6 +19,7 @@
 #include <linux/phy/phy-dp.h>
 #include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
+#include <linux/phy/phy-mipi-cphy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/phy/phy-thunderbolt.h>
 
@@ -42,6 +43,7 @@ enum phy_mode {
 	PHY_MODE_PCIE,
 	PHY_MODE_ETHERNET,
 	PHY_MODE_MIPI_DPHY,
+	PHY_MODE_MIPI_CPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
 	PHY_MODE_DP,
@@ -69,6 +71,8 @@ union phy_notify {
  *
  * @mipi_dphy:	Configuration set applicable for phys supporting
  *		the MIPI_DPHY phy mode.
+ * @mipi_cphy:	Configuration set applicable for phys supporting
+ *		the MIPI_CPHY phy mode.
  * @dp:		Configuration set applicable for phys supporting
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
@@ -78,6 +82,7 @@ union phy_notify {
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
+	struct phy_configure_opts_mipi_cphy	mipi_cphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
 	struct phy_configure_opts_hdmi		hdmi;
-- 
2.34.1

