Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA01379EE4
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811027; cv=pass; b=DqYb7o8DE8RTvwV26rsEC++nVq6/oTSKeWudwxyUGgVjsOVPW1RYpjxAUwpUQBIzfHeI5H/iFNd2s1MZ4bKnvRwhInXPjcV/J1VXJcUaGlSazxoJd5hM8lonGdf3s+G0x0Dfjxk4nruQduoGxAD4C6pM1WkFi3FkWQ0FOUn96FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811027; c=relaxed/simple;
	bh=hlGGDYwymH6mg8D1WDX6uDKt7eM+j3/WsmB9hbKOAzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcpXBQM9YwO/t4d0wrZO9n7iORAEcT7kUYeeDUMDMa+6IaVqYbHsYugDpwJ+6MAdnuxeZe8+EG5Rx/aVNaMF0X56vJjFXmsSBgToCIYdWeLMCPehO1kdI8lk0+3vjHDEnV1uCFjRoiXkcbaUi9f+//byGJYXashJG2eMtEQOt5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0U5Rj74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtJHxJkV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0U5Rj74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtJHxJkV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DmTA3567745
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 12:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=; b=n0U5Rj74LXzfJUj1
	Hb1IpHD/zYmylCIzNjGhWRg+adyRcS5lKro0nlvbeYFhcGOXC3/RQJYKGEMvDnGa
	H4JaDgwXvBkMXZvODTXY8n2wejPhMff9X7BwBZOO+C043Nf7YXnkKEkuOdTXUzrW
	OdN9ho1r2GYPSDXvxwWeWGwH46gxktKPyotyad/Ww+DwK7Zvd/AmpR4G93USDpnq
	NvdUg3zd8eCNNxH4RMdMJiYlXkUivl896rFTpBu3Ep3AufzsshKHWWOfPv6tO6Cn
	upeLtXoO0Puy9XfkxfbgbOhYEqsPyEA1CajM9LnZ4c2gSXaqp0k02R8kCqaUfucw
	xTm/pg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520tnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 12:50:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907a1e04111so11669876d6.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 05:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784811024; cv=none;
        d=google.com; s=arc-20260327;
        b=DK9bj7OFWkhLrylDbuN3x+OgKezGSxjOzewroWTNTrRtqGzTOKoKaOrwjRxl+CT0sS
         e/IuSKjA2UrJy3wOugsIM0LtiZUnFJyaYFZsX5EhAKSU6A8nHS4sxna3rcu6CYe+mdJw
         h7HVde89kJFPXaH0YdbWeW4PMoKOnJ2pISD9ccdZF7NzJSDq2+pquwQGUbWedfjS9fMk
         o7mogZd01AKSCjnGZjMdlT4YHl6fcWkmZ+KsUqPiKLE4NQ/gccNBW+EiNXKC9TbW2dVf
         ckBwLuYgvxll0ukYd47WZ39Nkq/+4xup5qq6aFFCmRjAwmdttERmlg2IAV2bZT+BCnk3
         +9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=;
        fh=7XGScxhiAicYhNULdOJqGfjbZQbdpcpIyed0FkTtrdo=;
        b=f0gopnNGhohkXQmpUB7evg2o6zhxI9o3tUVtdE9n4XCPDfzVanjtM+pipR12GYhGZc
         2Znnr0H62GMeg4kLe+RO+4uyxxBmJWmpuCvPZ00fLS7/39wMZ1QDtVOom/twBgZnAosR
         V+GhULFDpacW++qBQJDHCF0VujBYUSWFGonqRWr5zptR3XhB9FKUPd6QUnCoJ0RD/h/+
         Ubkn6LpeMA5XEB+5hU2hg4doxPu1hVlpoxp4XWD4lSaP79Q6XXbApwGV3e3yFiMdj2vI
         fN1oVnrbMTEKqcLIjfGeRpCvA5CTB8uI1GwQ7KkhkUEs8zLXQ8Dven1sBebPYe1EX8Pu
         BK2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811024; x=1785415824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=;
        b=EtJHxJkVONKstf1kFoiGbp08fzfvRlCSNa04+TInrAfotkuwg0t1itHHxL/pRrkyU1
         sTrh+NEMycbpLQ3shq5bhmtK28IrztFC29POW3GGYP2m3pFohfGIPaqZIDUl/LeJ0R5L
         hv/prrca4dWClMTEf+HsOynZkjD883NF7UeCyeVCGhbBE+jRrS4FtrkFOPH3AED/cTrM
         dp22fRKCJIIyi4fe25qA/naH4BwYtoFhYk/T1tIErhjU0kxZCvbYLLfSkesB9lAUID2K
         aJuuDqKzljq2Vab1FuuSyUPB0gYdYKmOGNIC9zHRZKuGsDwTsWyvTRsRKh3NLhji8fve
         Ah/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811024; x=1785415824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=;
        b=H2ca+SeqFlkV6hIasFfxPLj/Gal2Srr9brEyyt4AERaYAZbDmIXX2vaW3vs3xgWgx9
         /FjvbVo/Bgk9oaatfbCODWlS5xDE2iA0Lgjqshe4qQwE9NYhb4Wk8kJiE/alQmHDitO7
         WtYU3mP07FdXfx5ap1NsmbYRPRL67pDV4deqb92MCSMEoRR4iOzLLY587eYcfxllc6FE
         L5jIS2MXe2nxzCgpWAHO7v7ZPjNWHfZ+5nEExbcTJphDzr4Xj4fjaIzezl94Y0smqhBW
         AM9QJKHnzQ9F3F4kQy96PDXokQgJCZNMaJJILu7jN4KCLP6hnueZ1aBvb0LF0OILFV2k
         oITg==
X-Forwarded-Encrypted: i=1; AHgh+Roh0y40z3Je+2YVz9iKm3TKWocKPdh47s5hj3zP8EvvNRXLelzYnlFzjn5zyJ9ToGwj7cQesY5yZUtTmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGsLUYeqLWlIF7id2mPPvZO35XhKFfIN3HqPWGIbdXsIoZvA9
	JGKVOM4ZUBDzwDT0tbwXF7oz+E/7ZxG/hYgWvDESN6u9WtQNWUGGsKYFeKWsMs0R7+l1kZAPpz/
	GnWFBm1AsiRHVW4yWDbWhxbdPPDfPNGB8NZ4GCFQuACIQ38vePSeI8oVaVoQKNbENLGQCB1XsL3
	M+kQtGXHbg9SgM4rb8xqQvk6ferpNgluL14JO4qCvK
X-Gm-Gg: AR+sD11hpHJbK8A/Y53JA6xVrQvCgrsnabIj5k0lUNh83/66aziGeKMnv1PYcJklOoJ
	XuwxGwnz5KqwUGTw/bb3Ykb3nhSJ7gIQDorjLSWTSsB/9LTN3qDGUfhh2/aoVbVZ/OnzK6VL+qG
	r8Tc4nIrFOpWdao0cYl2lUsGtzbX8Nhv8OyMVD2bk71mhWr9wEsga8ED+CcdFSh1KYE/ZMD62Nh
	pC11ZWI7eo7wcuA/5WdpoUnVO8a/avNXkw4ptHbO4GAsgi8H6zHKgKgVTPK/ubb3YvHfQRwWYU=
X-Received: by 2002:a05:620a:4726:b0:930:f7ee:2cf5 with SMTP id af79cd13be357-93103b22fe2mr283340285a.66.1784811023492;
        Thu, 23 Jul 2026 05:50:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4726:b0:930:f7ee:2cf5 with SMTP id
 af79cd13be357-93103b22fe2mr283336185a.66.1784811022869; Thu, 23 Jul 2026
 05:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:50:11 +0200
X-Gm-Features: AUfX_mwF21VL9ibLPXKd6XDb1LktyT-nN-Sq53-IY29arpzrGXEA5oSTVWM1quc
Message-ID: <CAFEp6-2KX+iVPNaTHHRC+QYvn7b7iowPtd3ysgpKFhEdaY9AfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a620e10 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=idSoneugJW-k1LHGf6cA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfXxngOQvQcuk+d
 9nza9IV7AD/vj8lQO2nQn5yQiBpS6PvCgmbfZCHAXDLurHJy3blfM7j7pMQmorSyINEU6ubO1xH
 raGjHQTrQh/0BtEOyHkzge9gPT/TlsI=
X-Proofpoint-GUID: nhAyORnsHWlA7ozZTd_Ba7tt9RcHJBQo
X-Proofpoint-ORIG-GUID: nhAyORnsHWlA7ozZTd_Ba7tt9RcHJBQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfXzAhBA8dSQG63
 9gfCruQjA/eYd4FMwJGyfVDwmKfJjjWIbdfZTK6/1tlDfZLbSDy8sQECAfKp2G/HzmRF1TBSrGE
 gyRQP5arkeYRyIwMMwu07Mitkb1e20BnHi8Bxp3ctURxqDyOOpXmuCJh8c97IFUbd2YP4XrOllC
 c9bKahc3B7Hi+9QFZpdN3mu+4SYvmbcXATIvycqas2WNH+2FASO4c/XR26HIR5uQ5X6XaQmAm5y
 73b5C5+ghzuMoSOKe6dqfjkuQ+CCcgvzWOXKrLaYFW5VNaOdea3mc2JwDwLIBl4MWS6w2tK9B0b
 jLJUY43DIxL0k7SzRQXy5NUbCTFMwcMRl4aQgEAJksgQNfGFyOyUG+dZ8wV5poJ2F336ftu1Ca1
 UqDFWfDkL+4YG87m+hcH4mWTfb4wng/zVLnHldlqplibg2/JC6SZKVTeWh74kQp2iysgWmAG2Ry
 /w8ZjVT79oXHxsoRGDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230126

On Thu, Jul 23, 2026 at 1:09=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> The "gcc_axi_hf" clock is correctly listed in the clock list of the
> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
> causing these to not work on platforms where the firmware allows turning
> off "gcc_axi_hf".
>
> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
> these platforms.
>
> Fixes: 924f45e58b1fe ("media: qcom: camss: Add missing clocks for VFE lit=
e on sa8775p")
> Cc: stable@vger.kernel.org
> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - Also update clock_rate lists
> - Add missing Fixes: tag
> ---
>  drivers/media/platform/qcom/camss/camss.c | 25 ++++++++++++++---------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d..68491b16d647 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4037,10 +4037,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE2 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4062,10 +4063,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE3 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4087,10 +4089,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE4 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4112,10 +4115,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE5 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4137,10 +4141,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE6 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> --
> 2.55.0
>
