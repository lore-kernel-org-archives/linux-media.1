Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6BF3E3DA6
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379676; cv=none; b=rga9oqVOf4iXsmsBeKLU0W6ditsIkScsqa2o4/44g9kXYPOXQQiwarhB5ke5JEHm02777PM7X9IvSjmmIy3h+WsRuXy9DAiUJ9125lenCZ1jWKv7bqlAFF6TJ8yE4Yowz2AtlXzqs97MnstOiaGY659xb0nIFdIWJ1RS8vlvUuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379676; c=relaxed/simple;
	bh=QGQ6whxqf+OX3FYh6lKdjsPxftUzslebmpalWNd/V/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0dz6t3NhKn7hpCgAqGcREk8gcFFWNdR4JnE9FH2AwFHMuBWpL0fx9HPQEoC7xCWWaxfqvXnYuhr0LNlB12vxpABR/h5Iy/jcxr6fEFC0976kwsVxGCac5f7OeU1gaOI3lCImtIAuoxf2g11VF1+oqlPpeDVFEPrvbAuNbN4QjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkLi7WnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e05Qc82U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkLi7WnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e05Qc82U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqrkk1586078
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 20:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01vky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so25689135ad.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=e05Qc82UDk5x62lqnblHwLLBwrBjcEp1h4bnKXAVHJCwZPhPRw/bqvPihDf56OP035
         7n782990WOypHFVzEf+5AcyQjrT67c7TMi4V64bJmy6nV9Jf7jp4am1RnRXFZ26hrikE
         PfzYnotbrSZi1vxVJrxq9FfNmvaj4xPQxO9qx7Kw61elrszKUlZadjHNYr6AbpruB36o
         Z1kzO38pTZj1wYbSwXYw3qZJ+iANC/oywT7Gn1qrpKg3jtmV6iprO6qKIYnvEHuSwjLK
         6gElHdiYafnVBIiyllK2OENkOxaHpLSES7kbvXJrnsW1yRSKPdjWSl12+8yKal06hr/H
         Rjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=fB0DWQ4Scq+LPmhsuj4rMh90stZEzXBbZCbDMcpewM1aoV5Nx1qDZ5APJrd0cbBFuu
         9Ln8bDRKni4L33H0v+jiZIaz+mn6PTeGYDUmOj/l2AbefpgpMMEcs8ydIahqbNpVUwjk
         7sEDArCINWy9sUlQwwgqfPD/WUKzlkyuQ5EsKYarg1NRdzeioo++JCl6wF/9Zc/yYb1E
         AD2m7A+i1Chn5IAZAUGN1+WU6XO5ALtDKktFPgFQo646Vpv1/iNqIXSdruQeoI5p41lp
         MGzZ1VbJ87zWVjv5PEASVscC39JnAQ8YezNzcNakQVhEnYZ7Fepl12ljS/50K0jfGMn+
         lvoQ==
X-Forwarded-Encrypted: i=1; AKwUvByIT+es3GstAFnO5w0UX4nXLVJz2KhKqm5GDSg4qpZOBCI5469+O1qisdTIXN2GWt5Vio1Xs92N05OpnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kR0Zz0S9E+PBQsHAWhgACjMGXtxlqDFgtoB+LN1z/z+zexWUqO
	6zjGU/hwV6XWncltcNZofoj8mnFZmO2TMVDO3P+UFR4wtebjh28yDITf/I4KkI8DxpW6boLcpii
	n0LCH6HDKoJS6HdPfea/sf+VDQzcVbfb2AI+73/uNcZm1iHRLyv89mFq3Mlqu/uO1jA==
X-Gm-Gg: AYBFou3zlEhDUT19eB6ko62YwOx+rMU3CIVHXFGg1iE79jdcN9es9zxicxZDK7CyK8j
	lB0jRHrQUPUun5rGvYEDICSd8yY3cOGqwzYiopjVGCLaTQPTVZ3OgDiRdnLbUkXhEr5IhsW2vD6
	z4lw218y11pJf1RoKwiyfY2AuWC5UPCelmbkZ20VrodfiaVZyLkaUOViXEa7JTJDbCx+3bfqA8+
	PobeAEF2Zfo+iE9Xo5ibAMK3Pzzka1DKNEFrAd7V4RkO0SJ8Pa8b1fLOzQdQmV/2cF/TojKn9pw
	vKiEDqiW280mni4zL7yBqBh/5lzBWX4a99SZ4rgwkkYUfSn4sqZdNQjTpfC/7gZTdD8EvX9PPrn
	0uoNT9v/QKI0L18zQx5uAFIfro+Y=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99506495ad.19.1788379674239;
        Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Kzaywx10wvw8fv2zdLYUSfb0DxvVDOK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/FYpeuEHEWXv
 EtiJiK3OFiC0B/j9JvtxqGK9a4FHdL6R8LU5s86lJQ9Lg7r95qzjtuinDOT5mMWz2Dju/yERDk3
 LEuBPbhvV19XY3nN8dXqzSfpL05LckAdeR+BJi4JUBjRW41YwQc+MYgBHukLWUxxmP+h8R1Oox7
 OgvuEagve2tjs6UuwJmCIja3Ar3Iid0y3P2m3tNzQaq7Ma3gr4iV7X3zFhd+zaqS3/W8FaJU7IU
 SncP+GOqOUPubDwBQ+lA97CC21XEwdVmSomDAEq6GNdi2Lnwzh5o5cQ4rnvjYEUojF61jT9kjjk
 V7bF0xEqh+u/qYoxPhQsJxBDFq0RqcnZrjl8VJRGQFGxOxwWBcSmts7MvHHyROv+sbiCsXbL1W6
 Gc2JUUyuA7cRE8DPwjJIe17UumqQGHpq+lnRmoJopK0Yav7fmaSCbTmXMlSvXgy6uMCRFNseY4A
 2c3ouB/Zv3pW/Bit1GQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX0i9u733FonCa
 BsqotnJA1W5g6TZGBfqWQesZlTHlmQdtdzlvE5/tKXOmp9Sdtf6WG13UN6Y7uh29W3gVJWQcNHe
 vJ/EYPwq3udXJVORHqIYZKKPWH+x9dU=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Kzaywx10wvw8fv2zdLYUSfb0DxvVDOK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0

