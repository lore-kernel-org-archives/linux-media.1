Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27BF30C15B
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108197; cv=none; b=k/aTA3mqlvqedZpQnYjXha1tyg2ei+5r1jKkVgCrMaB20ZrGn+k13dWIY7vBycLLs/tWpCCezeeSwBtr1hBzdwB8V1dPKHPLL6pf4fM3VR5TB9lsKR5QNtHFIdHJ9eD4f6K/ycm/3k7zJNELwDcR1ppxft5CI8LMaW62mgbCjGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108197; c=relaxed/simple;
	bh=krVcrnUB6KdgrT4QdORU7xJGIRgPXzCI6lY9RG0qL5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3pxZGKhvXhH2Ps8dXONGeXPE5sa9KpDLFa9Gu5FsUAukfRW12OQW29Ebd5Tiv7L2dhwS9UP2Hgevs1FWGcZAg7UH56XQrJrN+ylPjO9K8r9KfIrSIDHOkYdJvlrmNuiNQsOy3SfjYjKRLvagyOJzVKjAOehRNCcFVBpFmHY54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGBoFG5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PL5AgDzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGBoFG5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PL5AgDzf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj2wK696518
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fJAbH4l7aN3
	5pTuclYtUMnOAOaiJ55cYUVwXugzOmoo=; b=PGBoFG5DKTfPJnwZmVs2dz9ZnWv
	A+19hdpiagXyD5IP+W8yCom0V+lFNNvDsvfT+c5hir8OgjtSN7GPw0oJ6p10UJHl
	Nbw7+UKC2U+0WYQL1qrudE7yNEn82i7T8GgUFpBkjWoCIvapKzamKbpq7UgBQW/J
	9Kq9VyNW4T+XauqcHK6IhKgNPypOAG3bm61xHYCdQXOz+3urQQj/Pkp894O+sKp5
	/h3FrFuq4Rg8zTy4U9mCR0AE/2hZ0DdkWlKhnNyO0v+/ezVOQjGWV0d8xJJhd9P4
	bALVJYPyqGtV+hgg6qfMBXmlZHev5jqQwlVn/HrQAckPuakW/p4cYJgbT8g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a624-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:49:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1302597a12.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108195; x=1783712995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJAbH4l7aN35pTuclYtUMnOAOaiJ55cYUVwXugzOmoo=;
        b=PL5AgDzf6S1hsORXXIh+2Teud3F7LuDq4MAvcsl+w0EBWzXQayLmAfw8otGJs3eDTl
         qF5u0cK20cHBd8U9vPyp/4uvpbX16UoStVnTDLWy89Ea38+oA1wQqGACPBKIJPfsvDay
         opUdCLaTzgAKBd3YwrdTN17HcshTUexqDUII6BaWGP08udXXmUA6ZzetXEuj5m7jGxgP
         LUqFqdaDqvXpE+GuQBC9OIAw9DD3FACrggSyxiSiozWWLh7PO0Up1Lr71qi0SDzdKbTy
         yBwy97neTrpJtSX0dkgml9hud2kbDsP3UbMkZtzae+Y5WwWDL52ocjKc5h06IprfiUx4
         t5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108195; x=1783712995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJAbH4l7aN35pTuclYtUMnOAOaiJ55cYUVwXugzOmoo=;
        b=XLycFv7GX2MyB9T/2PiUTbllsMyJMGXo9Y6hQhWwD2rOvcj8S2sg+grEr92d+zF0KU
         kedWkh+Z6GkKc6rzvE7nbmNFzD2hlt8dx79xegmR8Riie0SKGfi8/pihfS+yMCePzhbX
         lu+aQICm2RuiKv1TSiqsb8VPLdkEmCRcao3eFnJdw3jnMseYCTa2AJ4xJpxqfKSCTR5L
         nhY7zFiknlsehy/gCMXgbM7jSbxWXktZp6XXc64ap9sB3C6s3dleUmMSgTY5PfAfrnRS
         AAHOltwQq4IUV7m/VAPZQlcxCcI8NZSEqbGUS5M505sPfIq6uhqpzWEcWWvDhki+PHX6
         fX1w==
X-Forwarded-Encrypted: i=1; AHgh+RpUz7VumXU2kMdQ2FY+Nm/xvWZgkO/nwZx4UgUya5Nevt2opaKZKj8RPIr9dNB9Pxm6laObFGr+kZRrbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyayPbcbbGVCHSQNdw8v3LFe/K0EXpBg305//q0Ul/RnQOBxT16
	yGqvjw2v0dwgz19GX+IZ9XD9Cw7CLkKfQ/sy8SB7NTn+fAP6Rnu27HYwppjC323MsQH5sOJGDdh
	ZulJ/jpNkSBYejsY+k3WfZwwZvRRVALpqukvWJ+n2g5CizU/Pyt7JFWOy2DXAjrgIBA==
X-Gm-Gg: AfdE7cmeKLUJGt80dEBMGkZA+83qvQIe1vmFjVcilwa59l8vizV7CVmpCZZSNSl3jEY
	iHEBPxwwPPqESv2+2lwg7wEtW3Hb5AHWKX2GGU2ofl+ROTGWD6q1vmGxma9yqGli2O8dz9lMBCf
	80A4ks6lZui0+q9AByJ0fuaWiXsadDzz1/uk58ZyNvRKhukdymwErresVMS1iBOrgQulNnEdnyt
	/FOUnJjALarjXH/jHXG4GIFsHfutr4ewXVKLB+VKC0YZ5VELqa72s7cwWcEe/WUI96dK5E8Bngk
	CkZQOtk8gMHxDdpgg9KTn8Q424Yu0evIidUQgkFZGnTd3Tt792d6KL+bMYke1G4ZuMIAyXX3VD+
	Ql73o60FG3vGTAQAiGzNg2YAGxizUCBWaBml1vw==
X-Received: by 2002:a17:90b:51:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-382808b3569mr806728a91.8.1783108195214;
        Fri, 03 Jul 2026 12:49:55 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-382808b3569mr806672a91.8.1783108194599;
        Fri, 03 Jul 2026 12:49:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:54 -0700 (PDT)
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
Subject: [PATCH 26/42] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:39 +0530
Message-ID: <20260703193855.110619-27-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pqsnhxZo6GgjIzmFGmH3DUoPM6hn50JE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX/ZaEH7PcryjV
 IhWb07hMG20tzax4YwPojP2XqoMaLwQeKy+/F7hdzjRMSNn8EHS9ANU5tXno4PRLrg56JHkUS1d
 TXLQiaQfLb9WqNo+oeTvX9EwHwAUR9c=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a481264 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2Epw-RBMujpMcR55kOQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX274UpGdllNtW
 O/CmUs7JhKQbqYr8+4XhcpOfZ31CFV+jmMQFGH0i6XGBgPo5Pt2whC32MHcu51wF1+qm8ZW8g0S
 LMOiLrNGvvsiCmCPCKXnGcgoGedBOVHHYDPAJSx9kznfKkpggGY2WtItW+G3NACfIgJB+RHuM3g
 wPvdOk9N6gyi9BgGrA41k03Wdia/8I2pRIBs8fUQ72pdEzgisaNS3tCkZOh27c8E7lpdg038KOM
 e5YlO+ywSGJA7Q/we5m8KDFGu5zfp6NuJk5PY+Kbq3vlFJO2Rght3mGAEWXvzJ8rhmzw7mPuOSS
 cNpuM52ivDzzXqRHtg+oHhemXy+Cnz0dyGnSuP5+XN5L0ZeHJ0alXnOz7ipBBWidrC3uETVUiPz
 NVNOdOl3bgYFLk7wLTioPyVDVG71Pc0VbwtSNay6rEdq8bWkmiUtjDzjesICH1YIe8woJo99+vX
 7ib/+B8qm8BKGppwYAA==
X-Proofpoint-ORIG-GUID: pqsnhxZo6GgjIzmFGmH3DUoPM6hn50JE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (mt8196_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..dcee037991aa 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2309,11 +2309,6 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8196_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2327,14 +2322,9 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.53.0

