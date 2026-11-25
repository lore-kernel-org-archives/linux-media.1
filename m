Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596205;
	b=bGsiISjqcmsV6NGkw8j99jfkAzzKJ4qFLgqUMI+hpAHWjaJtafIdNgPfaz+wFSx315BC
	 NbghEZ/3LbSCClwCgsIaplThsIiPvxc2jSAUwwwNBRF6iONqMyw23aE4JWvk2M+cPJkO5
	 d+pGPDv+gVA758VkZsaX4qXgfnHYu3T1UAEBjPuQ4RT5PRj9k1QglVrs3ax4euEFxrDwO
	 fh1iSs18l9ZeTBJbsb9IaqvJ7NmsLnN+u09+FtRsmVKlgsqsxHDotf4JfyasEjynxBfsv
	 WAaTCw3Ey5VstELhZQQsHe5uLqtqC1zgPBwRyMEjihSr4HptC3uQ+xm7pBix29KsZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=;
	b=FXb/QT7FohzQZ07TSIapRNqyUG25fuLWSbja40/UC0OMilA1zOyDDDF5JfTbDPCElmCE
	 OvewfoVeLpg+hS++VWl8/n5usDR8UchT0qFiIHOd4skFeistyPShVJ8q7xqUzmzX2cTwm
	 +5JZd1xqa5koMC6F0c2rhXGt3CdEVzLDjIE/qFlLZ/xtY3aEcP1fwDFo3RmB/Kk6JKtDY
	 WHR6S2LUOw0Jq1Gm8cFpvW76uKBDlxbPUS7B1pt83EkDDvHSOWeMNrcUTv558Tn+4+6Ts
	 jZvzGhH64P8gHY0aYg3noKysySpYaVq6Zw9eJvDwzlf6G3XTOWQoA8Q9mPiK5TPafog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaL8G4cv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ap+dOCb6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A34606A685
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A34606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaL8G4cv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ap+dOCb6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68iYt1861076
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=; b=NaL8G4cvrKyYouJt
	d3p2fvzLOVo4RYT+YXmqTROzbYdOVXA6CvYgFP/4BFYEJZxYxOCI+TYrRNvDOUx0
	IsLwlSkWN0qmegaanXRmmCSXaJPlwh7ui56dh9IetTYieN/JZCVHmC1ZrD94f1P8
	awaNnCe4/nxEHDL/qDKVWCaj/zUElRk8Pt5yFbXP099CxooRxrQlak6W8oE/PAkT
	C5Uv3Xrz2n5oxmoVE4U4cAwKL7q4+9/eA16WiglwJZNSKnsh5lK8X3+A/4ydyOzI
	yYvJdW9U+sRjI34+QW4WjbKZ9TphCil9FfrPhAdWLVe03ZoL5GG/MFymyZZSaxJX
	hsP+/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69j7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:43:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so4506354eec.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596203; x=1796201003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=;
        b=Ap+dOCb6BB+jOWKQ29QeWVnRivxgOoAmMtz8f/4N6yhBsDmgOvncEXWmjCt2qgRUSF
         PHEoVmbjCgCVkdkDrsQHORF6aVX/JYQNw1QAuz4XoWa37bxgWphELJ+KcxuVKqITaLcv
         sKu832qbfIuLectCmF+wcM+7xv6hljf+aNiE8ovfAPPlfkDrDJm6Rat+eHO520v0IR5C
         +ZK16XRR7WcGeEOrM2BL8imuhCjCagVuC3U4eDGCt7VKl4pRlmMvEJJGmOtRPUtjChMv
         P2+LI+oJB5COFVRE4Ka7uuXLRvsNQGor9xdqH23LAWpGZfbBO5fut3NuKOisU+JHMZi7
         NQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596203; x=1796201003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=;
        b=cIOHdIfKxT2lWh6Br3EykecdwUIPe+9CeFwU/TIGKJ3Zx3JcnRJsDZDHzuV0zWJpUS
         oWHIi0uT/R1UjZDa4on8b/aBtfHZLFE5JQ43Ft/gHMGAsjfNHC0s12neyasZCsE4fAYY
         EW+8fjd/FTqcU/sPvWjht7huA44oNjIfw+ckNFfTbiXv+PkTTgwD/5KS1Ny+N18W9V68
         69AGu1u/2aQO2v3ZiJ8kR0r5UqJdQiGl5z4cZUUXygiR5uCm7xGYcXVDu9D98O/4uFo/
         iZfy9CpbOtzJPZlzlT5je5BuF9YTtTxW1K7AQe4bOZgie6CRaAElrLOILRHxZcib//Yp
         jMfg==
X-Forwarded-Encrypted: i=1; AL+hErGqOxvF3swABcvvCYXopNDPqMXx2irE530T6LNYQnVQquWPr0Rsrtyj5Havw05/YiN21Ib9v//KnDg9SQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8s56zsOhmI56r1fXPR8XrUzXMsxlgGPIM05Y5LI22W0d5ncWq8
	8f/SIrjMuIL89crmLe+aKI2zFh3GMp8l1Kh3z37MA9TIknauVrTV+VNFwJO6Q/doYZzosSndP5v
	2MnPFkpg0Rf3QsK0zyGGrEbcOAY1dA7Um1RPM5IcXwSJHGJCjqWTWVR64D5191Pw0hQ==
X-Gm-Gg: AZFdTZdDC25CD6U5yDtIGQuKUahXdLcLwP6wSTesoZnEDNgB/FPGuk3zycyA/zPXRfB
	BqclOzrNZQjNqta6WdWH1Of96tlwvz5xrLilkxQ4c3RTIZAU/+IboBGkxqlE3gaFNTUq8LXlO1z
	6Wles9EN5+ndrXdI1OocRrzfd0+VGCv0UU7XoLvdK0UqZ4V3kMz2FD0zEwZy8v4gQ6r3N7zw2Gs
	qT9DwvwId7JhNQDVCTbzhYyA6CderzlrwkEglVrGIPp6n/TOC9s/1uVncWYF/UvAKahezDGabpu
	gKYWyBFNPFPDyeYmrgZVNS5WSxUmg7gAB1fNcD8nGV40djHFfn3/D/+lm1Fe8anW5o2miNCzsoH
	ztX7cGOpGjOJ4O9XijDvzYzYncUG0y1ghWkNjJftlKxMwFR/hYCaytMFJGtNUTouhElc9wsXn3m
	F41l0T
X-Received: by 2002:a05:7022:3a0b:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b5568d861cmr17358902c88.20.1795596202667;
        Wed, 25 Nov 2026 00:43:22 -0800 (PST)
X-Received: by 2002:a05:7022:3a0b:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b5568d861cmr17358875c88.20.1795596202033;
        Wed, 25 Nov 2026 00:43:22 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:21 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:13:01 +0530
Subject: [PATCH v5 2/3] media: qcom: camss: csid: Scale the clocks with the
 CSI-2 link rate
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
Message-Id: <20261125-hawi-camss-v5-2-d48c4feb1c2e@oss.qualcomm.com>
References: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=10252;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=tpveFD6IUE1BcjgC1cRdIYcwyFNUjPZnwFV4YuwTebo=;
 b=szYJND60yPQMmbvDHj+qskOF1RvoxboTcfZiCFm44NO2JMs2G3iWI7PPksls3mdZvUjzEV2Ye
 lDwytHVVuy4AhKEpcNMILOyPePGW7RlBtKru2VqKU+wX+XMie6kGq4s
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: MgBIYgAJxz7ZdV5ntDcisgBzOlkkU26K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9/4S80pawGiB
 5p7d5rROTcXn1h+PlG+Kz+96XDZ0XV1O7s3kSZcY3jv8YL0LUdOesYB+n7wDmZAzKZAwjoTxyrP
 Uf7eeksE5T+/wvb2ZfeQtCO5v+g6/GA=
X-Proofpoint-GUID: MgBIYgAJxz7ZdV5ntDcisgBzOlkkU26K
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b069fab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1mbsq_4py20XrWrvqusA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX7bq7iAREjBtI
 rc1xTiVHe8zjlc9xGLt5OU4cyX8ADPPAdVffbK+AcOuKegvyAgP2PD8xq4hp011CnN0oP5jaf4n
 yk8dg0ZREw+Pl/9OZoSNMKoX3BvNz4GT484HxVFFUAcaRqbt6MuYUZ41RKmsckIXtIHFVJZz+H1
 JvNYvt79hUNShTzqZhFI+UO5cMA+9a0lzYXMYdhnoSXJZ04TuieFLkl4fK5/dpx8Pho26WlFt0/
 u4BjwdfHMQWhsmFhNYLWxmRCts2H3K3AKJw8OHgO7cFEFNiRPXDjV6mHyw1X1q3Wi7TRnJ2KjKC
 5XaabqcRvZpUGqgsZOjXse8HEws5KkAP89UwTyiyHekEC0ojfbqRcdHNwHQEQc5ezq7eVzEX5UP
 tcViajlqpkN0TmcAb9oBGXto+IO8oc3wLY99bg9ZxP++PWEYhpQTXq0t5itxnx04LBod9xXAJ4r
 AgUUTMWv5Lhe061rpvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

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
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 208 ++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..e6546fa9cf1e96bc9ec65eb1e6e4eb0144cc01fb 100644
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

