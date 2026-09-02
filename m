Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3E48C8CA
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379687; cv=none; b=dHKqQ+hfiwPwWuJ6b8PZnXI97Humi5RT2HEB2Xh5kmdRmxIBlWHk7e4PIP45/bac1nslhxI6ItVVMbL9D9ugko8uBc+EDQuS+x4dkNEMIPse2CvAKJe5AFBPU2cjM+sUSu00KxAC2SpIhYkwvvnedjbKuj4DI4k1fa0okNnBma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379687; c=relaxed/simple;
	bh=7irciqc861lyg2o5ao1Cr0/B5JpGbM206OChW/MMQ/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYarvw/uusB8GDZsaabLKQVtU1f3TG12IJ32vFiJcX5tKE3IGHmYTsMwPkPUU79H4y8sJcgGAluURpo8Jj7nQAHC7crdldNYPlSmOr6ItGmTidECzdDXMLhR97dba7f5PkwHVUHg+abj1xfamTVVzFcEqMlAxJxc9wN3nnPfoJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tz3iT1Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBOSCTSo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tz3iT1Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBOSCTSo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr6QD1650757
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 20:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sqre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:08:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso18808445ad.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=DBOSCTSoea3Ggs+veG8eCCZ/dmvO9y6/nO+KBgiY9uaKItg22rjh8jkeG55BSRl4yx
         XZ3Iv1AfyLZtwYtNd6dCPtWayOHi5mp/WW/P+xd/T5TrLl+o/jP1egPa+rml7LySNzww
         y7szL0cjP7ZmbrjAUm7GiUP+iaBMGphpJ9w4CGg9f3w76PN0Q7DMGpE8GH18RHFR0GP+
         4O7RoQFhYplpRTF7NED2WP22Q2VghF4T5P8m0Zhg6EnTPYMY5R4UBf01jHLAFptVwz//
         roJf3OKq4C+/m2TTC1CZCvk2bA4YvPossUc488RM++zHnQhmqWMGveurCB+LFVDm80AW
         6Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=T7kfXB94kaefB0lUu3KQYeIEqSNPth6WqoAivO7NeHUm8utwPVJdjDHKHmx7totH4w
         utgonywdyWXIHNXOyGRQQPIr3Z1hY9d1BTmO9jcpv2T3IH9uHAo30sUXMlUP5cCgvqpS
         OwQ63gecICnivZ8F8BVyf6q8sO9xmwm5fIcRrgn2FPdwNHMVo2/n4S8g9ia+EZWhdIY1
         2vGks3xrnqM50w0Fb+723xjT5xmT014ZbA2uA8OAv12c1hMJLGhPxqDXDnvwsoCHcHRK
         csy4mmpeY1PcL/In9sSAKsoDYm58TB+mi6/DEi1pdeAuVzZo82O0aGoJNDjjbLsQh9JB
         GyTg==
X-Forwarded-Encrypted: i=1; AKwUvBx+gQ1lbEGUckrClhaHeImAN1u6WcG1UE/rxb7l6QBkLHRgDmv0K6fcwnYcAGmKYnuRBL6QqUk+iEf90g==@vger.kernel.org
X-Gm-Message-State: AFuF++l/phR69aQ2P1st2Cjg+LmXiT9jSOLQvHs5gsJaktYjFPUS+2OW
	AvHm3iT2ITtFIzUUXk/wTwmrYRYKvMuVASL65XocYKViiKzi+sxg++xW6WVnML4pheMdV6yLpDF
	AuL8xFzn64/yGQ+4U4PlAOZZocyeMcyr69NeLfGYD9Ro/H332DCYTiix3eIL8sYmmcQ==
X-Gm-Gg: AYBFou37JucsI8lovMFVLbA+m8BvCKs56Z5RHlju7HkxeaCPEpXPHu4OjnFKFnAZJVH
	oWoEd/obeBPEHmsXFkXAMF3isiq5NBZfR85Y9eSFudqBcRz79wFJeqgnRxA+YlGe/fSgPwtNi10
	2Z46ioV6pagP+wNQpxvYMDwbczwhP0gogKWKKmcXOwnHLOvYSjeQXFM3dOhbi5ERZy726G1RgTq
	eKw9w6EfaELwcZ1gZe11cTK5YG1388qOh7zc9/33S11Uka2eHe8pWq7u77GORiybvaxBh+XmS1q
	iRe9py9WANIH+0dFPlhrLveSlW9xe09unyuVJol+GHJ4IO2HX8inDpH8SUuyvDmAeZZFft+9zn8
	xHpPWs3aRxWzYJ3IlEJIAUCgzzyI=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80446165ad.4.1788379683969;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXwi8jYsotPz2a
 UDaZeKFn6gWc1m12H9+4P0te4H2U50/l08Kwh4fczEuBItg2CbEEj9W9MKcwy1oOhYYZx4cbJ7z
 /u57u0IghNNdDm3gWm0vqY/WDR33xkc98RB84BPHXChXrIkqB10jDjy9QSPFC7JiO3hKvpGwq1z
 WO+UXBitQacfnMXQmyS4uByNX7RIOAPUgxAXKKjF/H4jLgT/iKGHowbU3eWewDmioYcsiWVxmHr
 UZunz+H/xmRBN7bwBRMUrryYglPl9L9vr/ObCnpuj/YT4VU26g+MfcG8XN9vpXlnEHSMthFD/3r
 si8AOnS4CQO2D1zFISWDTCyTmhFX+qjMTit/M8dsE8wsv6k9KdLqqXRJgrgBYYX0o8oFoROWLcc
 Zuv2baA7qWd54adbg1FCCj7kVzgMWIsLPYxIS6wOlqX0I8/CZpfPoFAM6YDM3JDLZ124O10H4C5
 D4OfGAxTzsENwobjlWA==
X-Proofpoint-ORIG-GUID: 7KZymPuBrXrPyJZYl4mplC4_rprebrQ5
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988225 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7KZymPuBrXrPyJZYl4mplC4_rprebrQ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX6/aOuSHhpgKS
 xP1Teme8XYAaefKQ3Wd5xgTjYqvbyaGrwJS1F2UoQwJaZ+oHCi1E5Wrmy5uCH0UMUN1F6j+0x6i
 VaSm34HlOh6biztXI8/hQTKMH6mCebs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
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
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0

