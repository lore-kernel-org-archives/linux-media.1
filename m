Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691843;
	b=OqLB/b0H2hB5MUJKfWIrUQsA6LSUZgSucKnu5t/Hrb+VEkXRphViehmwjA4foYe3/mtt
	 UgBYV8cRw9s9TpIv9x0VYylo8Qyj+luIIHkH1XVV1i89kCiPXpuEvyUU2ze55GHEZddyn
	 kYERUoqGsJs98SzC5X2Mem4vKwiIlb4dcyfumWBNhxdZ9HkTVk+r9LwIW/VI+8LDaat8C
	 UX/UPPJNbu79DCN2pMUqDaw3lmTigjrJ7R/DrEccS0WbBSg6a/GwqGg+fin8J6fVi7pmm
	 AFYharM5Zpcv+fS3BTYC4wc74f9ubJEOdNIlPpY7DuxScAv0N3JfNyl1LI9wVbO+SOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F6HQWOoh/nVaYmp7DoAInfPCXZizy4+b0/OF/6XosPg=;
	b=Ycjy7rMy6XGtqEbOBHQU3kXLjZKHA+OrDa2TNx26ZlSSbW0NGlicl5to0ybW/9MQZhu8
	 3Q4XjOJyktkgyytczfoPHIowPhp4i+w1sH36FlOlEqEcGyYvV7RN6qQPQJpR/p+2+Nb19
	 YeLy1+WhStt/tjiC8es+gbAHo+WS0w7j1KlNAbT4XJ9Jgqv9CAE+3uFNycHSA13SyeIwa
	 RAK5iH3OExzNGIPG+VqlhfBMRMe4aDLYPQ8+qN/Bu19PCS4n+fOMX+a1nC72152YceiI1
	 wCXXPTjkKRawiEo5EbcZ3dsV/wLU2HMiOq4/4tdlmjh+HFnu9Y34aDuLEh2VSq8rJUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XhGcJM43;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJ0eup97;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29E606A32D
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB29E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XhGcJM43;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJ0eup97
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHCFn1242802
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F6HQWOoh/nVaYmp7DoAInf
	PCXZizy4+b0/OF/6XosPg=; b=XhGcJM43jdP1k7yXgmQF1m013hRvHlqR2umUxE
	s6Qi7GhW6w/ty14OI2hfcBy+p8dOeYFop3EdGvGpWXdePKDA1oZSgyUCNpsL3PMy
	MArZ9COR7KAPMjKfUSIBJyj45BNorlCwkSmnj/8+BFZUz7ui8/UTaktjWjLSrg5v
	cfjyWjZc+WJ10hZfjjqjs8WO8AgRrBxsNzm5rTwozMuT2pSCMiTmsT2h0u8UXI1R
	YJ9AWaVKXD1AYWGzjzpP9/2IEB8vMgya/5CaL1Kj7Aykm/hHlCXxtpCTKeVT/EBG
	2p2aIk+48FuJ0C55lJegpNK0fx4r6/ZY4bf7HTnA5T18J0nQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7s0p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364f562140so129554701cf.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691841; x=1796296641; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6HQWOoh/nVaYmp7DoAInfPCXZizy4+b0/OF/6XosPg=;
        b=EJ0eup97m3mkZbO6fHiyJmJaMCvIF1j4iNH+PyqK81VC/5KVqCgLxZ3Z0p/aO96mra
         0WCyiMDJFtzYXDE6TaNWtlZqmpRYaHGvNMBU1RQlETid2S+Vhzh8k5HuLLa7N2F5Zpdi
         0XAUkXI7joyCrZOv5eCAOemoQxadLU5fptoMJkj+7XoUfsHXjtIEVRkkTIxMs2EsX13F
         6fm4SWSwK+/bt9xl+XpMFjGvmKZTncguACHzQEFtJcDwvSy2IEM54Du8HUIq3lVhiIVy
         s7vDBS3bZigCw8wWe5AGDlC/ymlHJm6h/m0iWSzROsUMBjKYk+SeOJUfM8MKU8oyzcf8
         ierA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691841; x=1796296641;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6HQWOoh/nVaYmp7DoAInfPCXZizy4+b0/OF/6XosPg=;
        b=EHGaUfYPffAGY6w6ctl/Rbn8dviqZPpr7mpZ+hzGy0vCV7qi35KelxmPQR+qPEqOIB
         NTGOKopk3phLYLoiBSPVuSFC/RIyHEjlNDSQ0QvF0ZNHH5z23XXLEvkzxIJo1ayBAket
         hKktq/LvzCkBGFHk8EgTriLVwwHCsP172QcAt4RQ3ppzYdqyOY7u1W3GIytCTMs6N1o3
         XgfwPtrRAtutlgpim4ZdFZFvCt8SUrhjLdzX1JR4cPjQk5nLT9zO7cwExZIc4xP/Pv1d
         Hm1cyF5L9dm7dnvHrQJXtzJM+N9AnL8cWwfz5MWb1b2o4WfOdHhoOLGZyUEWEtAzht2C
         oOtg==
X-Gm-Message-State: APuU4Z92mvBZ6yfej+tr3jQhqQmQF6XcZLgqMUQSN0dWnS3bUQGtE9hB
	qqC59yCuITzKrsnc5SbtMp0yFdDVpTDX6LxFUUHxCOoxiY0TLkf2AzWRQmPFGVwn7R4Rq3SyhD1
	GU0yTyzu/YNFlRBQDPwAqPhFJKkfmYLoQQ239JCjqgfwY879WaazMVE6q24IZcV3QsQ==
X-Gm-Gg: AZFdTZcXaPXGAxRvqvDNtuzjYs4dPx5m20gqOByZyY6obSvVzUrpBXmINTU2dY1x7bC
	1ua8T+v1aH2P8jlN/oh3R+Sjzi5/Yn+2tS6lvqbFXDjw5Gr4FJ93R3nsQ6sxLn1TRmFVs4jkbDm
	ehmbS1rrKNlDa4wbRv0TMQixqgJ+z8C6xqis9fBTlCEHbe7i+aHNAAB4vnRX7Xw8FfyqO/jygFt
	9jMmDzFDKfZdI+WdsmlntX77q3GnOZT5+4FTw61FoPTlQdGrLQgxH8NzvQ5e/d5xb0MbKMkq9a9
	1YXnqIVrI4sEYMRQ/ufHU0xbJw/NJnMzuPL82vRkqL9M+RlslrObRP0T7LtYXdH5/TZSMsLGSWL
	58P/plSgwLyfWlKN2dipyYPtOe0NUR1vVZkr7rfiqrGJfgy7WGdP4GtVQjm+k1Ku82rFDOBiVAE
	KvSL0FiTF8AcDKZhmLq/vPI63pImH3lSf9IWtKmrX40A==
X-Received: by 2002:a05:622a:60e:b0:55d:3347:813a with SMTP id d75a77b69052e-55d76a3a0c4mr347524201cf.27.1795691840952;
        Thu, 26 Nov 2026 03:17:20 -0800 (PST)
X-Received: by 2002:a05:622a:60e:b0:55d:3347:813a with SMTP id d75a77b69052e-55d76a3a0c4mr347524011cf.27.1795691840481;
        Thu, 26 Nov 2026 03:17:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/3] media: camss: add support for purwa platform
Date: Thu, 26 Nov 2026 19:15:56 +0800
Message-Id: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwUCGsC/3XQ22rDMAwG4Fcpvp6L5fqUXe09xhiOrKyGpWntx
 l0pefe6B9YF1hvBL6FPoBPLlCJl9ro4sUQl5jhsajAvC4Zrv/kiHkPNTApphBIN347p4D/R9zl
 zZbV1tnWWQLG6sU3UxZ+r9v5xy4l2Y0X3j+Y65v2QjteLBS7dOw5ihhfgghMF7ExogiN6G3Je7
 kb/jUPfL2thF67IB6EB5oSshKwD59sGpMEnhPolQAg3J1QlWuwA2k6i0eIJof8S8y8VXQntEFY
 BLaog/yGmaToDYOqkOosBAAA=
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jesse Casco <jesse.casco@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691835; l=2664;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=e72/IVoD6rcZ+Oh4llx7EJwNmBV/vw8PD6UK3LycWug=;
 b=YBlONCQpr1RWzGpk1UyNhSH2MlinyHN+gFz2o/do4aFWwXowPSWu44Nz8s37pTKru4OhPmxNI
 gWRheYSvhwEBRbgEVMeJ2KXUkpMpk9qR8Pu5JafmniYGL48m2NJ2Cfi
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX+ZRaUlassYeo
 TPcSiWwyvs1RpoVj7guBxfcDfM7sySEBM+jfLq3NJLvQKAdhTB+qKndPlHAIovrwuX9JwUlevCv
 /iapIZV4jslkNsvbYQW3NdBauuuY8Bg=
X-Proofpoint-GUID: InGLx2slOZI14ZALrP1pBig3PnisodpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX2r44wwpfzwCP
 ahPNzFt0lz5rcQYAobHZKm3CwwgMHrGq7KA8xx+SJMNBECNBUbStdms0dERROi9tw1sR3s77VgP
 Yxhjhxi7WmfbJLX7nHVxulFD4LVV46nhZ6E/kKJbQWXJLQnZiP1/p8CJWq2Hk+7PIVnzMX8+c6G
 59y36dFgtO145UpxANlBNspzWe9l+sNlJz/q0Z6ZMBMPoYowfGdo2qsKb548C6yLVge3UcDXSrR
 M2dJU7UyRE9N2HnFx+my0xN/wTgl/809L1SaLIfAVRa7+z+6bBNG/Wb0nN6ztJ78DdKS0dvB6Y8
 gxP1eaAmxjsNwLF2E6pCVs0LuBQDtCv3TtXRtCmx3WNYn+zHYmEQjsxVfZGT89F3XRGH2zGq335
 Ujvv+y02YATSyMdadLl4Pgne9aeQpjQ3u4UjkwVvQuflBBoBsbPxswe86SNgH+r1CMj6UFkZbmG
 E3aHQvz32a/jqq2+GlQ==
X-Proofpoint-ORIG-GUID: InGLx2slOZI14ZALrP1pBig3PnisodpS
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b081541 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-azpoqUCswQaV0tqBYUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260043

This series adds camss support for purwa platform.

Validated on the Purwa EVK with the OG0VA1B sensor and Hamoa EVK with
IMX577 sensor.

---
Changes in v6:
- Rebase on bryan/camss-next; drop the dt-bindings patch, already applied.
- Include Jesse's "x1e80100: Use the lite clocks for the lite CSIDs" as a
  dependency, already reviewed:
  https://lore.kernel.org/all/bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com/
- New patch: use the HW CSID index for the CSID 680 wrapper IO path
  config, the lite CSIDs program the wrong register since CSID2 was
  dropped from the X1E80100 resources.
- X1P42100: set the CSID hw_id, and use the vfe_lite_csid and
  vfe_lite_cphy_rx clocks for the lite CSIDs.
- X1P42100: align the clock rates with the X1P42100 camcc frequency tables.
- Link to v5: https://lore.kernel.org/r/20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com

Changes in v5:
- Set line_num of IFE0 to 3. -- Bryan
- Introduce CAMSS_CSIPHY_RES_PHY_API() to describe PHY API based csiphy
  resources and use it for X1P42100. -- Bryan
- Link to v4: https://lore.kernel.org/r/20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com

Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Jesse Casco (1):
      media: qcom: camss: x1e80100: Use the lite clocks for the lite CSIDs

Wenmeng Liu (2):
      media: qcom: camss: csid-680: Use HW CSID index for wrapper IO path config
      media: qcom: camss: Add support for X1P42100 CAMSS

 drivers/media/platform/qcom/camss/camss-csid-680.c |   2 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 188 ++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 5 files changed, 188 insertions(+), 5 deletions(-)
---
base-commit: cfa8366bc71063b6078472d60dd47742d883923d
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

