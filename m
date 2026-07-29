Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A043B3CC
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312298; cv=none; b=JxszoJIaLVfDL5v+IlieS1uLbySUf9BDMN9MH9oISQjG5M+Y4+1T29fdIHC2ssiLf0OVxZjFi0hppupuTgCZnYuPQPGsjzU13+lT5fe7Y+gqIAqc+UmWdf+CcXchvMNlJbu6hqnhpujaOFVx7BJN6g799Zj2IjBBhC0FGLMedWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312298; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJsmFA3lDULC3okqqhH4NTqABvgnMoN+rwPdZN62AREFcUNgyIpj/xrIlg2qYGWEXfiPY5j+HdljOXVyJ1RaR0DoRg6qiGMPvDwjbZ2pkqi5IXQpgt0eBjFFFaHH9iJGz+hgpe/tnQ5LUoi+BHSrHfBxUgrpjBdr+VvikwEdwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goQonZ1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+k5UgZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goQonZ1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+k5UgZR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f8In683430
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=goQonZ1SQvWwIF6t
	9TLuQSDvjJNL5uQBHlKscd4ptZGKTVnXsIVvV9r90709iHrXRYNTent5bINnbaM1
	stcz3AsT0PujgNfKLXPBMLnQuckpAHE8PHBsqcdUDlpPNWm+hiKaUvgUh6n974Nx
	sqIAFBd7UTs1eH+iO7ps6JB+6Uc0ik5I8qOV7JMMZ8jMsZjEgIXXYMpjhrGi4kED
	jr0dXktak7K0NdldMyGoK24ceytcl9mx40rvJqS6S1XFmb0+uO8o5ud9cxfsw+W8
	Q+FypHdZlNHv0zeVf2cLaQXqKUQMrL2FWQN3cOTkCXfM2Q/7140smsEx1VbyARqq
	bypjyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbn1rh06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so5814931cf.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312293; x=1785917093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=a+k5UgZR3dXhnIokad8IHFSoZ7G7k/A9ughXem0gtK3swLqSwRnrZlCGcCgcqLYxTn
         RUIY3o0Or7JuZ4e6gFovbzgl9r6f4+VGBolg3RZl8yECTw33tc1/QA7NnTltyZIfo3kN
         A4t8K3OoAn7FYVoxBVt3PTqxvKJPE183JsZrFjwDtFXQxMPab5n+x9guw1+c/zYpK67g
         YS9UN9AVQrTg8Kjta8hrVHUH3KOhr1xgg4BggqG19ZdZztYRiicjRnAuoYUXEazS+lKw
         JB4QwumJjqkZ8uNPyVoA7hinuDOib4zKPNdLqi3uQN2sazimLA1PSoFMP9h8jX8sNeuf
         nYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312293; x=1785917093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=b4Zo/pfVGJWKFjjMM9llfxdJwaMyzz34FNMehrq6t6f5S2XU7xBMOZLrdEVp90g7VL
         AvdrNrcyxAUBWxofSwX/Wz0j8VJ/nspalAVAIuSUCTr64LzyqTNMr3J7Prab7mQjyoPL
         gtQ6uSfr+W/EQKNh85A4H//V7gj5vktc9H+Pz88BQ8Gdc0HXi2arJV4ahKFD18YGuGhP
         hYffFUQwxSLI6T5+jm3jxE9etZM+CJ+xixiCgojA5CRhDLCUT0jdou8KPd5Bm6AW0njg
         LDhG4gPMomTaU1B/7VMiIstEVH8ry7iJSB9msRriEZaCQY8D4no7INFd3R0LylsEp2T/
         sSZQ==
X-Gm-Message-State: AOJu0Yw993PC94+x5tX7EMwa3zgWGHDVKXEGb4KLyf3W97dVrLRCETee
	kzf6jR7ZyEoqTWy3pvRX5pj5or/Df4sE04PKfdk9Jux3/J1oEIxB+iIcl2ydzGMX9q6giVxa4l3
	/Z1tY6xMx+NiHa3EzU6bKj1z9bWlDNZz6sW+DJN2dao62JmN9CuLfIZXaAuVgQKZSwg==
X-Gm-Gg: AR+sD12AcQ24Ldmc4r94RPOPmB6fbcavP/65AtP+XSoTrJkp4khxwvSGhvsyJmHJiL8
	jSH9imjLZi5HF36oTYGacdAAfDs74ZQXuRlwCs9Lht/nLycXSEkT/GWZbFUDZgIBEGxWjYgrRci
	W6EdZSwc+hommkGEgSS+dpwgxy7FMm6mPsbe8PdCLf/PMNkMXTIhLG+iYPM2CLkyDTrbq9TCtKq
	KyFhj+brKFNLwvqLjjYLEx6TiMCIP8p+bAneMt6Ou6eRMDtAR9uobfBSO3qeKYZCSMNS6CVl6b5
	j8EjhEkMETl16zDP6My2rFfwsboHj+cNs2toE9puuGHdhfrmxxc0uIZsvPYCswAknAJQpr17wEJ
	yXHNjxe2WdIP3lTcnDNBmveinwcoyShre9TnJOyD39SzUVpDUYz0/ci9Z4AMeer9KR+SR
X-Received: by 2002:ac8:5f8a:0:b0:51a:8c97:937c with SMTP id d75a77b69052e-529d72223a0mr48095481cf.68.1785312292943;
        Wed, 29 Jul 2026 01:04:52 -0700 (PDT)
X-Received: by 2002:ac8:5f8a:0:b0:51a:8c97:937c with SMTP id d75a77b69052e-529d72223a0mr48095361cf.68.1785312292545;
        Wed, 29 Jul 2026 01:04:52 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:04:51 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:04:30 +0800
Subject: [PATCH v4 1/4] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-og0va1b-v4-1-ec7e7ed87b2b@oss.qualcomm.com>
References: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
In-Reply-To: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=+nrwyoUMj1zhCcx4GfuQDFd6VjnQFFDEZgBUhcQEP1OW6p42wp1Q+xRPgbe8LPtsKL37R680X
 C7If69koX3eCSEBXxXuWocTywazFd7D/CYgJ8bfl0YlDUUDARyjiKWw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX64+j1RRmYDgp
 cFsrcNIhSwVieMCesvXek5RkZbHsh/7hSPDu3OnfSwJXYFUkChe5Eua0I5c5aerPizIb5i1EO+0
 2NEOvGTSfk0AN7eWk18PoYWwwIVRt1k=
X-Proofpoint-ORIG-GUID: h4OZDrdK_mrWRv9H5TIdFo5U-PdYj6Hz
X-Authority-Analysis: v=2.4 cv=csCrVV4i c=1 sm=1 tr=0 ts=6a69b426 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX6WpM0rkCM8s2
 j4ZHTxr9ibNwqUTHABbKlerKTCkkgCkyh6pA58Evmv+kJv/EqVzLy2wnwjIUEAIP+tcvaHrA+EL
 fleEq4q5qpoVT9S9S5p8f8DxPsIV3NaH7mPfKTs3hybDnXmLkcmjrAUCW9FKC7JU3g7ZrqEhGHN
 J38JF0GZM7enb7X4hRKH1yO8BeOpyQGXQ9ofzdZiAVnA8d8xLDhI+45ezaA3DARRc6vWWhwXloh
 D8xragL+sZ/ZKR1fdDPDFeH5dDHHx7Ibl9/RlkVsO+TWH4/Oq5Q4nHe+zDvyTwIvZ1zLjEqXp4x
 JjZXrqo1JYQ01NNyTCHG92QeX7PHUoSmZu2Li//78mAWyQgpN0LJhnw3yg6p9MbHjZKF4vcJy/q
 SAxufDA3KYw/SerT09/IqaZPX48kH90YWj55BdzjIUBaj7YvqH70m1WV6Apa8tOEPWX217a8YfR
 HduANj3ugjGWg5y324w==
X-Proofpoint-GUID: h4OZDrdK_mrWRv9H5TIdFo5U-PdYj6Hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290064

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

