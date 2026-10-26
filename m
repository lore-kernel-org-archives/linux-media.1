Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995874;
	b=T4b5DkhZl4s3Pz2h3d2h+92NX7MCxqDMGk3IZnBW9mVeU5mgrwzgqtEDOIHZv3A/RmLy
	 shkR900SwzRBIcmfSXltupZPpD9Tm/5PHRmiRNn9dyMseHZBIcktr51+n7e+UYQsp/WG2
	 ynapTvxW5KwzQ//d5+1ij4cl/cUWoFOHXpT1gQ+kJ4VAtWT9TwhHK91SoZck76NiUniZn
	 mnFvEGDuB28du1xZQBBbM3H6PphPZWv49svWYNpyJDSJGmeGxJ/2EOqV03wIl9ElHEXtb
	 h1GlDnYn1OWbDZChL81JhUVYK1RaM1GRhp9Tt/zcvKraIiIDxcXVkS0KIGkCuBC3Vew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
	b=KC8CDpOq6z2HRDY5Ykl87wNOXYI6LauC2q75S5iguRCwAwPyJYhzxPAzDzEjKZaV9S3J
	 KxrKOMncUGacm3rOLs+BFW5eNDNEquGtl1g+cJx4Zwnget8jMHa8qVml7tVqkts95X39P
	 roRxLqr4btOiB3mAM6n9LwEmrOguKy/QwngZlA+XkuGVWufG37bZJmskf5VDzadY01xXb
	 Wj8Wx0qaS6C08wOrFqayLe+wPIKU4kLoDD1b5fx+6U5a85maKeYbm7egIRxnUO8Bbuyy+
	 /oHI7pA2z6F4f8W8lyy7BC8mN/JziR26dANUuFnHFUGLVPumMui19wc3eTAG4X21GHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kl3hjtqH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMgwdH3o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF0606A32F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFF0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kl3hjtqH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMgwdH3o
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auId2727065
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=; b=Kl3hjtqHrbNM6nOj
	xuJncX+4ETr1rcO1gtaxpuptG70g6UsCA5K/Ynn7toA8YQqwLAy/rYiM47629XK5
	FrxT9GKcl4jIDO3QYrJjHf0rmW7/TBkxY8LNm27cc/2M+kLf9xUaMPfpZCKaksQ8
	kTGZOmq+fzP3GAf+oxwvMKa3fk4Iz2b83SLTGaxF/IgvbsijG8Pkz3eMB6OdnTfF
	BWFoH18dsmGDfLW6vSgthw1Cqs0lIw2PJ5Dgnr4AokMjLycCaSVw/rBAxdWIF8dt
	pp++/eEl7NDUU9zanBQvzCzqu4fe6xQ59iD9j83N7ZiGe6b9kjdz2eCctfkNST90
	iKJsPw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n669-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so21980875ad.1
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995871; x=1793600671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
        b=gMgwdH3ocogguiUrgPPXzqInvr+zk7ye7ZJtSetB+sxMAxm2VtVRKrO+Da3gwo64+N
         PjCjTkIGBmDcmLaGK/FUI14diip+KXo1/mSgeHVhm9qwr1lpzwMgYKqLyTor2ElBBS84
         mMXiGJgz9Rtu0VyoAvnWV4lvE01b/sQEUDp2xL+KDyBJGksIa5LsL7TY2XWMnkyc/dve
         ofwbOcrys0G99P/zB8hQ/Bo6Hn7UD8DFOtSiUPdD/i35Y6XTn0YzRPZO1bGqhR2kZIZJ
         nlilGJDlKC6mF3IWvCpbIb4GM/SEN79fVCJCsCj21pp1msV0/iIvCGpXPtLKebTn4PSD
         znEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995871; x=1793600671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEFp7w2tgG6bRDJtDTShC/IAhrO3WLDIL2BdyzZpv7U=;
        b=NDd8xzg+aoMqvDLAVs38aPX3SPNK7zq6FUr2iKgqOs+f8EvWTi9bhGqd+POLmV76eQ
         JAUjZ5SObm6nQ0Iy/FxGZi5QwjoKEaK0jECRQi/6nxe1gM8yfBHwEsA5ggpFkJoRUKM4
         e+UOE78bJ6q//5EdJ1XQSJ2Exdc1zA/ZYvCQGHG8Of4Mgm46CHyTB3JHFYwk57SIGhpK
         w+RKQM8J79hqImiG3gxxh9aHailWjnPD0ELVmmt3kdl/JZ040kxX8+m/Lj/WvfIolIjF
         Bts6aU5pIaVjIz3uOcj1QNiBLwnXgoOtXlcuq/3k0JCPmYHEtl2EYohxedKGMxsFKqVs
         qlxg==
X-Forwarded-Encrypted: i=1; AKwUvBz+kBb/JNhYCo0/kphFcbaGwMuTzzfGEo56HDE8ahC6bG2QMse3Vqoo0JebpqZiPz09s5Njtff+vzecdA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKfhrcnbR9RR1gFWrYk8n5m/JzKqCoxbcqszNQknbXfMw3RYvVj
	zK9gM/SyZ8S/qcfG4X4Fkz7VyJTrHvGZtljefz6HRlACD5fLhdQZe5SIEd7G+cltfxAhNsqdgzz
	zrceNPWTFh09qG/x3WN5ODef1Y7yd8gmTNbol7JVyVUlbIoFlpbzuufTL9UJroJFy+A==
X-Gm-Gg: AYBFou0NmU+CSUGOI2qN4yLloZasgF0sYm9TFnEvKrgKuT+0FB5nZtk+Dokrv1+FE2J
	glwoeL/Xnts7nhviTpexZ9El62woyX8qyAXFigJX8PowmRr1QsSzYNBBIWOYFI5QN+2IL0Nu2ta
	IOjDvVBpsccyPBEqo8nBQmek7Jlx7rbPNKQQh+DDfbOVa4q0r5kEITef0aNZLKN+Lfo+bSQvTDF
	+kwAcwu+/iV/9wI8dbYXIZwevGCIjE1bZJb22H4PJmWroFmj5JF/ZFWRSFtPj3kQByBB1DHByAU
	cm3E2vvfJhF8YHL5tCFxaF3rOjsd2c+Mvf+j4KkJvoJbW4oYLXK9G/XlzreRki6D8jzZpvB53W7
	cOFgzjse/9wf+yL4rRKY+9BRvXQGyA2exsA==
X-Received: by 2002:a17:903:3c30:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2ea9c6c73a1mr46780345ad.12.1792995870985;
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c30:b0:2e9:821a:5527 with SMTP id d9443c01a7336-2ea9c6c73a1mr46780015ad.12.1792995870524;
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:30 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:26 +0530
Subject: [PATCH v2 16/23] drm/msm/dcp: Integrate the DSI bridge with KMS
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-16-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=4407;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=YkElIL2VP9q3UDs86ECzwDFEF/OyzmGpxHXTXDTkMBY=;
 b=dK6ojiOmJgJpI/PfAGPWySwWrv1PqCpsjGAfv4a+OAjHAZ2np/K6tzX6Lr5Vz7Q11ykgxlBBr
 N1hOZCgwbYoDaTZ7PMa47CbVwaPr/4ZRRrA8jHmArpW87PZxJe5Cdu/
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: AK9RU8YLQiQ2X4UucY0x5nKEd9o8p6jk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+Hp7IjaFTsh4
 O1YKrPGJ1TmHzfsy3DS01lm7W1ulWRaZxYbahp06VQnbppzODk3nUWtlzsLadQDYCi9F5pkaXvi
 djl4pnnXBMKS4Z6ELrKbBzi/WdCH/AE=
X-Proofpoint-GUID: AK9RU8YLQiQ2X4UucY0x5nKEd9o8p6jk
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adef220 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vhVORTM7vdiWvPRSmu0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7/qc6/A1YXA+
 XKp49hFHFC5CDZ62bxe/pjtToBRDyNWjqWzKO3bwWJYxw2uq+m5jYiOd/tK+qbvRfHZt2wvLZFF
 4UwF4i8ud1negHVgVr5GOkCh72VNP78A9HczvOO53OdvbYinNj3TLcbOqQ8pHCUp8MM43kA8YaE
 URajrtvSERrCA/TdvF/TyjbQ0WAqURVgLI6dCYiEh/e//vgsf3Xh9czmMrWxjgWpWRGIiTc91m+
 Sp8uquPSfCzrAy9iJTrBUJdDas04lMAAGt3LbqgceVMD3HWRmOUc5VPmUWuEC4e1xsf1XYdNZ5A
 aAy1rf7AIyr4gpNwSi8Ey/DaS04bIRANJiuILTRJ1p6P0jvSTJe964fz9ZHzs9vut1ls4CG9IcZ
 KWhxHS6adVzEDjGxjhOkWrg4kFEo1XbaI3IPdBuvIrOgDUvOeTRhKM9AUSAACIJTRmlkxyygl4z
 YgfCd++tIpkdN73IxIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Connect the DCP DSI host and panel bridge to the DCP KMS
pipeline. Without bridge integration, DRM cannot create display
sessions, attach connectors, or run the bridge enable and disable
sequence for atomic commits.

Set up and tear down the bridge and CRTC relationship, pass panel
configuration through KMS, and connect bridge-backed display operations
to the DCP HFI commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_crtc.c    | 14 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h |  2 ++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
index ec4f74c2920f..173a07df71c5 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_crtc.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
@@ -147,6 +147,12 @@ static void dcp_crtc_atomic_begin(struct drm_crtc *crtc,
 		return;
 	}
 
+	ret = dcp_dpu_kms_prepare_crtc_session(dcp_kms, crtc);
+	if (ret) {
+		cstate->hfi_error = ret;
+		return;
+	}
+
 	if (!dcp_crtc_get_session(crtc, &session_id)) {
 		cstate->hfi_error = -ENODEV;
 		return;
@@ -559,6 +565,7 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	const struct drm_plane_state *pstate;
 	u32 max_width, max_height;
 	u32 mixer_count;
+	bool needs_dirtyfb;
 	int num_planes = 0;
 	int ret;
 
@@ -569,6 +576,8 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!crtc_state->enable || !crtc_state->active)
 		return 0;
 
+	needs_dirtyfb = dcp_dpu_kms_needs_dirtyfb(dcp_kms, crtc);
+
 	mixer_count = cstate->topology_mixer_count;
 	if (mixer_count < 1 || mixer_count > DCP_MAX_MIXERS) {
 		drm_err(crtc->dev,
@@ -598,8 +607,13 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 
 	/* Limit visible planes to the firmware blend-stage count. */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+		struct dcp_plane_state *dcp_pstate;
+
 		if (!pstate || !pstate->visible)
 			continue;
+
+		dcp_pstate = to_dcp_plane_state((struct drm_plane_state *)pstate);
+		dcp_pstate->needs_dirtyfb = needs_dirtyfb;
 		num_planes++;
 	}
 
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
index 44b1c2200aee..61a4d8565359 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
@@ -7,6 +7,27 @@
 #include <drm/drm_crtc.h>
 
 #include "dcp_dpu_kms.h"
+#include "dcp_dsi_bridge.h"
+
+int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
+				     struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge)
+			continue;
+		if (dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return dcp_dsi_bridge_prepare_session(bridge,
+						      &crtc->state->adjusted_mode);
+	}
+
+	return -ENODEV;
+}
 
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id)
@@ -19,3 +40,22 @@ struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 
 	return NULL;
 }
+
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge ||
+		    dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return bridge->dsi_device &&
+			!(bridge->dsi_device->mode_flags & MIPI_DSI_MODE_VIDEO);
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
index f8010fc5d32f..333567a78ad7 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
@@ -44,6 +44,8 @@ struct dcp_dpu_kms {
 #define to_dcp_dpu_kms(x) container_of(x, struct dcp_dpu_kms, base)
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id);
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc);
 int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
 				     struct drm_crtc *crtc);
 

-- 
2.43.0

