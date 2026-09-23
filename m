Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A4349BD9C
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161526; cv=none; b=oajJEJJsquROhzLjHDXApikoCmb+Z8jOxznu48lHpV7qRNHzWb0x5UX6Xu+g+gCsqHrv2t1BrDWHK7lMuvnjMw1IInxZfA2Y7PhX0WB4wC9aA928kGWZeGItcuFF+x+Jwt+zE2yUjKsS87qs1hbPjy8HSMxyxpFMPvuLNs80USs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161526; c=relaxed/simple;
	bh=bqn6l4iYdSOuw4aeXmyQs004lZO8LwBG9YK/8wnvAZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/22w3dZDxQPfN6t3Qke84UR9FEcp3jjcwD//Ojd+cIocjWBpWu1fzDDKXUzNloC1GVLYcEOKqjJGJ0SfBiP3wW+7yzYDMatM7TyqBY8J138R7516UOFwJ/NVFNpYvhqO1RfkF0B2yusEzzF/hozTRKIXrBgo1iaRzKtjfO4POs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsifitFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggX7aE/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsifitFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggX7aE/o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NAm2RJ3663537
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=; b=YsifitFZEhisGooO
	Drib5a6RQR+GHx4EltajtUmLprp7Vnic7nEWaijgrheQAyOCSocH7wIXG46DitSj
	1SLKHTVEsXVMnDRKPYfblNUHalln9XsqFGiB/H17uAssa+6s1LJnejR6QIEnV4gT
	p07I3tX2ZDfpOAN8lDZp2BZBXN6fr9qwxXzNO/LrY6tMSft8iXCXMk3nbMMxOyJm
	Wf6WFV17EB2xy6chFs5BL/fn15oSHDtvjc8MLTCJc6gn/SlQFba7OG46bUFpUrJ6
	OYaq/xQoik9HQpJ69jWgB6GkeJquhok+1NrtYbztaUoin5IVfsOA1OTCPq8DH7SW
	elPIkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb602g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:05:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-334f782d1abso2704867eec.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161516; x=1790766316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=;
        b=ggX7aE/oJ7rXDIXBJRmLJBj3IGziDu8R872h/NLcpUOK2nFAmj2PUq4fj8jqUITqzL
         6LF8iR3obASRjyImDU684t5ryspBeFCByDWf9ZXgjV4fNOvztM1lZmVKMtN5A0vds1rM
         3+8/4YpxkJRhjWrEK5Fta/H1bPr5mT2RlzA1Gz5aRpCrv+Vo8D3HDDTeKiabluI46XxW
         UdvESNkpbzmw7gVlDKZZjwiYyQ4bzfJwxhphQngC8/u6oXNAZ10LlMR/ZMqHIB6AzCuI
         +94DXIroouULyDBBLOl3GUDgWv6R6F/3ARXCIKAiGA8XlGtxKMeGk1N06PSsvFDRVwV3
         WwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161516; x=1790766316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=;
        b=ylhUb7L2pEXA2pxsIVod0XQ7n5iKgMJBjli71DFkinYrVNYdt+ts2Xn3xQu/sx29F2
         EIaXO/uYZBTzpjcK/9FCsArEGr+E3wKWwgRv15hF0NAp/b5Ps6uA6ATHOP3oR1j6qANP
         X//gWbKO/dtB95oC+mA2cSIp7FjMFa+7P/SrfBOdix7djJqV4ik+u1JQaJ7WNq9B3AOX
         an2YkTmLPWId+XdkEw8osjwrRt6cHWWmYuCs02P29erYSeEn8+wixGL2XtPexIdOvvCL
         1WWob8tsONyf9jUaS2+07RcOQwynDPzRNVxTuwlQnZ9OwUCn0xoaeE1ukxAD9IMALJqR
         eoAQ==
X-Forwarded-Encrypted: i=1; AKwUvByH0fSDkNQ9dDbYgXO3A8NSvqEt/QvSUcbTyye17HgfSGBJbhoj3RCEkaUwSG/os09DSjbZ5Uw/yLvfIg==@vger.kernel.org
X-Gm-Message-State: AFuF++kWJYcg8yEvQ0HC+jWf7UEQlHBioF3EGLxepvEly779tP5oNE9a
	s4PEvrmibS1FDrOrBJj+nHplpb6KM7cov9RiJc1jGtrlAvpl7gvxL4EiDUdXMR866/kqIibjGvp
	DaBdjkQEBNGA+UEEQsrP68vBg4VZ4t3ymCA1tH3MKZzsU7SuMKRFt9/YIVmbhq6OHLA==
X-Gm-Gg: AYBFou1gpxPi+jh9utcFdp6E1fMI5yU43jduoO+NehKQhXAlTk/7FVk0uWn6kFs8jSi
	PauKPP5JG/Qws/1mH7oFv6+yDsD8ojjMmPA+P0FIvJ/rB+79H8vsBKYSxeic78Ir94WIsqWgiw4
	x7sghEj1zLX0rjPl67Q2QtT8vM3A1/8wjYSNdI0D2k0HNrsxmj3n7yjwRhhpIqQOz9JwLX957ya
	qL/h8TPkHuGUcSyKSOUG7Zew9L29WiTS2oWBnlHnWwXDKcW8OFnsXMRFGKifOsHnFaXnPKNxAd6
	X3ifYe12U9EUHcai5YIrrw1buudWtVX2olPAOt6P48reANLhj/Epjq7Wk8jyKe+fHI/+fniXfsa
	eQTVtRePvmoVlS7F5vPcBj/D4I+6Xmw==
X-Received: by 2002:a05:7300:8242:b0:33b:db21:9877 with SMTP id 5a478bee46e88-33e8d9cd464mr2014762eec.20.1790161516376;
        Wed, 23 Sep 2026 04:05:16 -0700 (PDT)
X-Received: by 2002:a05:7300:8242:b0:33b:db21:9877 with SMTP id 5a478bee46e88-33e8d9cd464mr2014744eec.20.1790161515889;
        Wed, 23 Sep 2026 04:05:15 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:05:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:46 +0530
Subject: [PATCH RFC 15/15] arm64: defconfig: Enable S5KJN5 camera sensor
 for Qualcomm boards
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-15-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=708;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=bqn6l4iYdSOuw4aeXmyQs004lZO8LwBG9YK/8wnvAZU=;
 b=BtMxks8910ezL91AonRWICuUmO6BybjXRpW34O+cKL9X7/xTV0D9Ks9n9yUFV5WtXfam3m+fa
 Sjm5Agw9OTJA50XtKxXrPLrNgIhqSX5hLQSEmrOZCA4kQsXcoINDM7s
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: bDLXWrgYEdUwBr0bcTiIPqGpI6te-C__
X-Proofpoint-ORIG-GUID: bDLXWrgYEdUwBr0bcTiIPqGpI6te-C__
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3b26d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xpjZ0Ymiy3z0-qgt9i4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX+tt4VTCONkA/
 Rx6DthCn9sgPc2R4csHKQQAy/6d/xKHvQ9VhA796npRD1Vo2QZc/P1KtqOmOSJc+QCyBsjK30ns
 cmjRt2YvXgAEGaX95XeJPnJKI0vwNcs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX5O9k9PwNnwuH
 Wms/CK7/nXyqQRF9G9ONodXqi3nkXJKpZJdsq0oBhPcQbSTVcFWRtTz1nvUxK1++D937GBLCYIP
 V2+yyjS9aSUK15PmqtzVtC98zTKPQQmp10OJVRg4vTs9uX5e0KIpvz6akE4IouTE1o7ddgHYCPw
 G1/jdbxgf6x2fKAkK/TnmddkTOhPnA5h6Xg240iF/rG4O1uZRKS6uukFzFg63p0HqxG6Z97ysuL
 z6V6+ZYiUWKJI6Q8KGf7Gi2/npL3+Xa7fW67N7WWAun2/3v/IehP2OmXEB5OdFG/I6eqIoJhsYr
 s/oHcswSu8Jpcy9QWX2kCAXrTNAmxCaLOWjSFskDjbCH7epXyNlOIrsinBvbh+D5RR4l/OSjfVE
 AP+LhNwi8/LftQ59NhLMBzBFQ3J9hT3S3xsaEUnV+l2UUVjYni9XhMlcYufL+uao7/OCHzu5tit
 w1/JJ80vCqXd3wibHHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Enable the S5KJN5 driver which is used for the camera sensor on the
Qualcomm Hawi and Maili MTP boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc5e32289e453288db0bd9449d4c6f..fa35db683bb253e83af6bb25f702e3127761c086 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -960,6 +960,7 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_VIDEO_S5KJN5=m
 CONFIG_AUXDISPLAY=y
 CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m

-- 
2.34.1

