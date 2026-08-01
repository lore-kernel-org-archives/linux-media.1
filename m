Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0935336D50D
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569895; cv=none; b=ZhPVDrOpipwblWzcLDurpMAgruGBF4pnf6EwdaVAz76IBp6t1iRHdrSvoEFuejA8pkVHY3nZFzlUDGavFTv+hpfvWrFe+nfKbz8kWzslzM9JoFb9quH7U2KZnZ5sEt+SKtY8J9zrtGOKIcazkoYB6D3D9wZdQXT+gq7ub9lXRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569895; c=relaxed/simple;
	bh=Oi2ts3pd2reFAvM9hDgXRQssR5ZUrOVAm9WF0/xVRBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAwzc2d8uWG3Jg1nPIkanGSkNzPzQ6oksWqWw+btwP998dieN+404fhka6WzlLCLB99hDi1Iz6OkXdaQEGYtj/V5P+9hYQncbb/yNJqpOA7WD+Zx6n7ITxokiVPiTopcwjKmgiQG67i1tu+YjMDSPW6n5LCwF3YWKVtF8AG03jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4IKIEEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTTaCw6C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4IKIEEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTTaCw6C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DjR02066119
	for <linux-media@vger.kernel.org>; Sat, 1 Aug 2026 07:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CydxYBTX6LpQq/EH4Ur5mtxDb42yxKY1KInKEWUphhg=; b=K4IKIEEPSeChHgSA
	g+ygQgPpawXkDVWsZphW6v8eQEX37ZthOPUhYn7gnpXDQhcemPPZMQpGqjuXQ4Oj
	GQzjVprUg9Lsj+rFrfWO76PnCBFSrfxz7kHBDmYJRnEndu5uLaKALZpid48wZNk2
	miH+AYxctrYSFVLozW+uiuPWfYDgg5nW5NZOu/J71gYdhihW4xj/OvkCRXd05qBt
	LCyDeh2XJwTWSDpe+3Sxy/tI8ctnzr9cZ0ZeSctRJAYlHUj+U0ZCnnzwRDU2IFrk
	Xu73dyw+TMQ3sERzB/nsNeqhydvNI+R3r9exNAqZ6JpCFh7bIuVutogGvKroEHb2
	nTTbgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50g4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 07:38:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2373534a12.0
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785569892; x=1786174692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CydxYBTX6LpQq/EH4Ur5mtxDb42yxKY1KInKEWUphhg=;
        b=gTTaCw6CEGVi0AJLSkjGjKuJUgwzBY5T1yN1ucdxUGGnhtDRN7LKdvMI2OWBibMtqd
         ASn4bZZ4gQZSFVB7ZXfLlvt0ebaann+L5kFg8qklAkOnwe4+YYbppxEm0gkpgaE3gjqg
         bCTo1Cs6L+83z3MYFHw+xAOext9F7BxTOosClxeJ8DIvhRHEQ+cIZkjUZWep+IKWB30R
         gQJcc2rTPlgY/9Uwgfv+MfwZ0ntUz56zup+lI/HCPLtrf5S+1h5UJFA0ZvmkTLUyBhCZ
         4hbZAlYRTyL5aWV3KF1dFHUtcIAkIcYRd8aqAQsJL3N8D7fHWxVK/a1R4FK47xLnuicl
         qzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785569892; x=1786174692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CydxYBTX6LpQq/EH4Ur5mtxDb42yxKY1KInKEWUphhg=;
        b=q5hBmQGboy2nvlvC4EZFUyPdwmHK3i2UmEQJK4/Qq6XuHZT1ybNXn8xZW1JEI8xhuV
         Zl856yZ9lenb/GtXH1VYS+4oCeDA4c3vaD8dJrONEdin2kgsMCzkcBT+Tm087cZcMwFl
         GEB8wGxTEZvCBsIX4fKsFuaetUP8dOzRJ0HDfTxo4Lg6943qncKNIHzK3QsvHsssmICB
         QH28U/ps0j31IjfNEEAOCi3eQYXvenI9AvyFVjCJ7AGPZfjHl+Z+gsF/M35kdZnoWMpe
         SbkxEMFdfH1ppoYgqbxrHezQZDoaZUtbCGUdshKQl3tKJA9aO0aD2YGLdCeuG0XLVPVf
         7XkA==
X-Gm-Message-State: AOJu0YyyujSiq2uxq8RnWKooTlvK4hEQghzICaiHYEBIdu7EZoG7EnUG
	r0dFaelUn0igDtUh/reU1Fa6o826rcHMDrbKXqEq0MEQhhonc5bP3rb/QOiRNugNHFJ9NzmDCE2
	Z0DgCHdO5AYVsbwktap4rUiUOOauHP3AWh3/b6hMzjiwMjspD/9PbzFZ0UFsLh+UBrA==
X-Gm-Gg: AR+sD12GiHhMhrIMxgKxfRsTlx0D0Kt3rsCvB4W3R30BDEI8CaWyiJw30FwmFxvaUJk
	eowXJmHr+loJdK/j9elM6w2Ht2lh+lRFiluPfY2hgF1RbkZwo538mBv/OfSlyV6AjrR2EcqyVfb
	xAhhTNT/zLHbNnaHHNQ7JNLwlyhFQspkhg68U4aoURY1rVrXV++11ZkgD+Ij5ItWjz+r1G/DCM/
	aUGzVPXhQlOkwofHXCr8CfBYkRbVAEZKpnPJ2bA808IIBs+hJnbk2NLbuFepy1kT7P09pT/AZHL
	v3N3IAvuySzK6tYSiNjXIWaaOMXnSa7X1MfW7RIWj3TeC/GdaLmiR5lpve0jkFMPWvPjr9P9LkZ
	V58fZZmdP/CjPeorghXf6wQ/U5cGRknMdzg==
X-Received: by 2002:a05:6a21:9206:b0:3c3:8f0f:b6a0 with SMTP id adf61e73a8af0-3c92a813063mr2664453637.49.1785569891815;
        Sat, 01 Aug 2026 00:38:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3c3:8f0f:b6a0 with SMTP id adf61e73a8af0-3c92a813063mr2664412637.49.1785569891336;
        Sat, 01 Aug 2026 00:38:11 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm20729985eec.19.2026.08.01.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 00:38:10 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:07:28 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: sc7280: Add dma-coherent property
 into venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris-fixes-dma-pseq-fint-v1-2-aba0cb22f6ab@oss.qualcomm.com>
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785569872; l=1722;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Oi2ts3pd2reFAvM9hDgXRQssR5ZUrOVAm9WF0/xVRBs=;
 b=m5eSDcINrEApmPCymeCVlrmeolRlRb4OSogXRA8j9ihD5GJp6rRiN8Qrf4MFn+gPj5q4fIK8k
 hZ8SADBzTWZDDHtc3K+K3CP1lo1nw3cmrT/nocQG9HPRHmqNk/ul7M9
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX5n/SNcWQ6bTn
 IRL884uAW9O6e2WP4oKfulqTlZ/1WatqSO8aFN6pmG+sah2VBCDqdGks2XLXcP8J43ZLtaKPPtj
 Mu0fds8P3MZgU0/u0oYJai6SfAjRb1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX+gM4IJYZyQzT
 WJyJQucKv2TbQ/an6YvCB5pnewZE0BJTq5LXUq6PVTKz8CwU7zQLbfov2orlTo8JMUqyRKL/l/F
 ZovVHBbEZGY1mP5cHYgOz+J2FhMuprPEQKD7EgCNObQBP6CpP2VLrZQXOHjL6ypKuYWwNq7IQO5
 DAGf0EDO+EskU5FzX442RnajAQ/Mssc/TU0ZW07SfGH/AKPTP3g+AUsD2jEfhitR7oGUbl1Zl8l
 3SoqYVgVJMG4Jp+kyB69WpNWhw2wUTnKti7oHmwJGD5iVl4kgR6/FSeRZKnGrEBW4fwzhAog/w4
 5qRQKb9DXjZRgHS661lmxv+6zAVPmqk0Q5rUNPEfMg6SqLmv2DTytGOOUSpAfPJ97crtIOMJWnD
 Q/ZA6vmZb8BIxzMSk1rAwVwD9gZoKYlmOWsJk5LtMYWq/AYtbX82lT5kUPn0CeAnroLN40TPAhP
 B+whzhfKFgjYCBv3AUQ==
X-Proofpoint-GUID: p-3ZxlKjB61vBIYlK78WhDF-jmB8xxTm
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6da264 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wPaHxwV4LXfiR_c0ZecA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: p-3ZxlKjB61vBIYlK78WhDF-jmB8xxTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010053

While testing with some higher resolution clips, the venus hardware
triggers a fault due to wrong input data being received. Corruption
was also observed in the captured output when the client dumped it
to a file.

On debugging, this was traced to the venus node not declaring
dma-coherent. As a result, DMA buffers shared between the CPU and the
venus video hardware/controller are not guaranteed to be I/O coherent:
CPU writes to an input buffer can remain in CPU caches without being
visible to the video hardware when it reads the same buffer, so the
hardware receives input data that does not match what the CPU wrote.
Likewise, on the capture path, data written by the video hardware to
the output buffer may not be visible to the CPU, so the client reads
stale or partial data, resulting in corruption.

Add the dma-coherent property to the venus node so that DMA buffers
shared between the CPU and the video hardware and controller remain
coherent.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f74fa66f1a67..98184760b4bf 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5024,6 +5024,8 @@ venus: video-codec@aa00000 {
 					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "cpu-cfg", "video-mem";
 
+			dma-coherent;
+
 			iommus = <&apps_smmu 0x2180 0x20>;
 			memory-region = <&video_mem>;
 

-- 
2.34.1

