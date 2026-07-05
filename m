Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB43A4F36
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280469; cv=none; b=SS3BOIJgbMSe/EFeT7eDABkcOYbyY51n/WoHMzQSkN2paoBZDCbFg+A3YUDFA1LJLtmrPTqsPZXL875nwM2/N49HsWI6zwWCc45mx09cn5700o6o3DlTdpY3o0/AySEBqXSgwf7ZYcT/I+IBvcFDBmhEHk+TO88tkAdj8iP6Zsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280469; c=relaxed/simple;
	bh=aDbMtkb7vLXS6gEaXl0MiYPwbTWQdGwMD5R/KH8kYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMkxierkbGehOmPF+7EYa5AjfPFUvNfb2Q2xmTcmURk8n/TCVuFjtgMV+K5FXlP2brbHXM203fgZRoaIMAcngWglDcPNmGZUC8625H04jCK5m/1L6Qbmy/whA+rOEE3xOB1zZhRTukVadDXUsTssiiqV1oCtjHn0DJuq1iKFE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu2AUpMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8Pl1BcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu2AUpMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8Pl1BcH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IxLYZ2284376
	for <linux-media@vger.kernel.org>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 19:41:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c8018f11fbso24015215ad.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=T8Pl1BcHV82RNdBhjv/YnnFJMx2PfKDW5ali50O2AuxJ+wFsHHtCe9sQA7Jl4J8V5P
         7Sfx5/Z3iYr87U3fToEpecY9nTGwkS5LuNuPJE7XZnPMR+QFDzqzu/S+2toH3N3ACjOC
         ov/rVrjS9zsB+0+wR1t4Fbu/gqGr6U+MFivmHAi/A6j/xaLPzVm4uQyDjXILKDG5ErxQ
         wCghV6hgJMk1/bOaG+Kbhg96dIIGv8C+5JlWtE+gc5YhG3rek5F5EtpOrDYYpU/XURNz
         veuIPckjfa1XWXIhyV6MWcEzzJ7CCOkwnn0ZQJF++6PDjZKd0MVVabY6iqb5kVozPzxB
         XwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=mcSNqeFDjOFZ7Zwh4y/3p2i70Q29sjM5cgpkR8UWDJydJqCRlvZwlnVCW2b0exj4Wc
         XTYe8sB7P6LqhBpUZ0JUo4PmjHw21RujhaNSrFCVOuXq3jSrZU8gtI8YMY8ff0WVhjtl
         DJlPpLHpfw1hJwiFsvYw0W3h//HbLaxj7rnK19O2lwgmDHKorY0RlOwF90lT3V33t+5i
         OgBLCZHnaZDTtCcMJ+7LqPJxSY2Nwo5mZX0/EtXZ04v8JWs+HaX4NhLJ2fKBZNEl3p+U
         ShLtW19wUNtrnJZXymxNbEYkeIEk8pwH6ueu9U/N7MbKM2T5U2JKOLGaZRXRsMT7Q4wT
         Jg4A==
X-Forwarded-Encrypted: i=1; AHgh+Rqb7bjd3v760o+40AbFBD5eMFu7xCDRq+9t5AZgeSB2LcGL9Ytvks3tKGpSLqFsaSPGpQXkJ9Wv6Hpb0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy/vhjfTIno3KK3Vh0UCrNlLpRSMhDVyaIBkWlLokS2cDzmHEc
	+P1GjRpWkMxPH8t0wsZdkNPhCA1LQPVIjBqeV929g/h1DW480YB3eUFYJAt7lIAt5oQKZCVBna0
	8GX2NJk0ALxSCogLs/GUtstb3xzpjfP8C6MTJRiGXp+dIizt5Xng0f6jPU6u/iQjZzA==
X-Gm-Gg: AfdE7clD7zer7ApoW7OWjyMrp1iotCR9SPlmQ+pigNbCObRbkS6qVPV+2HwTLK9q4Us
	BVd11MdHpfaU9dcRKgxgsSQLgcW4d8spCRr1ra51Tnptz/y4QLWmRpMF5uUT2umfp1pLi3/6yDC
	k/hvJih3aqdZIUMG8RQK4K9iiWTABSIak0QGgadSItM5wSSNXhimmqdkD/Uw642DlP8RG4dRr/V
	9Y/yZZwKwLa64gQsQQarrBizOLUp3v0oosaIQDO0z1QjHVHfYat/Aj54U10kxSMnW6GJitvLS1M
	76+cS46YTlSTy/dPWmoJJG3PaUyfDyFnNSrCj8RzrMRhpcJbUHW9IF36Roi53fx0Xx5d6vfsPI8
	T9hfUjElT+4SRCO8l6J4N3YkuFkJD4kDRES+yIA==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673755ad.17.1783280465203;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzdf+LFnKc4eL
 Q/WYrQzq32PjHKtKBr3Y+wGOvkCdIxMZ51r2qbBZg982qiY54uJpJn/N+FykSyziJj5+1HLa9Aw
 ZzbeIUk7kA9xZr/EhnK9MMLgvtwOCvk=
X-Proofpoint-ORIG-GUID: tTCUqKzMgm3XKpapAratdevOgpL3YEER
X-Proofpoint-GUID: tTCUqKzMgm3XKpapAratdevOgpL3YEER
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab352 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9gdeta+HePAk
 1rAujzvwTdr6eBj/s+oBjH1RC6dM+tghh9NfxPdp2OeqzakU6OGc+28k6VJ/ugzETPjg3k12M1K
 2lb/EP/nutNpw3uDRERjdtNccZwjrmGCuD6p1gULF6kDe3WhPOs02/y4dhZ1j2NSPSsCgr34ZyR
 8z026DVBlRLj3N9TR4j9XtwU5CzQ6qDFyH5+ucKs2evzgiiodNozjHFihwnX/H4xOjJsP+M3LFT
 Zgg2R9tRr0/vIJ0I8m0MDksDNxptTrEozpdjkCJuXj+oF+wtaokVY66Br19OR4XkmyOVSL5psjM
 +MzX912kUiwkFjylRyuJX1W3nMrzVHj2K9ZkbClUXoXIpbhnqQCdg6cxVxVB69+K23z2Nthz/f9
 9ednoJcwX0UsFoPu/2BRFTrtOA/0rBqQpeQ/+9qjudKZ7nwZCH7sAx1ehVQH2OCWiggAHzJ4YgH
 5/5AL/f4bLac4GVxpDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

