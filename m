Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F317B505
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480332; cv=none; b=ERRLHV2y83tLhUvpc2BQKbOyLBL+PKtg4SKxbfNQsOhKPKGLgqhJ50LmQtfgYtdwKIJpywtlEsjOSEg2cZgsKhW75pLU58CIlJ3BDxFbjjoUvvJdhAJ/G8AWXUr4CQ0LcpGiKN0lr86DMTBQskpuAc0h9QU+Any0GFGWqgkfaaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480332; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e4ICZGHZ7CsUK4ob80rvywhL4aGBLinXdI5K4H9jw6gxXNeSs0zYI6ORBQMm1p5FVaKEuDcM7T7BcCjnwMT6oCXHQYrEcIL6bXNWiyrjC2zmNRRzkc0r/aq46vsAQj3N+PY5IXIGJqrc/9XjScortNo6MbOlo23ZjznJHseom94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GywL9LQ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtsG3Fy1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GywL9LQ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtsG3Fy1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6YNhA3206261
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=GywL9LQ3IZW23JDk
	LmcfQkarKRz58Wfv2ZPxvvo3QOT/VeDden+ySm46pHcwc1JyikV+2BtIwULz0z8s
	kSfiI1d7wlpOIzGbCp1pp4dexoGwb/6Qpj6Vj9xGI0FZxuZrvbCFG640QmyiSSMJ
	tXIPsResh+HkwB8g5fjIsliZ9KlVtZOoH9Kpp5Qw0BPuu9J0MHuNFAzqASKTzskG
	MCbIWl77lUs3W9zbiqmMoCg2tAw6VF5Ubz7ino92hHZUtc93a2gdSg5vBm2y0Cle
	3osGnTLkc3IrxV/C5JCjQkRN80jsFcDyAnHbH9dMbnt0sj+EMevAofXyU3R2COmF
	MnEzEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpja819g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 06:45:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso57301185a.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480328; x=1786085128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=JtsG3Fy18JmkVZc0JVIyDF4/xG3hsT6daA7/BT3xO3KTRsVmv+2lsFUCGOkQjAX/VE
         3WLG+LLaGXbh302mD8/zW8wXbIVo5fgPu+ZuDq4/wcTIRTBtrZXokHepUxuPjgnI38hy
         ZEYdEcz+JXCOt063aAqJfexLLFcICVD0dTvA0Fz9P75vlXgJ5f28R5Z3Rh1Lu2OGP2Dr
         qmw8LUlUwkgkbjho5qo/to8ylmHQcMfepcy1IIRzc54es2ExRXl8ylrzFyD0wuwzXOC/
         E3H+W0K08Nzl7bk7tuteusJXyqjE89z1Qjo9/BW9ocmP8DK36u1WEUq92+EPzYLbyQZa
         sKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480328; x=1786085128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=qtrYAC1G2D5Myl8RKHJn+uxlMiVZ2tQdr36CGGilq2liwTl1XkZMxwci0+fuqcDtrq
         o+7/YETUip09Lf4dbSlkl6btDO6BvgDDxS8OfyUNxYnYLi0dNgdEZ07dGlawDrqqQR5S
         39pB3vQzyKDMF8lT0aEL1U1h8J//wns4a/6D+ecfL3uNXM5NpAhImIscs6FtCyNciB91
         lK1yLiXBknW9Btk+xL3AQ8kMEYodtJ7aQROwPUdBqFI4DtjQnmQDvMl70da1SkJSHBBv
         oY+/3aLU/mVzsXYdBhrt+ckWFrf9iYOaqkdqx5ckh8FpkjfoQDwZC/6tv5Khe6gnjmM0
         oSCg==
X-Gm-Message-State: AOJu0Ywv1gM4Uz9P/8bLRwSe9EoO5qij38/e2a8r7FRf2sTczM4l5UBB
	6BxpKzaSRb1p6/LTAQYfBcqrnL2dTBbLk1GjYyGCGthw7HbpHYOQgklfXJ8Nk5jLUsDkaW/YKl1
	8SpQ3hBP4xqN02fwx7EAXA2OaXhmHRyVxWfndOQ4Py6DVyh+vXMTSwt8Y2v/x7OtMMw==
X-Gm-Gg: AR+sD10WQuhmNXhiI3mb1oschl3TfX2ZuvTtHqqqDarP8GZ3G647uDhE1OycBX1mgQc
	FMZ0PWWD5HKJKN5/XVqz4uwvFtWgB57ZBzKkhWXejHpugpHRGWabSUJbZFlTkdbGtksWbkKGxYv
	ZHh0r6tH15g1a4RmEhgX4Ufcmb796JMuxBsqYR07asmU0K80FqkUxVzsOlFfvsAPo1osOP9Tkvg
	JNpGhJqZR+/qhTAuduGwWWreAY5PSTkVdDUvH7CX8X3kmIOY2UmcXZKHe1ZfPAO05K2oSFaQJ7J
	AHEXDy1N2TQSqG8oDHwrsExEbNhGG7OLJwlN7GLH/FZx+Fm+F2WPjak24QXuDQLTEPoKR9upZPK
	L2sv3Jij1JzUZsYyl4PC84BOVQeiihbsAC9LwyUeBBKawr2NWqK7SSlmhXGXV4PJ8ti7D
X-Received: by 2002:a05:620a:261a:b0:934:9271:d0fd with SMTP id af79cd13be357-93496826c12mr89412385a.45.1785480328465;
        Thu, 30 Jul 2026 23:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:261a:b0:934:9271:d0fd with SMTP id af79cd13be357-93496826c12mr89408985a.45.1785480327958;
        Thu, 30 Jul 2026 23:45:27 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-934971773ffsm46107685a.29.2026.07.30.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:45:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:44:54 +0800
Subject: [PATCH v5 1/4] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-og0va1b-v5-1-c2b90b601241@oss.qualcomm.com>
References: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
In-Reply-To: <20260731-og0va1b-v5-0-c2b90b601241@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785480319; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=txv2N5Mi5yoDN2E2sGLmnJTrHlpRzeQeJ4lpgu+RhNcer4AVsfZVeS10D/ydD2izmfNHi2g7s
 ZGG5J9I23ziCVkRLeaxfOnoNYrRq8qgdwDefLv3SdpFOfymO43kPcIf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX7MCFHTSHQPYG
 /VLMZbix3IHePnbXxY5u9HYdh40TXF5L1YS5MCJTE7U7y8uvM8DeaSDtKl2SIPu2R7sAeSxP0lp
 UMtmdtwmLYqzHdmmtCuIMmVt+znfKGvQ36JTWGPd8nmiKY8f3kS6SV5DwK/L+qd8u2+GsLVBxoA
 ltn9c3LroctMP9wv5ZoL7iEGBxAj/LiN8hqiPbMvFWtdFAz60SFYobYieAGWQiHKkyZX+p2u62u
 dCWUxWs/1Q81nMoNUc5VIhmBnaaxIckdZjzdamtoYE03KIFe7DrOTeyFmBgSTzBwKF7ORdcgOXw
 3vKjiqg+3HJlXwqQH/kBr+RGUZ9AG63kxJektKg7g2+eMpACjUO/o/F/PaDt2EPXAmK4kHuexPB
 +yvrwOowUevnVlXBrFPp9NcDDd5DY/gumy50GlcKz3FZXrrkwbvFhlw8xw9ZLmiFtULtSbYXeMp
 99ANaW7geHPJIR9KxJQ==
X-Proofpoint-GUID: YcwhzoFrQmWgNtJSawvrKJ-yuY9PtnBQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX+PBcWNT482a0
 4efVm0HmsjDQPxjN+Tp6PuHTy/zOENIpw6a7+oSQgoJcDA/3p6OA48TUVTr8ArqwN/nBSe6NjQ+
 0/xDELT0/SLPKnOiVDKVWH7hmrcOGeM=
X-Proofpoint-ORIG-GUID: YcwhzoFrQmWgNtJSawvrKJ-yuY9PtnBQ
X-Authority-Analysis: v=2.4 cv=euzvCIpX c=1 sm=1 tr=0 ts=6a6c4489 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

