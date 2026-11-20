Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160555;
	b=k603TUznMqMTyerjVfnOX/3tTwdoW2m3PczqA7R6QrQbki0hNsxnctbNFe5WVHFIMM4w
	 4oT2j/c4DBhh9IZ4aLh1XkFW1k0FjmV0/qaSYCwT6mAReIoaTt8dG0b608ulp7G8vYr/+
	 Xqg1HNKLybJX13qWVxg7/lvNt3jHybVowT6JMn5V2EW8OW7N7hEC7Pg4tc3WzRCdT3zgz
	 AmL27P25MwinGMkG7Jm8wwv7AYEGFvmeaB0PHn3mIxt2bHUVv99/vC9NXZ6niW5WT5sQ0
	 kWW5VIcgxju+Usm6LHwyqsmeQIuD64AcLvJ53sLDbqtEViYfQ4pDu2tNk4YRsFH3jvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJHdZlygRN2jDx54/MBmSPXGD8ZnLG5eY4JP1FvaSw0=;
	b=dF7QKl230pANwH1q17cKp35iGfdHfkVThmKGajDVgpg1TdZFZTQ97bSCBTSs5tvCLkdL
	 OYlu2H0apF21HhUyKEuH2r2CY5ubL6Xe0VqopNuNm7MshnT/UgKahtHiVD3nPrvwIcSVd
	 hPhPW9FHL7qEtH1Iuq7XMl4PyNYeh6rXkciuXFLHz/Xj4NQyTJ6GGQgKf9JRcGUrzQya2
	 Xypu6jsrP7mfgAIUbP5cg6aeyioSGU6uSx9+LkYn8NGknxI8qHNjqYomvCcrk2r9txqWP
	 Alr5cpLGGX1qLMqkIm7LxQKY9TBBL89z4qmZxpmpVjRHy32rhzL44w/UrT57IXGNw3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MbwfR187;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bl91ntfK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340EA606A330
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340EA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MbwfR187;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bl91ntfK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0wd1742006
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OJHdZlygRN2jDx54/MBmSP
	XGD8ZnLG5eY4JP1FvaSw0=; b=MbwfR187Xs+UqJQh7lNr77GGIly3dgs9Inn6zI
	C/4ML5e7MFvx+dvrRc+n45AsZQppXi8aiF/2xmyJe/XQZyMDHGryi0cayyh23lZ7
	uXoJQ2uhiWLggNiBHn4FjgQaJIkVXMv8fE3mwghidtmQYmsuXvxcSmdyxm0X8H8d
	OQIH5d+pSmmBbfPua6GhKOAlJjuO/cTBmYHLbn7RD8UvtVfRpJiorDj7W8awDWDj
	tzG8C4HBSFRelV52G+i4J/hZoESPj6NkN/KTmzUsjqPTIjea/TRUVZEQLXRY/xmk
	SeVURYiAzYmz2jc4uPin+ZoTN6mzEu5inM9gyLhM2a/TP9EA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4ygqdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 07:42:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so1279724a91.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 23:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160552; x=1795765352; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OJHdZlygRN2jDx54/MBmSPXGD8ZnLG5eY4JP1FvaSw0=;
        b=bl91ntfKzNi7h/F1f/YBTWmiT38fkBb/EFhv3JjJWt6dnN/8FePdbCIfdVDhFc2Xwf
         IDFJJhVuehaWbrHP1ZaEQdLd31Ke4xE7FOWBXVNrKBn+u4zhICgNEN6Om1Y+sAg2WJ+i
         mrRjiSKVmQVT48eW4a7hvNe+8Pm/uyg9+ARLJHNFoXBiep8njJm3m5/IZfwpmWqsnH9K
         09iRrhZQdrFDLjQGlL43PPY8Vr5exLbKSGQPW5gXjbeucPq+gcqdSvWFEUrR6UmbnN2u
         KmxuPLXevxiMyUZHEfTKTfSgEu/1PDdeHIu8aAvH1jM60V16NTw/hWRa5f5mMbAolZ8R
         Xpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160552; x=1795765352;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJHdZlygRN2jDx54/MBmSPXGD8ZnLG5eY4JP1FvaSw0=;
        b=I9iD1yZkaCH/2IsriOHYukRwk7tG4q/PmvNFY+YLbBqiyL5faJaU/sHO4+KYWd/DLJ
         GFUlmRi+lQ81pfYFNAerBW9+jpe4jKd92cKivHx/rBBb6YKSaTpnyZdg9o/lTT5cVeQY
         2No3dcY6ZU0ZVUwi1O500AtgxkDg/vUiBOAJ27bs09UFvszk6aELMOukWHMMzUTXBnvO
         cKyusdvijpJNqyGiuhFF7FcUWULIZom3/yrRDP3yq1VOFTGDegOGla6BDziSOH+ExL/L
         FcDA8vjYVvfmGzqi+00RbocMVCpdIfpuccsxoF/mjvB2of9x+Du17CcjkU5db/PzD17U
         saAQ==
X-Forwarded-Encrypted: i=1; AL+hErGpjuhY4J8Onh3g8SGY3lvV41yA0xg469g2juXyQFEvMhmja4E7PJJlvkq/N9vvu9O4BwR/T9x/Tgelzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8WHVDpxxczBzUOevM6l5Ikgwa4E6V5h0U02WnpsKVLXFucjRN4
	Q6PImYTjVqO6g+xDwvJTYCcAxTBy93252LITKHlFB33NQUhgWyZwy4COMbuCz11zmrKMCMg5tuA
	aAVLC3Uh+u85LKKnq2lNjI2ZWguE20BW666cjFirQT0wNVtxLSE6BXnImcxTuL2tM2A==
X-Gm-Gg: AZFdTZdNthdpjJHFkiKe+cqdgEhQNsTs/AxJDUk0DaGypfAd94Ylzxut+hj/3xhahO3
	0eQgT5DnbKvp1bnvlER2qJE8cfwh255eEBdtJIyZwC2Hzm6V2vGrk6t0s8SuqHoX+PR0SS9gSbT
	1bUJawtVyQHkuo6Ep0NtWHmVaKzzxHOVnu82nEvA9vWg+wDFhgII8L/NBm8mtOgs7LU2HBOnIR2
	T2KUiU+ZCaaLcEOP8FPjQ9M55p9EzMXy0JzU2m5j8g0yE8+dS7AKzCOSxk8Y4mAYxsJd5k7zrES
	rhkongBEt/B9XLF0N4TTwENjGrtNhNw6/VNtgNl5TZtkjA863Sw/6FmX0kl9NtB64jgZLeT3uvw
	GmPmSPkYOUocdYvAgEDaaC1LDAa41xDjvaOsGHOh7DurRIJLFwP+5YrfxSqSvbXwpVlf4Wv18I9
	yCCJ1rAIY=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr2152838a91.58.1795160551859;
        Thu, 19 Nov 2026 23:42:31 -0800 (PST)
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr2152802a91.58.1795160551239;
        Thu, 19 Nov 2026 23:42:31 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:30 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: qcom: iris: Fix IRQ synchronization during
 power-off
Date: Fri, 20 Nov 2026 13:12:03 +0530
Message-Id: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMv5/2oC/3WNyw6CMBBFf4V0bUlb3q78D+OihanU8JAOEAnh3
 20xxo3MYpKbuXPOShCsASTnYCUWZoOm71yITgEpa9ndgZrKZSKYSDljMdXmRSuDUjXuZAeKUkO
 zUJ4ooTMucsYUcc9PC665g6+3T8ZJPaAcPc03aoNjb5fdPHPf+0qyI8nMKaNxksWpLmQhKrj0i
 OEwyabs2zZ0i3jXLH40N4c04Wg58EineSlAF39o27a9AafnJREjAQAA
X-Change-ID: 20261004-fix-disable-irq-safely-15b2f712800b
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=2288;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=FR20uXI73EXR2aj2lUtbieQR1WkGmhS+TQ8fKfJ+jvM=;
 b=dimX/6X39t1RoJs305qysFBRWDYMJTuJDt9vfj4mcymkOXlUgo7JIE8pyB94CHXt3SPskW0L0
 M5XmVOn19sMBOWlI2VUVgexF/AyqdpPNBDebeeae7+kN1+tIS232ej0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6afff9e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_RQlf2RcmuGO1PAenpAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX+1f1x+6ReNLp
 gGKUHRvcf4O0Mc8OjzjMuSRM1KoZ2QgCCpw6/rFhWAMkTe04324nrYVnHQnWmqoFv227/Av/GVj
 fXri7Yd9FbKG524l17tJylSHkxJUNXrBgaR+ECmKUEiFjGCeTsGxfWZ44qKY5iqGgwedTSAT4MP
 3l0K+sH0ZSMrXeCqsq4Ho3mmx1kHSa60h6JHxwEWIuk4UMzZwJKo/tJ3wF5fQ8EOo65SzsCgp2v
 I6jR5zlnETLI2QvP/O+n7KYSpwdLo8TRDO0FbFlTYJcdjBVtOon/m3LvOq5cCHSZrBEIMr4MUx/
 TlPUogu7l1er0Hsyx1vcyOGCN7A7dncCXoEnuzGiiJOEM2N8nbr5IPWS3u74LM4aRrmWAXBeqpp
 h+HWf+/tfqIKsNL0ldWYpIEA74kcD055jy+gZYLCi9s9eCX41sz27EIh8TmxXDTc3GrqPItXcH4
 Wq9zeX0Wssh3P+HmeEg==
X-Proofpoint-GUID: HO0W15hD_DbehT-E0kEpeIoj_eJmCz9B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX/bX9LgL2omU+
 fXNeI8M3Z+K6eipJKebSn4qZqZNQnmVmlprqR2b9ole03VcNMZcC87K/3hopZQ6xN22pO9CUp9E
 J2p5bWGNobAZ45JQ67m4NgdplpHfBjg=
X-Proofpoint-ORIG-GUID: HO0W15hD_DbehT-E0kEpeIoj_eJmCz9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
power-off") changed the VPU power-off sequence to use disable_irq()
instead of disable_irq_nosync(). This was intended to stop a queued
threaded IRQ handler from accessing the hardware after power-off.

However, iris_vpu_power_off() is called with core->lock held, and the
threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock. If
the handler is queued when power-off begins, disable_irq() blocks
waiting for the handler, while the handler blocks waiting for
core->lock. This results in a deadlock.

This series reverts the commit that introduced the deadlock and fixes
the IRQ handling around power-off. It keeps the IRQ disable depth
balanced across power-off and power-on, and makes sure a handler queued
around power-off does not access the registers of powered-off hardware.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Used IRQF_ONESHOT and dropped the manual IRQ disable/enable (Bryan)
- Avoided the irq_disabling flag, waitqueue and unlock of core->lock during power-off
- Skipped the register access once the hardware is powered off
- Link to v2: https://patch.msgid.link/20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com

Changes in v2:
- Added new patch to handle the irq depth
- Link to v1: https://patch.msgid.link/20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com

---
Vishnu Reddy (3):
      Revert "media: qcom: iris: use disable_irq() during power-off"
      media: qcom: iris: Fix IRQ disable depth imbalance on watchdog interrupt
      media: qcom: iris: Skip register access in IRQ handler after power-off

 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 20 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++++++--
 5 files changed, 24 insertions(+), 15 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261004-fix-disable-irq-safely-15b2f712800b

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

