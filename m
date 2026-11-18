Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983767;
	b=FSYn47UHFOMrd4nK3AlUNP5Dtgvpd0XNkx7o2ymrER3szqJYPT3jmgDusyxyuuegQC9a
	 aBAq0yKYHCSOXKBtUuVqHwBuD8s84645Mo0cUTA/xQgxyi9Kzbs2fDId/Tpvih/0ndmpb
	 oN3ZmWGTx6QAf3igwppqpZ1Hys7dQlIjqRQxy+bmsGwA715JLFLjs7+c3NuYbMKzB3CpN
	 EY5AAjY/ABvPBXuMkhyi8Z8cLvJu3000kIYH9nivwHivDV3SfwusXc8EJdwUKykJ+dSXb
	 sAepSEAHxUQyzOo1xZC0K+1/W9PoPWMq82cj0IxE70Ca2hLejpIeFax3/6uAphZr9nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0lm5kOt7PL3Mvrl2OibCI4467OpTHiJA54eDzM+N4uY=;
	b=ELXZWa6RmfxU5NnZtLN2gl0g/Bqump4ItAZLseSpyikDxA7HAFPjl0yz8e/y4qR3FjRx
	 fGgQEj8LM+jKFpEgZQ10jU/cliUYQOm78xgRLAKquowOuDZD31Hx/By/MCzVsNNYjFI5F
	 GYvDRHNFyaRlsBLxKRiE05k0xLMfmBg0yN6wZzhjVAIu+HR3ib1mRK+7Nu8P+L5eh9QVq
	 c8T1Ho+lpzQWbKK6esDp5mbOWjwKGEuGRK5AB9a6UbofcSivioMGXIhAkP8haRfnz7DP/
	 /1+Id0yFuJsU/6w860Mc7IBYkEybCjB8+jf5/nk9yPgvdID7jCqF2aDNGa0RxGLSWww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djjr3Fsl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WcfFPeAO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D72606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 06:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D72606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djjr3Fsl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WcfFPeAO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmYP3371245
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0lm5kOt7PL3Mvrl2OibCI4
	467OpTHiJA54eDzM+N4uY=; b=Djjr3Fsl419haDKoGerD3sR+aAULT6pjV2ByTZ
	wifMVxZEqQ0PNbq0yW7CwQVXsvBinseQT+kBfHbN9d7mMBwK2EYIR8n6NREpXLOz
	7kkvKdqaIM53Zj/950dekn+fNwLHlzvE783ILxdjfOAat/q7WXJa10WfKcafw48M
	pb2BckBm4a86hB+JA3n+RKMcV8pF+H5lONadBjJl8NK0sPE2Kt/37a3SluZZy4SR
	HhZME2GDBqvvDXlfXZsVxfn6/Owde7440L9WURane3ag5IgHqsGBYUtn3mSMz/4c
	o8Jn/psBTgNaBZYDZjQrK7GFnZOoou+I1ZeRVKP1MzzrbydA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sk17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 06:36:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee184a2474so5777375ad.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 22:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983766; x=1795588566; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0lm5kOt7PL3Mvrl2OibCI4467OpTHiJA54eDzM+N4uY=;
        b=WcfFPeAOR5ok47huK4LMvLChPmfU5Ak1AO7E1Un8g424DngHGRT049XeVZ7i5wMOaR
         P9Lpsm1z0QXhHIY7bZmYz/QRrRmxvRlsPoY0Dp+kJ7Hh+vaEvES02dttgsUNfBvbaiaf
         wyugzRIt2pxtpReFbzsCLlTwHE8701vZp2AjGJ/rj0FUqYfY3YkGA604NQA4Q++Vq/NC
         No70nvv5S3Gtxic0ij4KIXr8rB6K58QSHZJfpCjafevicgHwIJs3nlT7vLwBa72NC7uy
         kT2F8WDBvTOtfwYkDKyz8jEh5AQckHXECGjSyhm6b55PILdkuw82KQZYwm0bUsE5+Eh2
         p1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983766; x=1795588566;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0lm5kOt7PL3Mvrl2OibCI4467OpTHiJA54eDzM+N4uY=;
        b=Q801YLERJM+UdwD49UURb7gTy63Nl1LU/vthub9gJymmLyUbrom2IQ88sDoKVuqnzj
         rkaGeKSVp5ulBvEPz0AW1201nJonaMSbScTDwUlPsKM0Lvwt0nrdebm/6fgpdn/VsK5w
         /wGiiYSYhWMVwbaxXpHixV+ecpJp05kSHE+Pho76UPUu/pjDaLTKO/qXd7xcC3LydrWV
         gn4jxN/jSpWfmtbLAvooSvwC0o5/vEINAt5L8U2jk33T8BaXUGqMCYawZnFGWY6hx/KK
         aNGL8K3NJBnBCBtUF605GxJg1Sv066pjkBMNLl8NrAD+mqyw1TU7MbeziiyVImwFVLoW
         8t5g==
X-Gm-Message-State: APuU4Z/VKrPE/YpLV5p8XXFG3wwRwczHuZoS7PEP4JKiEGS8P2wEhA6V
	yYx3pP0cSH1K68d2wgmyTzCU9Qwa5A5I6y/jTuBmtapLqwRE9zrQFGLa3l2kubYGXAlsjbHzAkU
	ItC40gWooxpEDVq31EepiojW9YlRKa2xN+Hzrw0rSvkhJvpgk3BYe/HlBM38lNV6ObhwfpPwtsw
	==
X-Gm-Gg: AZFdTZc6rG/E7a2Q+mf85QCnBYeDWKqafBIBCbp42FzoZFQer9xbuziazXR+hsJI73k
	ja8LL3+0Rl1vDdhY8lbI9tXmuhQjWNP0UlOHs0ZiC9tY/L64C/+QGGo7atyd1q1UITxjVvLXSNK
	gud1j2Ds9QG+MXHXs2MuumfX7wD8vCnZjXSyRQKazwEEsn47TQObiFv3IGg9CbrzIlRO3ZpBGf+
	mR1YEl0ztrQ0Maudiw/PSsGza68X6gFXGiiQIxpvJoi7fSiHJPqZTKKV+6JQP+Q8DepFwOf0kHt
	fI4Umq4HNoAji/4BLfAJTYDfWuU1KiG59Z9FwqBbYBbhMJ0VwQXS4D3tyRIyvXQQocWf1b4N5D9
	sLBTxgqPCIkv3OpoEe1btBo6k3pjB76DN7ZAAAuz+8YAd41i7fSVoHIAW1790JO5stWgmlg4Mj9
	2YiiJ9
X-Received: by 2002:a17:903:234a:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2eff7100df7mr17677065ad.6.1794983765803;
        Tue, 17 Nov 2026 22:36:05 -0800 (PST)
X-Received: by 2002:a17:903:234a:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2eff7100df7mr17676805ad.6.1794983765320;
        Tue, 17 Nov 2026 22:36:05 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62876a6sm7337255ad.63.2026.11.17.22.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:04 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:05:57 +0530
Subject: [PATCH] media: qcom: camss: Skip disabled PHY API devices
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
Message-Id: <20261118-camss_fixes-v1-1-93e5b59e8757@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAExH/WoC/x3LSwqAMAwA0atI1haMf72KiJSaahZWaUCE4t0NL
 h/DJBCKTAJjliDSzcJnUGCegdtt2MjwqoayKFtE7Iyzh8ji+SExtcfGVo0dPPagxxXpDzpM8/t
 +AT5BiV0AAAA=
X-Change-ID: 20261117-camss_fixes-4f15a35a9f18
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794983761; l=1805;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=te+8IhW4wKHIeYTOHY0lq3MCORvUXQMMmr3zUOoMph4=;
 b=HKEHf1Ox5Ci5Q5DOX+4gMGNPjplTkTWQdL99fQPrI0XMGYLdEePwfvkw88rtB34MbfLaUSBAU
 eHszWNzHtjNA1hvCxBaJknfJ2zec33P0Y8txAmJ1gxoQb+ott/QQWZz
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4756 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HOR-2n2DdBinLPp7n6IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Jaam61gnlZ7yIPLpQUl2Qi3QVWW2F9IR
X-Proofpoint-ORIG-GUID: Jaam61gnlZ7yIPLpQUl2Qi3QVWW2F9IR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX409KqyUohWCC
 m/3rRMvfk4DO7XRHuTodenSYwA42MRygHxgcwylG2p8stT0ckeweRXZpSIc9MjRoBpTjLO6uYgP
 SuiY1Gxyc/TQODqOrvI2IMS88sfONiXAWtR3SFrPVD284bR3hFXfD/+ftvRnT7wRNQyOP7tr4Dr
 r80I9QBJBnD8kCLKFjQTi8kFg/6sRmLt7jzV7B+jcYJ1AIym5CLh4kxv8U5gNZTUQGFzHJn31zb
 /yLq/HP0JnLGPhtKZKfeChcjIjwrpSnaX+ynPJ/3Wqrz8Br6RX+oD1Y4SIYMyUbXWYeLX+O9BxN
 ANiHZTroxYDd+72ahr+Nya0KrbHAlNkKJKsYXMRhv8e9csx4A5t00lOZEm2fAcUBK3swms7rqOZ
 fWSJuIXftxHfiJ0U3HtYNyVrN9Ra4O4+FBZyfGnSUQxQlicz+lEYPs7u2rghrgE3wWGaj5gwJnL
 Cwos8wrG1DOBZ/EG3Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX0f+U/VMj6k7I
 D/sJTAk+57u32JZ2aXmBtGasnqMLyTrO4+c2TTv9JSK8eseEuuVzKe40Dr0Cfu6PJIkjTZAlzPH
 VixkdbPiefNZ2VYONh9Z5umr83arIpQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180026

PHY API based CAMSS topologies describe CSIPHY as a standalone DT device.
The old availability check only looked at the CAMSS endpoint node, not the
CSIPHY device node. Since DT normally disables devices with status on the
device node, a disabled CSIPHY could still be walked through and its sensor
path registered.

Check the CSIPHY device node before walking through it.

Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..ddb47c3ee271d2202228b089c3179d134b5836ab 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4745,9 +4745,6 @@ static int camss_parse_ports(struct camss *camss)
 	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct camss_async_subdev *csd;
 
-		if (!fwnode_device_is_available(ep))
-			continue;
-
 		if (camss->legacy_phy) {
 			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
 							      typeof(*csd));
@@ -4763,6 +4760,11 @@ static int camss_parse_ports(struct camss *camss)
 			if (!phy_node)
 				continue;
 
+			if (!fwnode_device_is_available(phy_node)) {
+				fwnode_handle_put(phy_node);
+				continue;
+			}
+
 			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
 			fwnode_handle_put(phy_node);
 			if (!phy_in)

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-camss_fixes-4f15a35a9f18

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

