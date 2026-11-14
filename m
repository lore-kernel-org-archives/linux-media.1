Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655868;
	b=4k2tcZQFBJ8vUIIiBgC2A79CzK4Xii2J+P+i+6Td+MZyQSXHxQTkYUq2hY1f7jtNppYX
	 o76LT3ginu5uFlIMTFHNo34F2s1yy52+nvLHR8tt9hPEYp7zcbQFjJkcsX5jul8rgvT1n
	 h/NHksI3/PXNO7mn7MdK/xOsJCvBgHqXZwZwc23BHoGz3XBuxL8k+WaFZIchgFEytz3G6
	 AUxh/l7da1p8O/1UKC3VSmz3xh8KnrZzOb85jr1xy8wpeh/Q7LmOlFqu08tohIrakz5UQ
	 Nhgc8tq3JxcPrdcdP8Bcx3wSN1WadMsD6d03P0vbD0ssaclZmJFDdQ5nJH9918KOUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nkSye9//jgyC+XYBBrGzY73sjN+7yBZmuTE+y1hNuDQ=;
	b=gdUENrabMEEGg5jGFdaZLzih/HxiVh6cvizimA7XOa4Ks0R6fkWpvFxf5PV7KEcuZbcQ
	 tV+Jglq+17Tdst0z8okp2KlWwmwQh36e4H0GJHvrr56TSVUofcTOx4VAVF7qCa82WOcec
	 xEAe/ewHYhWH9zL5wzLB9b7dm50NYWK2W4l34hp/jY/U8CfOK9rXGXriMh8RAI3b+76zN
	 qph6ZGm0zpZsqsaddFlupaie9NmHIpW1CEfxqWmYJizN9V/wiWFQFccrvxHyrNxpb2OmF
	 XHCHzXNpZA6p7+F4u7Pdedj7qPUCjR8LZcOVI96reiDGEsFzK0MXdCWPopNpytXqSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUuvxRmP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AAW/zrnG";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B2606A336
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716B2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VUuvxRmP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAW/zrnG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wC9C3379146
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkSye9//jgyC+XYBBrGzY73sjN+7yBZmuTE+y1hNuDQ=; b=VUuvxRmPEim55o1L
	vv25lSRbALlqzQ1uA0LSSRuGNXnAfJWFM9pmqlB/HQbG1wmJsq0KUrbgqPIT1q0R
	pXhyfobPvBe+wNy8R61g8prGbEGyCjXI7rtYHJH41gk1/fp8OEbvpoksiRfTx1AK
	YYBQUvmKonFnF5T+OPGCO9qFLhzPFS7RYB4DNzfft5TxHMowptubADYj15QgEr1m
	1uzw8+4B1XUOsfhRhuYl1HLwp69jqntA0E7TpyO9jf30GsupM5YJH8zoXbxvczwu
	aYnvfpZTq36obTSv+pD12qXb6LTy8ln1o3BTpNE+HbATkKmkarhbv77/Uhm/2lPB
	2fGPSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0n47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:31:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so208659785a.1
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655866; x=1795260666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkSye9//jgyC+XYBBrGzY73sjN+7yBZmuTE+y1hNuDQ=;
        b=AAW/zrnGVa7/FK37yjMd9SbeQJ/IR9GbCk4MMmgaR0SYESmX64oAzyYyF42GJlBZC4
         gz9SYfOowp/V7qgpPom9SIfZlmFXiYchBGWBDDMslvwIVzUtHzDEZL6qxRcZ8T6IqLME
         xvzWFmaNHqNoNzNvvgUiOCpucJ0KE3pQy6tV9UQ8bCFTiY61KGeFt9d1GnjIzJ1z8jWv
         qj3jky+r0eI/E4jGtkxtjX/dMeY2QgZaGYvoiRObMaTCTk9UkSHewUG/mLLfaNxsc3Rz
         k3FDg91yA+Li8MKPtrXWP3p1pqHG4Cg/8P2H4kQDObxm6cnWw9NO23FXlFV70+HS4/fo
         X84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655866; x=1795260666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkSye9//jgyC+XYBBrGzY73sjN+7yBZmuTE+y1hNuDQ=;
        b=aJFJXUSeyQMXHavZTiwarG7ZQSUd74NHMzA/AQUeY35w2Ym4AaxFv863c7i1sTPRS2
         C5ikEdEE2EOsCcf0BwFP6wYV1yjNxTwUjW1AVs6S0K76yAWpApFufAmvE/PNC464lZH+
         37tng6zQfdgbmt6O+BrIqRL4yAEPltMhmmjEGJzY79JpY14bsa+Fuqy4rmeGv6geGsIj
         0iG2I+hqLP67mfwDfbUQsQf8TfhwiOfZuRwFqMlSyK2IrIs7Vj7geDjYJH36zByy49sx
         djL3k+FA0HrbyTchbHQ3a3636uoXG9ZkybHpMwZ0ew0mxZOyi7VHg8G0yoRDoEBpVP2j
         H8Hg==
X-Forwarded-Encrypted: i=1; AL+hErE6Hdw3/71POSg43/3EXWZ7NHTaYaaQOMoGTB64ZLY65sDibiIOyi1Fdrc/oeroiwN8QcxobL6C22E+VA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8tkgmm6VfkYFOT/+BM8vMkofo0HcYaD6maHSi21vsHcwTXRoh
	D7OboYzQHAyj0TsCaDotdWhl9TblLzmCvNW6uFEdIcTAyFQD8jXS3A5+gOdvMrohbQuGotU/3lR
	IDONOdsV3tncwNbi2Y40MJj8ZK3KRMw1WgLv+ESaDWfZb9bS52cOJJNKvmMuPqex9VQ==
X-Gm-Gg: AYBFou0ulRJAMTMKzGft0sbYNrUqJpeBqXcKIzD8UydCFRmExdksGiPNokxSHuh5wIH
	5eMiT7vNivcVwH2nf6ZGxIik1eFohWXN9dtPBzxF7xbfWCDJ3ktUpgYUyXVvP2L7UQeEbu2Q2xN
	Yt8Ripi6+EQo+/usXCl5vnaiP9rLO0lVVrxqzMLmNF5LU53BuA0NnxJ/mPQwTQnHoxiXeht5Jq2
	903W1iABOMcoUeqnOPLeCUNBi0rDf3IhSAeTeOVsrw/wdRm6rW+MX7i6PnjbDm0xWC+u7Gdq3ml
	bk1CexQfo0+LY5pD9Y0hsPIQSQ5h32tDDwcIhqq5ujSVC8T201UX6HJgaFxjIdi7EJWhSf/bkHH
	IWbZgYgwiprO4veouqn/iHKv5Av6Wwe5ouTIlEmgrKxfLStNKfWiVBU68+i6VCjJwqJQM3ZO1Cp
	cvJqisLyYcDCA8egh+zpuN+/vGpT5MdQ8pHWiuGadt
X-Received: by 2002:a05:620a:6410:b0:948:48b8:6738 with SMTP id af79cd13be357-9494ba5fa05mr843840485a.7.1794655865510;
        Sat, 14 Nov 2026 03:31:05 -0800 (PST)
X-Received: by 2002:a05:620a:6410:b0:948:48b8:6738 with SMTP id af79cd13be357-9494ba5fa05mr843835085a.7.1794655864807;
        Sat, 14 Nov 2026 03:31:04 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:31:03 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:26 +0800
Subject: [PATCH v7 09/23] media: qcom: camss: csid: Scale the clocks with
 the CSI-2 link rate
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-9-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=10307;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=iqpMXB9ofejJNf6SiQOMlWp9y7epexowIxEe0Rry2IM=;
 b=6dw1moWJi41wTpvlMz7D+B2UCXSz5I5FIb4+9TaPXFTiMhzTcCniZcFscjd9yZUq6tXhgOOUt
 taRL+Dx2TC/Aa5wIMBQZDMmeD1HOViAxurpPmQOeISuzgEhXKAqKjJh
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX/QPe+8sh5Kqd
 ngMGJ/UsE4Ma5TtlztN3Klh5/UahCbsw1TST/8A9yqa0bvaAPd3fxbYbtKJfoQD4xK8K2kGoJo5
 Zr+7tvW/6naEfhd21mKwDplsNsQZsTNqLbLwdg3xvVSD9Lb1BPeKlj4K2grPwgy7XARdJug6xru
 +0aWFj2gi2fEFrl7HSMU3pIi9OBMKh+Xwsj+tyAFgOQ7VYq7xEIEJjYD6h8FRzjGZJ5VpbchKdy
 F+jtL6Cc5ZCGTEU0puWJ0sLwSR8cbw80KHmWvsNUfU5DHt/4znoTVRFufA/PJvcryORKFHoWCi5
 0ahhRa+vLYOCk3oBjm4S47IbfJNrPvbJcrSZ+onb3QUTvUIQ0gQSoHKBoiUaKXDnvjmM9B9qILT
 dvN6ZWIXYLw8iJ/EMBWWXFhl0CL0KxbJbfr7izznWiEBMoK+Rsb9wd9iP/uGO41Lq2dZocYAUNA
 Yai/hZblXZ6vKRSvy3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX2ZHD01RomxTp
 rpj0thpZdEZaSDM6ELNsi2jueaBCmifao/ccG0xu5f3ntW2cbUfJ4BsheuTFeRCpcJYfc/G7jhW
 VnZgt0+9yaY4/AcR9rQLmsCyw7h8SlU=
X-Proofpoint-ORIG-GUID: 8048Nzqvc0pGvJv-mVmOg_1ln1YbMxW2
X-Proofpoint-GUID: 8048Nzqvc0pGvJv-mVmOg_1ln1YbMxW2
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af8467a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Mufm1cvM-A_qJyHKcm0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Only the gen1 "csiN" clocks are scaled with the link rate of the sensor,
the CSID core and CSIPHY receive clocks of all the other SoCs are set to
the first rate of the resource table. A SoC can therefore only be
described for one sensor bandwidth: the lowest rate first breaks fast
sensors, the highest one burns power with the slow ones.

Compute the minimum rate from the link frequency for all generations.
The CSIPHY passes each D-PHY lane to the CSID over an 8 bit wide
interface clocked by the receive clock, so that clock has to run at the
per lane bit rate divided by 8, which is link_freq / 4. The core clock
must not be slower, hence the same minimum for it and the cap of the
receive clock at the core rate. The clocks are matched by suffix and
voted for with clk_set_rate_range(), as the CSIDs of the recent SoCs
share them.

Up to 1.8 Gbps/lane the selected rates are unchanged on every supported
SoC.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 208 ++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 51f20907ffde6ad2a40b787fdee6d6525e7603a2..714cea6883a78664e76109d11094f7b6c2b0729e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -532,72 +533,197 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
 	return &formats[0];
 }
 
+/* Match the core clock of the CSID */
+static bool csid_match_core_clock_name(struct camss_clock *clock)
+{
+	/* "csid", "vfe0_csid", "vfe_lite_csid", ... */
+	if (strends(clock->name, "csid"))
+		return true;
+
+	/* Named after the CSI port on the SoCs with a gen1 CSID */
+	return !strcmp(clock->name, "csi0") || !strcmp(clock->name, "csi1") ||
+	       !strcmp(clock->name, "csi2") || !strcmp(clock->name, "csi3");
+}
+
+/* Match the clock of the CSIPHY to CSID interface */
+static bool csid_match_phy_rx_clock_name(struct camss_clock *clock)
+{
+	/* "csiphy_rx", "csid_csiphy_rx", "vfe0_cphy_rx", ... */
+	return strends(clock->name, "phy_rx");
+}
+
+/* Match a clock whose rate depends on the CSI-2 link rate */
+static bool csid_match_scaled_clock_name(struct camss_clock *clock)
+{
+	return csid_match_core_clock_name(clock) ||
+	       csid_match_phy_rx_clock_name(clock);
+}
+
 /*
- * csid_set_clock_rates - Calculate and set clock rates on CSID module
- * @csiphy: CSID device
+ * csid_get_min_clock_rate - Get the rate the CSI-2 link requires
+ * @csid: CSID device
+ *
+ * The CSIPHY deserialises every D-PHY data lane into bytes and passes them to
+ * the CSID over an interface which is, as per the CSID HPG, 8 bits wide per
+ * lane and clocked by the CSIPHY receive clock. That clock has to run at the
+ * per lane bit rate divided by 8 at the very least. The link frequency is the
+ * DDR clock of the link, i.e. half the per lane bit rate, which makes the
+ * minimum rate link_freq / 4.
+ *
+ * Qualcomm recommends clocking the CSID core at least as fast as the CSIPHY
+ * receive clock feeding it, so the same minimum applies to the core clock.
+ *
+ * C-PHY maps 16 bits onto 7 symbols and needs a different ratio, but CAMSS
+ * does not support it so far.
+ *
+ * Return the minimum rate in Hz, clock margin included, or 0 if the link
+ * frequency of the sensor is not known
  */
-static int csid_set_clock_rates(struct csid_device *csid)
+static u64 csid_get_min_clock_rate(struct csid_device *csid)
 {
-	struct device *dev = csid->camss->dev;
 	const struct csid_format_info *fmt;
 	s64 link_freq;
-	int i, j;
-	int ret;
+	u64 min_rate;
 
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
-				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
+				 csid->fmt[MSM_CSID_PAD_SINK].code);
 	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
 					csid->phy.lane_cnt);
 	if (link_freq < 0)
-		link_freq = 0;
+		return 0;
+
+	min_rate = link_freq / 4;
+	camss_add_clock_margin(&min_rate);
+
+	return min_rate;
+}
+
+/* Get the lowest level of a clock above min_rate, or -EINVAL if there is none */
+static int csid_find_clock_level(struct camss_clock *clock, u64 min_rate)
+{
+	int i;
+
+	/* Play safe with the highest level if the link rate is not known */
+	if (!min_rate)
+		return clock->nfreqs - 1;
+
+	for (i = 0; i < clock->nfreqs; i++)
+		if (clock->freq[i] > min_rate)
+			return i;
+
+	return -EINVAL;
+}
+
+/* Lower a level down to max_rate, but never below what min_rate needs */
+static int csid_cap_clock_level(struct camss_clock *clock, int level,
+				u64 min_rate, u64 max_rate)
+{
+	while (level > 0 && clock->freq[level] > max_rate &&
+	       clock->freq[level - 1] > min_rate)
+		level--;
+
+	return level;
+}
+
+/*
+ * csid_set_clock_rates - Calculate and set clock rates on CSID module
+ * @csid: CSID device
+ */
+static int csid_set_clock_rates(struct csid_device *csid)
+{
+	struct device *dev = csid->camss->dev;
+	u64 min_rate = csid_get_min_clock_rate(csid);
+	u64 core_rate = 0;
+	int i, j;
+	int ret;
+
+	/*
+	 * Settle the rate of the core clock first, as the receive clock must
+	 * not outrun it and the clocks are not listed in a fixed order.
+	 */
 
 	for (i = 0; i < csid->nclocks; i++) {
 		struct camss_clock *clock = &csid->clock[i];
 
-		if (!strcmp(clock->name, "csi0") ||
-		    !strcmp(clock->name, "csi1") ||
-		    !strcmp(clock->name, "csi2") ||
-		    !strcmp(clock->name, "csi3")) {
-			u64 min_rate = link_freq / 4;
-			long rate;
+		if (!clock->nfreqs || !csid_match_core_clock_name(clock))
+			continue;
 
-			camss_add_clock_margin(&min_rate);
+		j = csid_find_clock_level(clock, min_rate);
+		if (j < 0) {
+			dev_err(dev, "Link rate is too high for the %s clock\n",
+				clock->name);
+			return j;
+		}
 
-			for (j = 0; j < clock->nfreqs; j++)
-				if (min_rate < clock->freq[j])
-					break;
+		core_rate = max_t(u64, core_rate, clock->freq[j]);
+	}
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for CSID\n");
-				return -EINVAL;
-			}
+	for (i = 0; i < csid->nclocks; i++) {
+		struct camss_clock *clock = &csid->clock[i];
 
-			/* if sensor pixel clock is not available */
-			/* set highest possible CSID clock rate */
-			if (min_rate == 0)
-				j = clock->nfreqs - 1;
+		if (!clock->nfreqs)
+			continue;
 
-			rate = clk_round_rate(clock->clk, clock->freq[j]);
-			if (rate < 0) {
-				dev_err(dev, "clk round rate failed: %ld\n",
-					rate);
-				return -EINVAL;
-			}
+		if (!csid_match_scaled_clock_name(clock)) {
+			/* The remaining clocks run at their lowest level */
 
-			ret = clk_set_rate(clock->clk, rate);
-			if (ret < 0) {
-				dev_err(dev, "clk set rate failed: %d\n", ret);
-				return ret;
-			}
-		} else if (clock->nfreqs) {
 			clk_set_rate(clock->clk, clock->freq[0]);
+			continue;
+		}
+
+		j = csid_find_clock_level(clock, min_rate);
+		if (j < 0) {
+			dev_err(dev, "Link rate is too high for the %s clock\n",
+				clock->name);
+			return j;
+		}
+
+		/*
+		 * There is nothing to gain from running the receive clock
+		 * faster than the core clock, as long as the link rate is
+		 * still covered.
+		 */
+		if (core_rate && csid_match_phy_rx_clock_name(clock))
+			j = csid_cap_clock_level(clock, j, min_rate, core_rate);
+
+		/*
+		 * Vote for the rate as a minimum, as the clock may be shared
+		 * with another CSID which needs it to run faster.
+		 */
+		ret = clk_set_rate_range(clock->clk, clock->freq[j], ULONG_MAX);
+		if (ret < 0) {
+			dev_err(dev, "clk set rate range failed: %d\n", ret);
+			return ret;
 		}
 	}
 
 	return 0;
 }
 
+/*
+ * Drop the minimum rates the CSID votes for and take its clocks back to their
+ * lowest level, or to the lowest level the other users of a shared clock need.
+ */
+static void csid_release_clock_rates(struct csid_device *csid)
+{
+	int i;
+
+	for (i = 0; i < csid->nclocks; i++) {
+		struct camss_clock *clock = &csid->clock[i];
+		long rate;
+
+		if (!clock->nfreqs || !csid_match_scaled_clock_name(clock))
+			continue;
+
+		clk_drop_range(clock->clk);
+
+		/* Round first, so that the rate respects the other votes */
+		rate = clk_round_rate(clock->clk, clock->freq[0]);
+		if (rate > 0)
+			clk_set_rate(clock->clk, rate);
+	}
+}
+
 /*
  * csid_hw_version - CSID hardware version query
  * @csid: CSID device
@@ -707,6 +833,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
+			csid_release_clock_rates(csid);
 			regulator_bulk_disable(csid->num_supplies,
 					       csid->supplies);
 			pm_runtime_put_sync(dev);
@@ -715,6 +842,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
+			csid_release_clock_rates(csid);
 			regulator_bulk_disable(csid->num_supplies,
 					       csid->supplies);
 			pm_runtime_put_sync(dev);
@@ -729,6 +857,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
+			csid_release_clock_rates(csid);
 			regulator_bulk_disable(csid->num_supplies,
 					       csid->supplies);
 			pm_runtime_put_sync(dev);
@@ -739,6 +868,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
+		csid_release_clock_rates(csid);
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);

-- 
2.34.1

