Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF94F5E02
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417273; cv=none; b=EtbVd3u8rtE6BZX11gKnTCC3/r6v9svQM4+7Drl9oNrL8pMbhSOaezxsZHsnMHJx5i2G/c9BEVWRpP82tlnLuYz2u4feIq7iV+Tf+fd8bXRDt8DooWHwRgLIpb66sjroQzQoCsTIqjocoTu2R+5Uo6wi38zRsHeRIJmVXFds69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417273; c=relaxed/simple;
	bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cEz+fOdo8LHdtw44YRa6ky/g7dBH/ivvMkb7FEcbqBskpczl0ZSIn81pAeeQO+TI1DfrA3Uu2kER4rcaSYWKgODWPf8Nb2+QbRf+kplflxu/Lc5bNYdDZI33SHIqocbOKSRU9N0rlZ7PNlov+mWfr6ElmH/O4nD+id+v/MTSWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz9ywKlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdSZEukm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz9ywKlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdSZEukm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OnK73256570
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JIsIH+g+At8ckqxE6xPOTK
	qkjwbD/YQT1Oj9C9sZJVM=; b=oz9ywKlox3/Hy3jO+MSH+1cj3CijwlwykxXYd4
	GZvC2emjfUt5WBFb7WEAYtBl9wFSvGBIU8zjO0NhsWmtd6WK2o1RtWwl1Uoh82Xo
	b4zoV2va99Z6+d5vER3FLuQgnV3Tp40gDhEJ3B0KP5+cWoeHmAfdOrgn532vUdPT
	LZU6uzljKM0XD6vSNHffqfOSD0jGcq3iwH4tllUdqfVe8eGNboCjhs0pXzz0zR40
	/98TvsPQ3E1TGM1ZgcoOiEHS81ovLqafbr4Qx8gC1N2juRHrqur7ZmOqsNvQxyaI
	3T4IXyd5MUKDK425E5EC7rD/KrzH5QINhMMnla9xH9Om7sdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f9bc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so362558485a.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417271; x=1793022071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=XdSZEukmrPJT0agyfdXt5+nlZKqGDjSsnM51GsP4lPfUpb23XMSc3D+U5aQqvhGW6E
         N3K1aspIHC4KtpJwWYHnweFH4pGz2nqEJk/dbYspFlz3cp2dsgvu+lqemc+xQ22zVuXg
         q9oztJikReOgcyTKCcJb0EYJjuWtz/QAR76Nxmm4hnu9Albi8E08N4gF8z742lVnkyfr
         s2vhjp49Itmh5htX2nzXT9LrslPXUuvr25aDIbipHCzKgkEGvHRlHjrjjdM7m743rpz/
         DYXemCv6EC2skqRVZaWoux7kAZIAZDvHZlAqn5jdS5bB16u/XXS2OriETndWOc7NBdox
         HJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417271; x=1793022071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=Xy0w5IYZ1KIep99iEBQyv8q1PZHGmZJsSAubJ9eiPwgXBdCvNPZ1xIzPo1+KhihOSv
         P28WJzmZg5B0Vx3RdHg3dBKWg7JsghFvwqpvyqjh/nwYdTb+9jeuz2Z8fASB4slYVrzd
         N/LzgP5DBilGWgdLxsPYp3daGopoVoh3fO2xLwGvj35acHEeegBoUtQBQ8Cpfxwy52FO
         8gEPYYJiLRJH8gl0bPVqXcyWkFWW+TqgbtXnfhwkNxb6r0F6wzntpYzE/o/pfuLbtgJg
         EUm9tPJGo32VnPX2slC6jIaGKEg/MIHRCecaYPKFi7dcWeWRRb0W4nSW87ns2HMfw4P7
         oORA==
X-Forwarded-Encrypted: i=1; AKwUvByZEu/2tRab3suptI3x/86sBknTUTbw/VSYPl6EnTHcZ0YNz2wTX3fGewYYO4JU1zfFI6lfOklNgk4QuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbMMLsw4r0q89t59/KlR8bVQBlQBvMan6P3ZvngtAAHz9U9Id+
	TJ6ccq9STzOxnE/edXhzql1/EuAlADIqcPigTCgo0GPzvOux7tIJnxNWRspSwwEu+IiQCnTHbfl
	8K9Vg9nt4nffTq/Eq2I6A5s7neYQfTQfAZl5pGueDW4eLTR461Ci3rltyrYb18sFyRA==
X-Gm-Gg: AYBFou3ea3833lDuSnH+7J3fTzl1bWFHEfDjFv7tL2D4dYOmiB+2kuJ5xJI1HBF1KWl
	UhRoSvK0y3rrFCWMXCVSIel+oOG/jMNVHjeZjt+EBKbTVZLjwKwG+shJI6gGqKhk4unc9yYU09a
	9baZ4fi+5PF2ufk+zRtbtqJ5fAkVXNdaqKXwxs8uPDOE5fPAoWIgL7yCq0VLd081yBNN4sKGRzx
	tSMFRUIMhwO6ASycbC0jEZrftkmmtZaPKNKNw9RHb0pq66ZSXw+Mt2u9K+86wkBLjMUHyaSA53X
	0kPciAPk8usxj7Lno620vBUwMmKq7u8CwG23V/Z7mBM28anBReWHI5xj5DSh9vphThsdaraCLiQ
	a2CUcG8G4hsfZ+6SmF+6YxiGyA3inSb488NbSBQpf8oCrYLZHjVlko9Rxd9Zr7kq3klii+rvsQP
	RUmbeQ1HPQuh8T
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310686685a.74.1792417270479;
        Mon, 19 Oct 2026 06:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310682585a.74.1792417269933;
        Mon, 19 Oct 2026 06:41:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] clk: qcom: several fixes for stability on MSM8996/98
 platforms
Date: Mon, 19 Oct 2026 16:40:59 +0300
Message-Id: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsd1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3dziXAtLSwvdtMwK3eSc/OTsYl0zY1NTA1OLpOTEJAMloMaColS
 gLNjQ6FgIv7g0KSs1uQRkklJtLQAQUlMOdgAAAA==
X-Change-ID: 20261019-msm8998-fix-clocks-6355058bcab0
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
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3tJd/TqO3nKhLXa4q4xYfMfvjF8OD+hnJ2u
 ndYqcs12BCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd7QAKCRCLPIo+Aiko
 1YEUCACyZyC09kHN7FKDl6bZ1ufmSOc5N8Z8KKObSXnIP66Z0Sj3bUq6li6L9U+1l8KfM/WvLZ9
 zzrY5UMnwR1ftVZRJl5UBmMeXddc1pWNxhNibhNRfSHvwR7kzkvDcfITaNUYXWFM7UFhu0dQpNU
 iNcu/79sKraZVkrqvqHeaFb9/lUeoxlqy3H2767JSor+iYQ1FoJa6/4C1KxpLiZt7GM/wf8Tt0w
 zFmadcBj3MhXTQ56qTMmLMzl5TCTSzuEI7tjh/h/eIyuTaBjcxvcSWtiPQFG/tbJMpe+EDIcR1K
 k/MRzxGTYsHCKK5NA+PSEUZ9A4/hV+FLrrB5xx44T2FioLOp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OWNzh9lL5wyQ7xsMmYHws3AuYNpkBmxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXyxry4Rtma1NJ
 wdBSZTpNeas+jaG//0QaamfhlOfATm5NKFLvnfq61uz+9L4J9JbS+yTUrXqCk89PHsTbkNlScDz
 I6/vCgmlUStcFb9D9NU8OjOz7C+QogZH5ACrEoTD4It4Ar4HLyG4R239NWyXSx2dGXh3wHiAQgk
 EWxOfwXQSg9VL34h2NS7IyN11ki/9VKjmCleADoQ0gEczrghZyjDTNN57JPrkOvEi47kr8JUe55
 UsNyaf/v4L0MoAEb13F2SLuu2HNU8cVx5pd8jMh99Yhd+MMMcRkuWL3283atXiR8u9Z3BhppVN5
 wJyskiFzkav5tGWjbvS47U+bNMjhsP9SdY910kxykO8L4XIC6Eez7I6pkUMgQgr3R9XfanmTk/b
 cD/atBq/svYkG5JKkOtmfDZaDMUjiqrqv6qW9oDXRYFDSl1jRLAnNk2w0TjRHiHDQnoOXChNMlS
 SuqWV7Ypkadhd6IGrLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX1x3h7ZesTxSv
 5vpK7DzptNSZa/wZyh9FIeWCBuaXTvXGy4EECOi17dNl9HYXLQ94NTXJosF81Ii4UYjAH27lK1u
 Qpuinr6oxGUheVZ+sAKnytHPSX0IB50=
X-Proofpoint-GUID: OWNzh9lL5wyQ7xsMmYHws3AuYNpkBmxk
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad61df7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pGoP7NTG_pKSZ3bbB-YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

The MSM8996/MSM8998/SDM630/SDM660 platforms face several issues with
stability (e.g. setting running at the halved frequency after certain
frequency switches, resetting if run without clk_ignore_unused, failing
to scale GPU clock, etc.). In preparation for scaling core, cluster, CBF
and GPU voltages, fix these issues affecting platform stability.

Compared to other patches in the series the patches for MSM8996-Pro were
lightly tested, as a part of the larger series and only remotely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      clk: qcom: gcc-msm8998: leave the GPU BIMC source and SNOC DVM clocks on
      clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
      clk: qcom: gpucc-msm8998: set the droop detector bit in the right register
      clk: qcom: clk-rcg2: forward the gfx3d rate request to the parent
      clk: qcom: cpu-8996: move off the ACD leg while the PLL speeds up
      clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk always enabled
      clk: qcom: cbf-msm8996: program the MSM8996 Pro post-divider
      dt-bindings: clock: qcom,msm8996-apcc: add the MSM8996 Pro compatible
      clk: qcom: cpu-8996: program the MSM8996 Pro droop code register
      arm64: dts: qcom: msm8996pro: use the MSM8996 Pro CPU clock compatible

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |  4 ++
 drivers/clk/qcom/clk-cbf-8996.c                    | 10 ++--
 drivers/clk/qcom/clk-cpu-8996.c                    | 36 ++++++++---
 drivers/clk/qcom/clk-rcg2.c                        | 21 +++----
 drivers/clk/qcom/gcc-msm8998.c                     | 69 ++++------------------
 drivers/clk/qcom/gpucc-msm8998.c                   |  2 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |  2 +-
 8 files changed, 65 insertions(+), 86 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-msm8998-fix-clocks-6355058bcab0

Best regards,
--  
With best wishes
Dmitry

