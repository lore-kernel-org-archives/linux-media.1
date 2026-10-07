Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5234657FD
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363656; cv=none; b=ETE68FxeFmiPFddICZQrFMGn5voCCy+6AUHIwonJSxnHrls2v5+E3oYsbtBNSGy615Mja5rTla+B42Z1ttLyY0rg0/F50GHAvX1r7qsCyC/JM8n9PyVvilhaPeCotvlI933zdv+BP0YvMyE0PT69r3uYRE338lro1r1BvVsfJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363656; c=relaxed/simple;
	bh=DPgKLvB2PNcWdmQvkIzprusFWSgbJAmy+ICrqd4Fj+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBDApEWnEfG1khygnXaLdkNAYE/d9KLc/0SgMMXz+nxdkkHLZ4Usz0kYIVLjB4TQMDUzotoul8A4LvtrJcJNSrVO40UaCHMjArRehrUQrfDU55sZIqtM+of6s3GzSyUfxyOPpFCgweH5FbSZOtpSAVDQ0JClr735WYyKZkZ0nVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itMUy/L3 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itMUy/L3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeCe3334684
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XU1FwuBtbti
	AGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=; b=itMUy/L3SRtQBTA5YPer24nNTW9
	qUUPFiOqYNNGvFJMTxL7j3Re57tgl0hmsQMs5iYpDL/MOh2CK/ebiCq5BYOh8PdS
	AfgZ18Nud/mi57+PTN7JtltE3tlOIATi/wLjpZKXUz3mLog4PnutU0y4msrDZ1of
	D7vxe5R5WyJQrZzxzON+ch0Yqrair9If0jpeb+a07vx+GcIPm+zMB7Q8cKBpvMIq
	6sDPCToiGDPCj+sEktkp/0AYxe+tdUopzGOY9Ec56qrX+uaqJtJ8T7mEqZY41Veg
	QgZTAEegKLsaIETP7YYPnX0k1/o+3xnPzRxxUuwkdAui2g70a6Wg1XLflJw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623am7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:00:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso75680936d6.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363653; x=1791968453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU1FwuBtbtiAGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=;
        b=YHLMCoeFA1neTPEzPYx+6GmrigXome+66PNWwMmZPBjtw4L/5uqjbXT7T7bkSrf+co
         igUpAVpSKWev7dMhlbZYHhYuG2nrgFzfgteBfhyUZzQuNwF1RO9Qyvrq9Kqp2tCn1jF/
         BXx8OJ7vYv4VUv+Wh5dFs7DY9R6LECpuyoWSoGz0+PD5yZ8KWAyiUnQUW+IT3PHCyy/T
         ZUaahonUh6alpEuJtWSVsgBH3Jm65W/nodo9NsEEIoYZk9USULDjpPv2WvqjWgbrzHBW
         05yYNAIdXVnVBz5uF1vcVR1wrpFc5224dcPCNzwWu7nC3HqCJQlFAdU66aO4WndOR1Bx
         YArg==
X-Forwarded-Encrypted: i=1; AKwUvBzrb9ogbMIFGDN0M/HPn1ZhQvJLefOahmbL7OT3GWMN3lzzoh0YdHFxE2xx4CqeKnL4ArvJtu4IgQiKrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n2h9iDKKmiG6KoCvKymeJo2g/pECC1yvkX9qP7RDtekObAip/p
	AUXFReW5Uc36M8LM9CaSy/vc0qd1G7Do1FLt1MNyf8p1sgGL1HepgsaII2XhgGe89VgoyeVg+QU
	wAv6gn42mv6LllNkWdwnXgVudAzm/CRkmZGOL8C4spbWhVBUi81RLk/co3DHJF1Z45g==
X-Gm-Gg: AYBFou1j9IV8syWhkk6BMp4p8rNN4HZ+uGjwrdijOghf77Lz5smgrotCCV2wnzc94r8
	4fqjk7S1nxFSWpX1H0/vg2VZPX1yWyn6etbtlZFm5zKw0A8f0HjqrEvLUMtpBveTzEOTaEKwCX6
	nHXYDG5gWxZyNb3eN1fM9hGkGO6+lp162amQDmndLluhtQKH3l+g+07xpabwajbpYS28u83F+yk
	C4n6+pZT9o2Lo8zcjnz9VeEJb/+wDWvpg79id6faNwUsbP6rMKkG/DoZUuoMtF9W29FjaNSaJfZ
	XmlHcHd9c6GRPKJ08us4qGELGTwACpCCskt48qT3GnB+WFWOyoJ2mjbSHlg=
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr261079385a.76.1791363653177;
        Wed, 07 Oct 2026 02:00:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr261071285a.76.1791363652377;
        Wed, 07 Oct 2026 02:00:52 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:51 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 01/45] media: qcom: camss: report probe failures
Date: Wed,  7 Oct 2026 11:59:57 +0300
Message-Id: <20261007090041.3732717-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DIjFV-cl3iBdhF-RI6sQAp7V4bHi2fY6
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a46 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=_ke9eFR7E5bWC9if0q4A:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXxEjFWZYViOc7
 9ohKoObzMrHqg7WMm5PYVhp25Iq1/cQwV/Ndlf/gYUgMmChgUFpAiInXX2dK9lLDeBk9rnT84vE
 7syxtEKgTOP4S75qSLv1RiGXAp1t+60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6oJRKDz+pgh9
 KIMS6yE9ks+xaoPZ2CH0tzd85X/elUNWTimGw/rq/C0rCm3RQe9p8Cv5ar4F6ToPxBgX1HdhJ7C
 somn8t3gwv2N5HJCbtGRdZdVytBm9NNtSbXAMLeCTecnOGj2A+Zb9f6sWPfVele30xrnwR71yAD
 KMaqyuAvDZdxlqAtJl409N/dzoMZabLhQQfHQxyTQIi0tRZsP+PRK6I3BqTDZYCLK0Zibc/dB50
 PD+qKWfqO+HP1iCKFHGgh0UQDr85nGU8fwwLDqzMujErnfqvI/xeVl8JJTh5UQzBkAic9Jrhs8r
 Ix1ke9uX7dIJpd7fUVZLPvrP4t7tES79JEGYJvgxYCVGxXuLJAa2LltcxndEh7rkSlg03UomvXH
 02cj5G7RLXvyg7FjEaVtq8Z2ig9Nrh+poYwT4QsK2Qrt9qHpykWqLat2uRnI7cLRsj9N0qdgnlw
 yC8wkVicEI5Br3uoZ1w==
X-Proofpoint-ORIG-GUID: DIjFV-cl3iBdhF-RI6sQAp7V4bHi2fY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Report errors returned by interconnect, DMA and firmware setup.

This makes early probe failures visible in the kernel log.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb0290395b..1f662b1caf5a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5418,8 +5418,10 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = camss_icc_get(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure ICC: %d\n", ret);
 		return ret;
+	}
 
 	ret = camss_configure_pd(camss);
 	if (ret < 0) {
@@ -5432,8 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_genpd_cleanup;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to configure DMA coherent: %d\n", ret);
 		goto err_genpd_cleanup;
+	}
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -5453,8 +5457,10 @@ static int camss_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = camss_parse_ports(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to parse ports: %d\n", ret);
 		goto err_v4l2_device_unregister;
+	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-- 
2.34.1

