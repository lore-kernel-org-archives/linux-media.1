Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846127;
	b=mpvmW/8P2IcG9UhkD9mXQPIbV52URENxhE3FafqPmjNSRy3qTT7rkQMFib/7DAIG+xZB
	 M4cUp4B3WSB7Dd2Vvp6nnf80UWyLRhdoauXeBWC9HbpbrhlKgrHJnGNgW1ThwMP0oK7T5
	 +9gfxchm3BRykZGzpAqEcCWzBeOW3hyEJildU+QNCvyVFqY83495EZUySILV/FBfi62LY
	 3Ikqu58V/t7G56eQQhoGFzHANM2vCED5pPsp1uF5ByvO4iP3Nn0IHArrQ+LiK8ME10Rrz
	 YVd/npzgj6HCdUp5A6zS38O6n/UCKP33MOWCOU/l+i72bdy4JqL7IOUtqxxQrSGGenA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
	b=CyWuWHGy9jW5ElcCzFbcfPLMhdxhDbE/MMMxvzUOu0fa+IDTkkmtjcVBO4zc2n+YujkD
	 FoBnAN7vgD0C2l1suAv4pWVBKt4NWLqA5lO7S3E4hmBY2krIxpKE7C6iJrMHStTKSgj9y
	 VzI/kBsgm41N4/nJ/y1tc97KSVumlINcRwNhQ18CpSxTOPBKwTpfhygTbPuOnMecnw9jM
	 LTbe/mIKPBbT+euI5rRBx3gWDy26iBoflwDLYnRgvUEZfMrw7bVFDbhm/yWr9SP2v5s+2
	 XNd1TdMLCkJRHsMPXvpNbTp9+7GRAHrwZFRtNXqT25kCREj9j2F3eYKLqL+ECTvyAHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn6B8mkZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC54606A329
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC54606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7OfNETp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn6B8mkZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK63n3692958
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhh
	O4gHPm10=; b=p7OfNETpEr68CLI0FHZnru+WSdSkOWcv95PEkSOO17XhebYpD14
	DfEypxXf9qv30Nno20G5GbZdH4vUA3yytNSqTdr3jQyerOMYoNX1kbXLqUeE8Xm3
	z2Amb0sNDDdy1hNjpFWoKsJuhvJIplQtmtAZGdMXE+f5NlINe+yFbbK4RRC5Ytyb
	tAUx0aeQRf8n+viyoAihM06FWVfPSZD9kU71jhEz7na1nkNmtBuqcuBgrY+rrbAR
	ZFAyEDhlZ/4gSypJ2dXu9AQmSvDFrhSrR2tpFFbE04k+Y47f95sguXhUF7fnxqGz
	TLMba/Bnqx6GI/MB5R1SWBV8ytMR4dK7m2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f8104b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so5163179c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846123; x=1795450923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=Xn6B8mkZSfmNeEcNaeCxnrHt/+2ZgdGHpcMa5RaA87K7Hbkk7M4aPYMvkrEhFiZ2vm
         Rar/ENgh/HHaZ4bTPH4FLFFlLcYSD3ATSZWPZpgLjLTwMNzBByyDlqWlJauPNryGHRlQ
         69591C/kHb280LmTy8Ch9EnuOFohfsuDTq+ZGB4Y0GRLTQXv7SCQn3Fat0dxcV4jpmNN
         SZAWwunZ+vsmhJKbvFDN4/moW3PjPJ/MCJV2HynRxRDHzuv69KIEFUYweqkseCQKSzHL
         5T4Y8lJzf+pyYLvjj9R3S4KhJ0470t2TdJLUmP4kkJETvASA6Ha67lfn+432dJvU+PQI
         Vd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846123; x=1795450923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFnPdS9OzKd2pQAuWQI40FvjqklDv0OYhhO4gHPm10=;
        b=Dlt7wtzl7XLbCRJEh2xmAh26j8Du97MPIptNYSRakxg3RbkpOwxsHCpO4OhKXz6xKo
         oKt+s+wvdE4zOGJYYXOLxXBQSHolx0lguEmggnrjUMTLLHa6Q3Kgmo4UjkOTiT+y0qc8
         tyqntGYJcV7nHJUr72OdK8PEELjajOc0nLjTLO2096o9CRPnWPUXS/xcmnixhQNk0Upj
         P2mk5vSZPO6QmkPT/ALYt6LAA+aDOyIkM/T6NrSVUPNqZ4WUYhN+gAD6Vga81qdDkHuH
         Sxuozq8r3MLkmEFDrkn7U2/X44nnfPxBUjWY9BPOwoTy402gs+b/Lip02lm8en9WVeA3
         dmBw==
X-Forwarded-Encrypted: i=1; AL+hErEtKHJG0mmwEHekWJaz3/vat5nn2mE3ugUyk1Tab9Dl4aUvH4lSRgB8c3bXLJC5ud1/TL8ztNz1vKk3/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jsu52wWNajmyfP4hrwiMkvTS9Sl3RFfyxBoMfdeTcM6KLsLCS
	joo4ijdo+9l3pj3030jdEho57Ae5JqkABrYlo2zl9RtHNJxi26R/h2P3DbhiRBh9c+P7wKiD1XO
	CWAdeiwylViH6N1mvihCDlJWkINFDI9pPaFtaQH5uavnOkZx0AqgyaXNIy80Ne72b2Q==
X-Gm-Gg: AYBFou3BXooZMSHfTxNJd5qfAeW0eexJ1ZySp/C8oitb2sLpbbmdi12ns3iqWFfO2qB
	rdzI1sIolTGx+utJ16uP+KMWSzuSCup/uSnzrfsWbeWpUzQelG8M/OUz3WjPLzG76XIl4XpsT9L
	vqM43dYEbYVaCJWkvSGZGJRVU7ebOYYcxCwiuorFVNv54acvJut8hMlk8FNz93sNARazBkgmhFr
	+qq/MFLXFLG4mh+vJWCFtQHv7XEoeKs/hOatIidfERtVs+foByWxbzEyZnzrRTDTYA+n7AGSCd5
	i93KX5DWxpSiSoSSNW116rhL4mmxT//yk2cEi/E+PM5vYfE4GYkuvWvfYl+hoA0zbsl3/YDJ8yV
	J06oO/d8mMUkjqGyDa8Kc6HLEfQJujgEOP7rwgN9Ec+ZhURM3zDuBRHVNQMSwAegmc51OnMZEVX
	iJ
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928424c88.19.1794846123270;
        Mon, 16 Nov 2026 08:22:03 -0800 (PST)
X-Received: by 2002:a05:701b:42c6:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b503171008mr11928366c88.19.1794846122515;
        Mon, 16 Nov 2026 08:22:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:01 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 0/9] Migrate PAS clients to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:39 +0530
Message-ID: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6zR1mwEeIhQT
 h5Kdz6HXstr2EQ5w12XjGYhsyMurHyvfy5pKoaetVRacf0e/IX1NQXl0irvvD6MNtVc2vovO3a6
 ExWzuGN09Bj82wEbrUq0Hmu3cQv7qnewqQWPsOvbnvx1d369+yV+trylabzNfW16qNIPrm8u0tz
 LPSQjK2Kp1z+y9ieuRYPKq2DKgnDrjhdbwCiusV++6O2xO3ytoIvHwp4g52NNOOlnoOyo9Zk8f1
 knzyHbQlvE4bvdKcGr+zgx7aO8UUV/N0hOXBNCcNWByO0VyL9sd3D4gbQxE4U1mgcxmb4YDKaMB
 1hsI6LyVl+8lZcUFSqbGSKuXn7QqoXCg6zug+G+ctXsXEf49ceg3bvnSN2mz3Kn/MMwnzjhsA1j
 5ZafCptW6yqT+UIeySCKOPcIm68LnL6NBUCZxcCaqcX/aW3zXSKLA+p2WKjU2HhLMi39TmT6qzm
 yQSygX8+RRB3aOznLJg==
X-Proofpoint-GUID: z34FZCEh_altxuHZUIE_UveVzukZ8J6i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX5vYZf0R+eoKA
 TJ2JonIk4RQx0D/4En3pQ1sS7REQYqq9U25LY/AY6J5nSPxeuNAVaJgD2y8ZGXApHMvnR2qQLPq
 lV+CUyKV2zemkjYW932WI1Ds5Zx/HBA=
X-Proofpoint-ORIG-GUID: z34FZCEh_altxuHZUIE_UveVzukZ8J6i
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb2dac cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HLFs0uR_R7ZgEvxmAyIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
public function, migrate every user to the new PAS context-aware API
qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().

This series migrates every remaining caller of the deprecated APIs
(qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.

Requesting the Ack from subsystem owners to get this series merge
through Bjorn's tree.

Changes in v3:
 - Added Acked by tag.
 - Fixed build warning.
 - Link to v2: https://lore.kernel.org/lkml/20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
 - Addressed Sasiko comments.
 - Addressed Alex comment and added 1/9 as new patch in this
   series and use the  API to other patches.
 - Commit description change.
 - Link to v1: https://lore.kernel.org/lkml/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (9):
  firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated
    context
  remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: iris: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  media: venus: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  net: ipa: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and
    qcom_pas_prepare_and_auth_reset()
  soc: qcom: mdt_loader: remove qcom_mdt_load()
  firmware: qcom: pas: remove qcom_pas_auth_and_reset()

 drivers/firmware/qcom/qcom_pas.c              | 42 +++++++------
 drivers/firmware/qcom/qcom_pas.h              |  3 -
 drivers/firmware/qcom/qcom_pas_tee.c          |  6 --
 drivers/firmware/qcom/qcom_scm.c              |  7 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 22 ++-----
 drivers/media/platform/qcom/iris/iris_core.h  |  2 +
 .../media/platform/qcom/iris/iris_firmware.c  | 27 ++++----
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/firmware.c  | 29 ++++-----
 drivers/net/ipa/ipa_main.c                    | 23 +++----
 drivers/net/wireless/ath/ath12k/ahb.c         | 23 ++++---
 drivers/remoteproc/qcom_wcnss.c               | 12 ++--
 drivers/soc/qcom/mdt_loader.c                 | 63 +++++++------------
 include/linux/firmware/qcom/qcom_pas.h        |  3 +-
 include/linux/soc/qcom/mdt_loader.h           | 12 ----
 15 files changed, 116 insertions(+), 160 deletions(-)

-- 
2.55.0

