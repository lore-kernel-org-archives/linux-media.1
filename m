Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DD5421241
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 20:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379708; cv=none; b=A9zdRv9oXYkuub0E5CGQSs0y6e3D2TFSXitwAWb0JMPPk8G9CYJ2ieI8NA+JEH8rxCcNm8g6ATJtquSudstUEmlCF/+jtvU7VWDFZtFVL48aZYcFFWbjGWZY7y2vKiK0Qj9NZry86pzRNa0heXQ1SY29iTZxcvj8igaSAC6tzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379708; c=relaxed/simple;
	bh=Q/UORPhGAU2fywQU1yEoWb8L5nIPF1bJxGdWPOrhRfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAJ24mb5GLFN07k8Y5/9ZxXpD6VWzPT1gjDkm2ohsKWkMcrcOcnMKlNOkYbQrjqqWs6WdL7GBiyb/jzvpTx/1esfqmc+7QZY0l6PuhtK0bsGlBrRRwcsno8SsYyr7XGVers17AUgYwzy0GLCsE9ZtJwkvN0NdHFcTfrYS0ZOmbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz/tv1sR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfQzaleb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz/tv1sR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfQzaleb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr1WA2372725
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 20:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6ghP9glQZI
	jLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=oz/tv1sRl/3WsGWjrvJ22sIWBYb
	EK44Eaj/gx7eSgTeGrFcBt5xotgqCYwj204u2D0Ndd3sEk1CT566XOJaRzl5VqpC
	EbEiiC/Sm70Il6ZcpQ1Ov/NdzUMXu1/Qh5WISHG1p9iAn+cPO5nWSkGhU+MTBev2
	tRFRmXaaICjuberKDCp9omSoB4vhP9evTmwK66S0w45DyWz7Iw8r8xrQISBK1dmi
	fkEIEA2g/dFwWupDcNawXcQpj0E0Wo9XOuag+STbTcUpHqLyXrUTMbOIJszCF5rK
	DtB+rd2+Is6sHEHgkmy94RiOKEOgofNKpIiX38htK6gO7L7l+GjQ7AdMY9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a7a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:08:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2377506a91.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379705; x=1788984505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=IfQzalebZhi5d8GR81FOZgAoUT27M0XxTOxade1QlRZ5YMAnsrEFjIcojhlThuI6uN
         9VZ+8IIJeZDBi/3uIqKDjjNsx7WtWze//spY3mz5Q5EbRaCos4t+0HAr9u36uQVkOoNa
         0OMzBerPfTMu4dFKK6iPAQBmDHcJx77SSgGccaNq/XGlcj8BNzaj7V4mt3CkTA6fvBfc
         f/6M4kI3lbHHaIF8sn3BJdQ3anwLcuTAbbOiIB1yiijX+E7+jL9qnEO28ddScOdJX7C4
         3LggqsVa+q0bDDppFThm83ueByVYgqO2rP9xOvuUjM6lbnvUyplbvw7mmkqCG0z/6f39
         W2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379705; x=1788984505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=X8DmsN3UnOYGyTqBRz4FrrbXPqpWCami1XQXEPRlckt13Nw6TuN2zWnKpYGoa4tuNO
         8j4mt6enWpYLQ3IfyESsumS9lBmHHACS1f9gImOiyzZAJeBWaQ3sHCdlcEUOqwyu5XgZ
         5eyeKXJ4KTNuBZxxuCWnGT2iRVtLebHPFqjC7g1Z8M1CVhGu6xfAX2Pyd1ntxQnt7/fu
         hK92iYUTJrt2tKhmrAp2sQdqn0iFfrxiWLhAoX0Zb/VlEOnOvIMk8TDyr6pLXxSYBa1t
         CO5rKnxq8wd3B419wivNYEblGo0KIXrVTAnJQtdIecsWuw9ASBFVlAzWyrCh0k98jThj
         f5/A==
X-Forwarded-Encrypted: i=1; AKwUvBwDwWDVMkW724VFquWC4iUzJiKAQ5jFj31LVh8m+THUy0eRJ/OfLFjRuTf4xPvyZh+QDSP7MPMpZ5SVOQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nRdOfSkI3DKkqZp0SwSKQn82yOoLNTwRGXoY2Akjqbfo/gGuFN
	UHx3QiYWNauZNAH5IvniYx/tJoq2gnCkWSi+8QLyJWNa20gOdWN8JtmwnS8tQW9bhtfHcytbG8t
	TpG13+7B1ffKCAirtytZ6Vyko07OJyT7KFCUJycQg0UH+0xUKlY4G9mhF3AzbFjwvYw==
X-Gm-Gg: AYBFou2VB38bSkgaaiKmelTCfS5vcvXCwP5VmZKS92KQjConY6q2Hc8mYjXofEE/3Ln
	I3jbuskj4v3hUw+MCWcKymoXW6ejMKrOquvUM3O0rJlHsmej5CuZytfVKQSUfEId+MB4u5DoPd5
	LMWpBdQxL5nCbXBvKDqRAcSLrrD+hvDed3J8Wk/kYrBtTy/AnrjCfdiZ7BfjU5XF7NOYZ1q1bGS
	VHsyMea+PGgAlABbXVthYERxl6gy6rL4whAGsjIyFF34pamfhlB/yK+dLqkEs1jweWCZoooZs/d
	0qn6rlmVSuNmPajJfdTeY5YDqWuNp1yvPMumba8ql1uPPyoHMVvcoIFrhO9YU8c94z9J0uYcGKx
	5an7aaJdh556iN2uJX2i2CQCzBfU=
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293347a91.7.1788379704622;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293267a91.7.1788379704103;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:23 -0700 (PDT)
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
Subject: [PATCH v2 6/6] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:03 +0530
Message-ID: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lU2aG8BUX3lPmMe5FEUqcMx0RXmPIwYv
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988239 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mTAD4mZO0xO8FHYJIeoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8FCIVrmcUrk/
 E/93ruDhEZ0RqaXP6ls6hwj6xW7vbJmefQotDwytDuTWUbA8UXjlXUbGX2mwpHmKWc6mHnOZ/M5
 dgosw/P2FnChQAS//9SoBpS5knLIMLYyW4dvuxFLanfUbDAbnSGqWqZq+e7fJNd4UQwFtdZXTwJ
 8NgdQzzZwqGsTQWuYbvTU7wcjIIF1hsq6rscRyHlONw2tTQUrrFi2jkgFsX24rdA533/quQ95Ea
 OXtdjfy2xjxPS64ebd7xNl5o5W9r9ctbXWSGUA4y6+vItDH4XtAyr3ybs5mmZqdqOgGEGGNv0El
 RrPlek9MXmBO0dTOxAZRE44nhuk5YttS6+J3NZ/JRnO9IY9+xPJToSNiK8wgMjYq5mOqhPCFd/C
 ensljBHidAasrQpLH2jh+F2gfL2GJubkWrPPYedA08+mPqWZ4S6FIaK7YBpimijb9e3zl2UwV+J
 5A9z7vGYKchMhr/iF7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/WHJKowZd6Ik
 7jvi+2eEaQllX3BBZu2Fwoz4OqaIRvjJYF44KR7MnnkPPVEFt1IA+qWAJ4dLU1Khj6QgJZg3VQ0
 HS2BcQNrgzDuS+SydGoc6JVsxhsqfQA=
X-Proofpoint-ORIG-GUID: lU2aG8BUX3lPmMe5FEUqcMx0RXmPIwYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..4a15f45ad077 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -277,7 +277,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	if (ret) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
-		goto err_mem;
+		return ret;
 	}
 
 	dev->ahb_clk = devm_clk_get(dev->dev, "ahb");
@@ -340,9 +340,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
-err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +350,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.55.0

