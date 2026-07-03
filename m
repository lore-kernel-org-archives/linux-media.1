Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F833DEE1
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108030; cv=none; b=lFqaPZHiLTm0A2Sp9TGQOAzVI6LOBl2pZ92KrDTR0+nr3PLzcEnsm6H1m6Qm6GJHZv6Hg1wxdcmTWgauh+qr9QFqybNGAyY9bK/tPb/ZJaMBwFTtrbpd7a2k7IVNGoM8VGyrkxtyG1tueIvtcfbuv0Yi8CIU+GkdUg5tdT2vHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108030; c=relaxed/simple;
	bh=1ag8CKt4fCTEhLmKmRXCXehyNPJpiTr6k9RPpRFt92k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oa0uAxVbOSl+wI7o20n+Iy47n/7qx+zkA+kNrNwkecschL9W2cmEjjDUlVSd9CLd6OpGOemO1+dTy8EbNkw+ktrhFwMy9vVGnZSuCjSePoQaXDrvdUOo17BTnwAKdnLSl5nEZ4hSYDM4Taez7C+8oTKQlF88Gqur1xY6+vTpjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY4QvfxB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/n2jGDU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY4QvfxB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/n2jGDU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiWM8676257
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TQ2PuvPwxYk
	Wt/yOA3YLy/RG2quNv49+20ByVVAjYo8=; b=DY4QvfxBiKqNUjE+FO+PvI+2fN/
	tWkhy2AkYZlVHf5nAR/ui7uQa+iRBuLntvRwgE0dQFPkqzoLgEMw0zeqlayJ/Gel
	onjx03ASz3rWePMh+qGM/a04eeA80fikGiR1H9p8mrt2w/n2sWBvv1DztzavFtXL
	/XeeldILoOCBesxiNfgJ+C4BADjhG2L6FEbE1s+veZRH1J/q5MN7YvhlEZTBrt1i
	tgodfKGbcSEh9Oqr/vvq610x+ieI1FDFMT4rZr2sB2q1M3/nEMAHspCXkJy5Qnpy
	5vg2JXZqEzbKmYlRZWLE71DuByFP/kvnxPtKLGkBzFPdFWg8Hz/Jm6Zj7cQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:47:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so1712979a91.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108026; x=1783712826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ2PuvPwxYkWt/yOA3YLy/RG2quNv49+20ByVVAjYo8=;
        b=J/n2jGDU4xdo5YywAn40wRrGTtIhoSj+LgCTVhslYmtNPt/UlSKSFHT7zivPinkC1/
         1FEvtbhqpUld+oxG4NQrWJ8Ix9bhHl3Rz2veLQVc+FPy9ybYgOu2ZdoP7HsPZQ3ud2UY
         J/ILC2RVk5pUp960h2owAKtWQcOmf+ZhaFwm+VW92OOpzbJ9yuYFk7Fmk2s0w0wZ16SD
         ca/PWmXayVFpbrmbRG260PPEx/zIH0KmY3x5/eB/KWq2XFUg/CqLR2c2vfbCD4hUhlJE
         m7q/OY72/pY91YcDdoLAC2FVbWy1OoolSZoVbl4xInzbLJF8r0fR1rCccC+OivUkioEd
         /CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108026; x=1783712826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQ2PuvPwxYkWt/yOA3YLy/RG2quNv49+20ByVVAjYo8=;
        b=CADOEfe9Etutks7PfZKCwHI26IdU7Qvq7k/aYPeEW+UPw7JBfikRo+tB44tXs61JTg
         cGhJQMzOJQRAQUB7C2dETJNrjieV221O3CLSZgWHtPVdWa5lhYUl6flHBJEcwfdzBe5Y
         VN4XHjwOtuOY45RkXFVuqi+KCgHorZOJO1c/HQRY+yE4hXX6ZF6Ww1rTGYecKZluaEKV
         yxSiHNqqLBh1EWNTYCybwiUWDjWhuvDlG+YabhvZu0i0WqhWOx2V+XNjto1qRxNDnR9p
         3lxmFvCDITrIOMkHWWzARBYIKYPFo6Pw+4YS0lZUV5R9a5aHdNnfm70BmjMLG0UM5Ofw
         NPQg==
X-Forwarded-Encrypted: i=1; AHgh+RplQfDVKKh+z4XBKZV8IeeDySRQJZbyh42spsRcZOnhdX/nUQqQP6YYODZ0B0CTjyjlRmSpkhz2YiUw0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvEhaU1J8QaM236JbD8zDUti5qXQtoyk36kCuqqUcOtSSFdYML
	uvHstE8Xd604ucTFTQ4msTRwO7TKjtpRE337ZNXljvIUMVe+MkMYNiEDLu8f76CdsTsfJfetltM
	KDsNPmcAjCP5Vn+Cou3eZUX9rRIO4FbUHBt4/O+thfRgAFZ854stICXvqHiKdniGknw==
X-Gm-Gg: AfdE7clh+S1CZOB8OgN3+4MnsHymAlhkNsSw6Eg4DFG5SVGJblFWL30HhxKdpG03heG
	pSSMvdUZKi6yMVJwWEOWjRRhHnUuCGAGuNeOTKg9BBIhUgkeJenWvYBn9i4yASn+SIYejeHfpZR
	HFTX1zCEfr/+vAiOOPUKgyKej58X2A5NWr0JmI4zdwgfXYlywjAld8U6W/7lZvfSmR7w/Eqy5Ag
	VbHh/Uisbjl17a8Y99XY2hvGqpPcywsBON5G6tQXUOKMQr7zUhLMsnCUGXnUcdUC97tYwZhdm2T
	CuKV+SCHnQMBoDoSxuKYGhI2LmsBj/LcOzSwx4LKct9HLeBByojlOubdjiYflDc2SxyTJ/gvX29
	jcprmeZz4Z5zQY8kwzGySjW0XEu/8aBc8KuRogg==
X-Received: by 2002:a17:90b:1e48:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-38280d999c9mr747551a91.12.1783108025418;
        Fri, 03 Jul 2026 12:47:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1e48:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-38280d999c9mr747443a91.12.1783108024778;
        Fri, 03 Jul 2026 12:47:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:04 -0700 (PDT)
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
Subject: [PATCH 19/42] drm: sun4i: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:32 +0530
Message-ID: <20260703193855.110619-20-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXx/7oPklcwWDg
 TS136EqqokH0C3eKl1D+zK2/KUCofJVzkizLAoWrNluNWFWJVWRIxciGj0b5AyxNFZocmhXgo4F
 K1tlO0g3g9tf4vngQOPIPNvp9s0VP7JfaREvlzxp1o9QTq72DpZ7MDF24nB4RzkTkZOWtJPX5cY
 kqq9zxbv1npTl+kw+Q/fU2HskWz9FcdGMA4vqsPBhYMQT42LkLRLOrCLN+fDfuK8p5D/dYI02y3
 mpQ7YJ48xCh1m+L4jlbPJEG0CytLbeV0gO87mVxzgPNqSfM6pBjAsRQQewaKAW8b79SwyXAblOP
 Fd0nAQcZreSeuGnwGjYLzclmndtSYJfTEdUbvpB0q9iPTZkuqhORL+yZO9yxDVVj57vE7Xj5gSo
 /CMdjNUO9wfE77I8bThZADrgnZAEx9+7tZut9hNepHvszrZKLdpPnCKSH0UJI0EBVFpJSE+JmFA
 YK/F43jbrc6QAK1NY6Q==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4811ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UuaWy5wPpgFSIu4BNl0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1dQ6tR02jxn80tzUOrWxVYl_0ImmvXc1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX4Kp7DalWBbDT
 yZb3y13DjxrlEUU47NrlBgM5Kb1xKF4MUVvNOBKCGiZmZ9hCGcP3mnmdc5tQnYs7MshyQ5pIhgu
 BFNTyAcg2PtuSURAax1cvpner+HFJDA=
X-Proofpoint-GUID: 1dQ6tR02jxn80tzUOrWxVYl_0ImmvXc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 8a409eee1dca..5ca7b6f4764b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -80,7 +80,7 @@ static int sun4i_drv_bind(struct device *dev)
 	INIT_LIST_HEAD(&drv->engine_list);
 	INIT_LIST_HEAD(&drv->tcon_list);
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(drm->dev, "Couldn't claim our memory region\n");
 		goto free_drm;
@@ -125,7 +125,6 @@ static int sun4i_drv_bind(struct device *dev)
 	component_unbind_all(dev, NULL);
 cleanup_mode_config:
 	drm_mode_config_cleanup(drm);
-	of_reserved_mem_device_release(dev);
 free_drm:
 	drm_dev_put(drm);
 	return ret;
@@ -142,7 +141,6 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 
 	component_unbind_all(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	drm_dev_put(drm);
 }
-- 
2.53.0

