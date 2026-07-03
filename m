Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C43333EB1B
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108080; cv=none; b=DuM6qU83Jj0OLu/+50SGXC8HCpSyD7HkLS3uKayr3b4QxP1t6MSikO+fIa+m3L354alWvXt73bSkOpRDedrvfuH6NTu5QJLL9d0jye1y1deH/nfnn33VWg9lt6DS7UeiQp/hcQFQ1f4YuutGrF74TPDXGDgkUPCwOhEs7aTi6Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108080; c=relaxed/simple;
	bh=0AzNxG8vWTQCmH86VPR5fCzyLSK7mXuSOy8qPDSRxr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VStlPJChrkFlL2AaPk9E4JD2XDxXHq+iw/iHmYkI06fe8orLoWX9FSauUaFSe+yUluyMwvpqlez5aoJYbCYfW2YJyK1bGnxn97FacZI7wFQTHlg1//36lbBWS/WzQAUaeIknmfsUmTpkvWb7NpY5uiazz2VkV0Z3ACQ5EezAeVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZRbqGsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqyBoyVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZRbqGsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqyBoyVF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiX5F662857
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xuYKB9E0hzF
	7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=; b=hZRbqGsBRWL/VYFCQeXeHyQYRPi
	GCEQKMaidc29Zyn17PyPi9mLE8M/gFX2q0clAuvqWEMCi5m86/yq0yfMwm66+xQg
	Yof60+ODe2We/1xeDUT/7wgvqLLDAuqKr9nVQmVGU09S2WsL2G0wpZggA032DX2b
	1cZwFSAZJtbX6Yg5dpbk4CTusF2kY8mw+okp6PnErHmqIt9fiWUIYpZW1vkWg8mz
	kdCzNTjJvN1F2Ng4/ZvC/o/W0wBPVJ1xiIAyQ87K1oHGDx6soXMwbve9EDpAugEF
	jr3ipdr+eYULxOuL+KdU7t1704r0d+uX7wy8p3c36wO+CwmF+RyFLO7Y8sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycfmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:47:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so447324a91.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108074; x=1783712874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=YqyBoyVF14930NKz27guyZxagzKG7HPPMbZRs9Db4RqPb27Mr0qBg3L4J6BXYze/4l
         ix9E1Bg/d9AyKg/8Ma9WJW4PZd867Ay2JGiVN50GPm61YhMuufRfDiYp1rbBX9MP3n69
         gh0cs1FxfCXFIMc9IlvVQgUv/ROuNmeSSJqYjN6pq9fxRh4MH1gS/NMr2WmuEGMrbxFv
         CiCKmp+LrEbzsWlwQ69bEGK1P8SU0Kf/+DzD/KrqNEi/0CZ4cNGVI1rWG1Ao1Zxd4PlN
         5u7IWTQ77Ib2oAz846zu6e8HXmGGHJxhyM/rF9bJOd+GtoxR8Q+Mbp2wJmfbOAZXp1Ii
         smlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108074; x=1783712874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=Lw4P98My3vp65TH/Tvt9967JQkuvO9pm22lTon1YnvykHH+7T7XK675ESmL6Xo7cdv
         g038nQ+fSW4iMOg+beD0yupOOlswxCW3a5Db446G3jehXsYVKXaYsr6VylN/DnckdT33
         lZqifH0QIgJ39oAiTXKDPNgajcgi+flMquUJdRU2b6nJO0tJjkHrwMsWyhGdpI4/exh0
         mCF542hRidL16j57mMXPR89Rz58M7Jw/HubM0un/JtFHrJF/MdizDTkXGcZDhOTvPy5W
         YfeMqt6kAT7HNOYhLHiLrohU9qdEUzEa2kIU7mEo9ZQ6WJ8huMa0arg4MUcELy7CbtAn
         bjfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYRLrac3Svx7r4wz8derlJ4XlXN9/JC9jIYZCH2zov8zPGti04R6q//xPFKbeDSkFlAEKK5MWJ5VjFlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEJpbAXsdWwve4rOsHYDpZykBQY/Y0FMX6MRCcrMP+9JgIDTeB
	56eUENAM3OMl7mNBmHYhEuW06MO9TBXtHltMFLQ+S2uTR2CTdmrxBMRIP4RnIP0Az6nx2kP41pp
	rrY3LnMG4QIIinl9TB8qxAoHOc1Al9+hL1lGy04q+nUeocqQYjUZs9VLvfP1RwBrWRw==
X-Gm-Gg: AfdE7ckpNJgm1SXQDLe+6dSVY6xfeGAJvTyrgL+CH3qdhS94Bk35zLdViWD3pIIQNvr
	9ZeIABM3vue7TUUvf+im8Y14+3jQF+59KNFbAUWQGKIq+GpsEHKjFRka0IlrKu3hVQZHWUnOQYp
	IoCHdSUukywakwA0T8aJ2cR6nuxYBjMD3C+foPoyWpAIGYw+qpwHhrCdqXnNnCsbFWcLFx8NuWl
	TtvliXSwH5/vFYc2OHvCG3IGkLMHLp3AZJuDnWQxmt2njKRChpQrNHhVAI1+8iOsKkNz0zRM6/C
	EICbSqJoOgwrbLntQLGEGG0jYnf7YQdtC2VhrmrvJ1hFNpJ/D89ON4x3y8/rNDy9krPKlGAM6nR
	8xCowYZdUhFJaZqyldsvv+JPvqviCavHrAydYLQ==
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730908a91.26.1783108074080;
        Fri, 03 Jul 2026 12:47:54 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730822a91.26.1783108073506;
        Fri, 03 Jul 2026 12:47:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:52 -0700 (PDT)
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
Subject: [PATCH 21/42] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:34 +0530
Message-ID: <20260703193855.110619-22-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX706bLLYlTpp0
 ionhLnVwbGHBBI7xLQXdfZjTm3jYz+KWRjGEP3lhvmRKSQ7KIRn6lEwP1VkykEXhzr8uhUSG47F
 RMwIzpUAR2snmTWCDjADc8itH4UfCozzYQ2YZMi+TuOPoCeKxUhJEa4V/MFG9zUsndsFFAamxdg
 Y06HeTJdeCwdTIHHJxpWhkfuTid+CoqDlrdJmH70O5JfbyBOPs3GY9NZucrdTgPEg+FO/BCBSqL
 mm/QZerwX/x+ieMFi22Ny7KGowbAKORc4u1+ojF8tISwIrZ8Y9VHGVLt7UxbwkwuTn0Nlr+EtMQ
 A6v7Tsy31olfq1pFgr+ZZgTlIs927C8qPwBDAOXg8eGMcPvpbx4NxHHaclGQw1FOO0ohqWTCbm+
 xDvSqjUco++sx31+Bjh5UayjkYisoo6Ln3vyQGqvHGY4565PIMuX3+Q5c2tZuIvvLI4DlcrvxOt
 KemaY4P/QYI1O1MfzOg==
X-Proofpoint-GUID: dwkr0lCnoxYyAoTR5dreEpavv04xm3Sq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX4lw28lISToK2
 cKcdXYittt9S2xThH66fMXKIomCbH1SGuZcwdGPxrzYlyeSBun3H73inkbZVY3jDMMJdAgJC4/N
 gXx10qDR1kNufyCJkdiRIERQ7zJUwj0=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4811eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NKxwcvIfb8AsFCMGSgUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dwkr0lCnoxYyAoTR5dreEpavv04xm3Sq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 94a389b3f833..afbec11f69f8 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -801,14 +801,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -847,9 +845,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -864,7 +859,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0

