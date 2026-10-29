Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268675;
	b=r7ZkX5SWr0KzvhuKDn9zYCsCUZeHp+XydgwWn7qA7xEWO7ba7hYAPgF97I+GvADDUQxC
	 sAw9jk993zMYoTGMamLEML8xUzgQS93sBib7yWQKbc4mdQr+9IzqS96PWKLZ8eAYx8MBM
	 Jgi5WkX6z/5rlyhn3j1nNlGKTvxRkAjmzzO6v4urKRu85G5Fp8FI70t6aqnhYtyoaSOoD
	 dteVfPj0tu5xOwUcxUjCswVYqogr8Cq6DWgGLTqxNNxqguyL13lj747fxJdYbpMQ3Zofr
	 wl8BuEOb0I0V1wDLmcBi/LMf9oBhJhkvtzuJGzBgZ7PdZwZ+8zD4pybuk55OQcUr30w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rfsypwn1yaFQQNUM4PUmNxrXwfW4P3G155hubvNmzlc=;
	b=C42unXtCCca/Bz1lLL+MuaYqHvBQWDjI5kzGJb5nRTNFl0oIqg2qTmbqHD4ADd8VoTfL
	 qYSrVEORbPDYgFZz5B4YgMirkIQTpw+Ia6wZcMF1gnUdFcuUI7/BlRhTUVJ+vf7GFRn8Y
	 84yBC2dfULuBRFr1uPPo8UoBAYUAyEpZWNtMzro8VpRWxky9qRdbNSUYAiz4uS3UWHaQO
	 WFzTaO2IEEQ/WUmLNL8giqwtX5Oqe2xUWkwLTX9GDqZlEDoVddoRT8FtlAB0T/bbgUsbi
	 A5mddF5SvySEvuwyjUo513SCkbx/I8u9x1UyKrkMlKsywyqpUeF/Db6eOOjwNQiyNDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fudzGipZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O5W6rwBc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1289606A31E
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1289606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fudzGipZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O5W6rwBc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vGY13775365
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rfsypwn1yaFQQNUM4PUmNxrXwfW4P3G155hubvNmzlc=; b=fudzGipZEvyd+XgO
	QWGV5n4ZCXgsn03WU0DMc7jKGGj2ifB4aRZM3zdUY+lDwNLQUj/Cc4V9YYTvKlWg
	Eag3a9k7rX0/bw2bU32hPpcJzXjIQSV/kcP8hv0vGh+n11EsMnW3K79my90cRso6
	ImmJyEbKBwwCXjeDKY0n9dHcjjGt6DBHJJUPzyAR9zkzlSz5FtqdOjN3/X0Sdu3t
	IM/5hRlY8GbmgFOM7huMiICyBfParCTRGA2mJv7dB8Z1JI/FmvjlsEWBg+HK0Ji+
	N7MX/krL2ffmPEmZUzcdvxB7oNTG9xdX7lCfi3pi8Tze6AOb40fumhAJekTuLMCk
	mjXCtg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshs8s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:11:13 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so2449238b6e.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268673; cv=none;
        d=google.com; s=arc-20260327;
        b=I8FFFDgJjCgNoi5kEEo5ZutmgPwrUembC/t+HRQxWlP26nb2Pc7sjWV10r0W85uFrv
         1W1diNHTDSQgnWkky2gcQkLPeodXvpu80BqRq8kRk2pCRhcIwWUKRWt3PiwCunqiT7ZC
         NqRLl0k+Qu5ZfX/6czVpBIqrOdoNO7rxmlCmp1g6EV3QpxVICEQPykftlRRvc/NP0wXQ
         VcmVLywLxElYeY7sxyEaKDerSZiKc/HFrkgeZ78z4+MbGZwmb/c1AtWwc9SSvAWCLf1m
         GFfw9Z6i8l0w84/5zYvC2mp6HEQrHaIe/iHsIFwMhY2WDHkxG5HmEV8sdJu3saG5EEwc
         JDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rfsypwn1yaFQQNUM4PUmNxrXwfW4P3G155hubvNmzlc=;
        fh=tvPtE+Td5Hck7AEtRDPptq8o8a1n/xno1XGVyIYUrHA=;
        b=fp/SOvP3lnyusGTM70WIr/bxOjZ0TsXdF0MJCrf+M3f39Kf7uTw4L19l8RXyzaSMDe
         BL0dFBGWX0rFSvJ9uNHILSMmAIsSHDqGWvINLL1MmoM4hRB+/Tr0J0bjvRReB249fm9W
         hVXtXWHrBxeRoGYSddDXVBbWI9+TWu11PPlBVmPgSp5/3pFXac4ipGdg4CR8iE2cN3Um
         v5W/igrzQ1aoDMLjFzUY9qTvhNxGuxb4WJGczObE91/ATu/p+uVzBoXVnhiEnwwET0t1
         E5qYN2aze2f9ldApGQfCvtBPp9D3pCqZDUi7/nDpmXASxnSKOqHnJUcJeuOEXviylHAv
         BV1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793268673; x=1793873473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rfsypwn1yaFQQNUM4PUmNxrXwfW4P3G155hubvNmzlc=;
        b=O5W6rwBcAUQV70q0m25uH52slKrbyjwqTIdpq9QK2a1WnvNGFpzUykjlo0bbcXZkZh
         yrfZ6RVSH9XyCA8KEx9lV4JDhgv4y/Mnsz4o+htWMPnWyHUO0cxEkVbV0/WdpQoIqh71
         gM1tkd0nGAxHsnGVGZmyPjB2kKosJOvECo06+P/seK40oeroU4iqMS1ThsemcgyFit/7
         SEJBB4Li0vagUA43T1cK5oEM/QVIVpi/HaL+7ofjOJzpGFSCS8nyWhEmFEJPuScpckAK
         y4mMdoqvZCPPoXkO1BeOxNLq8KnimNiXGZ9o0jbgBpWGBN8bfEq2X2m8sDzAQuCjT7w0
         uFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268673; x=1793873473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rfsypwn1yaFQQNUM4PUmNxrXwfW4P3G155hubvNmzlc=;
        b=zGBce/0n0wy1wi0IYRJttNc6jl62eFGMyDWTb6rFtg0KiBhXRk9JupPdKZ86n8l1Rt
         jPOCXbOBaRa7LqmJaLKhfWAxbO4+Q4cXrBfs86Xsw8pNg9a1w9VmCjYcqS5VxPf8/U5F
         SuwWeEJRHkkyYZ6wnrMR3PrKLT05EywjhMJaWgoS5Wno/r0Wx+KolUUg+Y+RjnA03cIy
         EADLuESY3c2lCUfyX0Xd6PrYHlB37hrRtZ2jvodf7xFK5hoPCgK9WOeZz3zACD3kLoI6
         qnuVfhrRY/qLemOtUN+K1cccReuymU1DhI8E6uEjQTKaXGC6zgNL/rve9r3MZAGeldQe
         Uz6w==
X-Forwarded-Encrypted: i=1; AKwUvBxmgR46vS3d3M6LpmGFxsCr2JzL48WbWmekkw7lCOSxbYnz11BOJdoEnunbTzU1pn/1Rl28kOa8KvWuxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLc8qxbtomRkJTHIqd4AfgFhXeaIRdolQlwg7rCzqYlqq691fx/
	eHxFjTWXkkHWzipTbqxg/otBLzlUIUCMy2ywQYxxwkDnFX6RhPcxgEXNt+ew/5IW0YAxnb8R0Bt
	uYMyPEoGF6VNfgRozy+NcbXV/bOIL6D4HMxTS7KG1ZPVOBDkstmP+9dvU2TibrJzqAW7Eftk8RW
	flCZiAPkeGiI4HAL/xSTU2Gp+ZRlJNKRS7BhoNTmF/
X-Gm-Gg: AYBFou21nnOOwY18BJ24fIbzHt6Y5FO55D3gn1eoTBzjwPEGBT/WQDkdfn/Xnybchyb
	Ovk6Q2vZpkXs3Q9XXIae7MFE+uwaGcEB05l782q9G0nXt8sJWwzGJ5HnJf9rA9ZXDmCkRvCSGwf
	kLrbV5z7mG/R7/wv+qlrgpx0BK9c8Z4QZKX/b2TNATQuC3wVibKJreTUobLPIk1F6f3kDyMgAd3
	+uKX4x8Jtm1Q6lgprmGySHrmqC+xxx40sWI26aICcdExPu2WqHWVyyaF6QZI4g6T+83gmKhkld5
X-Received: by 2002:a05:6808:2210:b0:4bc:336d:7494 with SMTP id 5614622812f47-56382b85c85mr3149381b6e.30.1793268672893;
        Thu, 29 Oct 2026 03:11:12 -0700 (PDT)
X-Received: by 2002:a05:6808:2210:b0:4bc:336d:7494 with SMTP id
 5614622812f47-56382b85c85mr3149355b6e.30.1793268672379; Thu, 29 Oct 2026
 03:11:12 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org> <20261029-v4l2-frame-sync-v1-1-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-1-d37992559c58@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:10:59 +0100
X-Gm-Features: AclHuK9x9my2OlOHIgychMs8UmvS7ZOc7etOB2PEl3rVyZPOEQF2pLuDR1Sgguw
Message-ID: <CAFEp6-0H=9=KM8eiJ690GEgpCqPKe3034gGLJbz4RrVxHP28bg@mail.gmail.com>
Subject: Re: [PATCH 01/14] media: qcom: camss: Introduce CPU latency QoS
 during streaming
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: LII5_KekCDMBU2aG7Mga7wamf6v1VF6B
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae31bc1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=Lkb8NMqpfrSbSyvDPywA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzOSBTYWx0ZWRfX/XsQNgttWTfp
 h6+3Y+Mx4E/pX0/K9SNS6I7GYD7lCaNEQe3rPmShZIRhldGTw9LO4a8NyZ0tX4iik8DYXDaA19i
 GD2q8Sn1VM7RkBaTTo4T9xiBWRCYv30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzOSBTYWx0ZWRfXwH4b4tKaULj8
 XzT9mfm1EwukSKtzqcziZO3KSogP/QXTFe3tHkpf/2SzjXPoRoGOvFUL7pz+ebJUSYIyBDh62UM
 IXSXK3Kc6Q4wTi/Sa+qoeNw/C0l/kygBlwdEjOjxiJSCCooGdrV8y1ts9xz6vAI8tvF88Jd+wtN
 zVixxng1dADk7s/w+aIP7QaA+wRQiJxShxXPhM75mcRlM1owbdxlyiQP8w0hoi+3V5rCa9rnn+G
 zirN0RGEUk6pevd2P5rqoMLwZuHvhyUweR5q5KWuzvB/JCjiuKnUKDMZaa01hIO+Xw4P8pwBidg
 T95Cdqf9vFdDbAs9Ap52NWmAvuS3cB0hdeajLKyILcMXZ4zdn/vHGaI5QNFgMBO5c9uYGEjDlM0
 6yr9vj6rwcjIKwrfDrKwG0G5SmDR7kBmveaHCj57BdQWFpoCWIPn+FCwo1IcdgVvML/se4QrLST
 iWeGgrTEYRQrIajEYrg==
X-Proofpoint-ORIG-GUID: LII5_KekCDMBU2aG7Mga7wamf6v1VF6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290039

Hi Bryan,

On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote=
:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> On a quiescent system - for example the X1 CRD booted to a simple ramdisk
> rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
> interrupt for buffer done could be delayed until after the SOF for the ne=
xt
> frame.
>
> Fiddling about with the interrupt bits, clearing them and changing the
> logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besid=
es
> "felt wrong".
>
> Tracing it looks like this:
> <idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=3D1 done=3D0
>
> Tracing with /dev/cpu_dma_latency =3D 0 looks like this:
> <idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=3D1 done=3D0
>
> The second is the pattern you expect CSI SOF followed by data.
>
> We will require SOF to track and understand which data-frame is correlate=
d
> to which camera stastics and parameters frame. On an ordinary system with
> several things pinging off at once, WiFi, display, keyboard you will be
> unlikely to hit deep idle and hence unlikely to see the long exit. Howeve=
r
> we should design for the case where the system is otherwise quiescent wit=
h
> only the camera streaming.
>
> Choosing a request of 300us - 1000us seemed to work fine but cutting the
> margin finer, similar to the value on IPU6.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c |  4 ++++
>  drivers/media/platform/qcom/camss/camss.c       | 27 +++++++++++++++++++=
++++++
>  drivers/media/platform/qcom/camss/camss.h       |  7 +++++++
>  3 files changed, 38 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13154..191cb71d02e19 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -286,6 +286,8 @@ static int video_start_streaming(struct vb2_queue *q,=
 unsigned int count)
>                         goto error;
>         }
>
> +       camss_cpu_latency_get(video->camss);
> +
>         return 0;
>
>  error:
> @@ -306,6 +308,8 @@ static void video_stop_streaming(struct vb2_queue *q)
>         struct v4l2_subdev *subdev;
>         int ret;
>
> +       camss_cpu_latency_put(video->camss);
> +
>         entity =3D &vdev->entity;
>         while (1) {
>                 pad =3D &entity->pads[0];
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..06e1bf82f4836 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5064,6 +5064,29 @@ void camss_buf_done(struct camss *camss, int hw_id=
, int port_id)
>         }
>  }
>
> +#define CAMSS_CPU_LATENCY_US   300
> +
> +void camss_cpu_latency_get(struct camss *camss)
> +{
> +       mutex_lock(&camss->cpu_latency_lock);
> +
> +       if (camss->cpu_latency_users++ =3D=3D 0)
> +               cpu_latency_qos_add_request(&camss->cpu_latency,
> +                                           CAMSS_CPU_LATENCY_US);
> +
> +       mutex_unlock(&camss->cpu_latency_lock);

I agree that we need such a latency request mechanism, but the current
approach requires additional logic and locking.

What about one of the following alternatives instead?
- Move the latency request handling to the suspend/resume paths. The
request lifecycle would then be naturally serialized and balanced, and
in practice there are very few cases where the device is resumed but
not actively streaming.
- Alternatively, add a dedicated latency request instance to each VFE
and let each VFE manage its own request during start/stop. That would
keep the ownership local to the VFE and avoid the need for extra
locking altogether.

Regards,
Loic

> +}
> +
> +void camss_cpu_latency_put(struct camss *camss)
> +{
> +       mutex_lock(&camss->cpu_latency_lock);
> +
> +       if (--camss->cpu_latency_users =3D=3D 0)
> +               cpu_latency_qos_remove_request(&camss->cpu_latency);
> +
> +       mutex_unlock(&camss->cpu_latency_lock);
> +}
> +
>  /*
>   * camss_register_entities - Register subdev nodes and create links
>   * @camss: CAMSS device
> @@ -5429,6 +5452,10 @@ static int camss_probe(struct platform_device *pde=
v)
>         camss->dev =3D dev;
>         platform_set_drvdata(pdev, camss);
>
> +       ret =3D devm_mutex_init(dev, &camss->cpu_latency_lock);
> +       if (ret)
> +               return ret;
> +
>         camss->csiphy =3D devm_kcalloc(dev, camss->res->csiphy_num,
>                                      sizeof(*camss->csiphy), GFP_KERNEL);
>         if (!camss->csiphy)
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0d..9341fdc9bca0e 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -11,6 +11,8 @@
>  #define QC_MSM_CAMSS_H
>
>  #include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_qos.h>
>  #include <linux/types.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-device.h>
> @@ -141,6 +143,9 @@ struct camss {
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
>         bool legacy_phy;
> +       struct mutex cpu_latency_lock;  /* Guards cpu_latency_users */
> +       unsigned int cpu_latency_users;
> +       struct pm_qos_request cpu_latency;
>  };
>
>  struct camss_camera_interface {
> @@ -182,5 +187,7 @@ void camss_delete(struct camss *camss);
>  void camss_buf_done(struct camss *camss, int hw_id, int port_id);
>  void camss_reg_update(struct camss *camss, int hw_id,
>                       int port_id, bool is_clear);
> +void camss_cpu_latency_get(struct camss *camss);
> +void camss_cpu_latency_put(struct camss *camss);
>
>  #endif /* QC_MSM_CAMSS_H */
>
> --
> 2.56.0
>
