Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE62B32B135
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107569; cv=none; b=ONmUbJYVzcFjai+9LaG3CVX2H8ebKSG1nU7Tbwu4qHVMUZYo+5CMUtLPuMGAMdyldzZ4D+yF1iFoDYZHytCpUxA8HSn4z/8RjMM+5k0HfEkM589naKlIgbexZlzaqv+YFRZf5DiNnfwJJrHiKYWxpWaBWTTT/4OkT7zRuujdI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107569; c=relaxed/simple;
	bh=gf0y849jqsWicWT8x2zXtY5gzlbXBv3ZHwVF2zzNRiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ilcBRiF3zuMm6dDscP6lQRUHq7CcIy+BSJv7dGkSFeTOT51QH5mxlOMG9N2rZQH5/g7X/6mhNJNyhgUFrIEhMMHAjn5NB5vl45C4Sue0QUoFlfnjk6dws4vRFTBwAvSCfLItiGTJNxXx1SD+paJGk8W0KVm52CT/jfZjw8g9CWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEMeysY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4su3hCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEMeysY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4su3hCC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HioXw495393
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yuDgKoAlw/JRHunDNfGXYB
	YzhSRLVnjx2xmNmMEK1vs=; b=YEMeysY1/myhDao0i74e7TNlV74ktXTCfMwdq9
	CR3QbS5AITeviE8hf9EJ30WAllVldtcYL4AMMm0/LzjQKzr0t0eqDF0S43incuSV
	MyApeWy7M1IbpM60LNShiFzTpmwg+/W0PKTj+Lp+cXYVgARiHsuxhXD426SvD7cT
	GGZrPR1QcL7iICOr24d23aBH8a/MPY5danZVa1/zTiMmF2fSUTDZMyH3oHPCfVAv
	4nbvlJJiytEOZCVzenusm2J4e5XUbEHMVWQY64oswPjfiGG059bwY0hXxdENEoJ/
	sJbKqjoPigEwtHk2s+fe6Ba9Tfz1f/tpFlGt1x1q0Mz2ipmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytke2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:39:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe2607511so1340901a12.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107566; x=1783712366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=;
        b=L4su3hCCMdFYIuBJEM12NFaEaRw+ZWrpRoUoyVEDZh11YUI4DjvK9ddaNZ0BMExuOd
         2hZlmHNXLfT5J8fol4KPgg59lbmOlBJHJLvtyeCImy1jF/kSMAwbrvs4EsymejeyhoUS
         /D69VBuMEU9+bQrWlCo9Q4tGeOgT5oF8uflGGrEJlvxUMOhJacFTLRwWMaWR97u17Rpi
         xXWAwefS+ZCjHSKA5lVMOmvVHyBlDrgnI830dGEmuQEet0ynOmFsg9X8jg2fsX8v2jSh
         lnK1qZBLx5Yh+mty7iPWOejD9hF4OZEM8wC0ZwWLIYTv36W4CCsUu9hWMxrpqNm130fL
         nHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107566; x=1783712366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuDgKoAlw/JRHunDNfGXYBYzhSRLVnjx2xmNmMEK1vs=;
        b=RodR/3BQigrJ0wRetTGpNY8hqVFayiJiNKhTpEQmLMCB5M9KjAgcV6fEMyszyB8xq3
         uIRaiQcMeMovXLZZS6KW1okrSez3X0y9+6U2BlYiZuHCBUl3UiiuyilTxMOH6bM9arhY
         mtlkc/R2KYfGa1XzMINFqG9eQwQqwKGi4NPULX/jxsKSAKw1+X2biJJlAHZI/FIzq5gf
         o+mLH/CI3ztljMgEBK2LXxWktqjRxqoVxI9agNvPq9POATZRSj7Nb9T+uSElCJqcAJxi
         Lp3LSqWxohddecDrFTIsvrPLM4G9UN/jFd9O7YTdv2se5HT9rTKAX6R0lxis9l98B2k1
         v4aA==
X-Forwarded-Encrypted: i=1; AFNElJ+JpLe6K7IT4PZqapVowLJRVI1orZL95s9Rq1wm2pEjnyEFLP1xFGPiOcF+IGTtXAqDOxmqIaUYeVCuhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlErFuG5qwZzeDLhuLq3XN8StnSWmz+h8kLQrUFE8tsXbEwbC4
	HXj/BG5oqQqYPVJ7qqkNr06NgIMCYKkLo7i6dx56DrhRBe5535BUySda7tIcV0Gyb7aDcw1yVcH
	wliS6AO4S+QZxcY05MH74uZKABXVM4PSJ8D17+bfV+wmJt/z6KJU0zVMyZ6aNtcA6zQ==
X-Gm-Gg: AfdE7clS7kLMgbWK3Zs4wXhCBLk21N//rx28clBvYYNL8b3kMDh54cFzkEaK/m6b7pz
	bLBDXEWkCOSL5DjQMy6FaCuQ5gBg9jr5kcq8ADZiiEzuTwtDAXP1X6i/5trQDuIAgQF4yyqE7ts
	A5PFwNNSVnhbHsQG6DegFihXcNUWQZeSd6YoCT83nN3gvhxe8pCwqWPbWfCkM/Q0t/KpSIeyZl2
	3gsuT+rRMw2aQFqoOGZBz6cMIrt9DIeK/EaJGLiAMu1Y3kf95iAzdyi8+kDE3NTqX/SqEt3/T6V
	Z+VWlVC6XU+zPRRjfxVT4WWlsgoZn1WkO9YbsQrjt+KjIfno6Cx1ysymG89u5Kl1SN28/cvKQa3
	0pP/o3vmPUuX9qtamAKWrrs5k+O03rCdfmDuk8Q==
X-Received: by 2002:a05:6a21:4c81:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c03e298475mr701926637.17.1783107565961;
        Fri, 03 Jul 2026 12:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c81:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c03e298475mr701865637.17.1783107565344;
        Fri, 03 Jul 2026 12:39:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:39:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and convert drivers
Date: Sat,  4 Jul 2026 01:08:13 +0530
Message-ID: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX1c9qTiUdnmBx
 u3tS9j1z7PmlgCXdmheHiMzFO0tDbgkOTj2bEXSWCesfHjy1HIVCEcXXmQ+FUP6QYo6DAsFfTrq
 +VBodDrlsUEMXWhbwE944wgv1p8Wmt0j2et8mPDwwCkHl7tFC1WP+HStZv2G6kwb7qT+MPTFsE/
 g+dTSdPQIpMDWXbSQChE3phuiW8IfE6aMLj49jvVoGop9EaAFEdKBhZtHN8KHZsKhj82cQfMEWm
 ZJa8MHxP9RRbEiaNdjRnFHSOjCEIFlM6xgsVDeIjyg2ytBmJIWimyV9NIbA8u4NvyB+IDU7vEBJ
 cJkZG85p/SNnyA7Vx9o/cuWtsj0m3VdVdbxUsxFn2QFdGdNpBPMIhoPbzGqAK832qMo/zoARJ3l
 6bYWruwc+ypx5HWzl2u/sGvGGPHOzsjGJ4N73Pf6zIkdtdW44OrHF/+9oWhCb12zBetV2yNPbgS
 5OSb8u1OzosN864J66g==
X-Proofpoint-GUID: T7uuWiBVFq5y3n6vV944EMibxOGC7iBR
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a480fee cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c_1ikP4J58vCyc_cPHMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: T7uuWiBVFq5y3n6vV944EMibxOGC7iBR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX13U8mG/8eWim
 127Vp3QXoEDf+v0cR5mpZ//devfRtXea9nk4JYtSjDxTRr3WFIILs2faMUlxKxabrRbfjvYEwc5
 gvVgtxaKUJk60Ip/bVbt9yHkwJuyMCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Drivers using of_reserved_mem_device_init() and its variants must
manually call of_reserved_mem_device_release() in their remove and
error-unwind paths. This is repetitive boilerplate that is easy to
get wrong, and several drivers have open-coded the teardown
inconsistently or skipped it entirely, leading to dangling reserved
memory references.

This series introduces devres-managed wrappers —
devm_of_reserved_mem_device_init(), devm_of_reserved_mem_device_init_by_idx(),
and devm_of_reserved_mem_device_init_by_name() — that tie the reserved
memory region lifetime to the device, releasing it automatically on
unbind. The remaining 40 patches convert drivers across the drm, media,
ASoC, remoteproc, firmware, mmc, memory and misc subsystems to use these
helpers, yielding a net reduction of ~90 lines of boilerplate.

This series depends on  https://lore.kernel.org/lkml/20260703164457.4040457-1-mukesh.ojha@oss.qualcomm.com/

Konrad Dybcio (1):
  of: reserved_mem: Introduce devres-managed initialization functions

Mukesh Ojha (41):
  of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
  firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
  remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
  remoteproc: keystone: Use devm_of_reserved_mem_device_init()
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  remoteproc: omap: Use devm_of_reserved_mem_device_init()
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  memory: tegra210-emc: Use devm_of_reserved_mem_device_init_by_name()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
  remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()
  ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
  ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
  ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
  misc: fastrpc: Use devm_of_reserved_mem_device_init()
  ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
  ASoC: sprd: Use devm_of_reserved_mem_device_init()

 drivers/firmware/qcom/qcom_scm.c              | 22 +++------
 .../gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  6 +--
 drivers/gpu/drm/arm/malidp_drv.c              |  4 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 13 +-----
 drivers/gpu/drm/kmb/kmb_drv.c                 | 12 +----
 drivers/gpu/drm/logicvc/logicvc_drm.c         | 21 ++++-----
 drivers/gpu/drm/pl111/pl111_drv.c             |  4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  4 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  4 +-
 .../platform/arm/mali-c55/mali-c55-core.c     | 12 ++---
 drivers/media/platform/aspeed/aspeed-video.c  | 12 ++---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c |  3 +-
 drivers/media/platform/nuvoton/npcm-video.c   |  9 +---
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 16 +------
 drivers/memory/tegra/tegra210-emc-core.c      | 21 ++++-----
 drivers/misc/fastrpc.c                        |  2 +-
 drivers/mmc/host/sdhci-of-bst.c               |  7 +--
 drivers/of/of_reserved_mem.c                  | 41 +++++++++++++++++
 drivers/remoteproc/da8xx_remoteproc.c         | 10 +---
 drivers/remoteproc/keystone_remoteproc.c      | 16 +------
 drivers/remoteproc/mtk_scp.c                  |  3 +-
 drivers/remoteproc/omap_remoteproc.c          | 13 +-----
 drivers/remoteproc/ti_k3_common.c             | 13 +-----
 drivers/remoteproc/ti_k3_common.h             |  1 -
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  6 +--
 include/linux/of_reserved_mem.h               | 46 +++++++++++++++++++
 sound/hda/controllers/cix-ipbloq.c            |  2 +-
 sound/soc/fsl/imx-rpmsg.c                     |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 13 +-----
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 +------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 11 +----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 14 +-----
 sound/soc/sof/imx/imx-common.c                |  9 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c        |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  2 +-
 sound/soc/sprd/sprd-pcm-dma.c                 |  3 +-
 43 files changed, 162 insertions(+), 249 deletions(-)

-- 
2.53.0

