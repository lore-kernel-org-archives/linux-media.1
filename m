Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA03EB117
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330025; cv=none; b=Kj/FQlXLjERg0Zyx+KUhP2quoSNkP/Of349T60KscCi/+jkFu84QOvcjq8bjHtCrWFx5pt/pY0LkLA11J9KSNhJMYe4XyKf4jROlvPtLsRNuQYVtgnV5kcqRSGniMFSDnAnSBwBwjAAzLmFHRj2tdVp4IZKl4gIKX5ddu4RDLcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330025; c=relaxed/simple;
	bh=r3m4i2ALdREpxRxkgOIDLlVqVDplzZtUq+N0+YLLT6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I3Tuc0ZW9Au1NVPrGvocpkstRPbjC83LwPyQWOQPcMOR9E0PNXYtTzePehtovGB8kgYgngGp8I0dKDt2UX1L4YpWGm3y9MxcUC/zh9jIRaYl684OqEkE2X67RZAvf7d+Dahf/Y1aFfs1ab7x77D2dv5HdD84vkqPQ7lsDe2R4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXjmegxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3ODrfen; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXjmegxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3ODrfen"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtMuP2619409
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X6UuIGePDsC
	buP2mdogDkUwxu/8Bj+LEHcxcasyG09I=; b=gXjmegxMJN9oSVx26xuGMOWNWXW
	WcbzJ0+uRWNrtdZqBlidwlOZxFkr5YlXzY1uRz3YCiOejQpms/j9o1dImjNN6A+Q
	WUhi3nB0eGFQcb1ChRsxs0JHtPknRa/bv2IDrc4rYG6hpEN7cQVYdNFVgaNer556
	sF3A07m5Ylcb8a75W1IBvz4hmRrsfW+s6Y4/uihxXYMh22Wa/EK8VKzkey1eVhL2
	OZRTdiyBBr2cizNSZlToBk3FLS/pFku8tWWFO0d/mwLyJaD5GLcIUO0XRTjjjz9E
	qlbL9oIzoHcgNIveayXaDTECogg9fFd89vehFb9XUqBRHIxz7Cdhm7AqJTg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagbm2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38869800848so12520954a91.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330018; x=1784934818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6UuIGePDsCbuP2mdogDkUwxu/8Bj+LEHcxcasyG09I=;
        b=I3ODrfenxnssjkWGEWwKPsd5tUzEBgrpsFkBdzX5JjnPHRYRPdG7ELZd98H30dJmB4
         VSItSKCAXNowREooye1A9MMoiRyFedLZOkORBS7Ls766sJoakSmRp0GRWGOseOQOWOTo
         m0HUWbE8n/JkJEj/VfsWMfO33WJgWBfaHx5+zjac3zThfKNXc9GFz1XE0mvDZA21vaRr
         uvYXJAfR/bp9folovaoinj3axyBf5pOEhey0zBA067DOJFii72KvAUUrH/pBnL96UqT6
         NqWnGHloG40OViKHqyj19EA2D5Ja9W4U3H0GrfUQ6DNxm0wcr282xoAQkn8QulPJJ8kS
         5xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330018; x=1784934818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X6UuIGePDsCbuP2mdogDkUwxu/8Bj+LEHcxcasyG09I=;
        b=Vn7reU5LF9fcHILzUKyPdrqrCyjv6UN3cgb11GgsQcdWZgpqsiiqlOngSWsJOxtNdQ
         NTdCS9c3z7NjU5GO3T0ySo2qtf8F5M3wOHfFG58odLHW2d0M3SI1O5gcB88JSro+n/wP
         /XqDM4CIm1o1fndDHuVdjQ/BWwZ5zBc/doRR173rgIE7xKDbi8etNJXLOdjEdmsaKlyp
         6Yp2dLW7BsZW/hO6aABD+vrhYCFrHoJGUbLDi6V0TY6QwOZhWVZCGzF8/RYLu0U0vGlP
         AiUvy3cgTtYT8GqyPjYDTyIEbaJHhB4am2KCVXbw3z+c9H4gZ4NfZkj1kExQ+HckwsLC
         fLwA==
X-Gm-Message-State: AOJu0YxxDW1g57nUkot8M2z7PONLMfLv23n6C/wdYwTEzA6mIWZaObsN
	HIjNS3CsiI5JzLq4X6W/JVn4K4ZL9Le6vtXXtelym1YM+0faNfezoOSOF31jAW5tSOO6+Q8dONp
	a8du42lrNpxE3+XXwII2QN6AB1s4TXitX2Wx9BUflkzA2WEwiLjkUcfcH8Gh688GsFHjMxPm1AQ
	==
X-Gm-Gg: AfdE7ckx+VRfDQ2wJ9x6UOr9PgCpr/LDMN+NBigQbHlp+3CWFWZ8a/3pDpGpOklbO31
	N9nPs+Tr1M1BwNp8qMwHlgJka50undCcVgCYl0nBTumMyoXMoHMdk1OKLPozlcfDlSiRjnqe3m+
	D7P90jq1VRJwkVSOz/JK10FPBPRhU+0uyg5G9gT3npeLbUPh/9Ubp8QP85h5pmZIOdoIxLWxys0
	JX2e0sgGpuScnZlw7+EJK0McGE2REMjYWhwKK+VloKgISsGskNU9s64HpnmJwi8VW00bTEc7O8r
	mdmlm/94JNfH/kT6fFQ+HVI/3ZrCFXjSqD/hsg039OLjH9L4FoaIvpqZa9RE7sROQOY2PJpZQ4N
	v5gNiNyoLbVrQoD27bFNxCJHPYzrEGNak3Z6BnNkoE9HReQnlbe6vrug=
X-Received: by 2002:a17:90b:4f91:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38e4b51cd29mr4932888a91.26.1784330017854;
        Fri, 17 Jul 2026 16:13:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4f91:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38e4b51cd29mr4932858a91.26.1784330017337;
        Fri, 17 Jul 2026 16:13:37 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:37 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 6/6] media: qcom: camss: validate local/remote endpoint bus-type
Date: Fri, 17 Jul 2026 16:13:31 -0700
Message-Id: <20260717231331.1229693-7-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX86Vt9aGQAKS2
 CpY0198GDoxbtgB4D/Wt1E4hKkRW4H+exiYW06OpERiqySHWUxH0iyDvQ+ppg7ZNbqq+POXcscO
 DqiFRFOmpQDpK7QgnEBpu8UuLIt9lHZFkRkYDG5v3+E2C8Y3E2ZuOIB/wOOqmIA3/j1sCoAnWVt
 gnI8XzZZbDY/iHOjuewtQsP2+eJhqaSZ0oYNt91sftWF6y+e/QLg89VzaQVc2arxDceU+j942b6
 rOlfUWTbIJjsFsGwAO0d/Geyi4Pim7HLNZddZkmobNnL6taN2GZdHbWlYSsRCh7Ka3HbhLGMPhy
 EI8J35JX+xwd4ECRPewIuMM5YK6J+YTIRzdWrpor23RYZHhlWcu5nSf3k5piEZkSoVPVBWWlAMq
 Q15gFcO2YOifAlHp08uCusOL1PKa0J1fkOPOfxv2nzMvemDZgJl/uSyxI23lI7MODt6EBlWXBc0
 heWdSRwevAqfkdRZfiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX8fkOwXCD2vxD
 3dN92LmyPaqyhRtjJGaPjSH2/+awyI/y5GqTHsQOpTSP+zmo4PvkdMIwHjmdoJ7caew6PnqC3u6
 33hVFgtvAY1d90ay2I0OItXRTLzZS5Q=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5ab722 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KcNSuxIBhJ6QY8qMoF0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Le5399nOjlH-inHEQOgOh1cAJZzdKoU8
X-Proofpoint-ORIG-GUID: Le5399nOjlH-inHEQOgOh1cAJZzdKoU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170238

A link is invalid if the local CSIPHY endpoint and the remote sensor
endpoint describe different bus types. Such a mismatch can otherwise go
undetected until later probe or streaming failures.

Parse the remote endpoint in camss_parse_endpoint_node() and compare its
bus-type with the local endpoint. Reject the link with -EINVAL if the two
ends disagree, so C-PHY/D-PHY mismatches are caught early during probe.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ebf8f21b5fa2..8013aafde6a9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4757,7 +4757,9 @@ static int camss_parse_endpoint_node(struct device *dev,
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
-	struct v4l2_fwnode_endpoint vep = { { 0 } };
+	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_UNKNOWN };
+	struct v4l2_fwnode_endpoint remote_vep = { .bus_type = V4L2_MBUS_UNKNOWN };
+	struct fwnode_handle *remote_ep;
 	unsigned int i;
 	int ret;
 
@@ -4774,6 +4776,30 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -EINVAL;
 	}
 
+	/* Get the remote (sensor) endpoint handle, e.g. imx686_ep1 */
+	remote_ep = fwnode_graph_get_remote_endpoint(ep);
+	if (!remote_ep) {
+		dev_dbg(dev, "No remote endpoint found for %pfw\n", ep);
+		return -ENODEV;
+	}
+
+	/* Parse the remote bus type and release the handle */
+	ret = v4l2_fwnode_endpoint_parse(remote_ep, &remote_vep);
+	fwnode_handle_put(remote_ep);
+	if (ret) {
+		dev_dbg(dev, "Failed to parse remote endpoint\n");
+		return ret;
+	}
+
+	/* The local (CSIPHY) and remote (sensor) ends must agree */
+	if (vep.bus_type != remote_vep.bus_type) {
+		dev_dbg(dev, "Bus type mismatch! Local (CSI-PHY): %u, Remote (Sensor): %u\n",
+			vep.bus_type, remote_vep.bus_type);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "Verified link: both ends use bus-type %u\n", vep.bus_type);
+
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
-- 
2.34.1

