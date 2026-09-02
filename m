Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA00D39185C
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 20:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379647; cv=none; b=uw9HtMVwx9BVZkwo1pP7hmGIgpGSkG4067A/WXS8nnMedfIi/vmWwIWCrNBCgYOQsl/8U4HEt03DcqYQtDHc2pWeSwPFVdC7+LeEV/zD0rYNdqAtzb1pF4HwtOnVyuzy0GIOPfvlrvZh6dHnJiMAgOGdisBf9ilbOGDuAicdTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379647; c=relaxed/simple;
	bh=+JRsAXUkPd/zCxfFhAsZWhnWtV5dxWny5nzrwbSSkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZSDb9DLyB9ZFwBEbVI3cBaR1PFVuWBwW6dQ5opelKfqsFaVksJjSk0JbqThGsICImNjDoWBXN6x4Goync/eNP83SNpFZ+IOm6smsT1p+uT9pB5gPVut/WYGmL1HpzYNHwAb+UmvnCaA1SPzfhvnK3GoDg1TA8ZY/0iCcmGrnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8qTZHJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ku3Oze8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8qTZHJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ku3Oze8n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtXL2209578
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so3010781a91.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379643; x=1788984443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=Ku3Oze8n70oKifLbL0+vYZkKiwTSx4ePYlrUMPFF0Vwq9VTWJv8Ip57LyFFZVb/3YO
         MuqC5MBTXCWoo803hXZFyMkJzgMWONskcROeUp/ykuQ24FMX+M5HtVz9P1BTjIkE+oen
         uSgwQ4QeI8VS+ihr+kvAF8Dr787spC2388+DoUXGx4ILfriPaqdmSIUYRDO7e6wX51M5
         X6alXk58dDOj4Vp2kbGQdOKluZkirVH78S9zjD7X5JVhf8D1Fn+ANmqOllfs5qAW0SDt
         u3My96UGHb3eEz7R/BbB0/5uWtMU0pePXIF/TGiqe3SsD0os3cwDbAqmHT/N0e1ABSBl
         X3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379643; x=1788984443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=QtD3DIjP0nrS+lROg8kc3LfO2v6FSWIqKcuoR186arwCtVWj4jU1ckNnxhP2HcN8OF
         HcXRAvVQnNVEJbSDN3OxSvY3EQB/H6Yi1YxRDmDeUDG/BTDcsiZb9zuusOhFDI34o0CI
         ja6qOW8R9Cq3HOkVZHm7A4YfBWK7dBkwcleU/YQ2r2Ip80+BbDHt0mRtDwWEHs+hTgmz
         2FfQ3UUWLgHtdA1XtuUm3EPd+JTbW/cc5VPFmft/A2+Qu9kc7tUr/oG5r+XGVfaTTGV3
         8FvgtVobi8MqGU31RwOvCztw923FYPIN9uqZZ0DtYKYrW3fMW+3KnkhgW1/JKiLEeIQj
         gMNA==
X-Forwarded-Encrypted: i=1; AKwUvBxxm9yLBxRIfe1tqks0Q0R27F4++u180ay5KnHcxy+7DBUjjrrdXCg2A8iup4sYbOSWqb+m38m4RhRmmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mmzX+Q/BfRliqLFcAJfI+E1DAggPiOsK1MbKw0mpulLZ0Csg6H
	Ensuix+rqQxwl+rzx82jADbEmKGHi2pQ+RmPeE8tlxLSkIndUl6GGe2Tstotk/Rl9AV8djszDnC
	ScAZfSZ26X0jir07TcR6hmKCW77rYujOD1JBxOHze/lU7CARKKvhgFR/4RiB6sIRQ9A==
X-Gm-Gg: AYBFou0She2vo+n1NEMgLccOOJY4r2/yt5Y1qI/+qnRGCdhAqvmQmuhylRHlO0whhg3
	9L8Y88nCOtuhTY+nXR0q0f2+1BJke6O2bvzUI+Ldj5Gx1coGpK6rGxVSomHArnObXCY3aZkySB+
	e/2WMRqhARQm6sgjUyDuVwePHDosupuMAbC/TRMvx8PBkSMohqg8IZEGw2TKFyJ5ak+lWrm7tse
	0RGB+U47vhtMzYxGIdVRdoZkD8ehhukic9jBfgEsBLomsmBobr6V5yMHYo+tBQnc2S1K0Jct1kQ
	4eFliHWcFg9QAxAaV6jqxlIhOtE283HScxfNIu3S4VFnQFYd9CPUZB6dszx2G83y0kAkIsbSdx/
	qD1dtwbysQtsA5GvxrH747ewr7bE=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604324a91.4.1788379643369;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 0pzE2S9cI8BgasDqHEs89_K1IX8tgymH
X-Proofpoint-ORIG-GUID: 0pzE2S9cI8BgasDqHEs89_K1IX8tgymH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX+qPARqPCufue
 5IAnLUroAXNrLJXz46NHcYH+qnP9qELY79J1NqxQNXqd9wiQCxQT/n1W4Eor0zlckrcoB8Cc2KP
 YjtoDPqZ4kkVOM6Je9i95bY01N1aSQ665dZaRtZ/r3gGG4UTZl6ePOggeIoTStoxpGZw8HChqVh
 sgtmcY103dRoCak+hn/vOfIOrN45JSxtO4y57MA0D4ZhsN9DccXAx7GdmhZ43NAFTj8ovNrH/z4
 M3NgAupm1pQknjhf5YBYjoOfYT/Lfs/RET64eT20lUciXx39H6VXPYs0BtTVv5tFjWcMBr9wf73
 H+SydK6kfx/7BYRIOitJjTPVZ9bS+bHKm/BeKk+AwENVz8gS6TFocK6ga9rIOT5FHu3BXT9ioWN
 75KYMayKLat913gNQG6ED7AURB0L5BqlWY4KycKSVIdpBvsRld9S0zmdBelIAk0LQVxPr2cuZ7g
 tvTuMpnQTMHpQcfJ6iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX3jlp6VOP+VWn
 8rB1Vi/VygC0lYB0J3uLta1VpygX/9jEgQoYo8XTJsZaD+KpTKPSbuJCQegIN6ZZbq+vo4w7gyz
 SSrS249Vs1BeC7V6EpXjTxDk0di7nq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0

