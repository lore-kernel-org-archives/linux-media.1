Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4E3242BA
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108293; cv=none; b=gCle6/IYFZKMiB/rIs6bVxJgMeMoL7GUKU0J9Q9ULnj18zLdlsbkn87cvksf1bfasX7brjbBLzsBwKj6lRsY2uPGlBCwdFcJMyqolYYKIO6j8bO9q8idx7UOWqnmlNc0dGAFcniFvKHO5yTj6SWjBcjncbuH9MND9oATXwWuVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108293; c=relaxed/simple;
	bh=xodAhjykuWl7xQ1UdgzLNcKCY0aCbpXjk2b7LKvOUCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGK61h0GgljOm+N6Ju6QSwmIpEefSErx2nnZ12RstUVFdLc4gOfncYtzZicZ0hImCxowiwwdiuFsLp3VTx0BC27CvYUp7vb9GE7/KGiMFFHb58XqaW+GA9d1ytcGtzk2TQ5CfLTuD48y5+7Qbl2I94PGL1BFhytBB3FCU3p8pUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0HtX2hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvrOPvXW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0HtX2hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvrOPvXW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj3dr686440
	for <linux-media@vger.kernel.org>; Fri, 3 Jul 2026 19:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+7rJ5pi7vc
	jWlKDY8Vdn8sewCr1uk0qSBX0f/87mts=; b=H0HtX2hLDru8JMoQArzbaE5LOfw
	0PmOhP+7x9PpJ44C1wYElB/pEE/AadwSvdrwi0uIzZkJk/QMUX5DyU6x0o7BkRFk
	8BJpVSuejk9iXVULoRbC2X6gud1gTQ4xHn1YSU9/IQtx4Ky+EWzSsQmcA3xp/pC6
	+MnOGJzMV0nL+VUgoZbFhVvPmVMOotmHWORnNZhy7/1ZGREbb1EnOprFlXUDAVlN
	RfTVoap57G0Zs7pQbe0oOXHWnxLSOibADzoCmaPEwP9yIk12i6WygXVRdg04GFoO
	P7I/gd52Ko2ce8DjPb84hpH1LvMNhQUKCGrtABkrlazO6G9itCuO6l0h60A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bt0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 19:51:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7cfa17fe6so14439285ad.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108291; x=1783713091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+7rJ5pi7vcjWlKDY8Vdn8sewCr1uk0qSBX0f/87mts=;
        b=OvrOPvXWQ6HgNzE91sjmhGZv85YFCHW2MRU59rYU1n6yTYMPdSD4Rbx3h/xdhsdho/
         wLNeP3xFgLjlE3jr0UoOhkrHtTIe9jFAAf1xFMBrJ0cyJxs65sU2rgraakwunK66OAVL
         6/uPfRoFWJe9vrIfsOFmQ8bESLkgugLi2ha8s7ybumeJzymgzZHxNzekiWyPxjBEV5h6
         t/ckDBUQ/apRt6DJa5tAj0vQg6qSZ35F2x8FvZLpn6oK6lAXihiALetXbfe1mVyXimUE
         ZqOkG3sgY2KaDf67enASbkpSU3u2hsBoNQY0eVOIV12wsprgwCGXt/IwwNenafiusg80
         ZoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108291; x=1783713091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+7rJ5pi7vcjWlKDY8Vdn8sewCr1uk0qSBX0f/87mts=;
        b=WtnHS5uK79TQfI8igyrgdJ7a+1A5Dt/ZC+O5VHgPH26CTLOiB6qlFUH08qxQdeWlJ2
         YOGYuwX6P0ZFQHGBT1T8PC5RcgBSrxH410njOhfEzATc7jQMey5wOheLrSaHHfSfC9y3
         tMQgVT+jZ1z27eH+LT5JuFxtVEHWnx8uqfy/VUV3CEqVUBEtYH1j+CMiaE3ZWwBFZEkr
         6nK8Bio8YlnIkiRWkDR8bdbK5tdutZYjtH2vZRm39syOLCq+SFAc5Dc+ZMPCbClHBcWL
         rOr7zUYfQrodJrdjGPnCoNDi0C9GFThi4vJhRRY8jmdWqzEMGiG/qPYXp84qWk+KkRDg
         XcGA==
X-Forwarded-Encrypted: i=1; AHgh+RrrUNEskq5oNESVPT7h4fuJKtVXQbIG09iLEgJEXHXGUH3xgyj6JtuiaCDVXwVCnE1dJ5ryu/TMnreWEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVApIwTCZOFARQ/IcCtBkJhZuEwqTfEDp35O0iWibqfhl6CjxU
	k1bEjuNPO4zJ63w57Ljb+1elc/KtiVf09aO88FJ17FeFaZsjFs5Yc///6rdheeEVpV2WApDOkTG
	X3R8jvdWmrL0QinhiWzLzcA8uWkOQsdAA6cmlKGzheAK09EtsdUoPA1TZR9jYJ9N+pQ==
X-Gm-Gg: AfdE7cm+zlyj05yP1/sRFsocx3kGhOsLXQsU5pTe64eZbh/pLMIHc6buh5NnHaCWVLn
	OfHmDso0RQCx1w23erGBkNHpRSPw5j0SzxQERflyJ/by6qZgsZ114JJ0NpKZ4Za/szI3zaVwJIK
	qzOWr8I6HMacXJpepzWyGS62dDJ9Y6AJCDJ/aLyQC98OFxNueRu6P2w2p6ZxTJd2yBhkCyKYlzo
	mHenM+MAVtlcrSfvU/6sW1WejApgSvWGqAhtjGGnd720K4CEuLUJfiewDYm9Oy5thfoP2GLNh5A
	93OToi5YB2NqQmya8UbFLEi/w0A5vzUscq98ARQm0QDRE78Y53c2cmVcv5cwajcApctPcTahGBU
	13r3I4BC4LY6ncEXMbA31gxGx4tKIKBvzopqM1w==
X-Received: by 2002:a17:90b:1845:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38280d98d29mr843458a91.11.1783108291244;
        Fri, 03 Jul 2026 12:51:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38280d98d29mr843393a91.11.1783108290587;
        Fri, 03 Jul 2026 12:51:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:30 -0700 (PDT)
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
Subject: [PATCH 30/42] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:43 +0530
Message-ID: <20260703193855.110619-31-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX80KkYmrEBqnp
 b07v+VhgJ56diw7RUbrD0FrNToj7atiKpxAT+zqkZCwKcd0yPFsuYJhdIxYOQeoq12tlGAiir18
 eV1v70vT7u3SILyotUSqR/MbDUvhqSo=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4812c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BsJah_a05XtIl1EiQYAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -_mcTJF4cCKlBqxsLPLaHNfnaMtg7IiD
X-Proofpoint-GUID: -_mcTJF4cCKlBqxsLPLaHNfnaMtg7IiD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX/Z8TbVi9bWas
 9HyJQ+yqiS7CWa/Wobx7jgJDo/+pj73VATzeVvIv1Khi3hbnGIA2yQygVbD85NZJChuv428CWwn
 qJbMU+H1JCUuQD57PDFKWPUyVt5o+zTw8r7X8m4wVoujMMtmCDCPRdOE6A45A0K2kQCaSyGmnEM
 Abd3oVrbWnKQi3JotfgVw0vJJf+ThPwV9t47HHLmra6B9Xh2/i3r5vQ5L3p2DD4aZvdFG9yMF1B
 u2imCi/8J1u1O6kOnzsMCLJjmClO4eVIxOtvEOkSwlBlvE5JIO9CRAqBFmQ7QlKXanFjarby1n3
 WKawJNGGV68qkIyK+X/k4MIwDobpB8qrdXuWxNS1yQu2DuIWlmiV+bBNcbNcwFEXJD9vKCReWrj
 jwMPUhC38GtttPjyiy5RX85Bmn0E3sgkZjqsxpyCwbfcjra9kVou+41z8VKoVgzw71xvYB9m8pE
 t3z1ac3Wm3hwnyIfZjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..7b5aa94064a1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -341,8 +341,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 err_sram:
 	sunxi_sram_release(dev->dev);
 err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +351,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.53.0

