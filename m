Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341979;
	b=bmeRYfYdpXLyHBUR20uRxwP3I7lXtEM4KIy6eS0jMHfu/oirIMaZNRKejScJICt2jaHz
	 YJCFUAiPZjGZN5YnZNNIaW8BkjmHApoknQD0edQiKjKFG8lB9tisIkmpLY3tM2bG+MYHy
	 ZeuEjpLxRDQ+/PAyBAmGs054hyYiJuXQ+6p7u0o+yuonSUIWrgzz7vUtFyMJ05efS0Wm0
	 9XYCzxggoW9sd1/XKmxztzZU63QsHxtV+MAW1BS9eSwNoAsWyDo3lAT15sNjfdjzt+U15
	 rPOyY1C7b7J01E13f2iTDMlkQWzLMbN3tpDzb5FdK3gvWBDey5wtNjlFvBViwugwE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=beTUv6ZC0r4hmBh8uJ0k1FYHfA/4l5fpP/vwiQFYCVU=;
	b=1nEhZNKSPKTEC0KDYhBAOO4QG4QRlmL7zfNU0Qei+/sy8YSG+lMxeUzMth0aJSKQQb/j
	 qVUsGgbd85EaCgnHwujVZD4yv1a5F6m+Vrxf9B/aMbivXse80wm+/EmhngOXuuadhCDGI
	 DELin5OomQcGrThMi5/9DVTDUlGEFv0ni7H82gvB81OdFOos6zc8assQphumHRMXbUmJp
	 uu2MjnJ0eiGODel/8j/pJ86MRUw9+BXLMPqz6NYTDvYfSBGu+a6uDzsyX40V1tB3V6wE2
	 Rsowe9KB2tQfWZdL4J18h2IO4/x0kkuWFsAb6awgCWvNVgzI/nUWgG5zOpETOhF9wnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pUwx2Q1g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SyBetCcG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D672606A323
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D672606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pUwx2Q1g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SyBetCcG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FBsq1367519
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=beTUv6ZC0r4hmBh8uJ0k1F
	YHfA/4l5fpP/vwiQFYCVU=; b=pUwx2Q1gKlOJNLIbDstDUHE4Dr5wqQYakiw+Ub
	f6g707vM0ePbXU88XAFcJhZz1NKAUtf3hAU9kadAJzAgaMzX6T5ykusQTJrrVIO7
	xbii1nyHNPX6jZANFStM4jNPhV1TiPMC0Xfurbp9BoJa6ymTQgdSP5KjPqGeZI7m
	uMmtyNjXGo6ZzU6nMQrJiZugxRATpINwD05yc6XwJgUBkTH7P4/KpA1KmbKz7fKg
	zh+rdAMj1/EA+895ZMDWd8UYFCB2ZyuOFkDiHWjZtHBEb2XIwjeJ6LDCHnPITq2n
	5QJuGkFYLB88qL5vZW27ccEzi8RshIf9aObZi72DrOI6AvNQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p9hhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:32:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so1915457eec.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341978; x=1793946778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=beTUv6ZC0r4hmBh8uJ0k1FYHfA/4l5fpP/vwiQFYCVU=;
        b=SyBetCcG3zDR5Nsb3bNev4SWxdOn/JAbSrNKfVMo6KO5YNwbAVADnpyJ/6Kusi5QWt
         YdcQ+WoHh07qcPQc87UYXgncliRxDcOUml20ciIMzzdx58XYsKGDfJnwwvx4I5GEi79A
         I2hkA0Co8JYG2KTtzCkvM0X/3P1XsFE42doWSojNZA8N2n99wkPyD1Q+j2h1SABIE/MH
         2d6kn0XvvJtbiH2A2GiaqQ1MJTAlQEMs0zHpsmWcgG1AsZZ8gUsR8SEjgXJDEtPYUUJJ
         RnD+wMIOuvX/S5yRiYKxxS3dXrnOwkwfmkndvTvvp3HBUYU72heAWC1dEQZsUxjhF0dO
         +G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341978; x=1793946778;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=beTUv6ZC0r4hmBh8uJ0k1FYHfA/4l5fpP/vwiQFYCVU=;
        b=GUwJ+zzA81Kfjmnt9vxFKkKUHDgrHoUppuVA69Laar4qjBTmRVGbthr7BwOZ1JKvWk
         VAJUU7WFd7itsGfE3z8iFKxmvee95ptWEQLZa5bBFpoUwEtBJCperSSj9BBMZoTx6k3l
         xtnzyMOir5dvlpVuBo3xZrpqwxxDHgtL02I1kQ6NWdIkf4b23lx2js539qbasRa72v0A
         Jg6HQoLlguTrnzjqMsgr6N8geZIOez6rVTXxqHo9D3NNtyjXZKtEo63kY7/aEArb1BX4
         E+/RPa2WmooC/bXTBFX6DIssGiuq7uY45Cl4Vxu5LrKcCKc0zvJu3dSIH6tkYOxbXExP
         Q+Tg==
X-Gm-Message-State: AFq9FYK4/jF689r15MDxOgp6ga4SVut4hSg34A1tLJ/4ztufGWiTmDiw
	1/JouJ5s3gyFjjEGx/7DXAsDbvbf309xhgWMk+mtv/eYnJE2/UDUryv+9vrzULgVCBH+HX/TXsp
	E1ptlmZHEju+E/GoPE9wjgkcQg/EXdk9bAuzEqc83lLPIA3zzdVA3YsgxwMHHmbOzgA==
X-Gm-Gg: AYBFou293Bp2IboY+niVh/ubUqERnK5tE2NaHG13Hdl2B4Kx5buNfEDmaxEHwvSNP8n
	8eld5ZnG8fpsPnBjClm2SADUg4QUZ/lLT+J+epkWScvyafo8vbsxaPB8SsMblWzRUY25cG8O1fq
	537xrlLhawdY4JnoZjqlECdYK1JVu9eCLdxPdbQFeiGbSNvDh07SkmeVUbOXdoVEoxgif7Z7GqN
	zFKLNBAJXbLz90m6WmKuGjuxh/vKTO2eOMEiSIkh539+zGliJOQvNK0bVHWsth/UhvZZJv/Sx36
	8T/Oo49x8T05BVKNbJSyhwztOBqNCphbR/zqtdsH0S5f3K7YmBodOpitkoOMbo1bsz3EwlztLJi
	oSruFxR4TFVaLGr3fNqsv0gGJWGCwiGlUAIcyTeybrXuOfo/vRUJAFYpt0CfO2ur0JscPgCQMrQ
	V2i2Kv
X-Received: by 2002:a05:693c:65cb:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-36a423b3f59mr2005620eec.25.1793341977430;
        Thu, 29 Oct 2026 23:32:57 -0700 (PDT)
X-Received: by 2002:a05:693c:65cb:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-36a423b3f59mr2005588eec.25.1793341976843;
        Thu, 29 Oct 2026 23:32:56 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm4903419eec.15.2026.10.29.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:32:56 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v3 0/2] add MBR type rate control for encoder
Date: Fri, 30 Oct 2026 12:02:37 +0530
Message-Id: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAY65GoC/22NQQ6CMBREr0L+2pL2Iy2w8h6GkFKKNBGq/Uo0p
 He34tbNJG+SebMB2eAsQZNtEOzqyPklQXHIwEx6uVjmhsSAHCVHgaw/Mj0MHRmFFe/mPrCyVtp
 IUfZ1ISDtbsGO7rU7z23iydHDh/d+seK3/dkU8j+2FZlgGnUlR1nwsVQnT5Tfn/pq/DznKaCNM
 X4A/Ki5d7kAAAA=
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341973; l=2218;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=tnGE1jsNNcOs2BMpFfCevOPApRPSWJ8iWdCJqnyxXsQ=;
 b=g9d5DaR31byDvnJQ/a3n2/zYmHdc/K891oMJgv4bl51jmiTtQ/mAzfUjnulQYBmhusdLvUc5u
 pVKYzDRgSWkAM+Q5aXbRzD9kKm6sPYTU3l8b01dfze2ZzngGgzmYfhw
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX0CNUUYirNGFL
 eMpOHpPW8kaVdHrDSts7iy06y4XhmmNr23eNfDCqzdx8m15shqEnabPHT9bp/mBKnqWfJ9/4ujT
 5FwBdd5sSEimWz78SqjBc3JfVktLZeJ1zBl4hJFNwhYdFUJi/Z3fI6t6Z9uD4vgJ/AMiaLOsKtm
 U7cqDsfSR4dSYYCVYl8tia42bVF/k3/bXZeCE5P5tygoCe24zUAom2gggbvJtBN2zYj7u18FR09
 f5TlNnHSOj7lt7l0UknznGQMgRxuhtSQLh1+P1Te2P5T4bEC3qh/bo187u0d5xD/oeDkBjYWV7r
 Qo0Xk/nztDm60vGJ5IYL1tRshKwl5y/zIXdoF2DXgFoIoGeY5/t/GKjNBLMocrbbEYfzICg/cAc
 w05q+MyosBNzESHMtJeI9BMPBZYocgZnoUP3qr1K3jJCY5fIkohOZY0qTqts5oQRSpkPKoL+tp0
 hmEonZvM1nOECu9SZwA==
X-Proofpoint-GUID: GnYcvrNtm0ZhbqXH1GeUX8BLjYriqg6u
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae43a1a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ptQNJT_TkX00A5QJh-kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: GnYcvrNtm0ZhbqXH1GeUX8BLjYriqg6u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX1Xic9JOUuD13
 +vti0qEvjBaAlfY6Jm0MXpX2vCpXSccZ977Xlx2F5H89JcULusDS2X3xv9ralI/uPp3i4c61aYL
 HajE0DFbdsQxg525wvr0D/VnBZDk5sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

This patch adds support for the MBR rate-control mode in the Iris driver.

Changes in v3:
- Split into two patches: add V4L2_CID_USER_QCOM_IRIS_BASE to
  v4l2-controls.h (patch 1), and base V4L2_CID_QCOM_MBR_RATE_CONTROL
  on it (patch 2).
- Reserve 64 controls for the iris control base instead of 16, to
  leave room for future iris encoder controls.
- Link to v2: https://lore.kernel.org/r/20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com

Changes in v2:
- Per upstream review feedback, convert MBR enablement from the
  generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
  Qualcomm IRIS vendor-specific boolean control,
  V4L2_CID_QCOM_MBR_RATE_CONTROL.
- Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
  enum, its "Maximum Bitrate" menu string, and its documentation
  (previously sent as a separate patch 1/2).
- Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
  duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
  shared encoder cap table and layers in only the MBR-specific cap
  entry via the new mbr_rc_supported flag.
- Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: uapi: v4l2-controls: Add control base for Qualcomm iris driver
      media: iris: add new rate control type MBR for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 include/uapi/linux/v4l2-controls.h                 |   6 ++
 8 files changed, 100 insertions(+), 17 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

