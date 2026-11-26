Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674740;
	b=0j6ZcXSwfn6fgoRJXQ1mlOsIMmhxyjAvSg3tUixKtgtUqH/mj20Bmzy9tPQOwqPSFjbt
	 IbeA1MvtnifajQs5jq4KoIjHKJG08ueL5ksNGWAO629u90Hlai7I31uYgmDExUnQVuw1w
	 bYfNLjvbhh/JWNFoiAvg4VFdyKoEwn8NV9B2umVkAJcqhi1dpa87ztAtHjZCLMye7jq0r
	 7qLLUtCh4dVb7KrNm/s2hjxC0c7KXLj+FF3adj2Xd3stLvYDLJD0N2iRsTEXGHdU94Q4V
	 nx+BPRjtXVlRluZoi6VKtz0yqBdiPhC8OgbHQyDuBFMRJHFlMyoLDjyMl5JSVYHTE/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
	b=vbNDrRNRIAVTclSv8ClKGoJ0ZDp9QqBGHuP6Oj3EolQNqhqFtzqN/Ck0nQoKsHEK6p9j
	 1Mq70vtT0d/XsvbnaEL7c8i6B8/ll4QaSCXbetSifptvpqVqTs9c135BzfLYZcH84kxiN
	 WT7WPLjxCvNydKBwKvct0HDCF7+W8NPQL2Vt641Go2mlsccvp5TEwLEblHppiJ0DAC0TV
	 ndhCyrY0p8Csx3SVNq/YmJw9BADQP2ni947kkoPFp2kq9RzvmNLApXnYKLZ+XeDVR/ZCw
	 I9xBfULWYIoBirMk+6XDrYYltOeIxMYUiHD2gehV0sb+5HlUYDC86UbmwGqpvJCbwgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W1x2E/qE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228A8606A6AE
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228A8606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1x2E/qE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36RDG1686558
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=; b=ZdTmBJzpsejhQ8Nb
	+TcwWFSNTj2fYAuNXt2Fac5+3/twa7YPJCacab9hyvr8QYfFmefKJnKxFnOH37O2
	fcHVJtUkrsDVIc0XgPQyPaeW0CsTQn3X3eihe9H6mPTbsJhjCD6gD+atcm+QiA0B
	PgM04MsCHdUudm/AO+rckGk5PFl/RdgF7FaTqqCfSk3jLkeogRAZ7nXeadwsA6gk
	DypoSQoT6dvoNhKo5FmOrwgCLou7P/J/B/DbWgzq34Oybc8PkAGjHQ+dzKGlnaYx
	ttPLSgE/QxIy9SH1kT6l1n/CQm9PqDcJv5JPVVYoanS/ho3rTmDylnmmOTgu3ZKc
	PIyMPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9kvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f074b87307so39592505ad.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674738; x=1796279538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=W1x2E/qE8LLPjpaG6TcgFg8MiWwTPQzEBTJjuJr0hDvL3/b85+CymYDhsnBYPcor9E
         EDnWBCCXaltY16cmA1U81x0JFdzr3ej9ee0vXxGoCoQta9VNcV2S8npdAZG+EFAKtmC7
         KssiQn5GsSVJwLTIKQX4q65h5179h4Rjuy5Ssr2Dkn9ZzrSNWw1Dlaz8OwFJwFkFK0Az
         sUSRyp6EYJ3DBKk9Um3SYJ4UTxtlkOw3RGwjwWwAoTMEvbtk2JRkqdsjg+5TJBws9YAv
         c4F6U2CDz0a0nDbURAjcBJVlYErl1sb7egtlk21Uek82AY63ztFaEhVSDj0LB/UXuiFb
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674738; x=1796279538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=xvEn4NqYn/2ktyJ1sHZQ5kMNkmA5viKQLtTkDIavR5d5m9LdatSFmvGaa3Cjcc/RLe
         iUB1/qmpvgr8HllvX7i/mcLO3hA/IaH3j2jqaUVGqHk6oNtYDDkYXxfF/kCPKnF0QJVq
         IUlHABzuW69xghhBVolFggFFUrGOzAnpfxxBks7+GieLQkeEle2cKJnVaIXCYVD0qiBp
         R1AVaI/Ujk3PgXcOgMjy34EZrqVey4VvDipmcgUikBq53C++eZvbsKkDwD50O52doDFU
         6O8O92RYNXyy3L/eUDPkjehyKRqrb3vET/ZnZyKyIR0j1NlqIxyyZG4MwQP8/DiQ1z4d
         2CPQ==
X-Forwarded-Encrypted: i=1; AL+hErEcLYxv4qCFXMw7/P1LQGwqNQmZt7vSmoxDOxvRIMC/60ji9kwYyT3eTe5zrRrAXHZk/EiBc7NgbJNHcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fe+FNANlM4TPSHflSunAw9QHSFU8HN7vPgpPjfEiSOU1IJqpt
	6kFNMy4zTvrcmh/BID6oMDZ4yb+ceGrD1h53VJHewHPyFJc5719aii9bo6ckT/axNkrbgALsH41
	nkZ/dns3q9OhJRjcARJ98vizSwzU8HXOT25pQHEwx5BhPaDcInTg0nL9K9befnROJpQ==
X-Gm-Gg: AZFdTZfTwaW7qEb3mzfIKw4CgkkqvNJlPXSJdJwyQR6hm+UgcWwkx3/EYYcxVj/JuCo
	8+x3xNbldZILVPr95RqrVDvQnAEIvdiSKUG26hJY07L5+YtE7bjbxjfbfj4lQ6lrHGjQR5qrJJQ
	NE4jIHvu1DRLZ6wUNRV8sePCly88nJNi+E2BH3iySyMb8IUwPEttK12qhAyz7AkzckR/XWTCxPJ
	4mxHUodwRpZ8/Rr+Tu/zMfeng3/IkmRYMgLoTdJWhW0QQmiarOt295ladu/uTp5iOJNX4esWVil
	tFekcsTLmUNJJTEb4lzEgzw/8WSywUAuKPJ9mGSwQPl5zgsfHuXRMZtliIsVe5OXtCsZslHKRhN
	ugYkFxa189OTebWfdC3yDY3UZNhDej+92golqn17PuQfO01Q3uEocodqwgG/CJTn6zhD8IYecDA
	QS7kdkCM4w
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18249355ad.54.1795674738151;
        Wed, 25 Nov 2026 22:32:18 -0800 (PST)
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18248945ad.54.1795674737658;
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:28 +0530
Subject: [PATCH v3 20/21] drm/msm: Register the DCP backend
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-20-f1e9d7505039@oss.qualcomm.com>
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
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=921;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=6PWxDVi4BsbO/741ftQsQBNSZTnRP3jHkckpMt40Eso=;
 b=Wl4BjgymT1IPugnivQbz8x6tsQhKaYhy1kx4zbGuLUWYteGkdm3HxalR5HeEUukju4cP5dIWN
 +kl35YXB7zYAwa3nkmZqDOH4Hq8/2VZ6AY2DQkmg7CXkeXse2A2DgET
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: WXDNeE9qNHDZgwSi9CIymfEIrROLTUd3
X-Proofpoint-GUID: WXDNeE9qNHDZgwSi9CIymfEIrROLTUd3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX9tbF5+ivJI8m
 khJb6gFRYrfAhKiyD1HEVWaXCZmFumiGgFvzs8tl+9H+lKeJDMkV3PX+M1c+ynlAvmkHsMr6UDD
 wbwr6PjjUQQt3YEYbcXGuzt6sxuZoWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXweDbQG77Mgwa
 +fIqEjKcA42DdizIZgmMV0Fg93kIxV1sMcH3YfTN0ymifznccJlsEs8/RMpDWvBOIVmlvy5g7y1
 Y+6s+GKOyqWD5GLHdJC+ISHmc7AjWtY+ppdfOLGu7XIllfgj6GvpxlTYY43GqUsc/CkQ5W0RV1C
 D7+Y/ykwP12KdKjHKhpdcM1qVTo4wajfvFArceMhkKwavM8T/7lM4z5VecZwz+z427rNHUO5oQH
 2VPcWNjeTIuT0UO1rYnof36+nr6RR1jI2o8C17KT/T2mWcAh0f+/eKXJaRJkU0fLRCQl3NsjZFJ
 Ir0RDGFrYhJQgjNe5d7LDbSXEyd42aej0WIwuE4wRmtNhe/E9n6FkKFd0+xgJ3HQT6CPGYtgm2D
 0hSufRcRvytqueSI6hwgjgwHMmQiklrYtKRplk9WfD5Yj3Wdmhc007dbKU4R7sjYXGdC9qHnnX0
 Fy5VIS1C4liH8x9EPig==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07d273 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BMemq1xz1GlmVizxLk0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP display device is discovered over VirtIO, so the MSM DRM core
must have the DCP backend registered for it to bind.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bb383bb0fe8e..af95237ac872 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1209,6 +1209,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1230,6 +1231,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);

-- 
2.43.0

