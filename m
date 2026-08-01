Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD93C76BC
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614139; cv=none; b=qi2Oa2/24FHJ31UgwzHfFLhxGBKqk3CcDZxzSMlZi9Cbw3jj0uVpKEKraStMTtsKjgGcw/i1Ci0vuvZ43Jc4l12uY+Uqf59uFYvdzltdq90e/DIZ8dBkMXtHmZxgZ/viUzfYZNEvDbKEw/2kirWjDrpNQSpLK8pvwd2UB5lwVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614139; c=relaxed/simple;
	bh=f1LZFXoTJBl1/AFu1OKBHhr7hP5lW3sbCItIQAZhxeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZboO+QornGvNENGoh8oADWkwf4OqiD43flA9y+bKFofjgBz98XZ/qwHJqUjvQ40Vk8xOhrrqgWKZBiH66IGhNkSia75pk3t0hgTu40hhcQHbRFdibMf68njySx1Otff9xGwewgvpIwZTCxrPvBzzVGnm8M0vqP6RmArBCNDekmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUFjra4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKR14Jtm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUFjra4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKR14Jtm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxnWX3846837
	for <linux-media@vger.kernel.org>; Sat, 1 Aug 2026 19:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0
	ImJYSDcg=; b=oUFjra4m/6j+FmlMLlb109kEWh/+P7bND1VOrWsvpRbmInK76fP
	x30+1KZkIBFTVb0hyTxKPAX3SlCYJHXWDjfiF5g8mqmgogJRDMBq34BhDhU0WVoJ
	YTNP7lsikoDc8yCcY/J/l51EncTUKxERdQ6I1znQ0IXd1rHryrzZLQA4YV68LNHF
	fVfopdZjEglNBFJinXGuNnfZQ8KIjwNhymDLrNoZx47nzyZXHOUvU16Ck8NTv94s
	IQ5VnMIpdtJK+ij/XLrJ4iu+FeMgPKRXRL4dl/r29oDFcS0Yn5BR95uoWPdFHoPM
	cu0CHG9+kYjcPH44x0OdjfYWOELO1I4ItFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt9ndw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 19:55:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso41485341cf.3
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614135; x=1786218935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0ImJYSDcg=;
        b=RKR14JtmkGG2OpvGtM0o2SrFUvNedWGiGTPOVq/pGkVLtf0aUzEKd+pAg6KPu2ajJ4
         N8lQDc8Q1hXMhbk8AijxXUKlPru67Vm2pGJBtkqiY3KF40jfsPFqKAk+qiPjTOG2KZmo
         ZRg1zWjk7feNDhClu0Kp29/iaz7RWau7OEo+O9QTLvWODGbexJ+ytG479qu5RZiCIY0i
         RaXRZirELgtRXzV44Q304jhX79RKd4gY1sc/PpipEFvIGc2Nl2FWKBLOCru4RFQxoF0x
         /VRr4sIKN4X3pqMRkLm41yPDmgL8RmUS/2qZQc304k32+T2CYFYK6IrBn70epN3C9UIy
         7UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614135; x=1786218935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiW8vgqtZHJtHheUC/tBnlPWJcBmJvF9od0ImJYSDcg=;
        b=HVOsf030JwJTFunSi/oZRn9YMG0fpBo0sfpLHM5uymXyqVbZqyr0w7WJPz7mAjYHXm
         vqYxiE9lquErgAAdDU1CWihxM9GhCI5m5SjXt9J19F67MJZc8TyQuIiiI6khiaBkX+tS
         hHjSxRURlwOldEBMwc/M6ci4NQMbpiC2r+66ZDKhDibSeF+rmM6hFhbg2hg4b4WcTUt9
         V86/PWORP+xmUxXUXHNSiWKP2PIheTVbVKQNHWeoOWfxhW2nUDPBC6VGv9P8tAGZ7d1Y
         wAcGtYtpDXk5CpY9ud2mmyRtRPKKaQ6BmP2C8FOFQjIQd2dBxGHcH7sbqA7+5hZGg89k
         Iidw==
X-Forwarded-Encrypted: i=1; AHgh+RooEM5RKadBjt7Jv5Py71U4jL2csoyWWlsYHghykFjMcpHDQR6fncskUFmhIz/GqjSCAWwgECGqmC8qOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWO3PeoJDFdKhkvO9rvEj7JVI3wpz+ALiYKmFPLks+Fk+lHSq
	0X3wpGDpYA0STPsEkoo2eKC0fXALmIdnfMW8NFClZYsKvRcFsuIvqB7nmmV4/MdJVK2/2jHt9EY
	pLAIuCLSvhFGODVKd7CWCZjy2n0STtjXcsd8Y3TUD8xKHCXEa+HNtR9B67beGt5Vzng==
X-Gm-Gg: AR+sD123BD2fI12dbpC3Yp79ToemhQXbllQh1ud51qaWLFCS4O1rxyqe+olAyRJtNhW
	8e7d8Lkadxki4Ti5QefE9MS+g6TyzKiE1WGKH5qZ3hwFKpwLLwzGD0N2On74dKqOI03JwpPwdwv
	bOgchOswl//xJLsfZ0jmoCKcDtZwmShHI6oIxXBOHUV6l659GqFxGJH2kfcB67X30Q7Z6B7+ZnS
	NJlir+nM2CWPmwmQHQKXR8Mgqx/bP8IPD3yND6e4D+QF9AjkCWK9VfrgZNR2glhIVX0zVWPExso
	QJvjAHOdrdmhTW0tbsimF/iFqKXkag4Vl2zp7riIT+Kki0r3r2tWzkteIFlVR50R1nhR07DheKv
	fHr5Hwcs420VzjDwx
X-Received: by 2002:a05:622a:230a:b0:51c:8571:1ccc with SMTP id d75a77b69052e-52b567f2645mr104547721cf.41.1785614135285;
        Sat, 01 Aug 2026 12:55:35 -0700 (PDT)
X-Received: by 2002:a05:622a:230a:b0:51c:8571:1ccc with SMTP id d75a77b69052e-52b567f2645mr104547211cf.41.1785614134881;
        Sat, 01 Aug 2026 12:55:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm17496417f8f.31.2026.08.01.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: dt-bindings: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:29 +0200
Message-ID: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7312; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f1LZFXoTJBl1/AFu1OKBHhr7hP5lW3sbCItIQAZhxeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8xEuIh8uDLGNQebu/2oaczx7f6aDF7SNe4g
 QqA/xBUaUCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PMQAKCRDBN2bmhouD
 1yFyD/40PrZJY9zLs1MqCz8QDJ/+7PJXg0TChXiqgK2wUEpoTfFVwEfXa6Kh70IyVLlgfTHBqTq
 n/1lOjE3lio2qM4yk4gcjbvyFs15AS+uJoBincJZgodWYvjIKuJtujfHLAFvuylv1z6nVsfFLnr
 9drCJQldJHDmQgK2f/y7WgZMycyqujdDrLSB8GdFQEC2xdTRNZyN5X5BkJhnrLHA73leD70rInb
 1nGmNcvJ/NaZZ5eIUjPfqNEZVoOQpUoc274BawefQ2Lcl04AdJBahDTvrwNBD89Hszi1G9YzCV4
 AQpJ8r0p5oZRhUAQLKW2vpFbsnKmYmRU5hxbz9M97AHlMzp6ZtyebKhMl4f4VDR6/xN71QoY5dg
 StbaMcygfZeWdM/mE2bHea6FzS/ev22z15mnBxORJAuswxpdEnLFSwEzysSS/cgkE/26pA5pyb2
 0NkRHZnH/ZnL3y9mrhjFfHzh7v2hPkZ/5FpIJTiaeBnOUyiaFdy8U7M1JN/nfBVwxuRxYKwa/SG
 KdV4VOLykfzAJ3nC3CROtKww02ZDPZIrWfq1yjMYaOroVRq/wIUw6Jqe75vzF1fTcJTvf16AcBD
 jE3Z11La6Ch+QlD2o5IHI8wAYRbMlwDZzw07Rhjnd69kRmYfOPSckASZ/aQ478i/d2PAr5MpRri P+a2P5BeHxR0U7w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfXzQxtWkBPhcO1
 Ujh+aawQugwb5ohhLmvHPKHPxcHhCGT24hl44F1Ba/nM2Pwibre53qNT7Nv4fttzOyjT4DApKgN
 gDwsJCJ07EyHdo4h8Fm8hY5OqkQxgL8=
X-Proofpoint-ORIG-GUID: fnInppBYW_Ozsfk90IVbueOLZexxp0tb
X-Proofpoint-GUID: fnInppBYW_Ozsfk90IVbueOLZexxp0tb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX0ujuBhjKTiev
 0/ge9OjCbxU3YaSZskfgS8VyXp0ohe4QU4m4N80UGAvSjUa/nkeYGcOnGhji8u0T0DvIiIogWlo
 KTaspqRtZuWAfP4P/xPRIV0kR3uZ0RBFVdva8K1RrPA8sA+5FCx4+raAd2H/N4ir+Vus7QqqHaM
 jFXg14n7ioFNIFYsU2oXgwaouuX4irGpVa3fyxORgZ2W6+JOhB7B9cLLRquA29MdT1hzeJJU1v5
 Xn1EUaY7LNjIJl18e1CWoCWRxnNbEQhQAOGon3urht0/NmDT+yUq5v9Li8ZvUyrOt8Jk5I0v0V0
 R8AszgHLkjGVIrxnA6Ahv00YoW3k4x3KGwnUg/qPVeHoF12Y3BvmFFOsvVqt+EoTg+VKWz6BB3/
 Ho1gIhy6IG7G7BDjFCd37aWGoU1XZmfP3LNFKjgT2xSENL/qzxOToonQhJuv5hSsSJbbhTdCAqM
 3f0uVHzO/b3ZAzD/vhQ==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6e4f37 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-OYJPjWUVwCj3UUiuegA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
 .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
 .../media/mediatek,vcodec-encoder.yaml        |  2 +-
 .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
 .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
 .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
 .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
index b0129beab0c3..2f11e5f45839 100644
--- a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
@@ -96,8 +96,8 @@ examples:
                   <0x0 0xff01a000 0x0 0x100>;
             reg-names = "aphy", "dphy", "host";
             power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
-            clocks =  <&clkc_periphs CLKID_VAPB>,
-                      <&clkc_periphs CLKID_CSI_PHY0>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_CSI_PHY0>;
             clock-names = "vapb", "phy0";
             assigned-clocks = <&clkc_periphs CLKID_VAPB>,
                               <&clkc_periphs CLKID_CSI_PHY0>;
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
index 0e7a7b5ac89f..99d728c47cfb 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
@@ -88,7 +88,7 @@ examples:
         #size-cells = <0>;
 
         sensor@37 {
-            compatible =  "galaxycore,gc05a2";
+            compatible = "galaxycore,gc05a2";
             reg = <0x37>;
 
             clocks = <&gc05a2_clk>;
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 4505e66876a2..551e483f3e51 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -160,7 +160,7 @@ examples:
 
     vcodec_enc_vp8: vcodec@19002000 {
       compatible = "mediatek,mt8173-vcodec-enc-vp8";
-      reg =  <0x19002000 0x1000>; /* VENC_LT_SYS */
+      reg = <0x19002000 0x1000>; /* VENC_LT_SYS */
       interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
       iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
              <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..76878050cfd9 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -72,8 +72,8 @@ examples:
       compatible = "mediatek,mt2701-jpgdec";
       reg = <0x15004000 0x1000>;
       interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
-                <&imgsys CLK_IMG_JPGDEC>;
+      clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
+               <&imgsys CLK_IMG_JPGDEC>;
       clock-names = "jpgdec-smi",
                     "jpgdec";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..3bc1ccb25893 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -67,7 +67,7 @@ examples:
                    "mediatek,mtk-jpgenc";
       reg = <0x1500a000 0x1000>;
       interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
-      clocks =  <&imgsys CLK_IMG_VENC>;
+      clocks = <&imgsys CLK_IMG_VENC>;
       clock-names = "jpgenc";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
       iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 56c16458e3bb..389b545c9631 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -119,26 +119,26 @@ examples:
                  <&mmcc VIDEO_MAXI_CLK>;
         clock-names = "core", "iface", "bus", "mbus";
         power-domains = <&mmcc VENUS_GDSC>;
-        iommus =  <&venus_smmu 0x00>,
-                  <&venus_smmu 0x01>,
-                  <&venus_smmu 0x0a>,
-                  <&venus_smmu 0x07>,
-                  <&venus_smmu 0x0e>,
-                  <&venus_smmu 0x0f>,
-                  <&venus_smmu 0x08>,
-                  <&venus_smmu 0x09>,
-                  <&venus_smmu 0x0b>,
-                  <&venus_smmu 0x0c>,
-                  <&venus_smmu 0x0d>,
-                  <&venus_smmu 0x10>,
-                  <&venus_smmu 0x11>,
-                  <&venus_smmu 0x21>,
-                  <&venus_smmu 0x28>,
-                  <&venus_smmu 0x29>,
-                  <&venus_smmu 0x2b>,
-                  <&venus_smmu 0x2c>,
-                  <&venus_smmu 0x2d>,
-                  <&venus_smmu 0x31>;
+        iommus = <&venus_smmu 0x00>,
+                 <&venus_smmu 0x01>,
+                 <&venus_smmu 0x0a>,
+                 <&venus_smmu 0x07>,
+                 <&venus_smmu 0x0e>,
+                 <&venus_smmu 0x0f>,
+                 <&venus_smmu 0x08>,
+                 <&venus_smmu 0x09>,
+                 <&venus_smmu 0x0b>,
+                 <&venus_smmu 0x0c>,
+                 <&venus_smmu 0x0d>,
+                 <&venus_smmu 0x10>,
+                 <&venus_smmu 0x11>,
+                 <&venus_smmu 0x21>,
+                 <&venus_smmu 0x28>,
+                 <&venus_smmu 0x29>,
+                 <&venus_smmu 0x2b>,
+                 <&venus_smmu 0x2c>,
+                 <&venus_smmu 0x2d>,
+                 <&venus_smmu 0x31>;
         memory-region = <&venus_mem>;
 
         video-decoder {
diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
index 1fc62a1d8eda..5c0f2f7b1d95 100644
--- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -53,7 +53,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        isp@880000  {
+        isp@880000 {
              compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
              reg = <0x10 0x00880000 0x0 0x4000>;
              interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.53.0

