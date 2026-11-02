Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793610455;
	b=bQQqWGX11oFez65HVI9WA+MvJ+4BETNem71mc5l+SsKraDrAA//Cf13b8f70pjfCU/LO
	 MCXQ2r0fv/DuqH1CKryEsJTzWenhmUc78g7vV80eK5rPvmFuNKpCV84cC88yXSD0Y3yTQ
	 71jJqqk8TZZhddvEwD87cR39erWSyr70BTTj46wPTZCVwcN6PDu0rrLbbkY/JFsR46e8J
	 eLgr8BPbcfwXac3+hDLVLyooqZWzb1q7/1x/WUWnvLHuMBR9xEpW84w47EFtWkrzVa242
	 UwF3u9Nd9c2eiT9s7T+mH1EBUfzaEAs71LRpKAftmplnJ1GsWxdcTh8/TRms1wffoIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
	b=tZYr2fcKAr+YK0OIOrKNRrA5OKLU/um8EC4dTuBCmvftSdzCoEbj6jWyRqpwnCBgFMnJ
	 bisw/PY45dgLi+8frjiugxT14e0ILDde75dekPbAtZMh46WasQcHftCaFY+yPkvO5ZtUN
	 qiwQAp6fifVyjODB60OTpUqqoVvlkzHKjWe2Zumq/rbqpDrU6u+yJdzC6HdY9r+qWmnui
	 A+C39Xk/bzCie0s5nUet//YjM5WnzTW5Lf0tKQOuQQK3yyKQmrTs5cyMzHtvZMf36c+/J
	 OmcyrdOB+LBPNAgsXgOcgUC14zn6eDNl4oSPygkyFgyZJ5U1REJ6jeJ9Kmrcx1oNBDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SutbqeKr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/4p5whp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64411606A331
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64411606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SutbqeKr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/4p5whp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25VsiR3924184
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=; b=SutbqeKr96Cb63qy
	mpgas1pHXMIBIQkUNjYxJVsH2XgpHVqKrcEFUKYs00zCoWPePw1mV2meAKOQnl2i
	PNxjvu48aZlwg/belftXKaA9RuG3CD6gPm8IIqkbUZvaFVP8j5rmy7P09h/Q+w3c
	Z1WQoo0QFU3DdZ+glswTLKHsj6b+o/urn9ANrPK9oRnOGuggIMrSqKlk4wHjrX0a
	tZe7iloNmb5SjHq036uwayL82mbKVRTJvjaZ9rczAnJ8WmIeD2lLxu/KWsntds+A
	Ta+0wk3wtCHYJHueZOYTQCRc7MoJmUlLuW0TrIYkE+Tg0GiqHhlKaydfyFSwrYtL
	GmY7Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rsvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so507864985a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793610452; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0egPPXTOVTB6qutNUKmjSEBOgp0yAoTnKFJQFa+Q1m10WcyDm171q5Tpf2qPjJeB6
         3lX8B5GCJa0Jbf5r9dselJYmVkwT1ZnAQ+61wtsIXcp7ZlevGO+y17uo6F9adWO+0C6G
         lhmJ0vsN/WvrdkdpkW4sjutWXh2VA3Uzhng4fYhWPoPtIok3Cfrd7JPuAz76/gRpcmvh
         +uNxJqNGpERUKFrB80wGJCnaD13BertZOoKQA8YOlBU5h2fHJW6JroR4detfBO4XgYgw
         UB7y6NCMSOrRWAb0slg2tOAR5aX+FcxMtZEqFWhZHLz37PVLvJ0YwWPF8ncergQm0ePo
         e5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        fh=SzibLCyaMhsLOEdK9sT5Y4w0Iun9SmsEGzDu68t8alE=;
        b=qQIDj2Gnx9H/IFS7UkNsyu9RYzYgMpvvYz4rZsSN0RIS7HuV2tDHH8e2qo+ja7z/E4
         zn0jz6gYf2cDlCtYo8q0rTYjh/45zabvwyajsfMZ0cCO8DNSPkTYqgBarYKfw+WkoTnK
         J/8yi9+MdexH8g9TrMHdI8ZBSF+JrM4A9hy2nak6BBhOKZVEOhgsNMJGfLozPobu6w22
         msn0+jlw5FuOt4y+aJVjN1AKwb/Q5l/OyP4/oK+mBcSMCiUfHPrt4PlZp7U1AXgrrPf5
         BAuF/W3VPL8FbZ4U9Q3Uhh2ztlgcDBEvDNnu1f2/Hi2hdpgQANsHOaWcd0ujC3gYA8fX
         3xVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610452; x=1794215252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        b=C/4p5whpXmi3JW9ueD2TkaAEp3yJ04QK73r+8JrTZh3q45iXKl+7sBjSVCukW3VKLo
         HRSzyIGXXG9knjJMNjr2CmThlpK9DO3coJWifETL8KaItfdiqWjsSIHwALQyGJE34Zsb
         PyOgpvuQPB/B65lWQaFHddbtCsjWv3GsQ9nP8L038p2JXLHPDGXnamsH6N2c1nihd60v
         WMrodVwJDawdztuY980ZXouZJyOZ5L7DHwpamvyl0wWddlkYYXCXBYycwaRe4fAg+Aa9
         A+wsITo5REBKTv4z6Juxz1v9z/78genoj6apIFYGIY/xWDulvQTGTAeJZVcW3HACnzWA
         06BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610452; x=1794215252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        b=WToO8Hq4tfu9PARo97iIRqqRCQrfrNSK+WhB6Qn7DfMAyreowcMTYbt3bD42LL0X8K
         61t41/01CPY5EPkBoixBgG8LyTcEAbNG4mgj1yZx/xor0SzA2EIVwfJUJuX9s1xsWILC
         rqQN+Slbe+P+0zpURpJkLjB5el2ZSzmpdVH8paQmsK0WdHdYOVoxYDhB1qIdfrukWlFS
         Ot6N22ZJNEiZo6eSdRhC2K3voiU4175rR5AE6Qp+M5qZK91gu/JxBmmBxIZzzt324j9o
         lyNIRO1U8b0jhsQdnvICdh9bzfq6PAWeCQ/Lmo+KQ2p0DYTlOdMzi2rLpplM3mdCgFMB
         7rhw==
X-Forwarded-Encrypted: i=1; AKwUvBy1C2AdrWxCGiyMoNfRem7NGKq6WNfZ3yo26ZhfVqHgWTxXykzeBWAkXigo1P8tp94HYanKnLhxOX1c8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJofqCsgNoigp3soIt12ojM+VUgGDZz9oZ+jhhWS+g5m5IeJt5z
	smY/54R7/THsxdQx8+GE9J5ebjxe9nCmXAokDlBKx+wocYf5wvPsxgaNbSs1FzJ1GGs1rw4xkz+
	Q+h2LjX7BtFvgCliDUQ7AsaYBCWg9OV67KFBlU1eZesBiKxCrrucOnFyRwxw7QotnQni1Qeb+7R
	F/da+jb8tz6K0iUD7quEOQxF5Y8Wls196kB6J+rvYk
X-Gm-Gg: AYBFou0rUPkVRfPDSpDPsdDQGtnHuR1kQbLWGzpLJ1TINw2nstlA0T4BNOQTFzy7kS6
	Pc5X3dBtg1JVAZFosXSPJy4lwB3lFXw9eTaa9C9X1qhdK2OpMDWB4TE6vkunko+j3UTKB3dK78t
	hgyPrOWOIsTKZgaHVA3tIymHcDgekmGpzt7ASrX0cCT8iFBZyysvbiBrRfAC5zFklhVqBsoK78x
	MYuVdChdb04rBm1AxsCJYrOIG/4POpn8kfsTQ/1bvWxuTsDWRlcGiwpb5xgsFG/Y/PI9wJwIsI=
X-Received: by 2002:a05:620a:72cd:10b0:945:ae36:d318 with SMTP id af79cd13be357-945ae36d4c9mr443314185a.61.1793610452530;
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:72cd:10b0:945:ae36:d318 with SMTP id
 af79cd13be357-945ae36d4c9mr443310485a.61.1793610452047; Mon, 02 Nov 2026
 01:07:32 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:07:21 +0100
X-Gm-Features: AclHuK8qwpJ4t97NQfYBs_D9ps5xva1LbxOD8GCWXYj_2Vf6LGgnzwQQZn9XolQ
Message-ID: <CAFEp6-1Z1_DivMsaZbX=00tbG-xw5ntqAoe0QKyM4iA8SrfGbQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware version 2.2.0
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gfB1hTL503Ikt2zJhNaWnSlyLmNG7HGc
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae852d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XBxIerWLAjSjZTh_gn0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXwifIIyNMyUMI
 5oBJ3XrzG9kndPcflLeelN+mqHoQHV7MlsHSjuu0Ibsx9SbsUfyidKvTviJ8C84a2SLRzBb6ZIH
 nMZ0wnOC6e154ea9j5UJuqoJZuD3ASffOaLGA8h/8Ht4DLl15meCJb9OKVNIFyQAoB+pPTXhl7v
 rQXxDMhzjSfz7rSRlcdWd1k53Ky6fRXZPsjEoQ49ystvfsUUQD37eooCMfRjrD8Q840aD6KL3ig
 zD8z1gp4Z5UoJtMDZhOtxfnc6qCZMwXV16OQwcuCouzD8gY2AhZN+rnKCO5LB2+v8j9IUHYHAvO
 i2a2IOK/wyT+uDFjwnEEeMB2077DxOPhxY1Rp6wJ7l7auf63Ibg2PaQv3RmUJZv7UGFWGynYAwb
 n+cbzfyymcGRAUZCVtuXp//mS2i28BCVXGztzcQNkNS17V1xtZn6ViQc8DMaTcBx2ngzRmvBZsD
 7KkXPHbASgCcM7kvV/A==
X-Proofpoint-GUID: gfB1hTL503Ikt2zJhNaWnSlyLmNG7HGc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX4MrZ41+vKDEQ
 1kEguTjlZDuuMq78gQP/7F0jFxW4an/XrLFUOuvtNGi25bDFhncCwI9TDPBoOF0/TE3X5FmJC1L
 jPKzCdjOylr22jmzWddyqhALz3lVnEY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Qualcomm SM8650 CAMSS TPG blocks version 2.2.0 have no test enable bit in
> TPG_CTRL register, test pattern generation is started by a test enable
> command written to TPG_CTRL_CMD register, which is also used to reset
> the TPG. This is the same programming model as the one of TPG hardware
> version 2.3.0 and 2.4.0, hence lower the hardware version down to 2.2.0.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index cabbb2638cf3..a83f9a80c2b6 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> @@ -22,6 +22,7 @@
>
>  #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>  #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
> +#define TPG_HW_VER_2_2_0                TPG_HW_VER(2, 2, 0)
>  #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
>
>  #define TPG_HW_STATUS          0x4
> @@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
>         val =3D FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>               FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
>
> -       if (tpg->hw_version < TPG_HW_VER_2_4_0) {
> +       if (tpg->hw_version < TPG_HW_VER_2_2_0) {
>                 val |=3D FIELD_PREP(TPG_CTRL_TEST_EN, 1);
>                 writel(val, tpg->base + TPG_CTRL);
>         } else {
> @@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
>
>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -       if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +       if (tpg->hw_version < TPG_HW_VER_2_2_0)
>                 writel(0, tpg->base + TPG_CTRL);
>
>         writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> --
> 2.53.0
>
