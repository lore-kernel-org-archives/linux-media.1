Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD413911A9
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209149; cv=none; b=t1evV/twbC7cnZhJs3bgiHD3r8zC+z3azY1KDHjgJj+rocYOv53p8wgQRfPO7iFiPVxLlQOsvh8HXiOlHbmp6ki7Ats9A7FdnWW3iwH1DGOPGtEwH4R/nixl0vmm8UN2mJk0G+E1FF4LkSEAxU94W4lW2Bcqrho9E8bALOqfQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209149; c=relaxed/simple;
	bh=zRm2u4LEYc0gtNFHizlm4NMKGlWn+oPcvAHoerFBkWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dQasj0ZSycR7hye9IjT+WWl2YOUCXQVqV+OdM8w5XyH65XKp5TuM7yTnNWn3Lr0ucNiMl7KesbSX3b1nWvnNWIb1ZvPQtmM/PgLyPD4wat+gUjMBUSyzelsSGWyMIATAWc4jg1SEnK8Kd/39SPrnJZ9ec00LCxrnJ4AEljAILU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRse4Mls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS4qyRKA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRse4Mls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS4qyRKA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30dJk3542539
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VLDH4uYDOB5
	s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=; b=TRse4MlsgtHfh3tdYuNlJttb2PO
	eAO8rgj+9+84/UPRIQ5jOo+U7IAVkeo/d7/ZPs/Uic1ZGG4fJXxSJTyzzoAyiSPT
	O3PBx1AKQ1oLz0Cc20PnNNii7prwDQhi75pVRrlSK3qn9rKk6BW60L1ETtPi7LdU
	cRo7f8CMVKRFnKXsLlV5/zUcKz/QTZpCqa/p+UcfsH7LEur8ue1hw0v16NAzVAzA
	S0r3T1BohEoQ7j9QFt0YdFxYLy2RwD3oFEupsUDwbUgNOlCRbMNFL1fzVSbSIoMD
	h6NLnW3rR6dZG0EaLVLbvB3SIx6v5o7UJ0dQ2Hn0wZyT0jbiAzkMjvSp04w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxajrcp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso931481eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209146; x=1792813946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=iS4qyRKAiFg0KbsE7rePVui5qbfWrR++GpmsPUI6ipNuhxkr3gl1glJ4FpwDrZ+9eY
         gH0ie49J/yCHLhWtiIJoMuf1YwYiTpOKj4GqnUzkuj8w69GiRkpYbcPEzTLqEBNypCcD
         PUUrLhKCiKhd3hvqw/kOtgMJ8MOcMEa0iUMEBVTN17S0fswP1odSC2Jmxzy3m+hzFtjZ
         w/vSQiKTj0yB75XyO3i3AgpMRkvDtwRHBoUu5TbJzasE8FJbRH6hY6JmPP2NFzgqggxo
         jaP8sugqmnGVB9aHKVNpr9+tSu2tf90BbcmLkOPAE8l4wF8rl1r7/b2NC3AWHxv9iACb
         tYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209146; x=1792813946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLDH4uYDOB5s4rSB29wrt2IQL64k9o38d4UrD+kGPGQ=;
        b=EgHbDCY/lGkI9cmu3T4fgcaX8Dl/YiL9SqOl8ugAamkcz2RKLS//y0FnLcdJDSBY0N
         ykgkP4yeMqqNrnvAuWSj40UWh5BF2iDk6E+1ekUPzKfjZ/qvkRSF7/jFzM0Tk+pzSntl
         JSjLuRK6KX4LHUtpcSZf5p/gXtvqd88O4EG66gkHkJY3RixKn58if4pfxOaL8kGVxwWh
         QgE3NP0gUIjB4HpERpHXtgBOVjm9JPnSo9fx5wdJ7iyYeWzcKCTt3iMrd+NizILTnr58
         Zq2mFX5pUnLFFtA4ETiBD05Vu3Ce3jyRfqoBExlCWsr6GLh1Udz/bkp/wjFrnOylxSlw
         q0tw==
X-Forwarded-Encrypted: i=1; AKwUvByS5y7VN2PuB9pbyIiZ+5DKE6iXDsJ/I6eKGuOde9NSqsCgaZIUZeNW91kT9Jgbdmof5VCNdMItXiyPQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFKwqVvSbwGkVrb9ArnESmTBZir7Dw//Ey7Vxqa5fIH8I2dgD+
	u0ObjHSzPpEMIHcEciCzHYzFu9agUMyxP05wuhTCxb/gSpcl6lSSw8paX989dtKOCI0sFzam0aX
	Dw9t6Ozp64Z/ttmUfTL9P1G7pcX2Eo0Jx31K6gyVZiYHpo4XTlD8+4e3p8ChNJoWDzw==
X-Gm-Gg: AYBFou3W4cFukE9oAbnt2bF3Lmocld/ZzCoW0gPqvh1lvlcuUL4A3pPsu2Ea2Rbe8Fq
	ufWSveWLb7v8LyCRqT7wsAbqHX8Uk5uO++Bc0DM1artZc0sSxRZ9c5uRZlz2ohz/Xbb2ZlJxa8L
	WzBeEet/+iSo6uZC8G8Qe5BB9Hmn7ShhRZY6TJMuwXW4AcBf4ygY3N2QCPPsusTf/u5702Nn0OY
	/+7LPeva9qzX48jD6yMJC0qkpvM0wQDFpuIVHh9Kg+3hWm2dzZH58oR7E8HjGrBoWx0lOIP8Sii
	0LqWy3d8ZPepHeOYxHsJVG+Tf9dKVz4Wcg7/mQBvBJNSnkRFK643aG/weMnpg+40UO22fdTLD5r
	ELGHc5e7XlFiraueYh/09g8IiJ1GIr1lQmXOVoe7YEGkbj5E9scgUdA==
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584967c88.45.1792209145761;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr2584907c88.45.1792209145028;
        Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 1/2] media: qcom: camss: csiphy: record PHY type from device-tree bus-type
Date: Fri, 16 Oct 2026 20:52:20 -0700
Message-Id: <20261017035221.3816464-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 96j1WEcXX7WwnkjaBAxkuzyDKluDnizZ
X-Proofpoint-GUID: 96j1WEcXX7WwnkjaBAxkuzyDKluDnizZ
X-Authority-Analysis: v=2.4 cv=AOfP0WMl c=1 sm=1 tr=0 ts=6ad2f0fa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=CkjXbxflZYdHZoY9ubYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfXw+0guTuwOe1/
 IGVqgLseS57N4dPevDdc6yADm96HYrZ8FH43MMQtC9sSoKJ6dnA//d/NpFJ6c/okvCKjobyojQt
 lqClaoMXfnLA2/YrAsXBsBbW1akLI7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfXw8Ji1MHmxthV
 GXVMPvyFAaekZcGLUK8BwiX9Jxro7Ut7MAm8ZJsok1QUSWVJRryyctAeXzXLchiWeCe/zfUhjo6
 w+X/6E7KX2CE5ISDe8LTxiRLt1Q8uOpZhPpkGiR5oRN4CYRwqG3qoZ5og6936bwIAbdvdmErJWv
 UCsQGWRaJYzPPUbeqqYXJLA4i5J/D4ew/NAoJkKZ9hjyLm8ADoX1o9qpSBe1dO10X50yulNULlM
 9hHXOeAUpXY0X3C8wGgddfmLibiAUgUXOV8rjljK0TLvW6nUi7jPWvW4fkqib7z0AQ4s3oSAGQI
 id5tx6byfjMzZVrPLUyNtp5QrEKTbSlt8x9vpM/Sj3R44uwmpzNa7iYRRqhTKj0HNG8tj3A6F2O
 XgU4w/FGgRvWlfk+Xn2kqBNbbLYo9XeA+hXxXOXGWNcQeBLjJ7wY7HbrHAMnlyoWYrWXMFofJeV
 a+bZclJ3AZiS1VMXj9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170015

The CSIPHY lane configuration only tracked D-PHY, and
camss_parse_endpoint_node() rejected any endpoint whose bus-type was
not V4L2_MBUS_CSI2_DPHY. To support C-PHY sensors, record the PHY type
(D-PHY or C-PHY) parsed from the device-tree endpoint bus-type into
struct csiphy_lanes_cfg, and accept C-PHY endpoints.

This is consumed by subsequent patches that adjust the link-frequency
calculation and PHY configuration for C-PHY operation. No functional
change for D-PHY: phy_cfg is set to V4L2_MBUS_CSI2_DPHY and existing
behaviour is retained.

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1c..fff504d2d489 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -35,11 +35,13 @@ struct csiphy_lane {
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
+ * @phy_cfg:  PHY type in use (D-PHY or C-PHY)
  */
 struct csiphy_lanes_cfg {
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
+	enum v4l2_mbus_type phy_cfg;
 };
 
 struct csiphy_csi2_cfg {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 07f7bed9591d..c888e78256b3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4756,10 +4756,12 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return ret;
 
 	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
+	 * Most SoCs support both D-PHY and C-PHY standards. Record the PHY type
+	 * in use so that later stages (link-frequency calculation and PHY
+	 * configuration) can account for the encoding differences between them.
 	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
@@ -4767,6 +4769,7 @@ static int camss_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
+	lncfg->phy_cfg = vep.bus_type;
 	lncfg->clk.pos = mipi_csi2->clock_lane;
 	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
-- 
2.34.1

