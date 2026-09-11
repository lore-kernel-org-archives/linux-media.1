Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E693F3297
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107754; cv=none; b=acenmc7/MamyBav79WZLiV4SaOMCz0hcmgZL8ds9g4w1vAhTDtigP/PejC1cWQOx7G+ipE6zoRNRxxrZ7iBEHCuY7ADpStmozZjkGx7625t29QaVHAEXpSYLoL9FLnmrEmkKyTWA8SQcv7NJdO/cX/Ogb/P+48lhlqP8DVYNjao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107754; c=relaxed/simple;
	bh=9a2otHsWPgTCqqpoSPH5+inCAvVQ5uCN7hbABIuWFsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YUPqDKP6DZgztXmSAtNuqrfStioaUfgwZLolkzZ87lLQrPizIHBix7SqCCCgOo4fI4dgpAPVA/wU573Q3A7ASbynTkPtak5htP64sQ0Jw3ugV5FruOm3+H7WdzyzQ1U6/nR3yF6MT7aSyU4USnV2ySd4ODvxoUC6iY9sIF1pg/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zonxc3Ry reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zonxc3Ry"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5JJv33180417
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W8+MlrBWEAN
	eqZf07oqzyGDGfzjvQVczdsnNfM3tEEE=; b=Zonxc3RyrhYAAi2YBOkgdhShqjc
	eMmc1ooXzGvLaP9/Emif70goSfDI+V277Xs8sOWK40MHigRNNKUk2hOU0jw5rPDu
	A4/IlNdReshx304qNzx+Wl6ZG3bdNbd7Ww0dC1bQLZbzH8exAMqQQAAsPwFAY+tq
	7Tf72E1P9RmTtMC2N3dTgLRHpzt/sZBrDsHuBovwjfdi/XYK2y+KaXpxJBpkZo8o
	TnKNog+2zD8pepxM6eVyYmo7A7xjrxwOXbYtouaciDilItcngV/aKZCt8xh3B4J1
	CSsA2Wg0a7H2RvvDYYa3roJL9qdJFkxTwBVq+bRe0Mggw1gCcq1T6t6Zg9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd5071n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a00c45easo86564185a.2
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 23:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107747; x=1789712547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8+MlrBWEANeqZf07oqzyGDGfzjvQVczdsnNfM3tEEE=;
        b=HkQSUMTkwj7OLM+aBidmfW4dbpFTEh3LEk8g5BepAF8D45iW24cSlU8UTFe2fpvBbv
         2kBQhjfS/uaBDvX8kOeiIBuJn/FBldyVmCoSkf12A0yANAg4A08ZmEFXASovhZxtBN5e
         C40RtIcnHnY/7Y/E+8tvyzHCokbriyslSTey9tYrMuWd7nSS2z8lPEi/4TW0mAnbeHKp
         +2GF3Q4YDvMrlQuqZvna6C9gvf9Hvj8IggO4dAG2FPZufStPqi9nxiCzQsivcBp5OCFI
         YhEnkwEduFJprCexOt1vY65g6Zew1vOQO5tbUbly8H8luo1SkL0yZLcfCWP9SYsAkCfs
         tKrw==
X-Forwarded-Encrypted: i=1; AKwUvBxS5AsWROSbERw6TXZgdcw/9ggCpoQLEdTiwBxuavpaQQKducIf9O9hwsg+bQbbjDbE+Jry9Tkh2ksKBw==@vger.kernel.org
X-Gm-Message-State: AFuF++ljqontmdQ0SZp+dXsyd4bFqzVo3idW9P6ZLzUAh0RRJfZL1Be3
	kouja5UUSGLxKf57aGejjooMeFpjV0CYiw8p2UfFg18dzCMIjVTbjSpYFfMPagxvaG23eUmtAdU
	gorxevM9ZwYwp0YEzk3/w3GjM3vy+pg7CV3DCoQ6t0R2HAtPNr64lMrNfhoU14DQm+w==
X-Gm-Gg: AYBFou10y/1zsYzj0FbGJmlcQ/IxcgED/CM8JvubfGM9IcK0qZbFWi5FDadzZaAqwBb
	buA9nL4xLUsRxzbybb3a0DyvofyIFgtAU9LZFkxMQhZiL/B4muuqUTd+4XSaxvx0E1eOmyV+EKm
	L87iuQ1rXnbr6LNzro+/ZtpcGAPccOL7LP4PyAzL3iDmC3hRxHo7kehYaLiwk3CcsCG90GHUF1d
	urqoNzG5pc20Udyw8YHIFdPMpgfp75szg2LiNmddD3L52+5BnYN7z5t2+vMA80JTFO/yqV3xV48
	QqdZCby0/es9kKKRzAQmtjQVnouZPuGamPmC/P8PFy4Kp2c1bwWBp4OiLFY=
X-Received: by 2002:a05:620a:29c1:b0:939:993e:bffb with SMTP id af79cd13be357-939ea1838c4mr327271585a.22.1789107747359;
        Thu, 10 Sep 2026 23:22:27 -0700 (PDT)
X-Received: by 2002:a05:620a:29c1:b0:939:993e:bffb with SMTP id af79cd13be357-939ea1838c4mr327269285a.22.1789107747010;
        Thu, 10 Sep 2026 23:22:27 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:26 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 5/8] media: qcom: camss: Fix CSID-to-VFE all-to-all link crossbar on sm8250
Date: Fri, 11 Sep 2026 09:22:10 +0300
Message-Id: <20260911062213.195007-6-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xXtUO-BTZ5iS9b9Xt4VseCfh2EKnbzuf
X-Proofpoint-ORIG-GUID: xXtUO-BTZ5iS9b9Xt4VseCfh2EKnbzuf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX+HbUsR+dm5AP
 a1ssCCi5jo1kEMuDHYKy5p9IkyBwpF/F/KPeTPQFXzku2zWHLLrpxqDVnLC2NVadlcGVix0LeR2
 oCtN82OHfg0x7qpNKL1A0EMohY8TYPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX8DEW4QuLaiJK
 YP5ti+yvF2T2Wlein3CWnhy4ablXheU1f/tom9cguT8UpMhcYbfYXYrJR7wzC6wLnZjv8jmCNoH
 d2P9t92LxYX3ysYJrr4pJyyC4bLNAbNMW/PdW+zlIAtnBKb7QXruFcbptj3UbKol3AGz1EumJIO
 ulE81TxbudHks2nfTNW9xRhj2kUK9eBOJZ+akQMEURUpFDi2WrPIDTX9KPvvDZnqEA14DF/hOy2
 4F4T7A/9BJCub5l3ztnScrvMn78yEgEXIJjrpYSBEL24zulEyR0cxfK51TBbMGqDeClS5e7+eta
 9V7i05oKxswkzloE+y6IDRVx75R7hsVwu+56U+Q5m4z8+0YuLjR0/gk9BNnhj7AiDvLJIP35XA3
 ba0cjTlZ0sD1FbgsFICotzgXaaKTFqVmH3Upah4JJ87xasD43dcrzRVOrQdqjY7HMrHNNrGWH4P
 u8xkdKxyfNAMM453CQw==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa39e24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=wE0bsl3glxBt6B52h2UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

camss_link_entities() unconditionally links every CSID to every VFE,
creating an all-to-all crossbar. On SM8250 the hardware wiring is
fixed: each CSID is hardwired to exactly one VFE (csid[i] <-> vfe[i]),
with no crossbar between instances. Enabling a mismatched link (e.g.
csid0 -> vfe1) creates a media link that does not correspond to any
real hardware datapath.

Add a csid_vfe_fixed_pairing flag to struct camss_resources and set it
for sm8250_resources. When set, camss_link_entities() skips creating
links between CSID and VFE instances whose indices do not match.
Other platforms keep the historical all-to-all link creation.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 ++++++-
 drivers/media/platform/qcom/camss/camss.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..1bb22cd23c5e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5000,7 +5000,10 @@ static int camss_link_entities(struct camss *camss)
 				}
 	} else {
 		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->res->vfe_num; k++)
+			for (k = 0; k < camss->res->vfe_num; k++) {
+				if (camss->res->csid_vfe_fixed_pairing && i != k)
+					continue;
+
 				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
@@ -5017,6 +5020,7 @@ static int camss_link_entities(struct camss *camss)
 						return ret;
 					}
 				}
+			}
 	}
 
 	return 0;
@@ -5666,6 +5670,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.csid_vfe_fixed_pairing = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..ad0b42719788 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -119,6 +119,13 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	/*
+	 * True on platforms where each CSID is wired to exactly one VFE at
+	 * the same index (csid[i] <-> vfe[i]). When set, camss_link_entities()
+	 * only creates CSID->VFE links for matching indices instead of an
+	 * all-to-all crossbar.
+	 */
+	const bool csid_vfe_fixed_pairing;
 };
 
 struct camss {
-- 
2.34.1

