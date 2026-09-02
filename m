Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3732D2487
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379656; cv=none; b=YBDsgI2XTHHp7gU/IoZupuuRrfsQGv9m3fTg2+khQBOuhzCg+WpH2id93jw09yoFzwCbFNcsrY1ntr06WgGFp4lqhD3kCt+1OqcNTOlHlxmrzJ9y8c3QRSva72MY6Cxi6Lf2QprvQVvwQ489Jw4HlA/Im0Q/q7yH1wyAbPb05J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379656; c=relaxed/simple;
	bh=SSSdIplKEJEBPlCNjY+NcISoiNn9OSmXZXvbgj2TGBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QK0Dbk0FG/eiu59kL/RTCAYbJPuAyg4z2hsHv9KDkdks66vZvzG2r5HsvVzJZ52wehdmI1Z9Kx5EN+2Mflgun2QBBPqw1Xcfrg5+3PE2l0lU7eFwiBvjupCR5jIH55ltaSWIuLgOlGGv8N2SM6hi5+1eHY9sErCUIh2Yng31qNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROdgvEYD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF9HGiB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROdgvEYD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF9HGiB8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrrNe2731186
	for <linux-media@vger.kernel.org>; Wed, 2 Sep 2026 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6axdt58sY1D
	qnmVQsW0ISUurcHhysngabrgAEPT5NAQ=; b=ROdgvEYDb2UZdpNEhI8RxvnS9DG
	2OQurEeIzPojM+T0MtsUy8ud0+ePaKsegGa2jZIAz+1/ZoRDfQgUPhsWM5VI8Q8V
	8njeua6nNI9k3tuL04Wmg+SptShh5D1ZtQpf+Zrhq47/HGQS6EE4cqFFn7skgYwG
	Z8Pah6EzNrX9zEbaBzGCISZoP7dl2XJBkXOqozZ8Zn62ajG2B3LSVEfCueR2Cs2f
	upqOVyaMpNKvUQ2R4tfkN7yAo4cStnJcs3FMv3FGzcqkoiO7mcmY639u/FVsvIeW
	raqcwHlpDp5YDpK9k9328GUmh7ldi700HT5V6eYIPzoxV9f3VRQ2Xz+Btpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2s4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:07:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so2543769a91.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379653; x=1788984453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=;
        b=gF9HGiB86vdTa77Nhkm3GZCtZrW42OCFIGgKDIugJHTRl5Sm2x1Ac0aNHRpFcpAY+P
         4Alk5wGHNzfaSVOpixthhvs7W67kMlQ1vHhcVk2sKDZFB3G/93yAQFijw/6cUJjPqnXc
         HCcHpOygUugED1vwJpqJXnXqPwG4zuFSjrTNDS/Fw2aeeS62OyJOmrG6AxJsLGEx56a1
         2j1Y4ktis2yoE5nBRuHYX88j+iZkXmDjIFFtYJki5VvViGRec9+1zfMwnN1MecGwLmhj
         yDt+DMcipL+b8un+iCXBE2NMab/7/OFp67NY7zmIG6oNRRDGPldGrIeTmxtTP59J5DHM
         nZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379653; x=1788984453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6axdt58sY1DqnmVQsW0ISUurcHhysngabrgAEPT5NAQ=;
        b=iqc6Dl+6bLc/5vqw4L9es/wRwS+dAGqKmqc6fJdgl/6upYRfv+5mTKMU7CFFrM7bVB
         HIV1+Qu0/hzp43jccsZyDv7cMX4MePvShqrCHIllox3W7Olmj8y/sCwzPISn7HIZTxKw
         b2cTBDBTQDXGA83GwU67E9L/O2LxP8M3Thse7A/JRELRF34oxLv6Pk4oOv4X7cuNxOuS
         +3Oi1B0Ea3+s3Wza4olf45ZCEn5DiNc3VaSXxbHKxZ1nT5gg6BchK5ZgnToMkE2sL5Yp
         +ZchaiP3xAFgumystAJRr4Tnz7aQVg7fswfGVzyEGWSPp5SVS+FaZkjoc531TRuPlxb0
         IQ/A==
X-Forwarded-Encrypted: i=1; AKwUvByS3LpgKyE7w+AvX1cnMgfKQgWMCBV2IGHNGnxlUDFBgM6bilQEglvMy62+edhaTt8OaPkC4ZpKG1OLIA==@vger.kernel.org
X-Gm-Message-State: AFuF++mIwbXR5ms7Xk6g1IlYPlRlA8SYCTxXSwg35NJ4YSqoOaDEy+GP
	P6SXilAfgRKkNetgPjiTCmD+RPuMQw9c9mquCRM/Z1ARyTBSv0f9BJMDFDIHa6XTX0Pl9hLMgjj
	9Wo7V6zXreoOexZ620VCJbQ63x/vaPmEwt4UmpZFJTsfutX0k/A9tyvhtZizfvlMxKg==
X-Gm-Gg: AYBFou3zzdApgfFtJdLh4dsFo5XmHQ/Fk7Uto34OKbFkBAZw2fXCjPqqwWSaN6Tn7YJ
	nSuByWe+qK03uzrbtvUBe6HWnb76ctnkaloWkbW1T3s5CS03st/Qi5OuH0BM0EHuDAFnYCv9M/x
	7t4agkRHcm9xOIZ2QMfo3IiFstXMQi6sInWadCbo6hHxghIkCTCHXbQiKXusZaSJC0u26hCQblf
	U7VAnayH3DqTA+wPS5ER95SCwpbCW2Bi4W13swCvv9+ebUeTW7N76BLNSb3B5V7aYCw/Gw21nL8
	xfc3IknDO+UJR/JIPN2XGuEV9VuLlSxz2Eb72lpYGxyg/f+3uNH7iHw0u6X2El0xqEQiMgt7Yd1
	UMTzkesEdyw2yTYXcvYQ+3rJHhUo=
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr11942901a91.19.1788379653317;
        Wed, 02 Sep 2026 13:07:33 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39aee21a4demr11942802a91.19.1788379652830;
        Wed, 02 Sep 2026 13:07:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:32 -0700 (PDT)
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
Subject: [PATCH v2 1/6] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:58 +0530
Message-ID: <20260902200703.2016410-2-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a988206 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=wxxTr_YEz1i4iFEBgi8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: eAKiDnaTQw6tTZ3OyGpi9K82mTHAVT1o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/enRbp+dn2Iy
 2ZLRF2JQeJZc4urX3QVMNtfk7REcIzon4kdLsOBSM8JxHKHbu+WZyc8D1Vl2F8idsHnCVkA/zNL
 ajqJmjbeB6udfTevtWK1Q/Kk7qk1F78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/4gp0rMXCMBk
 6i9PFXUtHt2hW4itSkrarvStFbDz05z2wEOs15nrZNUFnbGnaB8bbEyET5eP36pDtugD5BxT51r
 9dk5LD0K/6XT4kujr8mafDZdbJ4QdeSAR3SFjWWtXsGxXfGAN4GI48vg6xu2MFK2LqJU1uNmm3l
 V5UIY7ATQ3dD7yV7ZfUgpxxzexqnhPUv6IpYemg+HupxBaUVJPThFt+Xk807lwbYu/WEuC3Z/kE
 YvXxzc1ezYbTnEs2W50g3lO/LBxG9lhE1d6Tja1EGQteB0yo+ElgDXuhK6U96ExP0PpJuro7h97
 1MXRJ6qgwuSyi8+y79nXm++SoI1nrg52CDyPe3cJDtBZ9Gv6rw8W09Ze9DDJ5EUTPTFEyXNF2Wz
 7dITT2dNgmBRcY5P0O0rCsJXRj3Zd+fmH+AqgHMtylZscji6iO+QZ6SMHGTlVrESNPM4IqACBiR
 /oIaDrhT+SPLNOueTlA==
X-Proofpoint-ORIG-GUID: eAKiDnaTQw6tTZ3OyGpi9K82mTHAVT1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..7c6acc6d7e88 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.read = hdmirx_readl,
 };
 
-static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
-{
-	of_reserved_mem_device_release(dev);
-}
-
 static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct device *dev = hdmirx_dev->dev;
@@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (!device_property_read_bool(dev, "hpd-is-active-low"))
 		hdmirx_dev->hpd_trigger_level_high = true;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       devm_hdmirx_of_reserved_mem_device_release,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
-- 
2.55.0

