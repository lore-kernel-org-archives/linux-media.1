Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616154;
	b=eggA1il6ctUck3CuVOtYOxBIwa/YK2LoQSubt9gROi5U/YmY+Y6vmxqN5bxsSpEWl4xG
	 M1/v76Pe81eBRp4Dc6fiwGs7IMSiqcaLt1I2jbb0BbFKr4m/tEHUK0MdcxXI9WBu0lQrz
	 RfcDQUS+9QmXeV7kt58eMy0cb06iFZzoc/M8/kseNYt/VgwVeHG28fZAeGgs58w1R/HwH
	 QWhuLvRgLLIo+6mcFD6Ov6FxgyHgRLb8B0xc2dFpkofUz9vZb5Xtmv7S8j6gcSJfaFE5f
	 87eZR0mzEow4oy0e14IymqhX/fz377Cv/wF5ycNBZ7hXJYX1l3VrpcNnZkaIXzlPIaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
	b=PFtDeqHmXWYMXwhhajbH0FNj3HOQUfVIHw7OVRDq6u+aOwCPNM5SFcHcOAhmYLHMEqsE
	 +mtiHVSdhzKlcwM75aubz7WLI4hy3NnEH49mIV3sOux+57OJC3B7LF15lvOgAOcE+YNf5
	 qyJKgo+PIJslnvuNw8l2aaVzDIgo0M+7HPVHoD7znurPtbwp5z8LeTCKE7Q5Z3A6qyJJs
	 s+9VZJ1+QO7hWUVQmnO1cYSxPah5+r6cfMeyYMgy2rOo3vRlBA99WLqkd8S9CKb+SxN5X
	 myqwE18BAQF6C4fUs1rNmbolIJ0ValkHvNskYzvnYRz1DgGxyNQlCiD4Ox/84YcO20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpwnpaHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LBbNALc7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFD160A5BC1
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFD160A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpwnpaHS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LBbNALc7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJMw2880820
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=; b=UpwnpaHSAilrnpNC
	45ac+f1d54RpuYYqvQdisI8oRkg6dlc0WjmS1ZGtYGc6Q1HyuFUlQ52EP8I4JF5p
	YyvbL1Ow+GiHcWsvfMLuysZqP1Qlk2iwa/hZpkOuMuLCs28oK+zCYTdy2o6FR3Cj
	XtwP5cjAUKh5K0Gxe6j1Xi3U2yHBLpWQQXgsYh6tCPbxiJFwXdZ3Y/qmt4hXgrFB
	rQjLc6FX9LeyZETvpFDDocIqAaMhQC2mM2nFBYtgxxI+lt50doQ9yullgPk/ALo4
	vMnfcwCgruxBTjE98/6sOhTU0EHtaKDO8E8FSEN91iBmm78FjCBoCSAMYG3FqLYk
	EjCJEw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgdvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso4358590b6e.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616152; x=1794220952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
        b=LBbNALc7XPDE2T0HwJNzNlGp80wjiVnw47+20ENHBf7WQ5MfQK9NxhdmJECX3sb+QP
         kFrT/BhGpAryxBgMvLbnBkntbio79mAnUXorYy2jnHUX1+FS0x9Z/zjhyPWVW8LhU87J
         BYEd1DyxcDIexsAwQ9S009lZnlEK0FTwYQEyASmrZjG3/mF+39X31h6e30sv2oZkR38v
         KVboAua7TaBvTI0WxW22BgpjfJYA3LgOBAXx0KeEZKx8fP4QRe2uoRFWEDzyB2juU3Hd
         1MztwVOiNFNURmBMkIYMAlPSwa8UGVMpm3HyxY+3eOFWtrG2t4lSU2SFu4TszlN8OHws
         tIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616152; x=1794220952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
        b=BWgdI0T/OMCCErZSO9as/vt+rLbTQVA/JaOH43BIqkx9ZL6hsmmvesZ7pK2HyE4uc9
         +EQoeSINXHcqVsSoV4ruHrIwcrZpSA89/VatiDWNxn0MDNXFiagkbMidB8k0upEO3feF
         34lKCMg+nFfR7T5c5PeD1pxs0rZMrxx+fyFM4svusx3MC5dy+fqfSx63yHkOFyD+R1MO
         yH9kqhFqNCZN6lZt1xJyoMJ0D6g717o/WWW2K43xtOOmr6ElblXqPCsym3QT6gFRwFvO
         9KDSpSXb//TE1NHT3JkeYvjzHFYDpK48iVhmQIJZ7RdQFjRvEXqb8u22PbCTq2QouZAH
         60Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwnJMJ0TwRX/lkkMtkGjR9DKF9J5Zsv3jb8qMQr3UbyoVYfo1zwYSppW4VJ50R9K2nYgoQzS2LZzOyqWA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBz3VKkHlti73FGfzqnbMdMakS4CAzJGljd/qwrwa+eF86Tatu
	2DXH1dL7TosFI2zWqAf/P88Me8YmT6E2Z2zevBXSlY+wE3v9CbzjyuQSk9bWmuWCenAgZj09QkJ
	XlP2hbHLRJmK3yzvuJkAeH7EdpTUVG/dujxLBw5UwgN1ED6h1wFoAAom4FB0s8YeZAQ==
X-Gm-Gg: AYBFou1+EUqUhN9tYvObLV7eFZECKZ/Upx4CygXVQXxDP8e3gbHTnbrKG9JfxxUUS0l
	y9KhrVgmtekR5wb7xSZARj6vEB2oYZILplbyF38sNqnU4+rQCU/2AINyRNOVFq0RwByn3vWOarw
	18LjvaT1vwQ8oOQmb7PEcn+Sc0VsstO05MbX2yeqwf5OCpbe0fNzZls2kn3qsCzlPEMNZd6GiwU
	ikPgquOdZtipZK3qYgMqETxDwU+pgIbs7/3HMRxQ5U7ATAWr9XTUmkoVTkmuoqnNmoo333Cs4Fk
	WX232skE+MhL1cF59sNGJW0pMF74f2z0H4IT6oAEi0S6xxgi+ev9NZtgydDXu9111kcZw99Ah1e
	9jYXKafdY5U5ImgOngImlz+3xlEMyXEOVG1q8UMvY8th4Enj3aoyvNrzjBfo6AMIKzKTVpQWxus
	QPuQDbhjGdTKog9hCOHOGL3SRj8ZVjfzSzJZn7FSJqShywhoXBVPVzHzZ3i7s=
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id 5614622812f47-5640df8d97bmr5915332b6e.39.1793616151931;
        Mon, 02 Nov 2026 02:42:31 -0800 (PST)
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id 5614622812f47-5640df8d97bmr5915303b6e.39.1793616151442;
        Mon, 02 Nov 2026 02:42:31 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:30 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:16 -0800
Subject: [PATCH v24 08/15] media: qcom: camss: Allow CSI2 PHY devices
 without CSIPHY resources
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
Message-Id: <20261102-kaanapali-camss-v24-8-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86918 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=2_0--xn6cTixhlPqFr8A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: U9_rTl7K7BAKbQb5PFuuP04RYxmmXZOX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX2b1Io4Nn5yqW
 0pnkfI9YxYI6HcgBKZjRpNuswCyhGWbeQ/15H33ccbgYa3GXJGsFiay0rvrvQaR7RzSI5MbYrJn
 QfJ0b2cMUrUoEJ1cLqJc7/wXM+cxzI4=
X-Proofpoint-ORIG-GUID: U9_rTl7K7BAKbQb5PFuuP04RYxmmXZOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXxovlc8bP/uYH
 tT/LXpNC7YFSyVqyajppJTgb9xDLiv2aHtWselwZV61TTyXl9j8hkgOb/nYfSoxRQLAxg7YQZ8/
 6hmjHP/TqzH5P1HcRtHckAb27GT+nUmbKYhJ2VibJkzrLm/KYHU9KmGRN0fK7NBnlyYSQ5UNt4Q
 3slvprxEBcBsM19rb8BHATMTcRQsqtM1KK7QkVOuubncpqSP6gCfFo6AZQsL95uv8Vyw5uryHEs
 qmr+nwc5RHKqPKnDN3M04yuzGW/WNF9AyIOWwhV61te4N7fEivcYPsW4Fy5arz8JR3glG/xfa+9
 k91iIXoTppy0dwQ0lI/NEjC9/cSAwegmZ4cXMb+RnngaPjJpBFr6Vy2A17fdss/4M8B8sW1hPbb
 VSOU6egjHPf5htO0jVfvPoHuHC9T+zAhXko9J54tITi5RpyprdaKN9JmmiyvmuPGzsWjcZ6k7/o
 p8xn0beWIH8i2YG1+0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

From: Vladimir Zapolskiy <vz@kernel.org>

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..8ecd514451d2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
 	return ret;
 }
 
+/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
+static const struct csiphy_subdev_resources csiphy_res_phy = {
+	.formats = &csiphy_formats_sdm845,
+};
+
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
  * @camss: CAMSS structure
@@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	}
 
 	csiphy->camss = camss;
-	csiphy->id = res->csiphy.id;
-	csiphy->res = &res->csiphy;
+	if (res) {
+		csiphy->id = res[port].csiphy.id;
+		csiphy->res = &res[port].csiphy;
+	} else {
+		csiphy->id = port;
+		csiphy->res = &csiphy_res_phy;
+	}
 
 	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3857515aac7c..30c2a0c89100 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4810,7 +4810,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4824,6 +4827,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4855,7 +4859,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}

-- 
2.34.1

