Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC94C3DDDDD
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379667; cv=none; b=qGB35LncDfUfg3YK7oYlb0/NNwdCGsf6HR51A1Nisb0OgkKgWohtOMJnyB0ZUSfDn3CfBkgI8rtDyYjI8Io7jTWWX2A7Hn9giAMzTk2XUXq/BgpwAu7lKwnKcWN/wND1pboQBWt8k+XnZX/G9seLyHBL4LPEBErZCPT+1lkeZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379667; c=relaxed/simple;
	bh=edAqkzR2VHg8wkB7OCT1eoSkZr2X0FpnBQkzfDMc3IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5p8DCvLy27Qc7qgL84tQnTROy02KzA0604H0Pzxpwf1CG8TXdTKT5vEP7WMXJd6hxDL/tywaVTgWwSpBTmCRE5ZBUCxEgoJnUR6C7FACrEJGbTkcJa4HDx425gC2d8T/cDUUhDHOBaGHUtlY4EKcA6ITCiBPkWWGRj1AE3an24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P64iHGeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8i/Vmk6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P64iHGeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8i/Vmk6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqqEN1650547
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 20:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J9W8P08UQPf
	Jw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=P64iHGeU+wqitnO2yOTz85CPPMC
	Nh9EN3gs+0SkmrParjRLd3P0cOTDHlUIuwGLTuKjTJxj2CRNpFTYEG6MPoVkvEoN
	KRHTCcUMHiCjR48T3RBTIkIlHfwEfHUJn8w9LZX6cIPl6V72APy3F7KN8w5EZhOh
	JmIfKfn1M9o8qLLLslSCCHkih+JlFWsLs5eIut+RLMcZtwCohJ/vch0JdGhdKGlx
	05ci71hJL1xR4/y/O1dq2OyMXjVfwO3NqnxZVBv4QnG1GPIFy2RU34XcrhpbqbY2
	dqXpMxp8akRJCDdTl+S71BL///ZwoRsnXT5kuM5vJcaDjuDRWHNG9Ls4ndQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sqq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:07:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2902490a91.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379664; x=1788984464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=I8i/Vmk6xtXlzdSBMcOe3SiNp0TRzU6J6tJ62ewpHvUVlzRz1oyCHU/SdHkTjBpLZC
         lqE0tSXr6wYc+GzByP4q4Dk0V2jRCcYjK4SPopzjGlLf04gX3H7ioU0OV5ZKaYimb2A+
         vwZsGYqHCOQqtHSt9UGnLjXoBLOacdkkFtj1CNsmk4aN3CNF050P+2m6TrVD0RfPxyKc
         SA7NVu+EDUdSQHUo4UnqnMCgmvUzgg8LO+7thPpd9gdXUvUdsSeKHNQ0jfs1p72+NClo
         T+1409gGOm+cUU32Hs7XpqbbeauLT0SiXWm7I4Yhm92tOqNYkqY3mRrWw/q0my/z98oQ
         2LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379664; x=1788984464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=ZGpXMQ1NCDyS7wVjX2jpQ1TW+A5zxBlyAO2XSJCWwaEjrsKmrEtEj9JDDvf/UNcifr
         AvnMMFTre8XQj4j/nVwDmL+RegEYP0TeceKy6+nAw4lZyjhbXRetAmHokLZSFn3Omq2/
         GUJ529qJN8kuYxCjxtzv0L+qkIEgexT8ONXiGakvv7gPiBeiELupXPSzM/T9dZUt9+x5
         t8sx5mmxGcn2YBayt3KhP98UZh1m15fHUGG/trqsFdKJ9pPWBgOKuRBXMTPHJrd9ZVvf
         5dFb65Fhw94bbPoal2Zu1XlpTdCK9iQ5+4/6Ao/ydb2T/Gi6zvqxmQf8b2RPgz3IDUju
         R4Jg==
X-Forwarded-Encrypted: i=1; AKwUvByZYs9R7aVcGgROKCr1mTCMeKoCzFimhXMhjfLLSWqP/ZohPHBgyWZVi/R8f/Ftk5M2OfGHE3u9nbmGKA==@vger.kernel.org
X-Gm-Message-State: AFuF++lxROg1TQrjlR02npGISKVEwDt65WncEYSc+Uhwkjo+owsAgvah
	GwsWf8JocDs+M46De6wPssBMxUzxVXBnXpm2RiIQeXR1ovpS6+ZaWWBA8ogwTB6efrOyPlUU1xD
	1ezHrP8zva37to7Xai8CDtr3Mj0uX++jCR6V2DYcdr1VD8FNaaez+UsKhmnfgzBOh3A==
X-Gm-Gg: AYBFou3WtumlifVSx26plTCVoUqL4661hY0e1pDDcdREQ+M2bYklRlfCIt53dFIu1V9
	ffbO/4uqaM7hJcGHqkgbKEBUTODmaYMNQ/LmcP+/ubo6RYkaYZfRaXE0IkK1c9H3EQXUeTOdcDG
	lTqCPrjyqs3SX+4b06kRG3hOPQr6ANlC6mRvDJkfHJKP1wVswF0/EVeWqJI7YaMfR8y6tKMpg3J
	1cAVFQmwWtQ1JAOqnu7SN4/viHqYKrjOETTon14cTzPPe9xhMe9IIBUT8MQzvC03UBG9SUZeGOO
	k6Svl8EIWcmVJwJecVtSBysf0Ib3atV+HydUElwbw83rChf1l4iJzYHbpyxvq3UE2KQgAEzc7h+
	QXBDxGy06JrDK4SrKpHs9W4w/YUg=
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639284a91.7.1788379663619;
        Wed, 02 Sep 2026 13:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639151a91.7.1788379662903;
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
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
Subject: [PATCH v2 2/6] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:59 +0530
Message-ID: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXyqXB0kue23oi
 7FSHm/2BMz2xeDMYiLENeLt31+Hl6fbjEG4TlkEF5yrocQ480uXpjtMfg6yKQPnIWCpN7MxoeTK
 r7zrouomxmnfTyD5k9GZi3rfigVHgx+Utp1twShKV17D8/JSOm3FMK9sLhwfX+QSZlF+Dd87w2k
 5o0mbW3P/6KmHZVoNeC01TMnEHurDXJRXz4jiw4S/FWejZbdLRDLdxc5bCEhgy7Jb+Rp3nC4mLS
 Y64uaP6w0DaaEEZQLYvwnloeCN6OOCWyzz5TZQUufylZbbG1BC7R7zL0JfRlbCYJOWbayfjHkDz
 mPtShKGHp2zJiRHoHqFzHDiIb/fZsOAkMWoWIeY7vJ9k3zEzuk9Px/L7Y4OiMrWDtYcIsxwOtzT
 Nve6Be58aeEdrqPuHwkP6NkvgWxDDbaGyIwQlEYzkShuJhPObABxz/Opi2Pg3s9Ic5B+ZLBvnUT
 0P6Dv45L8/VpOCddYtg==
X-Proofpoint-ORIG-GUID: T29_ySK9spj79aDSxVEkR12Cpp_5bseX
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988210 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: T29_ySK9spj79aDSxVEkR12Cpp_5bseX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX2UVZRsjieoIL
 zul5nQKMWNzmAJLLto13E7ppVp+I9XO2yjgfyazjfCqJX62uwHcYaDDqS0s3v7mA23ibm4pWiaV
 gWiaD/A+uT09m3AruFPSjzHTJHNO9/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..7ba9314fdbd2 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 	if (rc)
 		goto err_unprepare_eclk;
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
 		rc = -ENOMEM;
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 	dev_info(video->dev, "alloc mem size(%d) at %pad for jpeg header\n",
 		 VE_JPEG_HEADER_SIZE, &video->jpeg.dma);
@@ -2288,8 +2288,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	return 0;
 
-err_release_reserved_mem:
-	of_reserved_mem_device_release(dev);
+err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
 	clk_unprepare(video->eclk);
@@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
-		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
@@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 
 	aspeed_video_free_buf(video, &video->jpeg);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static struct platform_driver aspeed_video_driver = {
-- 
2.55.0

