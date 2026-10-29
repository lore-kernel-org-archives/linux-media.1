Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288647;
	b=W5xJEMzqqhi14GYcXco5+Z8XtLvDeHcr3Phuik10aH4MunMHwm4njYCtdFOnugaYpps3
	 IL+NeWqvgPjDpmpBP+Uqc4glfdRuHfDA4wG7XMp82WIE9lsx0ULRtZ5JqzyPJlSurhH0I
	 3ATOUaRoshAEnToXFJ7o6Sg1gz2vZVCTHO6l/w+RF4wB5m8XPfscjL32pSlosyiZmzsTI
	 B0Wp1UuvsPTx53NqZWSgZErLYp+ZJNsG15124QrunjrkDiF2SDw3Mm7hC3nkFRV+FbecA
	 33hJ95Kdzsc8Zyt7qynOSTPKnON6IWhgkzHwXYY+7RfUvM0CgOdX6HcQUWJB8HfSVpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
	b=xkuLx+rbf1yluIIQsrNcgZ9JMBj/sMgUykngLTEuBQkSAh185SJjVnvlEg0x9nkWADVx
	 RPVQcd1Eg5xofhshJMp2/duO2wpiyJ1/wjoUOCcTH/sTcywP+cWUFFsBIGUom7RHLNdO9
	 MozetRrcCz4Jqwg2taNC71ruYX42HXvphP6vwdFUXUEH6kON1DHJMihKj4UxKuDn9Kkxz
	 /r64h3zXyK1x2BqUi89q2UcczcH3EKo7dZXiH6AlZiHy3spR5a/R2meA6TXQUDez2U/4/
	 ePvMg00L1PGkjp/RKAUKFAI4xUwT5EwP+q4VdqBNHqya93Gzy44L7/sEpChhkCfHrLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L0sJSXE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKbGRPoD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B68606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B68606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L0sJSXE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKbGRPoD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TDaBlc3521348
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=; b=L0sJSXE934S1b5Q7
	4WWQgqoR2Vqai6mvLXVRqTP2hf7Y5fgh0epPFI7WRP4hb0OR/tXwD9NZi7lxXxpa
	MAyKrq9Lk8ja5g8meTTEzPcJh2iOXvrfxn7QzTJ1Zrv5R8XXxLCMtSbRLMqFmeA+
	TvE1nr0KRq4kS7HXH4q/U9p0/e0a3hiFODZv/uejPlF/2E6ifrAQ6XGGjXrWeBVN
	c9QUvJwW/9vIuw+iw/tmzHz4k805gZwvxkGk2tJ35aIp5uN+jtFbq4A+rtRuUg0x
	I1ABIkmTGB4kGoy9tgmZMSSRFYsbawz/lvWbVJCH/krpJn5FZl/mR9beosYnuDpp
	iMoCXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7620kf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9440b27c1feso349032585a.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288644; cv=none;
        d=google.com; s=arc-20260327;
        b=ZR6YQm2uertb+Giy91FRfqP9tgPMgagCskBrsqrEmK2pbZqIFz5mRZVnfqnB9PQ7ad
         HCdk8rqNVEWDUt7ESoeELnDb5F3IvwzMu2sxxpZd8PtJ4uHOBfa4peqcUakY/JyuPgeq
         v3AojEsQAZix+E2UiIYWzYp1P/n52jCx/mIyOkh97Gmls7/XCbl/JGXCkOXb1zttzGh8
         ne8bS4X77e5GCa1TdqMJNuXRU+VhOeu+otVDNETItkp8puqdVNHcPIhEOtcqouy+kSn9
         V+tAxgKTvQg2daHAx9OmRphqpqTRMJQPRSDz3s+zO4fdWzJ1h3ZWLxU3BtQJsV0hRSRv
         RzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        fh=+TW974fAi1qggHgekvfl+EMMIayN3qolElj34PxN7Vc=;
        b=NxI6q+WFW3vxpJAPkVDhzyTTDwAW4Kk7doe+uhPRkWBqDcAOJ7bsWvbkJKLyHVwDxC
         M/SQ7BajMEWayPsyPcGvlfvCn8+6MTcNO301lNZ/pTTRCKM5oGPAbk1VdKqir4Fl5vbL
         w1FiMprbn+8OM5hKyunlCPXG0FX4O13s8ieSUzp2iu+MzzkJXljKMirAZGz9t/M0r0d+
         mGK3lN6jgGV1jSU2nNYP1Wjg5ZfzGlOgygwCyh5YbQaD+iojCn/Wx25wVKsqaEbtLQEB
         WQv7uRhhoHCuCiZ+lPJKtVm6Gl/Es8NuLuvvbB0HzJq+d8Odmlr+de3Aznju+eBq1BM3
         Ur+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288644; x=1793893444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        b=CKbGRPoDHFs5KdTOKD9KY8k00fesNObZr8GlbxFSr2HWiKtJQwki38kesekBCNUPGR
         g6gCqTaKln0464b8Th3LyxRCd6iRT2an+EJrWedvRpL954aIXj3oYEIBAGodPHOr6i1H
         1XMkd4uYu+h56dxZKw1SWIAt9Yj/UizJ76NuZDw9MNjqKnyxHhjNNNsJ4ZBNViRiRwVD
         beoWsD93cOzApWsZgpljYJhBVwauR/EB9Ayrvmx9s2cdl+fEW9pmsDQYezB3mPuxiEBN
         z8d3yoaigtzyehR+j7a1DNwa8F9Pj6KHFMwwXI1M3a4I7sL20n4/DhAQWNwWB08eJgqb
         CyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288644; x=1793893444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        b=JsOewa1A4Edk+HBNqoGsAW/+kTp4TJu7CnTXeaBV5Xng8SjLyl4PH3eDP2KQYn6038
         I/calA1tTFCkL3oH0Ki8FMnpt0dn6G/p03PIAr1UifgUaGYmY8UWtpwQ48QfZ1dQYsOX
         q1DA6pyPOPfevr8yD6r4EcAys7/tZ5l7Lo9W+Y1zTdNvDbjhydWcN+/AipexBlce2B9f
         IkTSOFV2UnfhlAJ44AXw0aKyy2hCci0LcuJzPZ/ogdHFvInS4dd174reSpLuhKHUskXI
         ptCBdjRcupdoLCJptxcbDBjBEfu4YueSoNXODuJvlXmJ0g+95/eqveoAcRa7/57ksbiX
         KUDA==
X-Forwarded-Encrypted: i=1; AKwUvBzj9FzhtuNrgHGfYb+w5ORJEJzsjmdXmfKxPFbrQL3p8P/b3Xaq+f4Tih/gd0vaRvbcrIrtX1Mqu/yf9g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjkxOi8uoGKnosdLh39XCDw1UOE2BxvDhgbwH6Z8s3XGVsghmR
	L/8e7ik+1Qz4mo646BB8BhOn2USa2KnSypJ8zNP3/O0act7ewjOoxTEc+S4wtTXK09HMi+Il1oE
	gWXVgUCqrQ8iGaww2kDDvId1jwC2rSnLN5IySEhobL5njRpLFUgQtE9w01yNviqIQ8FJML3PIMY
	hyOdif0ovpafEmKjJXehHtjgELbB9Rr+bZuztLx3Rl
X-Gm-Gg: AYBFou1Pn4HLF4ymjCoQGvPFNGMI7csSs1kCH9olppjXDcjePL1ueH0r3Bu+ii1OWDT
	wPNRidyoIimNFcWi4PTzAmeb4gLKfwwgL+cNOGmxJnT4+YCEcZnTDGTHBg8jhif6aezPfUXkk8D
	vhMGuZEPTtQv07VbFVK5ypc0YfPEn+AUG0JFMRONT1PkL4c2hc24tj00uX+hZJZ/dUbqsA47TN7
	K6PUyvnExO0NCPMLf/afv6Augp5Ne/pn5Hxmr8kr/+26C25RpmDLYvMPVMO/Vm3Sif/id3KjSYf
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr902384885a.58.1793288643993;
        Thu, 29 Oct 2026 08:44:03 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id
 af79cd13be357-94408cf77dbmr902378885a.58.1793288643316; Thu, 29 Oct 2026
 08:44:03 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org> <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:43:50 +0100
X-Gm-Features: AclHuK9NubgRSXuctoCBUtKUfM90zobYJmwFx0BidUU7P_UDH-kzWoIpGwxYW38
Message-ID: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: eMTB-5jdev1qhAF3X7d4HE16OG-JaLnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX0yWRJUG7jG2E
 QUNY08uuiQHamVmXIDFS+2R6ByHaqTP2YZq+xbfMCpRoz4IuUIsDOFalpMiYys1f6NI91HNN8bH
 8XFsuX61vk+sTF41kyVnjNU6bhqwXxBOrZhG7Ai6iA8LMUHkSwXx0doIos8IogvjEm14wPTtB6G
 z0Q2zCKflYOPEBLQKpoB9tfrNooApoSSaVr9/79bSGktLqGx2vSUm3V1FjuDUQWN3Jj1ynxETPZ
 ZOIXmWIGGUxs+NFGy3JOf8HAMB45eaQaVAqOMhu1GdOMZknDvf+8khKq5/0QpiFKLPWZ3jtsV1S
 4JsUYl/Is0Im2OsMNUNsACZ/WCpfKCSBGhT5mXVghrvzECyIEAfDf75+IdQap6VTtYid9mS6fIe
 hL1aGiIGwTk4GoH2Kbi0e2ognXTrj7K+RpoAbjcIFMI/04zEdsllM1MUlfeX+048EcLflATHeGh
 ruXHd+eBCaBC1BUBXGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX55yVja0xkZ/r
 X/z6fNi9Lb4hWtyAGIieyLYY2pjH/3nwMRt8bnwH8BjhzwgQXwh5DlSS0XzX6niIUObmn0uKPGK
 mUhDB0qvzy5wAS9Fmaa3m10KxHl9D1I=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae369c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=1sShYwCD-S9XEYFb0O0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eMTB-5jdev1qhAF3X7d4HE16OG-JaLnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290061

On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote=
:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add in silicon enabling code to generate SOF and trigger the routine whic=
h
> produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27db..6a538d825f78b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -34,6 +34,7 @@
>  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(20=
)) << (rdi))
>
>  #define CSID_TOP_IRQ_STATUS            0x7C
> +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
>  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
>
>  #define CSID_TOP_IRQ_MASK              0x80
> @@ -58,6 +59,9 @@
>  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
>  #define                RUP_DONE_IRQ_STATUS             BIT(23)
>
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> +
>  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
>
> @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D INFO_INPUT_SOF_IRQ;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> +
> +       if (enable)
> +               val |=3D TOP_IRQ_RDI(rdi);
> +       else
> +               val &=3D ~TOP_IRQ_RDI(rdi);
> +
> +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);

Is this something that should also be tied to frame_sync_en?

Also, just thinking out loud, are there cases where we'd want to
toggle this dynamically at runtime based on any V4L2 configuration or
pipeline path? For example, should it be enabled for the pixel path
but disabled for RDI?

I'm asking because one of the appreciated strengths of CAMSS is its
relatively low-latency and lightweight capture path. As we add more
features, it may be worth preserving that characteristic where
possible. Not saying this particular feature has a meaningful latency
or compute cost, but more as a general design consideration.

Regards,
Loic

>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +                       if (val & INFO_INPUT_SOF_IRQ)
> +                               csid_sof_event(csid, i);
> +
>                         if (val & RUP_DONE_IRQ_STATUS)
>                                 /* clear the reg update bit */
>                                 csid_subdev_reg_update(csid, i, true);
>
> --
> 2.56.0
>
