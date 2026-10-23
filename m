Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769349;
	b=bvStgzq0Re3OwLJXDVdyJdpOo8HhVshGksrqr/45xCdhd04Wx9AfKz0mFW2qC4qHjAeH
	 KlnIK7TA0yqAM3P2+Fi/e59CrlJ8WoCUK+qImNg2RG4pSe6lsTXSCPdQb0Nm65EXCmjsI
	 6W/O+jKtkpAAZnFgKvIPpOCxT5/FgQ38R0NVS+Y2axEFkGr3EJEHog13uP1JQTUe620uX
	 GeqOMpIoyi4EDDHoA7ghjkDUlI3hD/3LKxvaMnhwFZKG5Q8xIq/WiRoEAP0KRuHhmH13h
	 th7zvhPG8Z+qsH7Mej+hE8d2tpO5SPm9SpNsFMz9IJ+vbKuGN+Ss7OlamVj7aCIVXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
	b=Sb+mmA8oqHb1Sp7rW5c6plzwW98AnZV+yvc8F5vOKxL/0Kux72eThstyxqJ9+2o4mOtQ
	 nCNYWNNTTto3tUgrU9AemluNGLOVvZYDrB15jJw/dna+dngdfKOBJ/xDtPIDEXgYLtAos
	 g1sxpw9fVN88jYaENFUmDL60IIHyVpHIGua4sqOt1MLHGy5RC8NPEwsiwD8DAsEk+UwBt
	 ijEjAPONESbNLKEIpyckLpl00ZmXq0EgG2xBBg5DxPprXz5uxLnPYZjaN/NerjhoVWfo1
	 LA7SsnDpvjMvWMpkGtoHHd6HepmjuG5yRbPZJXfZ8PMjW2ybkoQtQig/ecKIe8ONOPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BogmpsSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb5xSiq4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5407606A339
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5407606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BogmpsSO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb5xSiq4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5v182109062
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krTDg+KuG8O
	L20d9UWcUcT8ep5S6DmptVb18MyRohEs=; b=BogmpsSOwV9HaGEeYZRhGS/FtdA
	fmDw6HlGxdvIIQQ0QwfE+2URnTt9Oh6N99/z4SHvYCJHI1mlP3gQKYhf18e87tR1
	VGcb1icoFPq8t+hqaPu2E5YdbfdHyX7AqTXbbL/D82I3ZdAVC2+AyWIvzHAiqX4O
	Do6hxSTWLEmIbjizp9g7yrmykwF3W7gWDCvFhzLO4EyLMXSl33kVE/WRoqwu9X+z
	i2gq9gal+trhnpdZwBD5O+NmESJIGLnbPSW4yZ4v4KyN5+x/18NXD8ZKmMXtG7hJ
	5IUnQEV3elcNT5C6s2+1Dp7x+4ZmFs8ClBJ4NC5X58mQ9pWOBKbh5VGyJAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4a30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so186208785a.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769347; x=1793374147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
        b=Vb5xSiq4Hyp95BUskdkXkhHCToUbxh98S63reEYJr1K/DIFtkpiFpebyCu2PyrJTMO
         GswN59/G6D5HRGXbyjstAnwm4u1MeMQ3AMHzJGkVjivxORO7fGByJlbLaY/oGXbt+Fft
         M/p2/bTyENdm/Kyr9zmnRUwxiwK7zdXBYKgqNehpTOC4MAjFf6DE1ssZXeLNahYQXNxj
         50uqBYCPzag6lDOKbaPrEZIvdBV6GSIAcX0VJNPL4qtet5CaYBzFU0cZPRKalBvIGElD
         CPQ5hS+Pee2i8eXU6fvduOLDnwHsjxownVJBF2y92jhRDAde4iZHsOhU8Fe+BqLo/6UE
         C48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769347; x=1793374147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krTDg+KuG8OL20d9UWcUcT8ep5S6DmptVb18MyRohEs=;
        b=OGO484yW2WAE0zlcDY5D8rw8fpTz/suBLovaoDQMFWE8Gl4kK8Wvoyc8H7fIg5apFN
         75y68OrdWLRlOkWMGmU4lvWOe//m3u+TRxpC3MFW9LSytK4QLUjpfA761LdUnfKYB6FN
         acTLaed4izO4qSPQAM7/HgA64hw5R4V/Ggd/ZBP/FPkqJZONu0c8DYEfq/Hcl+FIsSS3
         C2PVRdlN9pMRUTCm7/ZgRADehmFfCEYgZ9xXgkn0ZihupfOS4q6IFQaJgi7+Uy7hAW88
         p0XKfOxvyCZBjSldEskzISF6CC6/xGWgT+ipNe+maRqzVXCLc7CrdlPdM4J+Zsteispg
         8SNw==
X-Forwarded-Encrypted: i=1; AKwUvBwYACr4LjKoUHCDkUKXKDnlCOWJfLz6pa0VFevcvqLssAes/YdyQHv74ZFqBkFxVkUdylrC/978ASk9rg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8DTHLcByvHRl/Mj/wESU2tPGlBsVx0uDzWJlod/b9H/Y6DEQj
	G0dECthlnqfqfNuOELoEY61y/1Sh//dFyFd/4oRgCvPs5pgvGelCGDFFI9biuLJMO9ZBwkiUIQZ
	tvUOCMYDWYi4MbzL3p9XbhUOSSeLRNSYTbna4vka9EFsBzqEiaB53lZ46GcFl5a9x9A==
X-Gm-Gg: AYBFou2tqLR2hobQx415WJWM6foeOrzQlWjzHL4XOI2oHZL9vdjtl6SpW4fk5peBYvj
	FyHrSGrx/hMVYEhAZ/Eh7jHvnqFBwhuawuomZZc6TBOKPHFM3365EP0U3KfdWeh6q+x1Z09zVd/
	YH0EkuzNIIbJx93tXGSBiKN7gFRjPG2sG4CY1EoANIaToQkPcQgnM4/uDrOulInOGKOCCZh5lq+
	z1hwuekeHtjMkmGUxns7qGfTFOZyVVbyjXnqFuS3XEvImf1uXxbCpRpd5j9ylBHyliIKffXzdqk
	ihMzBSiMipxyqpyvsNPeTLhRC3SbebpitxnkEzS5NCjlFz8urB4ATzTI+qfncbA8S1ecw47PmqH
	73cex6/Eket/j3cmRHI2JJ68J
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr506122785a.27.1792769347155;
        Fri, 23 Oct 2026 08:29:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93f6f7dc7bdmr506118785a.27.1792769346689;
        Fri, 23 Oct 2026 08:29:06 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:05 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Fri, 23 Oct 2026 18:28:55 +0300
Message-Id: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX3DxKFBBCdlIp
 18/lWmgUIULIrIgFXHZuBQsSab/msUWOcMtATvM36NkJY9/Lp8DbqY/J7CIco6bOcaX7XIUCZ4/
 OcGDIVB5rdq0FnSUvgptmOok7QhKZjTpI1pV8Fg7RHUU/GEdi4RE6W0m/4owhgofV/vPUG9weBL
 Fqwvg/DTJ9Bo3RKVCz+Mmus0GUIo6bs2aaJekHJpefDm28c8cH7pNvWbo3eUbrfArpv2WdudfTE
 wjJ64EjrFFEzSXc/1v5tJhon1DBpqf/E1VU5ffu6BIdVKJCSQJ/1KecUw9ToObYn61lJnU5LwTR
 IfheBN74OoTvT4yutFfTixhZ7mEnjCdYUs074lzm964tqIRQSJJWE4lqkg3DodrRQVaQgb/Ooeq
 nSNKzU9zv5mWZdnV1SI0tovfgfpt3gdpNYPTaRZwwLDGwVCgwVLACVJf7shG8Xjn6d8gm/nN8U5
 4e8CN91F89jhbR35oOQ==
X-Proofpoint-GUID: _tR3_0rAzrsx17gwduK1AnkWMwNdjmaD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX7z43VTbJxcOY
 7t10wgGF49KHQPz0iSNxnEMq17/20YzIqtX0jV4z5IF7ZbOSB+m89j8nnGI8XjlVoTQjdnbDk7D
 uNke4hN0zZGiLIj7NBlw4CneAP2+78Y=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb7d44 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rPRfP_fVeLzQRQyiyREA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _tR3_0rAzrsx17gwduK1AnkWMwNdjmaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

