Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE62486E58
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327414; cv=none; b=s0LoCNRLQNzt5I9jC7MEXkyyItrBROVuq3uTP3L/gzgYIiDy1BMJfODcB7Aoi9BCN+G9SopScUlF+Xzjqxsut8YXZM/iMM3Z0tmeuXny6Vik83/7WYKzjq7St94abG0O9TYwhDb/cgpNOaeOHja1EsOeuNscX5GpeUZnyWusFfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327414; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZOLokxv11rLTtT5n4jLDj7ofIfMj2VI4OUwzOxsyEnkeZb/HUtJcAZVg7YgbOtT9AkH+MX8Sqs+0HGeJwsk0RQKXC3PHYlZWISeRnWh03zFPEj8tiQGH5Iua4v9kl6tWFsYClqwbRcJB1CmlSmt1BE7Ei5leIasR93Tcc0tolgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCXfdnzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFXYL+eo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCXfdnzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFXYL+eo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YaqE4102264
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=VCXfdnzsBuAxysu4
	O6uJHtTkow49ha/+RPdqHJab41tX5nEczGltusQP0GLq5MsO4Nt1yHTL09vacODl
	OVmcsrgON/EaByj2NDK0DIcw7vhOe4+wHKJWp0aAUKkn8zgXLrlasPU0eNPVvRgs
	rQTntLrm4AmkJTowsjg1cJ14Add6dE6IHzwhlginxV2GxGzY4wo7mXoKyuRz964h
	A46AOhScf3JcRZmV76f+3mlqnJOQKUBxEJ9hgYDuD+mmb13ou8TwgDj/yN96MeDN
	oaDgBBcaP7GAtNIchR19Ypx0UNMVLWTU4+R7ZZ+bKT0pCrcftaEkBJjhPJeCYqKC
	udwEiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8unax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:10:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f248907fso66883985a.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327409; x=1790932209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=JFXYL+eonL3NXP0P2pMWehXGcBhZT4a/3iDTpPm9fAHUzn2kvxbI7TPWNteVhQzOs/
         dab7ULbyvb9JiHtvb08qc/QUEoQefJsNQc7SXIrHArR1jSE80J9sJCR8ABDmkxPcKkHM
         4GDjmoVYXALxWkSc+cdsWmvxPDCqnT67Odx2Jcgo5xnRU662pVxQDRya2+Yo4ZW7C7Ml
         yefvJURjCJDoF0vo1QsPzro2u3v+zcLxkbNdvKht9BgOwl8ugusla4mZv/OjLNwdraQN
         rjUofeg+x3KD5LCVprFWYSz8FCC40TV5sL8tQ+ZYHS6cjuzoKNF7u17nYUxB8MpZ1zzD
         nxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327409; x=1790932209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=RV6UK10RQwy0KnTaMmOTBdPMQljV6ehHcPHCtoRERVq8Fv5JX01KaAhUSIlc+BEmbj
         G/tAkaAA5figqY/Z+86xtLFB3Yfp3bS0w98/Wn1Aczd1vz7u9C0hvAdTIbvUPECFYsSY
         Aun17pXqL6p4T3dNPFpHCJXRMqnkZR7VW1Si3D46TnLGmIw5P8nJ3bMxrR+68MdcnUW5
         q/MroSJyyPYo+KVMI+JCPGpFtXSSKp2N2QjMWaUo0txPpUTRxSty8IXgzY5EdbdZ4vem
         A5xSyhy4vaqKPdVR9x9TUJD+vcUbMjTahZ+d0NH9hVjA/5JkhJn5SKCzpxZ2ReHhRwGI
         e5QA==
X-Gm-Message-State: AFuF++lj6Y+/RwK1Ou1Iwx0MOzvsazAPMTcx2/K2IWcMr57FbxEpSwI1
	qClWDHGSxuPEoOE7Nwd6gPegoQnF5ln57n70kkJXu9bpYxjPaNo72yt3FQeVLN8EsDWx4TdgQxZ
	IoKbqvUNG3iR6qMrlg0tXPojn/a9DRxBqQEOFElYwS5aH43EjkgKRux2sQ7YekMvzjA==
X-Gm-Gg: AYBFou2bvb1mv1sDCjWpM91GVcOKqx2OnlHmqnPpmGMVmtbeUrrhkiO+9x1whc54Dcd
	c3wOSeQNbPKeb4LG15hUZPkgT5jFrf7zujK5neHuG0LTKyBq/uQgmIkJkjxQ4w/i7CqlpLrgHN2
	n9ADst4VHgC6Rd04Jy+cjosb1jEPTkGKOraxlNN6x3OiTU7U7pAZipP1jTC0m9SJDToWTEDLQhH
	TKlMyj1UC7Bfs/4MdyLXardI4q2Kdl9sLatye0ruZBd0jkltTxWGXpPjuk2nODCoUr9bG789r7i
	l25ouMHAr5Phc2wyRlHsUUy8lSTWoeZ4KnTpoj4nBQBc6CZaDQFEcJbrFqaGf+V9Fbu1iwxFA8W
	qByxNh+Krh6kYGoXyF/sd9QK8t6hizwpQt75XGo69yNrB93d6nclAv1YIjsVFQfNiIBrCtHQJiU
	NaFlOyrR/kn85R1nrFYU6fVkoT2NzLPOBDe6xZoPuJc5RHIDxEj1A=
X-Received: by 2002:a05:620a:199b:b0:93b:e917:6888 with SMTP id af79cd13be357-93c43cb6c72mr320195785a.33.1790327409479;
        Fri, 25 Sep 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:93b:e917:6888 with SMTP id af79cd13be357-93c43cb6c72mr320192385a.33.1790327408916;
        Fri, 25 Sep 2026 02:10:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:10:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:56 +0200
Subject: [PATCH v10 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-9-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX/hj5dzBAERjl
 kx9uxSiaEG1NRK0TIkOK2G7zRvXRkvE/7TL5eghxO0mi/ABuLT12pzMHH48stjJIuB+K0LnHv5/
 woxiVvewLydoffLy1LUr9+Z+t2VMygI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX4LQKtOW8Ztj+
 7zogpZ4tqKb4fWTHuDb+fqQs1A7+gt5Hb7T0thypLzOQ4PqD4wBXKd53CcJmcn3SWy6tH+YeERt
 TuOfAGDnr6S1Y4AD52OzinEmxVBZ6zJEpR/LQiSPaPfWnEmbxuQgcS7YYVP6VxLuFY1UdQKD9Aj
 COlgEVwFyK30EIvIeSRZ9OKsml5en06qT35LIq/ARCWvSCh4feYp+V//7K0DTXN6TpfF/Iahl8Z
 eZpSQ6p8K0xoGTSqB5gaImrS4JwxYqPKCp5bAtfR29Wa4M9xWYaOYtAB0ccWm10+H+I5Dtpi/cs
 485d9VSQTBCRxuQKVLT1z2QaHuVFJ1o8HaYgrDlpBsBT0yLC0uOk3W/f0jHznOkAIZY+uhNS5lM
 4iqsEkgtTni15rhyzXBPdjOTdnYjFdC9EqO30Mv1AzIgBxrU7sTH262JLL2BFIQIqdR0CAibPWw
 eDirNCmaYVEqk+KTvDw==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab63a72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5ddYIeXBFuTnB64J4U4Dqwb8bJYEk0Y7
X-Proofpoint-ORIG-GUID: 5ddYIeXBFuTnB64J4U4Dqwb8bJYEk0Y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

