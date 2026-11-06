Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972680;
	b=pCNfQjjBvlVs63xf+WeN5V4mNQX/HSN1toPPAu+Y0B47JZ/MjqGTpvd9xSjc/btAlxBO
	 /N/EcNewdhHesZS50uMOmaSrS5PkPjg7fh2v9+gn6TCu/p4OwPJ09N1UqppsEsPy/LeUc
	 uY5Cd7tZd3qgRuOmuiecFLW+u95yQhxuskG4pa3Mx7ZV5tMfysidrC1qlh/P1RtCdN+5E
	 qucVOjQdMHgIRfMxzD8yywv2zZPX/00Fr6n/QumQm9YQAb9BjNS3dhwwXho2yOnTrUviY
	 2xMYExJCM5GjB1fpu7UPW9vTvBKZqE3UqiWwfkaokFyWK8hRM+Vor0YrfM3EH3ayIaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yUx2/AYYER6Z8PqhV9YutBEuv6ASg82KLIs8XoRfhp8=;
	b=ZJ9EkrGYpWZvBu7BInXznAaSJ3loJst2WzjELLNR/wjII6ixWR7sn8RLGVW0UfPSlbVX
	 uvPqs4eGTh1e6wgBsTH4QGGydpJbvoLQWv57H1QMHp4dbqHjQwtjdyhJ3clp0bR+RI0sc
	 LracYMMou9uQ/JpAkHI80+rph25TtmJatZjH4I5mvKokexNq12YQnz+gkgakdJo2v6qGs
	 Ls6H/4Hjn2nuvs5Eut4EbD08RTjPY35cI8ouTmoFpshYq7bnhunSB2a8MiDG02aPanRxa
	 nIjTel5nk0RHa5PHakXKTZLUB3fM1WpCRc2UOBITTBAGwhn1Qo4W0xtG0ouJYxdJHdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7znpuLq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrNMOB7q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F3606D824
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212F3606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7znpuLq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FrNMOB7q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJLR2593305
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUx2/AYYER6Z8PqhV9YutBEuv6ASg82KLIs8XoRfhp8=; b=a7znpuLq80oOBKNk
	NsZeHARw5grGYGT4I2oYsByT8gT/CRhrQWCMLU6RSLIalSMqE0EbUbV+Ns7goVXD
	A/8tFCpf+288VZYCWiZYhhshsvxXmgBNXXinsfg+iR6PgeWB5E4NlxbSCJ5OjUhm
	aaxEoVX3aqSQEq5eKfG8bM91K83NVpR0r8v5bbel34EJ3EAmZUZrClQ26Uu4wWj0
	IMMEovNmabTHheh9HU5foeEM0oTNlErOv+e7c2TNhwNijBFtLFi0WNwvTb3mO6/P
	SmOxI5tiEpjkg+QGHBTQK14S4/9S9SjI6tWpTfnbJ+288Py71MONGb3kmAboSspc
	gxyC7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paaxef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:44:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so149771385a.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972677; x=1794577477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUx2/AYYER6Z8PqhV9YutBEuv6ASg82KLIs8XoRfhp8=;
        b=FrNMOB7qxHEXbKxncVXNKX600Vivak/8FwGUGFo918CY5pPDgrdtS9ux+TD9qq0RNG
         DEtiIsB9ka5MRkXNSPLrL12zEC5t7uGhs2DWun39guKYw89Iq0OQntAiBeu4M5hrGNY3
         ABsr9M1cFwuLNXuHeJE42WpDXo1JtJarn+KwCaSuS8hWuxDGBeRGPUC2zipj27/IZ3Lf
         oqko/8lMKY2EKI9JPfvJT4EM4h9rfWmt1rrD9Lbw13eybcdwt9ap4D2cEvCi1241oWEb
         6R869JXnYf5uK2mIwlb5BJo8yRCXbFWqWlzoTERWnLWlO+fUiv5Is9gS/U6w5NlbGjua
         SR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972677; x=1794577477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUx2/AYYER6Z8PqhV9YutBEuv6ASg82KLIs8XoRfhp8=;
        b=X3TNXe5ctWIkonpN4hWKucYv1AbZepZ+nHF11H/zDzg1UajZawuhUclqBh2Hz32h+A
         de1a4Szz6acUO6JXmeNgTs9dasSlisHY5MxLgip5ved8goiMpzqBtxm3sDKz0QLFV1Sd
         vkc2sMEtGTy+iYPTVLwmxSlZvOOV/5mXw759jLpsfYzAK5vGhR5GW5WLYaSrOsaRjtzG
         W/U7/Q58madItz0qoQ/ORhhtFu3pMs+DsEUrTtnnKFO4vCrpadaUcir5/+r4kzEvxqZt
         /fRwS9Vtj+sZDlSM7S1yrmESIIfKiuDLlpJ3Mih0G91XJMNCj03mYzUeY8h6hlqaY/5W
         G19g==
X-Forwarded-Encrypted: i=1; AKwUvByGBJNjArcMJkKvsCTeCIZ9tQLp6cIrKA2dwkmSC0HNaHFKwKDg7vLVVubjr7qA3Xzoj6mQP/5J7WYnlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8tfhJguM1ZSKtfhMHmZ7axfdM31mO47GlAuNy/4RWwYaN2PpPs
	SEzQ8XT/0XgtQy2ozjHATv9NLXpjqFekEL71ibMwH6dKg1A6fUXETC+5ZhGuE0HcB2Xd8GyR5hn
	bvZku7jpoKTnv+KU9/gAVq8f1/rX7f9Wyl7DMo+SV2WPnKHTsEgtDoKlEon3VCtOpSw==
X-Gm-Gg: AYBFou2RdBcBHnPwtrqs+dLEeYLjzixQe8SKMt8ErfkKSCzAmEExcyUCcBbAH74t0i6
	SZs/rafFiYG5MDTI6OpxW+unFTqoLAthrA7l4p+CUNAt8PvxV8fu6FiMAXMOMMzt8MOXKEL+3AH
	dzgRDVYSCaz/V5rZmvjCqU6SznwZd9KaDwamTXSD3sUtLr0ieNZWK2VETJnHm3Uafc4EjBzMruC
	EfsoLNsD71o9fXAnPqPJoRJEdkASpIaczAfa1kgFsjrqALJDzdL7eNZpKuOBRW+CzJ4d5ENp4C/
	UKgKo3lS8zb9F5zSbX/W639vKp2G3vGoHGkVwmmgG8ZXwEpBH+zb+tfF59GmVpB3BraKvUnzPPF
	+KVxvUhe47hSRh/t8FoXOq36G4qczBbubGKjd0akTpH9TJdPGS2VmDQlX4pcGVQxy3OnxF9knQW
	EucSQ/InOdI1citBtqDpokC3eYpSpqVb4S1S7dvt+8YpJV1h9ZfikYwn3HmTYMJQ==
X-Received: by 2002:a05:620a:170e:b0:93f:5445:c661 with SMTP id af79cd13be357-945f34ee9f8mr364102485a.57.1793972677240;
        Fri, 06 Nov 2026 05:44:37 -0800 (PST)
X-Received: by 2002:a05:620a:170e:b0:93f:5445:c661 with SMTP id af79cd13be357-945f34ee9f8mr364099185a.57.1793972676777;
        Fri, 06 Nov 2026 05:44:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:08 +0200
Subject: [PATCH v2 2/8] drm/msm: separate compressed P010 and P030 (TP10)
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
Message-Id: <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KC7RvkMVOgn+4H42iwyDdp1mol1keZJGBSWmjNCy+fo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dmx/XJ3HXoJCOTo/Rx/s76+HuJ9CHm0wd2J9
 drWRDWw3IuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZsQAKCRCLPIo+Aiko
 1bpaB/9BVzsaVMl5o6civqjjKYdgXyX/hWDiKPEk7ycyeUP+lqIFAVpA3iAeJK371V0PdI+pFJD
 URgYhFm8fp69l22JEMwuODGNgDubRyJo0gprS0L0RQ/yR+y2do3NvLq0RnB/P+Rp8MiXhAqj9qN
 JTRe9Cn/uR94bQ6XDEtJPkg602QP6VSVqBVfsajUo3VJ1dneHctp9WTBRhQs5A82gPWsIbt0Y7U
 SVF3+Dm3JZpX//2A4PNOOs6o7eUutmGdTt0WRHgyiCKG/9v6DGrh4xyi9qmiTy29CFCjFEXgsF4
 FsdWDbNhz+E0n7cnMVP36trbhsXZXjwQDXyRVr87ytLXtAKc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kD2nsNbFWF09qk70S_1k_pjdnCSYmc5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX45ZsbdbbT0nG
 edmpGcj5g9YJTs/J73htkAidjkeSB4lS/vjyDUzQSe97nrfl1+qY5LVaY1VsjM27XIHNqClYLHn
 N8noXqZOJvydJv6C8GsVtj8pTs7cq6w59/RN4ChuaoUhlPi5t+kfDnP6OGsgiZkXReIaKxccZ5+
 y5SATg6Fp2QSfQbnLScZuMvR488WbkwZrEUXrtSylVClkywbqVDApOpspJ6u/SwxXjCSmeco/dd
 shclZ1rDTt8gIC5H2B1msi+og2kR9opbS7Zkx0BPf7RDC/7h1L27NU7w5c6ETAno0Zwg1snUz39
 u9gLSGagy42CmB4k0vRAfEGtDuaVda8AtgFUzh4aa3Z3Cus3XxSkpuFZ/MqtSrWEKvUY/HsVVkj
 JSCxvFHZDaIlLlBPB7+8vzQE/XGZUAAFfgij/GUFtLIeACOx3VY/eqZb+LBdXGXSqOtFRNS1aNk
 DPzVAbY3tL+YZNMDH3Q==
X-Proofpoint-ORIG-GUID: kD2nsNbFWF09qk70S_1k_pjdnCSYmc5W
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedd9c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fSef4fKgGNmnkmXS94sA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX48mJqOAzF4/q
 bbIddyRM3zg8Ec6b0EAzn5cxs/T33ip/zKP9dM/YwiFe/qVnZOROuCaVtFaQ5pyQpDWoquHKLin
 E3CNS1kd0CBWMqpm6hEcxDc8wCRcJVI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

The UBWC entry for DRM_FORMAT_P010 is set up for P030 (TP10), three
10-bit samples in each 32-bit word, the layout the video decoders
produce for QC10C. It doesn't match P010: compressed P010, as the GPU
writes it, keeps 16-bit samples and is scanned out as garbage.

Use DRM_FORMAT_P030 for that entry, compressed only, as the SSPP can't
fetch linear P030, and give P010 its own UBWC entry with 16-bit samples.

This changes what compressed P010 means. Nothing is known to depend on
the old meaning: Mesa and minigbm never allocate it, the vendor stack
uses its own modifier bits, and the only user found is a draft
GStreamer merge request.

Fixes: f07c9946cc1a ("drm/msm/dpu: Add support for P010 format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  4 +++-
 drivers/gpu/drm/msm/disp/mdp_format.c          | 13 +++++++++----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 107150a8553f..f755c0d57abe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -173,6 +173,7 @@ static const uint32_t plane_formats_yuv[] = {
 	DRM_FORMAT_BGRX4444,
 
 	DRM_FORMAT_P010,
+	DRM_FORMAT_P030,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV21,
 	DRM_FORMAT_NV16,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1a471cdf767b..09146023d13e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -68,6 +68,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_P010,
+	DRM_FORMAT_P030,
 };
 
 /*
@@ -1779,8 +1780,9 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
+	/* the SSPP can only fetch P030 compressed */
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return true;
+		return format != DRM_FORMAT_P030;
 
 	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED && !has_no_ubwc)
 		return dpu_find_format(format, qcom_compressed_supported_formats,
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 33da569eae5e..2712a73e5783 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -298,8 +298,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = MDP_FETCH_UBWC,                                     \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
-		 MSM_FORMAT_FLAG_YUV |                                    \
+	.flags = MSM_FORMAT_FLAG_YUV |                                    \
 		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
 	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
@@ -606,13 +605,19 @@ static const struct msm_format mdp_formats_ubwc[] = {
 	PSEUDO_YUV_FMT_TILED(NV12,
 		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, 0,
+		CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT,
 		MDP_TILE_HEIGHT_NV12),
 
+	PSEUDO_YUV_FMT_TILED(P030,
+		BPC8, BPC8, BPC8,
+		C1_B_Cb, C2_R_Cr,
+		CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT | MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
+
 	PSEUDO_YUV_FMT_TILED(P010,
 		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		CHROMA_420, MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | MSM_FORMAT_FLAG_DX,
 		MDP_TILE_HEIGHT_UBWC),
 };
 

-- 
2.47.3

