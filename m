Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A73128B6
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107617; cv=none; b=ol8vJVNTkDcfjtDdpM4LagtfV4gH677nHZPo+3sukbQ0K3Q2N66WNE3pP2F770ReuEPP3XIAPg7hx+XMFYPJTOyTuqolzYd19sY6OXxGHglrEBVKOB3QWKpGZoMyY4WfECSNtXEz9y6leZiOLuX2p6FGjrQa98ZF1WZ+85NHK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107617; c=relaxed/simple;
	bh=oHFB4sL3tHNSQdz1blCjwGW5qxp8LON4aK4OWW8RoPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnPCwpCfn3ebKvnCyUhypWzzWg0uCI4kII3DT05KuBKTAgvEFfe+adbOG2eBNp5Y3JT76wTvub2DnZz47nsFpyMYFyZwVoiq4vpyrf8X9W6MNw9/eV40uyHqMnzmwx33AP1sPvz3kilfD3m25Y/xbkHwn+462kIt9mEYF6M5chU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HipLHZTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfe6pkbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HipLHZTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfe6pkbf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiLfT546530
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGH0Mfb9t3d
	kT8UvMf5f1wosC3eQeF337EZxodGa2xo=; b=HipLHZTmLwrBQObeVsOGWExITfp
	t7/tVWx4vzKDtDPxgNwrOMMLEYbY4ozBpTauLC1kSTV/W7k1Qm0e12vRO+ogANBW
	NW0APmhU3sAdU2NrCqlWIoHmD0kU4SQGq4ljc6YwuMSM7GFhHObmCpJ+/+rhnKsQ
	INKlcMzloIbYPjrnEN/lLIpHGyWDH5yPXXSi8+KcBgoraO6K/MnRfB3UUkLILky6
	qTPqH4OVJXMwBZsrvWtdNjSsexZaz22Q5jADDCPONMxS+LjIGY3qz0KpGGSr3YaR
	wcrE60nfHX13IMBNYdT4V8pqcZ2+pD+AyngKR10muMKnOdEdCQYuLKpAovQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02va2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:40:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so439161a91.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107614; x=1783712414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
        b=kfe6pkbfDyOMipG+41hzYIo1UgkSqM2IuqUMs4o+lOSuMBn9CNmiv/UJyytAWWUpX7
         DGFo1i71iZv4rWAJCy9U1j6q3vdmJe4Sg3qoVkyVsee3M5E4ATmtqjuhn+spap6qjtwF
         pP6lIv8kUKQQQ9wqKgsNANYZa5M1YoX/vlwtRQxeUtK31XS/DB5hXTIzLwCqxjmIpNsi
         Gm4Ijdf2T646rmJjxH5G+I1zglB0XLQM3Y3p9fReGA2V2EhaRkRLh/Z0Ygne6cGzcT6v
         LS2QDkDhP4p60bH0uxJHGSeQTd+yd+RpfutdDfhAww43S/CxB4pnz6+aHIxFzWDXm6rd
         T+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107614; x=1783712414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
        b=lF2CKZZ7gN9fcCl0TQ4SoE+Q7cA0xp0N0deB9x3ca8bXhj3k0C1QKiucsQzPEqBzuD
         mFdTJk8iUCxcnhMouN2szt1IbgD5Fflv6HOemdQE3AAtbiJ2GeZHtBPu66sGoPww42xg
         q8GKE/85i9Qh0wEIaTWvyIl24ojyeQRuT3xsTf72fYFK2OrHTJGqLGj9zUVsE0l+yOwk
         LwwqClHvc7YxI0dR1xnnbLlDR90F75a2iCmhg8KNVuZh1Iw4vpwmIeRsqO+AHQiWWiK1
         SV0KXjTirAqo3bDUhBXNTT2KM60AYPxZtoHQ7hg2qp6aifCsQ4RQHHDNzH8ax2hxrD20
         6+0g==
X-Forwarded-Encrypted: i=1; AHgh+RpJMB2h7G/Nc9BboTxCdqjLd0bSHLzeQZkRlhPfHp1j4b32Gf/WUuYlCzz7/n4APkOBlJ/Xb17A5fd47g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Zv55gXui8MIy55D/9MrI39dfgJzKKkT87yVEF13SyDfsFvXW
	LVi9/0ISVMFgitukWGPw+rPyCVpRmz/bjSTjImA1VyiLoC/d/7X0cmxu7tBTZx/eXf/uMCUyU0O
	2B5V7DF49T0XMmTHZsSujLnGpWKJNC0Us8TAD1xCdHF+BzzHLeemWbYllRVPDXSdKIg==
X-Gm-Gg: AfdE7clOogU1mVAvWAa3QVrUytbuPLdKv0pKiVMrH7iMCR4iauFlazQ8o5zsgOrgSko
	PuWZ4cOv5iZqc+btc6P+SAGdo0r/TXfLKTYd/l30hjVTdO3ceCiGCFC4f+JIZ31zLF8FocJ1Fed
	LJvu3IglJIfpNqXZbAX774AtcoFr6Wt8sSYUeTqoCZ6a9DR5rmx3YZ8/6nGeRJZbbVL4Tfc3Unn
	JOSAlMAvD+5c2s/79vNHV0SYb25/TzexhI4oZrfzRdCP6NVI7Y1KLB4JDe+EomwWXZ6dartKKi9
	y7MoTPxUIzhZP1zA2EVRTSwX7SWb5ThTukIhzmZtSBDoNSYBANwPSnklO/WXmLJwkCa5FliilXS
	WCVI1KwwoF36NaZV9y1h5f0UjXX3icIBE8D0X7Q==
X-Received: by 2002:a17:90b:4fd1:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-3829f0054e1mr764384a91.21.1783107614344;
        Fri, 03 Jul 2026 12:40:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-3829f0054e1mr764330a91.21.1783107613641;
        Fri, 03 Jul 2026 12:40:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:40:13 -0700 (PDT)
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
Subject: [PATCH 02/42] of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:15 +0530
Message-ID: <20260703193855.110619-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: EreQEwzg-Y1diwdOlEvMF_sSSP1oncFQ
X-Proofpoint-ORIG-GUID: EreQEwzg-Y1diwdOlEvMF_sSSP1oncFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXzWQ4C6iRHD4N
 x3eeEB3NZheTwsBqyWMbUMcBzlH7V2uVI47d98KrhSL7EtBvZUgmULFfbDEX5h91CHF6NWSvDN+
 KbKk/eJV00W5M7cvUDAcW+Ft6NiiOOw=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a48101f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=K3bnyJ_z4bF7bLuR74EA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXzNTaGnlpMOpD
 JVCGQ5wYfx/cbMqARCiGm/Ourzz2+dUPYcRbd/3l3w5B21bNli5+6N9dMuD8C1FeNFH8HxYpD6b
 0G7pFAuurdc7eGivagfs4qnohZpZqqB6IWmxP1StGBxEpqb6WoBJPo6HfrA0YF/Kq1AbBEF+qKU
 osl+Bv5VjAO21aGLTdf2U95Ki5IYep3NAZ+Cbk8DN1vi0mPp/ETCiQQyPzjarAuMbiuFkWJWVDf
 iUOlvsWIjWqgOKNlFDZ946x6oXRvHDRgfeWeIjkp1UAruarHZpSX8xB1wKvo7knATst8ofHkBL3
 4VLisQNqMYR7uqANp1gZVLhEvTPhQh+TfnCI9jbZztOy+yCClq9nKd0BipCZOu/DAnrpNrRJNw0
 40QjBH7dgWnjCu+jbVefXtdUlSB5fupyvzllKURYvGs+DuuKpIdvFoz7MFL+LYku4u/HTbyqaec
 mdIoMPrPRH0JiS+LXtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Add a resource managed inline wrapper for
of_reserved_mem_device_init_by_name() to complement the existing
devm_of_reserved_mem_device_init_by_idx() and
devm_of_reserved_mem_device_init() helpers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/of_reserved_mem.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index b9fd78123d77..52aacdbf432c 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -133,4 +133,25 @@ static inline int devm_of_reserved_mem_device_init(struct device *dev)
 	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
 }
 
+/**
+ * devm_of_reserved_mem_device_init_by_name() - Resource managed of_reserved_mem_device_init_by_name
+ * @dev:	Pointer to the device to configure
+ * @np:		Pointer to the device node with 'memory-region' property
+ * @name:	Name of the selected memory region
+ *
+ * This is a resource managed version of of_reserved_mem_device_init_by_name().
+ * The reserved memory region will be released automatically when the device
+ * is unbound.
+ *
+ * Returns error code or zero on success.
+ */
+static inline int devm_of_reserved_mem_device_init_by_name(struct device *dev,
+							   struct device_node *np,
+							   const char *name)
+{
+	int idx = of_property_match_string(np, "memory-region-names", name);
+
+	return devm_of_reserved_mem_device_init_by_idx(dev, np, idx);
+}
+
 #endif /* __OF_RESERVED_MEM_H */
-- 
2.53.0

