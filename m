Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971C4F96C4
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417291; cv=none; b=bnXL/pzIZyxcVS+nEc3WwoOoCgrMz5p8xQ16Vu96YF87futCy737ynOSMk/wTbun91imi56kXj/GdBiNV1SpnlcinoQ2iLQMtDeTpYVyirmrtOPd3A6bdhqNEugdJ0prOHMNQfa5jz1k3rGXFFdoiPdPHRRq+DaQ1IX8Z75Hq2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417291; c=relaxed/simple;
	bh=3gU5+mX4WzzVkNWUEr871Rixbw0+MCdF/oblinxoDHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUp9B5F/PVD8a/w1USRiUCLbX+MdyScuXCDHcm56jurbpkb68qEUptiaXmvYwj5lfAaAabHlSknPwJCz57xiveJPQ8FMXE3u8A7M3m9+jmP7wLOQcTxGq+hUhiUv3ms1geFV6XE6lGPWsNY8hEE3ua5BTUVUdbvl1ssxKeH3jLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/66FrZ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCrSM7k/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/66FrZ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCrSM7k/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P0n82041862
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJcTCN36eywvX1rEBfwac/27NnwRn2fb3zuPwwnc12U=; b=M/66FrZ+SNbAt0ZS
	jWl27+08dlIIGUinjfvROV8/9QKJEfFHY+AFYbwQDkNross6iamjQMPa+TxaJygZ
	ARJOpLA2hmIp6fy0Qx/3fEgv7eR4Oqe8/PMx+agoXBRo6aniLRg2mCotkfyVfwNi
	W716xoNBzEfZJw7qywt0lo4rU5DrxuOm0nXolESJB2PDOOHLGMUVYcLI7fVg3Bwr
	pJuaeFer5vfqS3vUxMhpc9W3tcb+qDmxYfoTkcVY2Gztl0UhFYK2OOqeLBzizR/L
	5F5T6MTguE6r0LaUBt12K4/AL0+/OImMHUmfBz6lvTfL+8d79xY5wXRk1Du9sHvn
	HWa1fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2y4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso298798085a.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417288; x=1793022088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJcTCN36eywvX1rEBfwac/27NnwRn2fb3zuPwwnc12U=;
        b=RCrSM7k/0+vQu6LTuUrlXOenOKhKKOWNWVXELb+o9ZpoeIwjvS1fDFCMrlGWKOhwxT
         3aBCHMUOnw4jewMjpgV4htC3fKTRKA7CYnVVy6DvyWRtPa5bMS0AloS4X++Kix1u2cU7
         qa4pQGSY1bdglPEcHPmzyAFeVHhos8aeLeE9/8sPPueD+y3DFNwRHgqcaUkOIJWsRszR
         nLabGCuJZL/Xk6+nhv6596OKII1+ObtQXu74ACdc/0VZxAWJtJs8NoomGaGJYVPf6ZjA
         RLcPT01aI8jIj95kUBIce/R+836tF7wo3n4lUolGUqIwYwmt+rHCUwAYRJqRf0eK/WiV
         fmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417288; x=1793022088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJcTCN36eywvX1rEBfwac/27NnwRn2fb3zuPwwnc12U=;
        b=XqfE7gbam8qO25lkBqMpbI/2WghKlYx4a9VgMShQgdVRQsK1rhD3qms9gsNeu+hWlZ
         i+kwCKMW//B6Hq7buoMq7mp2B8YCCVgfnIaWcq0MxZcdYu8x8Ei8xlnd4paxpHVAC6Yo
         G2HUWAxkZBmCQdPM0Ag56XrqSaLCVOty0qGuQleXnULS/4tyOTbWaaBfyI2sml3chM1E
         tUB8Gm1qpGFf270Y60JVmaV7m0ruYvk7ydUu7toIjliNyi2IWrD7BYP4H65vWLHEYpnU
         9INMApHQ8oqtxzoTNrYNG47YMJh1H2IKnQSIS1lQ2ToATdXdHmgYLm/2zZP/A5L5OEbl
         b+jg==
X-Forwarded-Encrypted: i=1; AKwUvBwxenau5dtM3T2zB1GHAJgN6W6IX00HcFn3+e/mS+ppYSKWtZuHqNtzXTY/jEmZO20KIgvmIaLBRUXuLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ38GsvTydkQdN65lukML9eUj8yAJCgSUOsHV8ZgpfdKtwdJxyz
	7H3Far1AJ5xiCuN6otXDWG//6aerQwhb8mUJ2kfAR7q0FQpfjzyMBtkvyoonVCS4KKi0mEaLh+h
	IS9+Zhaj4Pwo6GI4Zaak0AxJVzWbU9PZKTULGvBDN5UYQySUn6iQRolpkjsa7ALWstg==
X-Gm-Gg: AYBFou2xvHvTwJ6EKdz7LPRXNspXqtMa7pQbTXSUh0hTCPVzL60mHWoMMq12vB0s3Wd
	Di0+yarBI89dCQafYkt2TDJr62aY9e4ojy9eAjXSXxTdrTLlYS/gK7msZTpvwGjsxPTXTWMdJE1
	LFMBPuMvppXtrwZ2vYMZoz93nQqGcRVBNKq+BBmuZyGHWCeuED9RNeN+W29N00sQm61tek3iHIZ
	cswUuQfvlPoaP5iSkCrOTj4zymPwmr+lHp802ijf8CfNTEEz5+4UHWFdU0gXNHJdv9eztBfLPmk
	5gP4ahtWVdglVDZM1vbRcnuJ5XPL7GcdC3bP4PZ4HOtTWuFa0C/LOz45IWi4QZR3F2YxDdiSphB
	Zvc2LwHcD6tx60iwvm9lxi8zYu91tNlecSBtIEV+vMgPeVS/qat4K5o5enb6cyad+UVSmnRGlCk
	1gS2ic2ysfIeSZ
X-Received: by 2002:a05:620a:460d:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93f29d7ae9cmr1175007985a.57.1792417288170;
        Mon, 19 Oct 2026 06:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93f29d7ae9cmr1175002285a.57.1792417287673;
        Mon, 19 Oct 2026 06:41:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:07 +0300
Subject: [PATCH 08/10] dt-bindings: clock: qcom,msm8996-apcc: add the
 MSM8996 Pro compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-8-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3gU5+mX4WzzVkNWUEr871Rixbw0+MCdF/oblinxoDHY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3zCQqYjvzaYogPZ64/7C4eYAZHu7O1S8wVK
 /6OMcFIgNSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8wAKCRCLPIo+Aiko
 1Vh5CACld7HSH5zsaE8hc33xx/jilewXOU52WVrxXvMxr5b/zF08ctTw2RkcQYYpiqhSN+rKQr8
 ujURvDcqsyHSV4A2ZGFfvOWu9dPu5Q+xAmw2f2utUBAnWQfcyxfMczju2VvWSEBoC4AtMav+gdT
 reNHzgK2WINu8v8kjh7YP+iWSY3VGOWShdL1qVax75ZBp1jIphT0UydL8COgNJ58Fgt4dUB00XF
 O41nKzgIBPJHeF1/Bnajfiz08fV/FSrABwrU3JAd1e2E4siNJNgqsRdduJFlIftxhKm/7/7bZkw
 P0cqTSWnTycd6V0VjVUpojcLcnb+z5e+ErG4qQikIFnqgsyC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX0Nu5Tdd1/zCD
 ezxO1uPWIbwYjzBmi/oMB6wO0bVgKdrqypuBZDGd54dwRTQsReQT3pw/M+rE5QaB83DKiRkoHUS
 8jVzeVxPPrc3DYNntQz5hmwYwv+J9Os=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX/odd7UUceoJw
 zsdqWF9FUTwBP2NcuuxfBpMbBhVXF80l4lMoUG8BE1RJ+hRjx8z5RDc4DPk0btZ7PVlSLvkQh11
 s/kAMoOfIB7I5H45e7LkF7yqIIZYRcIoYgkkQKcVE2yIQoF2iJ1X5IelKcXsg7eja4IZKCke5As
 sy+Iqbb1p6dPHjk0QXz7oVU3GqDvzkPPSzisJVSfH9LgO6wzs/xf1AnB1ZSsHIMd/MSPIb2okFD
 OaxpyNFDkgD1U9UbITGoe6z3uAnfyzAD339dUXwEu41GLjTaGeZYE86/F+7B0dFUcrEwIv8cY5y
 GoUACBT5KSPUzpjUHeS10M64B9Vjlk+L2JHGBSKzovF//LEtVhCpb+7mHE0UZ2d7AAk/2uuOpx7
 mF5mBdHxgAjFv22wqRUVGudmzMbIBzy0bnPcsZe/YrSt/+lXHqgrPFXYmHuJ8OUF4fX00OUpqFB
 iEnTInq0pl0WXtqEymQ==
X-Proofpoint-ORIG-GUID: CjvhqbUSO5hcVwf3hj7Ft92FrE1thgwp
X-Proofpoint-GUID: CjvhqbUSO5hcVwf3hj7Ft92FrE1thgwp
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad61e08 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bUs1gMxecmeFkUrvqhsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

The MSM8996 Pro CPU clock controller needs a setting the MSM8996 one
does not, but the binding offers no way to tell the two apart.

Add a compatible for MSM8996 Pro, falling back to the MSM8996 one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index fcace96c72eb..e036749626f7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -15,8 +15,11 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,msm8996-apcc
+    oneOf:
+      - const: qcom,msm8996-apcc
+      - items:
+          - const: qcom,msm8996pro-apcc
+          - const: qcom,msm8996-apcc
 
   reg:
     maxItems: 1

-- 
2.47.3

