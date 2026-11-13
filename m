Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548051;
	b=F1aH+MeRVTXJ0DN5XHH3XwTIT5lC6VJzon6fwbzD7LOlx38F+7pXE6n2J089LE0gva02
	 wPZjbTZvVl27qdPy1SS2JgZE/fJfEOkzeBPVla6DX0kgoWEdX2mLDqUnmGRt/zgDjh4JC
	 GShRPv1Ac5JmOqdatqiu/a0SMEccAm2vW/mA91+DilUVmB2FfpPH/EKHP6ADiKp5WL7IR
	 cak3rzWx0jIDHE2hwsgGxcLo9U/RqFTqCIOLzHLR4rXAL5yV29ZEgbgs84BSiX1OKqp5L
	 Z3rJEz3Ge50FMvZQ9AFbrUMsucpeSctv0dtW2PzIqUjBR7KtuykB3VkniQchZsAK0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
	b=DKVAZ23s+oYGNiNjd9X8CN912arHMYPXBAHaUeId1RZmU5+jMEYrLkeE+F4/4Fvifpvj
	 hDPtvuhhP91uhaYzUHXx/MxGiSFCprBdaGM/yXTbp+smF/HKQb5Qzkz85/f3zYRGpEcIq
	 3zPQTcn4ZdpjWngGWzvJ9Hq6iJ/4k9571ArO9K90dh8uidAALk3FPtKdBufelWVU/g7zR
	 ZqqFiPTXtKLb3G2vh21wk5svTU5cpFYWl1wojbTUPbvuWOVjWX8Fru9BwtAgujQ5clKJ4
	 2Anw/L34tysSxFjldYwKmcxCjqPqn7NtgQuasNuDRQpwhmdt/rrOQ1+SDhKKTjml/NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWAqQbDl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPx9Dmk9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6360A5BDC
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B6360A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWAqQbDl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SPx9Dmk9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD575hS1631340
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=; b=nWAqQbDlmo+bpHw6
	6kKcxDeVelCwg8ZXGH7dq94SA6ysbO+KK1D24ljg7OtxvreSEUyzhLSeGoK1/njT
	Ihss6za9pwI/QexkKmpQdygMOKEcAd94EleyuSEQNNoBrJR9bn62Kl/GNpQLYWDX
	e+vekL6GV5CHvwiedvNhDCg0wYqoEGQMsqv6IPog35lAvC0VUUd02PEzUMMUSM9+
	iseLgm37WeB00kG+j4iqJSnoOongYwWW4aBCvOOE/jhQs8nT3LvVCyT0juIz8Rjb
	wc4XGUXwodUF1PWN0KSzJbSpi4THjxKd+GZzeVlG0edxIX+V8GRWQZqab82xClzZ
	HIcjqw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1c8he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:10 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-7026e2e80f0so800106eaf.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548050; x=1795152850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
        b=SPx9Dmk97fFj037fv0vQrhUiXdiJGMYRWtK/cHCLLKan3DGaA6oQQ3+cYr7YARiSZM
         x6P0nrjBTuG3Qk7DuhJEF5xPcKPcfvM+kqvwALkp1tiCoqlkl5gZFRU9HZw7/1uu5Aoz
         xTrdVo6tCfXFLjeU4gwqSHhfYtbE7IYCQ/6hQYEQ4vZarE1KYtR09E5ITskP86LFKaMe
         dk1byOD6IXK90yVa5+5hyKb4Nf4CIdnQfUJRaDfv2afXd63UXQFY4yN7EafdZiS0niT1
         n5+A9LYuIpnOX3/ELiBdB26d9DpAc3+4ozjjZs/rH1iAkdn/keltrJ8VBUZgodyv3KD/
         meow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548050; x=1795152850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42bCCNU/m7FK0fMb6qz7TXZO/W0QFWHC4JebWD14a9U=;
        b=OwVQTw70sv2m58qMf0VbSZHT66l4SKaWiaLkD0QezT6a9o+kDWiEzBr9aYVVDukCv/
         35uZvUq3Q8ACjwSZ+H9F10z77E5IVMoVlf8adFgZX+uchQQz5h99kgm0pAP4ipKhgp0j
         1HR6HVMLqKmzK/4KjWSiKtBAs21UECRaAg/D7gNZPEgmfz+1wPqBNkhhSmwdJpm0FKx/
         eQ//LAXcaz7dq4yZ1B3F9fbsmBnmt3P9PiELBG3s5XUlaIZdtMrv3VyMMNTP3yKAbftD
         ysgjRzOAv/rW9dodvy0Q7cF2dVC+HzblCRrt5iSeWLneXrQJ9YVjc8922Dqmr5sUQVdS
         By6A==
X-Forwarded-Encrypted: i=1; AL+hErHAR+DIPWoL9Vk/ZfjKE+3kC9ma4kKrWRuxRum0pbjAKxu3xnq6L1jUwtS8MAaDvnTw3p1hS8YAv64nSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kMC70pbfxJlIzjG/4+crxneD5S2/Z7ctHHnyT9BJibVt+EoFf
	5qZ3sCv1p86RgMmDolQij8F30evtaX87fjMcNiEKppBklAYfIHVsEK64GBTvXGgqlT8HojbXd2V
	cVWSF1IlAEHVq/JTbZxY+fiNGR+LkcNvSgMhywYmr9HxHClz5ysRlTC0fZEQWQKcQfQ==
X-Gm-Gg: AYBFou36Vt9yrndecQY+SCOF20ZLJYmwmDXHYLbeBUPvMkesLOjCz/AFQxQHhsgjKZl
	3JQP7oZcGJXcdf0ojuOFzZECIK9ErsG5mYHL/uNVo0LPw+5osaiilygrlnZVUvp6wK8Th7cbLTX
	bZcNXJheEJwM7VyaSUVP2+e7trZ3A7pAjNo1AHb2cM8KTlk9JYPMLbGNHWhiA80JKA45H1xjw5p
	yk5IqXwySbyulkSouUUFJmdA0hiSrhcIVLw1DpFE4toCOX8HJvOLFsAGUpZNpgVGTS0rd3S3WaZ
	uRIvd07+MfEnS3F3ZNlIclpyhh++0rY23IaqJyvQWhuGoEUPr5NGx03nSI6NgnVO6KIDWlOITz2
	7iMWXW0t6Z12fQEgsKN+IA1zBXIM2UQd/dExc9EdjswVtTNeOLQTovY48LQKJrX2MohjEZzttJ1
	t2o4VxRuPTR3KK3TsJUdDEqpvX0KaR9PHsG8c9YOoUfpzad9h9HrGTYj1mPEcN
X-Received: by 2002:a05:6820:1692:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-71ab4cd949emr1026853eaf.5.1794548049749;
        Thu, 12 Nov 2026 21:34:09 -0800 (PST)
X-Received: by 2002:a05:6820:1692:b0:6f8:2346:cd78 with SMTP id 006d021491bc7-71ab4cd949emr1026840eaf.5.1794548049260;
        Thu, 12 Nov 2026 21:34:09 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:08 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:40 -0800
Subject: [PATCH v25 08/15] media: qcom: camss: Allow CSI2 PHY devices
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
Message-Id: <20261112-kaanapali-camss-v25-8-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXxDR3A/S1YOBi
 Djp2qNC1WyOtrzV1iViQDXtZTgJd40DqbK4Gpgpr1ax+VguwDdCITP6v3SpTOjItzPsnoAgjzjL
 jo9xcyrsyJqMsAKtZDkjrZk6Pf+pue+7Gnw3MMbbHXrq+HcrDFRkASQai/JEj4aVrwUYP3Klp7f
 73cMz3V4y/B3niBstpcrD0Yaw6CswVAWkRe5iG4KyPPNQFYuqtlLtFOJpJFny4uJ0u3CaHFwbXa
 YcvEZPsRw5uKjEiiqKamGifjsQz9iWB5JWFpSicGMFKJL3l8jmGpcQK6HKclOaILV7t5T9SvsTf
 M7HVY9Kbkp07+8cEFe/fGdB5BqMUiU8USZ+D5PiTMR1pipqFTC8+U6mZkR3S6b5510cJ0bdaC5h
 lCb5DHPsSOxIP0Do++F2ShV52j+CYXox74Y7lllk04KFSQdNDJRIkuwjH/VvN7fX9X/GhikZomH
 +avNCY+HUDUxYvTrHkA==
X-Proofpoint-GUID: 0F6kDEVoaM1IULzRdqa82yAj1ZOHt-Ka
X-Proofpoint-ORIG-GUID: 0F6kDEVoaM1IULzRdqa82yAj1ZOHt-Ka
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6a152 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=2_0--xn6cTixhlPqFr8A:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4sgGl1f/UIkP
 lw7sfbuY9NT3r0mdQ4MIUjDXb+h/FWIu6QqRlcQO147NBGyyEin3YT3FTL6xDpRLsC/0YvzA5fb
 qyRyUjnQKptkJnvpD/+qZfMjml8G7w4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

From: Vladimir Zapolskiy <vz@kernel.org>

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index cdb803843792..4db68aa2a7a7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -793,6 +793,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
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
@@ -802,7 +807,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -830,8 +835,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
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
index f7b9c71cf263..508fcecadb79 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4808,7 +4808,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4822,6 +4825,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4853,7 +4857,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}

-- 
2.34.1

