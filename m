Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10351357739
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727722; cv=none; b=Wkltg9o3GLkAT3sXsRk0Pf5e37i2+/6BG2GlH4e+ynAYpHzXbDfLeG8o5my/Ut3xBL2PtVLpLFiDZXGUqTegkugIHNpW/KaOZLH8eUzb3v/JNt4T5UXDdTA9qvyTVFtBZ9pGpOm4UHuS5MvQqiREwsGDlFrix+YkPdx7TwDdZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727722; c=relaxed/simple;
	bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWpJJBtU9qcoRd/Evrf+JqabUzTU4wP7uyLBovxLHqdqA1vlAgiUt5SYhUAMhk1QVg4HnbbtkQKyo2JfDCCPypOc3Vl9B6UdYi9JBLAmy4W6PgDomzHUTEaJeMnmIIVr5erNfPBmDGq7BFUonqEXU9f3HRP/4HxdBlIfMs7a1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDOlIZGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mo8U0TKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDOlIZGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mo8U0TKf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWODL1155198
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=; b=JDOlIZGdjzix5g+5
	q6HdGfDPU13TwLARMH64QvMItNgCt3Xa8uyI2dpSNcuDnSWJNt+oBYOouga5ohv9
	ZG2lz5+0x5auM6OCtMzfLwTRiAIjwPkooGqmVK+/my3fQeP+FwEpZudQYnzWMS1t
	sTOc7QAGSxgrsQNzGGAv3vY4maNWB98w24ZwsXqvO56d6IQCAFC/sEnJNUek9vdr
	X8yDdiZyFvRocFmZl/1klIB0SdertDU+cXNSFp5i/zB2qOj8cWVRM0LXblVwHK0y
	DiCPR/kYaRAnof5O57UJZ6Y4iT+0rbzQISEyhC+duuw2+L5yV9KjlYk0A2Xbkxyq
	MmhqwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1pb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:42:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso178113545ad.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727719; x=1785332519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=Mo8U0TKfPNIFf2XrlgndK0aG4RpHuEH/3boN7jEAzUQm6QfYoLXanuvVwGH01o50tB
         Zico96iXEZZ5puRrzEEozVgBpyv7vemp1TW9M05lDn/RiugNy+MP7Vyk+rBbbHA/jenK
         qF0md32b1tNV5L9cGsYCHGeuqZK8KFH8U2KqXUDeOq2qBIes2ZZDpkfEM4lKcCRvluhr
         YcXx6PCPlTuCZ994PLsRBWblUgwrltRj85OJeJd+NGcbiFSlDMB1PXKfG93ibpgHt0X9
         9NbRzT0MirKl9n1RDs1JIZ6MCTVdUmiY9HWoU3RZYq5RU7hPbx26jFIBXxD4d9DgPnzR
         a+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727719; x=1785332519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=BAcHLn7QEd/dG6rvhB2k6mhZE8fj4bwFosOKDSOpwIv8TzWT7snY7f5RacrepUOL3A
         CTWnCk6r7/qPQYY6uM1LngNRle34Ez964xksnAM42z6m2+7sZCrYslIRVCEACsT+6RUk
         vRNMIni7zisB197VU0yDXjlQcCXBcPUAOu+sQsLWwnFpSuwfqJg1LzwLnjzn7Y3KhfX9
         xSd4FHVonhVZvl4b4Gei1bgjuKKaBXTK5zqPopLoytWU5BbyS12f9tQPRz1e9p+Ji5ng
         CmWJ0pSUqNual59IDEEnR0ZgzuFDrBegZc2bV22lrcLzmaamnAmcVORHelZEUHQepZpZ
         l/yw==
X-Forwarded-Encrypted: i=1; AHgh+RrELDnU5V2/DhM/AyBpc2yUraCXlgupVNDjUDd4wCCG9w6EZ1rsGbebKEDpbq4GbC9nUcQtPmHB0Mnt0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDw7zPE8/6dD8Fkq3Psvev8eZpXnkgsBgtISDoAqDmZL4ftL+R
	lj1QYJMoh0xiSOhE5C9faS1Tnh5Dm2kicYlZ09dr9cdC3sCR8d6fAUWbJXoZx3FypabDPY23pDB
	hcvrEUQqvSq3hAaoc0YrS6Sd/WfYKrsC/KImghzzVJm5B+O1cgacko6un+4UCIDyf+Kwtsvb8ag
	==
X-Gm-Gg: AR+sD11s7doM4GAkHI1MBNCi8Sna/vnloecZmrQ+dYCEIr3jVqLZt6MrnNAJCzgWnvt
	D08DqGgXaTuj041ocYzV2SN/JAzl4QgSEYAnyxY5F0/xQnFWmoHjRpLFwy4EGE31+jYbuwESK0m
	8dGFT5Egp5NiKcyUkWEkBG8EB7MjuFpvRstt+KCZAPEOYNwhc18qrBCdQ9gjGtjaZR4c2m1BNJd
	iwV2Cb0oz2MEJX/phAcQhfc09csxHevIbUa0RNTMWAELRppDmn7iuHcDz0PGgTckYDePdbm3npH
	p9BlYH99HT52Hj6TGJtzgR/dVIP64H+wHNmcCmDFP2jwrNkxq+0Y2T7E3X+nCLL4pQ1jCA4oADb
	lgl7UGer78cRYhlaQyW9hufsroy6d5ebLBdc=
X-Received: by 2002:a17:903:46c3:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2cf34885b75mr249481835ad.14.1784727719532;
        Wed, 22 Jul 2026 06:41:59 -0700 (PDT)
X-Received: by 2002:a17:903:46c3:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2cf34885b75mr249480245ad.14.1784727717542;
        Wed, 22 Jul 2026 06:41:57 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:57 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:11:21 +0530
Subject: [PATCH v5 4/4] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-shikra_vpu-v5-4-3d80babd4672@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=900;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
 b=HWId/SX7aAyEaq4wi/UxnTTdt6OquIHfj98ezz+HGYl0tHsy/BoRvBdx9goia27gXFL7YwFnM
 dg6nyY7N1YVAVSmP5+hhTMS66nMYZk+fwuRnFWgbAePasCwgCKqzEFP
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: WJfUDRH9-Uo5xz5Uo6MZwWX-R4ZBaUYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXyUGCRPlgXO3+
 EzawWSRNFUObjJkrx08zIEFWVG8t8DYEeb7AYRw+DEa+Dc4L4griCJoiDU2ehUCrIiep975uFsW
 YZwwz6lzYHUzcthyzadzRh39f00ZlDabFHxYEUwMSlvHZGGl655dkgXTExb8PlYyvE/kRp1xgdf
 ilgM6Sm1FunwGJOIBlw7N96qxT2c5TU4camzT/ek9T87Vt7MHIHMQdpsb1AR/Y+VmPL0O4xuOHe
 I7VRz9CzGCO/W9XhYtH1GoEnkAyZXHWfajIy45UDbpvfo5i2JnOlUuu6orXTFq+27Rjgl2NiNOO
 Lq+WrY4jov38y0dt/JZOiOhdpZnZisxmukf7iSKMe1B2qY23kTHst30bMWzryoW+pXawXYhM9Bh
 woGLsAErywmevvdZMa5jrGXfeCNj0TT7caqCNFvCVVmiuqSTR7ZWJhrodehyP1PGNHcSOf0+Nir
 v/Zyv4VJdSSUBzQoBBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX/AvTYR/N1lrF
 xeHBN6I2L/PPZdpQg5LI4cAxJHKfePME57rYTPHz5l3VmHzEJeP/R40qBcK8D31VwijxcyKJTXx
 TUAGaaU7nyuU3tZZ4ftStPrRDC2jRIA=
X-Proofpoint-GUID: WJfUDRH9-Uo5xz5Uo6MZwWX-R4ZBaUYW
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60c8a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f76422d57766ba34647010c690646fdab..696df7c9a7e0f7c86955066e76df3d8fcb8bad1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

