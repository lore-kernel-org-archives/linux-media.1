Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E11469854
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247893; cv=none; b=i7bYRyPDPK8uBjMiZdFFXgZILJ58ymQGtTJTujkUDgKlBzsD3P87bZH3gXOYTWGyv5sJ/IZT3rBQxVE8dtsePOKv+5UuxWK0hEwYxOwzJ0Nk94Mj+8cI/316IY9pdfeE5IYPPe16QlgHxWyxq3K5CYHL52Bd8+ydhA17gFLJ9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247893; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TklxIPJN/aobFU+P3l8mdMro8N5tey3EExf/OEO433JvQNqDO7Oe9LC3C+bjBOe5uF3Q3jh7WDsFJPr6UpO2EgCQ7qs72MhYuvSmU6oprke68RioU02wJMwjRMmcDpgVYAJQewRN4P/HY8JMm7uZMJHLDOYf9TFG2NOaLccsHdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9fEybIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y553jR/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9fEybIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y553jR/l"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JJF1709562
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=C9fEybItt1aLSL7D
	gPa5E5Rwn++JCN5nyo0Bt2u9tJANQp8969+knanaURYIPcKnx3aCxPC0MhxAqQoK
	yyHOt97UtL6ugaLxBTMl0CyBeUnjapsFhJ3CG3cA8oGgpJcDsFa2A2ykgGs3Z0KO
	tWfUNOjKvXn5mjK60weB4qtshe1XgS77OetIjxTUhtq/SKlDZvP8wRnOUJNY9mlm
	vhF/i4LpOtCAcayMHG8ey8BesqXtfqzqbEV1BhEwI/gn36PyTSD+PQq3ywS8CO9P
	7XnBGw/m/aXSzMC07zgrKNfC/k3Y3rULnVt1BzXF+Ctb7LQb/99oV95QALa5er3D
	5ZgTPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs0yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:31:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so1194627585a.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247891; x=1788852691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=Y553jR/l7Bphc53psUYJlpgAdADS7NerdtfFO+X5AH3W0eglRknloWFkm3eHjtEHVl
         aOacBBYhb19u7bb/5gmGNVKh0gx8NG6lvhtpNLcrV1yAK7F/XMylGjq9xkcFvnpeW5Hz
         gV/391mrwvTDYHlTuq+Y81tUIPkAKL4608+33+Rkurj/MqlaABNz9lBDtTA6rQZ5YIkN
         V3XxWOqDCjL4DvJPGU1dNPgJWxwqC1mPc2dgn4mua8Iy9Mzg0ZNwLCYocOEq2kv5UjfN
         B0uGlhGg1scrMskvaHqmCO6u8SqaU2PW/wxuf2zvAPDpRwis2vmzy9n6J9YD4ALkSBvF
         ILOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247891; x=1788852691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=PPJlKqRriWeu74iLWkQhhw8sFQ/yxMHlwjpBzGe+iWlLL+NqYj/8oCgfNv3ax3PU6+
         Hx69qpgM4gO74Gje7tCLcGltraDFKmO10xX4ry0Aqf/4VPAaNI92U+xjWZZYKfS3ji+G
         DC5azR7j9YkLHRiZURD8GY9f5cwkqgQVqMxO9vD59a1tjMU1KdLscRdD5tpgvqUU7iAS
         FSW/lO+uzST/ylK7n9ZOBaBbOSkwFLJXBnrYY8ol7KD/f4tfnc1jmh4EepEmGrIn/Quh
         cU0HRNr13r4JWU9XrzT6o+c6xvEVyz8kqlZMDei3m4RjcJy5FSgzRPgVkqUwLT43mthu
         vXog==
X-Gm-Message-State: AFuF++mnepXJ2gL5eUVD7XmDYLrogU0Ud3lAffNC68Heyxwk+t8uarPC
	t5K8jBwazpBLjKh1BuckCEJl3fVAabNbY0dtzKRKKwtLS3WLgZquNMczFYyHJMMt00U36KrkYaz
	tsdrgkaPJchY1Ppjl1o7YCx4t1vIMd8/kQVcTrQznE1Brypseo6bb5FPWl6ZylF085XIXVpIywl
	91
X-Gm-Gg: AR+sD10ktkBXOiCY70BI99CvrwoXof/+1Eck4GOL/zOatK9xpz/8w/hQWwxhRDSS61P
	GbqWObdsMwyzdOvF3lhTsSESX+UC0mlCfET69gPmKs0WBfdT0O2oRCWKWJj/+jacivlrygD9j4M
	VduYgz3apcRZS+uxcvgbGvgEXgSFPTSQ7TMqxruPZFDugm9zRyREE6qQGHO2IuS9raeDa2swpFu
	f1duajhSVx3nDQRO+YmDYRlZmVAt8BrKtCA5D4oXjLpGdo9hZ4+lel3fTE/I+FbsYOt2eUnoPHN
	UO7i4qvd+C1bt3kTXt90Ewg/tvxLo27Ow0NQp4Gidc4fLYKtnqA+BqBU5GLD90BqxQWVay6WZb0
	IsLz2+jS7sOAlKBXNfGrzffKkKVM/gWnrNy2p8stvMzJA2Lx3zHbZS8G1vB1+lyaTR7CO
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr689364885a.8.1788247890626;
        Tue, 01 Sep 2026 00:31:30 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr689361685a.8.1788247890180;
        Tue, 01 Sep 2026 00:31:30 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:31:04 +0800
Subject: [PATCH RESEND v5 1/4] dt-bindings: media: i2c: og0ve1b: Add
 OmniVision OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v5-1-b0400a9bac01@oss.qualcomm.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=vCml7d1QeXb6g7Kayy7R89q1qf9zYTdDvGknRrpcZLeOWfjVdbZAPUtWr+XH3uAfb7WG+ZXnU
 EOi3zT1tkCyBHVbizUO85dmCEt1vAyIKGoO/NuC4bZgC5x3wGus+UGR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: QetJ57DhL4ruP7a6sjZKgEOfBX1yQw6p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX0/Ni8fVnWK97
 BAiZ1eoFsm+nZr30dobOy/JPAg8gbVWpIwX7rNPaertWdqVqcpYucro2d1bTIDucR4yzTGz96Uc
 I4/DcKg2F+Am29gVQY2iRpIzhdvYEhQ=
X-Proofpoint-ORIG-GUID: QetJ57DhL4ruP7a6sjZKgEOfBX1yQw6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXzQK6QksJ59Cl
 Yq+cZ5KGBcEv+6aR7P+tFjUoFHF48lVixdokPbfv67LLcZGdIkZ1sYa7uFh0/LjU6CfXm3Mvgrv
 gxML7hvFEG3Xk1oeegK/Bxn69XVUps1oBv2IASRDC3dWRei06pu6R35q7YVyHRNFE2Sjx8TYybR
 EDlEH3v70AvqEVouAN5AWKsVidT05b3lXl7TN8vbpFSphkzURPr5ivCorCGkKT4vvW55b9Rz6mL
 LGqQl1UKpHItZ5/0Z/8to/O2n+PDCcmDPJOOzcFY8FBu9e5sg6Pf7AhttWpco6dTO/6+RJxLF8g
 CkGuSQp9WXW3Cq4hCcP/fQ4MeUm0fs0QJjYknBKiEeWgzfH3gLHYFqToQOzidzButXkwrGVBNPI
 kQtNelhSY2++vPf8mNg09xx7jmQE6oiq/4rYo07QwvoW09PtkMB1SMTUUs+zH/v2c0X4YyfOvZJ
 0rhSg82Fg8WWSjM4XAQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a967f53 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

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

