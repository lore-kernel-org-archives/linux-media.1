Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632308;
	b=Yme5C5uIZ+wVS9eN+p/31HT8GMGANAnWIs2P+GdYfWpB103OlTyhOPGLEsvXcekcuW+I
	 5bR+oBYQLv6h0jwFNpZ2RvuEHR0DAzuMV0gJw/99D+cw1BEcAhk0FxzJLROxdC3s2cNUe
	 75oZ2HHNjlFYDl7TYW0/CM5L+BhDDxLYl92RIHwaFq/nXHVLoeWXReowKKP/B6dwNEcRP
	 OYIu61JF1+BD39Ha6Pghb28gQvlVdmKJnL+VVitOyLUSHw15u4dbpQboUT3R3zDSqtiT4
	 qkDOdFJCV2cByp4iVZ72Gpk9t31H8uRAyne9INg57a3ZV8q4fK3ww28f4IiWmaV9MLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
	b=wrQjkma5ZsIqQFP76WO5mlNah4qxl2QpahXkrVA1zVh2dtTBeAmp0lIlFEIIJGgEI1R3
	 p5nyEBsOUwuUZXYHeZblfnmDc1WRlA9Jt42fbqcYFkIxCJCP+FE2BlfTl8TRub/cUPnBo
	 ZLIeLG2rlEVe1lHFyebGAGL+9iOVCpHb2v7XfAo9+3IfjcI6KgF1B5OH4KL61HfkUYwzt
	 OPzmioDJKGrRK/p80aLc6xbO5WG3qmczbZy/PthespUJG7aJn7LRl1j6YHxtZ230Hqlzt
	 5zKeIaRUTOVO+4/+vZ7InqGv5le3R+pz7RwmeFq8FzdpPWwEGVYNuJ3RN0JcFIorrfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dwFuqd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5tz2SZb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003E60771C4
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4003E60771C4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dwFuqd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5tz2SZb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpBO33512197
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=; b=M6dwFuqd9d494bUi
	H9y0+N1KdAZwQ74tCIuEUwEMahov437QC9EqU7wTKU/QwdiQ+3Z7TkApbElZEHlG
	PqXN9H81hwsVeqW16djt8c0JxrUJu1RKW9ndMpwhPp+5yB1Ccr8kz9rlKRXG/tS3
	8N5Sc+10GuUx9D9AFBjJdlMqWwzQfCrSpYZn0iYKFUEIiBSV5NLKyCK0hxgGqjpz
	3axscshDeKjYnjTSZdPMUBbhBJqUn8i0k7t06HsdwJjYmFyXoPl43YXPAGeahRVN
	MzeE7I0PV9NVhgJWlOQN2waHEbvDJ7CqB4VcE3KDdoLGfJ/Ol3zFHC91cbg8H3ok
	3MfBFw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrhevx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:11:47 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8255327a28fso3807667a34.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632306; cv=none;
        d=google.com; s=arc-20260327;
        b=VnazFSs0UXIF3NmMl+HASEn/25xl++ccjWdxs+dBUUsXl0tor8yZxK1LWMdrdHFosi
         mbg64Jwkw+xDlJcyRrevAItLHOMV2XloyjsVvb2h0pwe7Atg+uqO99z4BEUDHUFxGoQ5
         mjtz1NmojcqmvQP9QHyD3tYDJupGoEjGMX7DvIXdC6T5UE6qr5iJziLcIvQd+FBV6/11
         RVK+E/CZc4QBhbJQhzwO+WMzovPMaqO462YW9yfi0UNbeFVmeWF7H9k82WGwGnWcG0in
         B8LK8/0izHaEl2XvZpJV7mHhNsNqaK9G6nVFluyh/6tZCJ+vzSEV6T5vyBgqBLYEuS33
         jk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        fh=oLaujoRkg8vkSt8kllN7+QfT/ttj3YIZJZnw47cbw5k=;
        b=hjaz3pIx5qr9brgcAA0WKvrXdshgWJEnbNwv7ui3peJ6zt+IEaHnAnV/Sq6XGSTida
         gX5PP3ZKNJk9rgj9wUgnFoYnD73+0L7cyZIwwRa5FRqlMM6g+JLhhv9TNQD8c5a/2aoc
         zAejkS6paQct+qV/s3pqIYLSdOyf6tIn9YECiyMHSDtI4kYnAtHU/6w9JErVamVOi84j
         u5x0WGQBlMvpg/sPypwW+vUAVGzEAZf17aZp4SK4yWv2bWCl+NX2BOiKx+ZC8WgCb54b
         KZXEPFeYOQewNhqYo9Y9wJiDHY+KBYJzyZCqhEkvOhpP6/12oNlG+R9AqGosdIYPBTSY
         sB4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632306; x=1794237106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        b=f5tz2SZbfZsf5aOnK+6T+MqtX0I589kIhL7nsLxs+QXxVf2bDnjcRCvbEw4KE16D7K
         A+27/6+3BmbnHflQAGyWxTuCqGRGBZl44MRge6rq/iWBF6jPHjN+BPAbGFw1qRbSeHYm
         1/39qwpAPAZp7XDfCMbRG+B9Yzp1IDS8jyJHSXhGLfTyAG+pDE1Tqv3WieceewluPwAq
         ODX54nE2vigoTtrwG5V6EYIj2Q92y2yp2rgmh7agR6GKZrlFHvEI0aQ47XcfoOmc010a
         4jgmlr1LB/nVQ3rEhR9snWtak7dk5xdN5Nu9HkQzvp718Pc5lJaGOTGg1/s+Cq0uBmoq
         Hblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632306; x=1794237106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        b=o7yiVFTgFKYH+Dr+UwJcX6/AUU5L1M4VR5SoeV1Fggamo5s0j2azv+QBsa0Z1qBJPn
         GP6XELGXzXKJ/bAat8keAOe5uaQYNsohAku+OQIZn60e0p/gchAwMLk/0mw3JEfO23Ks
         NeHpt0AON9UGBeqXIFlXU6GqxSw2ze8/ph6BO4P8NpGV5kzVnicr1AEnmuWETKoSfY58
         PRhp3x2xq4GeGh40ouXa0S42vy55awSR8H2OHO50E9NoFQZj3QFhuwSb6F3mEApO4gNk
         36sqHLAldMkF3JZEmTDICctQvWAzgyZF+7b9VuYlKa1jQGb81RfMrRWmHHuCpqyN/NIq
         Ka2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1JDVf+9vn6Fkyn1UwQRR1pPtpJ9f5WhQvQ7MjgcHvn6iO7+wrqjdzzgAzbdiMf8reMbh2n6wSM+2gcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbjP+2xTYJ9xbgTlstbeurTxmRXhAH6NlBkuFLMiGMGWKorf/N
	I44jWkd6ousn9DsZKSunRxbCSp9QstxWKq7iYi0WfLVmK4RFLxj0M10+A0JeNR0eo7sIOgt64E5
	5VekJOb+uTWc6LHgkgo1WquiT7BCRqvARqgJtySrUkcBNHB5xkraJ2k+zCXmCSCXu5x/UnGuK4A
	AtVsyuDB4zlXQrmv8Bl9wkyeLKm2kUcH2QtOsqHxx2
X-Gm-Gg: AYBFou1ZRD00Sa6VHxdwQw2qPFVCqxKoTSkFDJCYoh9aTZqxjVUkPrdkW+LdnlkoyPS
	611X8+xBondV9vyzyEmOz/WIPf592pg2Prsk5N1zEGYByqycsnbAO+CJTbh7cMV3PFzlnHGD0aO
	dTrLwgkauqV1rXgOoiEJmXOZOfHBKyko1+0AOy6HWMyEKsPwDogDRq8nyXkP95wyx3+fmNSxyVS
	IQhHvA5ruBJGDjRjGm1VOVrM9c4bUy4IyxKsBqzTOtVJYxUqDbEJVjkbyOS+CDbSi78C1u/OpA=
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr6752288b6e.14.1793632306556;
        Mon, 02 Nov 2026 07:11:46 -0800 (PST)
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id
 5614622812f47-5640deea502mr6752253b6e.14.1793632306115; Mon, 02 Nov 2026
 07:11:46 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:11:33 +0100
X-Gm-Features: AclHuK9h2JSkbUMAvyoRdkyclLVmAHb1v_zmAVf8DqDK0h8jHaRxmYbby2gpM9c
Message-ID: <CAFEp6-1ojA_ceOvaJtvc6Ze5DKPJtbX0mYxMcEj6W9JNb33gXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] media: qcom: camss: csid-680: Enable RDI SOF tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8a833 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Lk1wFp84Q21arWboEzQA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kWijrL-69gaYAtKBG8lWnsQA8ZaRPIK8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX9Ca8IIg6oMeG
 39aXoBjfhikJVRXnlmGCSu6it1+n+Jb/M51S0wpZp0XmSiVEiB2kI2C/If7LzfHUhbiZkD9nLKr
 vRiY4CVigaUoAs3Rzd/YsP50uWciG7o=
X-Proofpoint-ORIG-GUID: kWijrL-69gaYAtKBG8lWnsQA8ZaRPIK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX4e4xVUf3eQND
 DPpVe9T7Hg2gN7aAqX/JPT6nO183qWDVqWPlQjHiPO3MBNe4yuZY+rPfPOOcBKw3gU9ZBTLgFLf
 OwY+rRtRGUVIw89W4mxLJuZLomQsFXadrX9NlsMGMXmajOgthq8yqmGHo9SIyazMWQXXIFs17VS
 P3VEblSPCu547fCnHT9V0sAxkAmTLQ3nuEZSGmNo8tvNQK6NC0SRyRZhGPKDAMWuOURPvRha5If
 tpM8qqZWVKgIsqw6CPx7f3kTJXaAvw64vcmJY0oY+Kt9NBRjsO9S6XQCpRTDRgXYSC5a0fmd+kA
 MpV2EFrwy2SW1Eh1COWGfolIS9X5hpyLaDF5mKoj6TodMsL0/TkG6gGEOSirbA9zC5wyDNXRmvA
 zvyy6Y3jIGN0DM9RsBzfaUbVnJMSomG/LAANIoS5DLCIfWaQ0me3T5j43bi2FQVOxekjtufsbWQ
 D8L3bsB7213UeWmEvag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SY=
NC
> for x1e/x2e which uses csid-680.
>
> Do so now.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++=
++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb947..452640e72f6d5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val;
> +
> +       val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       if (enable)
> +               val |=3D CSID_CSI2_RDIN_INFO_INPUT_SOF;
> +       else
> +               val &=3D ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         int i;
> @@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
> @@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                 if (val)
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +               if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
> +                       csid_sof_event(csid, i);
> +
>                 if (val & CSID_CSI2_RDIN_RUP_DONE)
>                         csid_rup_complete(csid, i);
>
>
> --
> 2.56.0
>
