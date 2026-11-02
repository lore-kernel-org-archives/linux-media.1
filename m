Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632254;
	b=G8XkeCtFUZhmh1Up6fqhsCxip0iqsBOVB9SUuEVfoo21xljRnxx5F+A/a2psKt9OaBtq
	 RSYXP7ogc2274e8Go3RZHa+Efu+ankJQGcjMQTMFzEn1KoIzPQhdIMylfZanLovhsqzIk
	 9GFQPM5cPinZ6swyy8pHwYgDk5esVtYG1jedLN0w6vuKdADX6W/ce6g01CSHgExaP6ykx
	 pMmRVpjjPvLrEu7SfCOs93WufZEJbuqb4zE7Gn8l0IChu4mVK2cjpCH1TaFpEplAQGFor
	 7fIowa1hxEUQvCBznNoz5wzTk1fbiVf9tMBL4waISvq9WwT2wVkNOafaWR5U1A42eFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
	b=4UhGT6A9TqvbeqXob3GNRmcCE6Lc04JXJShFzED3oWol2GnnWzMS3gQpjowFRfksmL38
	 EAX6vDVFmH1YiUtofsBwvsdEaAlxD67JqaPJdr5x/Zr2XrYML8QiXFDhjhH32iB64LoCc
	 BuU2wGYCytnfS732x9MYb3GPhYDIBH6Q6M6oHLEypWjGl7vRWItRokQqhCP3ghgSbxY0h
	 IstD1DObUtVzlyWoTciMTtl1/p3kM8ivMpbQg0DVZP+5UWvwZXQvvWO0YU/Ud4hzp03qo
	 xwa8Naz/mslIncshtAlDe+3c1MK+VOqsAajNt47OI24wWztl70mbJglmibFD1HZueLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Acb6Ao/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TTkdNv5g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927A6076719
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4927A6076719
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Acb6Ao/k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TTkdNv5g
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIKk3102577
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=; b=Acb6Ao/kD2+0R91x
	Z3b1mdHeDf24o/EhLrUbf5mmmJwueXoNJ0L79M9qz7jX8KUOEdAujv1tsM+b9bK1
	nQRyaJKOk3xCStxMevN9tQtZuGA/xjd+dGp93qNNKiciTFjOLYOGrnWEst2CpaCz
	qEpZJPaDXXqRgeQcjtflMGocW6BWY4OYuq5kehIn/SQWprUGlTmJacCFZvrePFev
	CVqBM07n7QOxBuGrklMUwqNTT7fEu0vPfRqt+wJHsxd4gR7KlOCx9k2HGLi8vggB
	IQfJJZrZNs5Wh6usomoXmnx0XOQZDhsMhOc8T2EQgpn+2hWaLtlIcYYUfQaZM3vU
	tFuePA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rje3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:10:53 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84c4dce8182so4231426a34.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632253; cv=none;
        d=google.com; s=arc-20260327;
        b=AU2zMBhT1S2qlhMo3K0zK3slZLR3u2lROFFgJ5Rn1LAwcjLQgHEdjY2T1zoQrfa+oJ
         V6fa7xwUiMwodcq10mmdSGUqprpp7HGmqYNgchzx1bnPzRNy15+c4qeYc6wZRyV0PS1E
         brr9QTFEZxPuxZELHcUqJ3haaQDtz0OWdt0fq5K728OTOq30NtdoxoM4x6C+zAk/J29j
         XFcwOknP2VPaow3rIjad66E848uw1+0nuldFgsolikpXsbvJ4hNhjlX4xuYTVZM0D7S2
         XiXtghR+skr4qo4G6QnDRFHzBImqihTR/9UpsRu++9UNA+OARzF7VeQ0syBrgJ//Dh+2
         Pq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        fh=Z2yVyFAHr4Ld2dg9uG/uACSCZnP+/TBPJQIYZdVxWy0=;
        b=cYXaMLDd1+GKpC7ERUJ4ngm2gxy/aHAfKXOSJm5ZBS+cfI4rdRv6auBL2Af3r7wPHs
         /KcVLY32fk0CdRTQXq5ioarJsmswHONzbBLvqyvsotUU7O68EyR+LG3rYuhuXixXqRi7
         WTLuMyNHvPICAQLrwOkm4NXxSvL7wnNVx+QBtxIeD0BQUEFcdr8hwSWJCHtYh/0fElQX
         eLX58Aie9560XqPuFWpDNup0y9RTQvRwIbJQJCWygrGIxGsZidbkDYBn/SYc0TwBgsBJ
         oEO7Bha861qvuZ1Os44jXO3a0ypL8A+g5TMcROKk/0PfJiebrRLYprKVDrxGjCMEw9q4
         tBmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632253; x=1794237053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        b=TTkdNv5gRS6pA9GbsJRxl5LIcnBr8iIkhuV3FgkB3RPXYC72MRb0nLP3MwTIqbijIx
         HuCLJ+fbZPUayMjqtEJY6CeeKaMO3XoEI1Ip71zd25TmU6PVJM/vriDzbTOLP/K/7xlt
         W2CP71JDTqhr+yjkr4JoTyuzOI9BVyH0CpQvOmkpodiOKtbkwF+Gcy4aYpLzZA6rsbuD
         JHfER9k0jTH0rivr0hUU2KtldIHzATggR24xgBal1h+/gHedRzaSgARi8tlqsObTgoBo
         SNFP7IoMubK2v/SOpNSyyKNM6TVt/yqHuRzE/F5oWrArFDL+lYjQhrd20MrYhR9z2xcV
         bkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632253; x=1794237053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        b=ivk6R3Q4C6TN1MB66opg/AICbva5wlEkHHTlnaadR5vcB2/fpEGU8mp5f0wkEC8xAc
         enmZwdBjjvKM1xyc2r92DttA5qsGkW8Pwcx4NqG8AeAFZsgYwm5gYqnFjyqNR1DKdZGB
         rYJ+Kihqf8uA+uiTmq/qi4yT8Iv5oKgB6sTxbAUsV1ShdBCo4WrcjJiH9RaDA4WtwEdg
         sQQ8kfTQyFVWq8aHKJ9o2mqtlJ2m64HiIeYZKxU3GUYA8nkaMDwr9aNwqgmsK9XBVRDe
         soFjynPoyliITr0eXaZTTDXahOylVf+1yEXsU8ioRye6zYshw10k8ckoEpqQlIy1lN4d
         0VaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQMmeJyJYOXZfwW+BGXCnDaX5yaWSzj5gbyqQrjPwfM3Ow3uenCMxZlI6ZE3A0MOrMycvpsc2WQ9oEbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK51YvfhCAXpSNEjUQ+bX+UEAXw6ymGNnQlUyhQNAXg20ZwCNcT
	tzsrfMqyBY5dFLQmKc3G9DIHMTZm9g72HAkrobmEgo1/bDTytDmOXd9I8SVPBRgD/JOD+KKV9JX
	GAsPsJoTc6LOwDijPuLDog8A7/DwM25BFh8sL2A5YGbSu6RbyMi3bkIzOvzwvw+nMaqL2uu7hGI
	Ci5go8K0yvZ/EskHAjVqlfmHgYbHDkSIgRJylW3lpQ
X-Gm-Gg: AYBFou1PcrQ9yCq7Otwa9a7Go5qwRcq/DUNl+erbhGqzU53wAvflGzmr6iR+u9qlJ07
	H8+DCDVgpczWsRibDF6mzuAipolFNCOkkw4AXlh4JSAD8mXQvbKtvWBrZwHV43YwPrhGA4p82Q5
	6FTyi6xstqxEx6J/7qUs4HGA93746qkJEQMqjxx8XIvc1o0uhONTJsZP3ev0pxqwTmxrboqoNN/
	7CgZLXoNwgdIwVeFQO+Gs2+t2QOQmecETwoytKFnAhdzqwhjr3pT8P5w4BaQ7xCw4I6jzquXdc=
X-Received: by 2002:a05:6808:120b:b0:4e6:6079:c33d with SMTP id 5614622812f47-5640dcf25f8mr6442089b6e.10.1793632252597;
        Mon, 02 Nov 2026 07:10:52 -0800 (PST)
X-Received: by 2002:a05:6808:120b:b0:4e6:6079:c33d with SMTP id
 5614622812f47-5640dcf25f8mr6442070b6e.10.1793632252159; Mon, 02 Nov 2026
 07:10:52 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:10:40 +0100
X-Gm-Features: AclHuK-JQEWhxTCECGBwpwc7HhTmuHtz6VOr3jPQI82NvgKXWXXsfW9ieCjol3E
Message-ID: <CAFEp6-3FGuYO8TUtEeA_K12+CrVRPZ103KJz4AfFgCRFd65k_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2kVR0vCUm2VqD-9o9rRFLMk--LCYgbPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXwCgM49M1vVOY
 czyx7DvZPHmbimRU/U/mxiMlN+8WdbjGhodThSqB3PlSV/TCvX8ilwqrVtQCbPjEIiUkSLPTZD2
 9dmYErOY5MamCoWu5lHbOeZRbdhlWz8QnQDcQj8KFMKZbe0JmBu0jIYwomWJMhfS9t5/bPrvGHk
 EvaBqejY0+TKYG0KSHKkT5K8CFz3yYkvvRgePr2M7tWcShmEhFbVd0ZBYYns0NCWSzfYrbCyZmj
 QQfJhaSNiGqps/Mh1xIm5/FsMYTE6/Qlrs9HlEgnbuNpv1O1P/7QPDrn/7i1k1FXN2F1nP+ZiE9
 GjNHVjfI8DvqXh1kW4DHIXA2iZNEQ8QbuHl67DBw7KmQ+58rChYrlLDSCAoNoKPBAs++hqkqQ4r
 xSDx75Xc0RpgGCnHQBvOVo6PHO9mosKz3+9TKrrkSOzC6OLdpAF9BIwS0Ccn6CC+5HyOKJQPO+A
 jRdf5diWkEB4+fueMzw==
X-Proofpoint-GUID: 2kVR0vCUm2VqD-9o9rRFLMk--LCYgbPt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX0tqTOO42HfEy
 OCFeISBKelXlAMdeJ9k9njE0QVGO2Rm/k2Pw68diThTU80k3fQp1KqiP7562i5tiBHdSfGq53hz
 3qu8Afvn6x14Nk3yR5B6P4OvxbcNSYA=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a7fd cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Pns92UxjTm5tqybKbc4A:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add in silicon enabling code to generate SOF and trigger the routine whic=
h
> produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

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
