Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674732;
	b=SPNm6b6s5N5GJel0iNTjIZg3BL6c9RRiv5mq+b6NH2W9aup9ZvDBzdS6HNm8/EFElStE
	 b80KCEu+v2gRp5nBYSscBek3UxbKMaD5IGmSc9MT9PqBB5otqaKc5mRv3L4uM9gNbHgAi
	 x659HRx/VAJMP5wYuqObHXhsZ5RoLXgqKmwKAdFv1P/Ny9GW/Qlmi8f0ERDHht/r/28rv
	 01OIWLOOt3aQ/OHNWFnnsti5H9pQf/T0c6Vg7b3Zwtp+pSr6ZP11BS2HklHDAjF3tmRzl
	 IzbLvWIrMZHlLlo9mSkisTHJkIs7lo3faPs9HHNvf9n22nJOBLH0F//aw1yUZ/algpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
	b=RVVq96Q9Ehg3sfABD8qiHDMgFfCmQmeqeACopf5IcVzOCIoQReYibpauPiewzNH7BbYg
	 o1gh7As2G8CymRYWGQId3AxZzaNbwjAGx/ambv6aLo1yEBNlRoFiyac9gvygHkV7drmBU
	 /wNKa/XfdPBIRjBG0aPFsH1q9uKecekXidHhaJMSHQTkBG+VrVlH419y/ab0b9uyfc7BQ
	 Krr7Icj0oaPFGVkuDkLZxVEKn6E72f5is1Yvqiu/cTKv9ZLDQRDWqgALKX8qDEDFINhNw
	 rBDMnyrFWv2v52QeLdKocSfIohfHKC1j0vE+WkQen1SsvivFL1akkpQefgWjSIoMKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96615606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96615606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36TKf3023720
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=; b=KwLkEcN+3tM7E/Jq
	zrm3P6u1PZaHxwIDGxCqcQv67I8AFt5Z6oAFSlGRZNygTSa8Zdud/JWqoU1ciy1o
	ZVUDxEtEFTew0UWzEEQhlj+leiGzmap8kC2czZcUp03ICNBUAoms5plgWzac9age
	WAcJsgbhjFE4f7BMXMyjKs8I7cG6IJrtN33VUKJEJyp0AcWn+VEDAuZ05Zl7cchV
	B7wsoLBOEatDcqR4Qx15WMs1Vf9vERRaioz7/HjuDhj/znDdBNmr47SurzVMqeMv
	7MHECDSdFczxFmeKZFjYehR1CVIwg5U93GZwcXFmvsvc7ZzlwqLVhg6BuI8JL9yl
	t4xmZQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatkqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f08196b148so41043425ad.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674730; x=1796279530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=YHuwOi48sQZqP35mnueZaBwuAd9EUBqR8x0amSmD/1fWMKj+gHujO2dUyFy+NHyfg2
         AXpQ2zusIwUv9TKmeHqa03rwzdYmtZbB0hPxCHDWoIlT+Q0RKNZqfzpqqTN5yQ7ckXKR
         4W1+sLPKrX2JUQGFEHPJWZcJ6EkYD00ZNNJfopwrAP6CU/WLHQXbz5J0wokC6KelJyi5
         6uo43YD1pxA0r72JDzN0HQKWggcOztz8EXswYWs2kefZ28TAF44q3zfd0yF4+mLXTtEa
         RoQVux5gXs38Kb3p6XrsOjnIDOYDIrezLfpdpojlnp2ChO8vLv4SuP1D7/7XfhSp9pVQ
         T+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674730; x=1796279530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=MIVoc1jYa/h2Pbh6yZ2+OoAhtD8MsBhrUoYBr73jQ9znAguDr8HgBjpkCf6hRwm/Xr
         24+yG+OEa+zLRIBc4dfq8to0TQ6v/CcgBGy5kjhQvwadXeupmg0Q4rc5dUCl/WDdTS2C
         nP0YLScgMVKa0n/IQUHvfacdfjGEEO8NuJFht0DHJeQJaczvJzpQ79z1ef5zRqJjyYRo
         HVXjD/DyGQbA/W7msO7FZwPXM0u4DuHbNS9Mm4EPaEC6I3WVtus8qWFbjWEz6EpgCIdC
         PGMuZby7zW04rWCZLD+GTRN6CSkDShY9R/hIUp9heC9DjBgq8ZM350jcbW697LxYe6cY
         rypg==
X-Forwarded-Encrypted: i=1; AL+hErGpb78UenDwye1vrje6/T2LrTTePMli5x4uLjrDBFVb3ndTJH9dA1oRhlJ6VigWcr2DPNkQdg+pNbo5fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/m1SdsIhzQsd22i8ixB//Wy5AUU0eBFJwWcfbnp6O9e5IfryoR
	Mw3KnSTLWUFMtJJdPvpnObyNKbggdz0Kuw6fHodcSZdnLzeikrJixutayCEa7ma3oEtNhla2ipz
	mAd1TPe0QHsdCeWRrawX0fSff/iohcVaSpuaIguGy4Rnizr4mI49jvrd4QYrJ/63Ghw==
X-Gm-Gg: AZFdTZcnIgyWL2d7EWvi9QgECHQJtpLpBqZd7FnGUSk4G6FUqwc8txG7cbvLH/Qxf/i
	xkyR5whCyygHLL4GS2yBmedAgTyH7eAiAvSX6t+VRjdfXBlWrjjiuvkrHK3ekjPtvHfxg4bs7M9
	GXgKeG+VTOmTos8K2b/jXjNVrULMY+UaJIlJLr/vf0wXGiZ3pFFmxbz9P3EJ+qt+uIlY+LpSAMu
	YHDEHyBpZHpuc74FNWC6xPzMdruCH2YWsMuMV8J0OrPlZ7enfollh8yI5pCwLwmiYIdVq+PrNNy
	HBY0n1YfQGH8eU9iOjU7i6G0NUWVR3NGK7MGGuOV6ihOOlCjDg6lFp4HPVk7zIcew0/4viKT8yr
	sWs4D2wUQwfQy7KA87qQ9Z69D2KQduG3GdulI9kt1bvtMBh5WRXOS1UWxdF73aXrsPOf3hP61O+
	8ItVeRBJjD
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218271375ad.37.1795674730016;
        Wed, 25 Nov 2026 22:32:10 -0800 (PST)
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218270835ad.37.1795674729434;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:27 +0530
Subject: [PATCH v3 19/21] drm/msm: Support KMS backends without a display
 IRQ
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-19-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1191;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OeeUkS71qhEHZfJKt5l7tFxYoS0sgnGLM8wENixTSYU=;
 b=xviT776rfCeMHIFO3g8aaW6MLHf1PKw27DBdPxkNYkyDI6t+nLjVEm6uO4H7Ode9HZee3kh4X
 Qit8ls5DWndAfFs+hSXsT9IZFIJa4EXjRfVkVEvK5CL6qZ2pjmmnDDb
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX6CF/newYLhXb
 QqmgBcPafMcZodLTcRguwTPAWVUkql1wWmsQlnLTJawjKKwiSbSY39V4b8hL7nYQ5gTKNfkYeg6
 m7XfgMCQ69wNsEGNLR67c2g/OX5jx04=
X-Proofpoint-ORIG-GUID: _pFuhgaQ-5mi6OP_-eXmZxlMvB42_XA6
X-Proofpoint-GUID: _pFuhgaQ-5mi6OP_-eXmZxlMvB42_XA6
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07d26a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+xART0bt3rdi
 AC9+XD1HZbi449c3IpsRvvdavyEV0tcaaJKaNwWjViqiMlcpCI9xLV7xWD1SWUp1s57OtCO520f
 xE3o+ywWqYR9hxqPepYUB+lBAS72P+pIeCULffMzs4l1J0qg9D7UbwwOkg7IgcoilS4tJV3HwKB
 fxQvpvJIWQjwt/Vcmb34gclEcaA5zRwASgn7/wbC0bYipYq5n0uuFXXhIKs+CjIpqRczWeFyKbd
 0rg1ZFxelyijXbdJhI9+/P4lj0aN+E9xI/ZHmLMZtNuYpuDzfOXGR1B8WzCksxkOACHkzHs6agY
 IMn+xN8c05VKUo5U22Kk/uO4VLH9T/BpkQQI+1QNa80LxWcYB3pwGzrLJtY+wBV+aJ7iu27UYAk
 h6Onc7UAJ/4qqChCH1OU2tpSND7qSVfD84kTvpTmn4Tbh3IULpPw/ofV7s4uZjNWmr9myNenxCY
 Me8SaunqGKHrKGvOtsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP (Display Co-Processor) KMS backend receives display events
through firmware over VirtIO and therefore has no host-visible display
interrupt. Rejecting it during common KMS initialization prevents it
from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9592fa28c85b..fe6f290d7be0 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

