Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203618;
	b=YiPaY4AtcF31ZBdOWC/vIT8fAgcZIrRDCN/a1O6xyIlWG5GwKCmcXVjKrRP9wcMQjdgG
	 M8GKPtlF7BBDkL6EOY2cLGUW5TnlbV2zq//3DpY6KwA78VCZRxUUh/V/Ei8kA0T0n1wYY
	 emZLzs3faGWZvPXwwn6gRvJaIGTJP3vIUK2r8ReIL+IhU3oeReYs1FHgiwslMpCWGUTLT
	 z+uoq/ZINm+Zd5xcB2SctnT6LS9oe0ztXslyeRX029efyUxd8h7KzZ2fFJa9cl5EFfBVj
	 kE4bfk6zTKZFPNzEvagDU1kAntVyeydrWO+JyVg8IU4iR+1f8m84PweEbDHr2vs6Zhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
	b=Ttw5+R+J8YLVEDgku7Zw1MAJL3pU17Nx+cgpONlofayciIvjoAXA0GZ1X+DtnU2kndgY
	 YJrGYLrT+luDpjUVpucI+RoXdj+24H1DiABS8LxpIMFnYBR5TCzJ9uXor+BTT2qCoZpRr
	 jJapOrLS3mhjb/bJpAzg47ovYOUWLuQnwy/M033fLZuI/GT2Lwpwt3Gy14StjVJmKySTs
	 ZokGRGlq7JmVXPhBBhEnTmx2iHXPsm9v+cu2qOz4qKdpXPVyRk04zdlSr3V2ZPr/RfXYm
	 BBvJrJPpKjdOkVQg8ygHJrmAd8yJIZLooitVsa5M0CdhZw977CVabNY6bBzhfklp8ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=du5WvwWo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a/kcW239";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6984360A2606
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6984360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=du5WvwWo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a/kcW239
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEff8M1527754
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=; b=du5WvwWop2S3bP1j
	SYaOk2PagB62K4/CU42/NaDawhoS2QDQ0NY9tUZZjAWiUDJOzFDhBwZEHQvvuiXS
	WIJlZNODqaNVHny/TbZLeentVOxg9GM4yJC8Wg3iXyJY6trB/EjjTsiVswEwYhSr
	8+wcrvPUK2cVIVO8i3vy7ILmi2u/8cLcagrsqJ1bj5V1hKzS7PqUU9CDWW2HOkV+
	Y+fZCRQQxkqWL538s7rZHgJKzoppIBhkk7r8vY3tS3Bv/hC8p//lIbr8tbehscGi
	bUBfRr7x4QlgRVYnZVFrBZG4n2rZcGuXUAkCOTmlpP5x6I0kuAmgjaiiaEeP17Un
	HvlxAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqucsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:40:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d2f5f1e1dso19469541cf.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203607; cv=none;
        d=google.com; s=arc-20260327;
        b=k9OfjUqsFM/mh84AKqJjfSIZQLKz3QP1GcksfIkgGd7zbCkLZzfAxWs/zr7nfgtglk
         2YB6e81+Qls8JyTQWvilScd828uwHDZqHC1DXl9mpE+gV4qfpeIfWNN9sBukWov0SleY
         jY/QyCUUzaKoecA1s46DJlz//qIhVXTDyTP3+1DHgx5Bhg6lf9pZgNbgiiI+yKY4uq3j
         NyNHiQWqTJOwWkas+I+ninXyG7pXcb1IZ8ns5KnIBXjZZKfeupqEbEE4FUI/4Wa0G7if
         eCG803NKYt7ZmSClwLwKLUaGM+U/WvkhE70OXsbHcLko23WSy8L1Py7v8wJpTmCLC2Dv
         Rx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
        fh=J5KXCCXLkKIutVT2euaZ8P0OLd8IgL+7q6aHr36W+7U=;
        b=OLih+Y/gmKf+eH+N36GLNXz2XrJKAUAOZc70M9ZEzYIq6YXGK/L0skgOWFe4pfs69Q
         ZuOj5uzCIXKYrFCRWW63ixmTt5DDSFi8VLgFi8hLa4YiVdCsoKiSOiOIkA77mjrA33O2
         f/gVebm25E/ZX9gUkJY+3GSHez5BFSrfiqyWoe7iUdT7ZyGue5X/mB32JBxY18dDMrWl
         Af+Yv+YqjctDRUnZkymB9tkN9mvJZLLzNNLoglDmx1Tpsls08i/o6QdcZ+fm6TdhYSuY
         F0pkgvoI4Gf7mxuGh8u+o4IbMRkURoWHw1JUM9se0yke+2sXoDLrQwZSZuRxXHVGqhtq
         ATyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203607; x=1795808407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
        b=a/kcW239Pj2ePZmq1YuGMKFdFM+6aJUP+ZEEBt68U91c4CPP3lyE/2UlJB0Rg3SMoE
         GCyDT7GusKUWYrReJCelcFTRz1bSwXD7OtO375ugho4xiQ4qkvscKdrO4UYaTKwvnfiV
         RO3pGKEX7uzEN9SywUqUyJHRqzBGuOuozwRzEdfUgw2e3WyPYTEHKyrKB0T44txwW8ux
         3Uae99wJYrCJpcne6T5xjcY5yMKR+qR8EMeb+xrF/i20+E4SvZ8QGJH4MbUa4f8iaDND
         IHDKInUSS7MCxVHmNedOlNLgCHa9lMjPbLQTwPFaWNNVn87n9+1pM9ayeKcEQ4Ye5qMt
         p9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203607; x=1795808407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
        b=m8kOq3h5N74NCRuijrskSCEHDRuzOdHE6gISjkHZJXaySHggF/7Yl3wZMPLe9D/J9j
         +1NZ6RmxRxlweDRo+mof7UMCsqxjeLzuKF3YLbBZiQLTkjEZPuLzTIbty2g/Y4uP0Rac
         dAZAvKrBmGWbDsSvQI05KWhxyLsfENsQmrFbNbevS2DUTQA7SoP2OuGb0adlECu5ub6q
         qYr7qzE8XnST617upy8YgIJcjUQf7BLyWoUn2OD2N9ETJ0eX7lsk/C5PEa8r+i21cT3+
         vjj7NehL7PgpeQCNDvHQa+fSEPe8YqvEWqjn13A6YnfAN3XnC60Zov+BukJYZBwCzuZ/
         jHPQ==
X-Forwarded-Encrypted: i=1; AL+hErEr9+owCrWrJMyq2nnlDmpk3KzLMbpiXBJIVDmaIGe0BAl9Rk+8b7yh7fPUnCkwgKsWdREwPH2sOvp1Jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kOkK3TgVIFa3D7lHyzJR52beY+0y+Ym8J/LQl34H3GqAsVzZQ
	OuLKyY7FxuXOuBm+JXi4Bfpn/LxWJ+wqSxGDRpccdYY166xXMddX5PgDLQ7ZClmMXEr7CIj2Mxt
	fHL2mhY9R+SotC9IHHSLi1bVYP0fqUbU2X5F9LrX8LlGzfoYcggtSZk4Pj0WShrprKe19Pc+ryx
	qZH+7neW/M+uJlgUHWzmRuaQZx8q73U3XSO4F6Of3DRtRXhh6Tm8hLFQ==
X-Gm-Gg: AYBFou2LSrkAySHmrvLpyMTY+mfrL/L5Bk4Yz1GzXVkA+uqqOFMH1oYcyJRPMPtFo9t
	JJClRui/a0E3i6vSY9ya/Yfu8mfjDX3D1PcJADuLaPTv6E9E64oByYBX0g9NqBInn7h406uD46q
	U7Qrwm9Uo/sPA7e1+/wfA02jhKxSnkhyKYOo6Ti1TP5eZ3mzEovD5az5J5h27SmP3LanIJBsV4l
	yAtP2ZIzVk8GDrFGYsRrgMzFCEO89UuJuP6lHV/YjIj1anmHk4TY0pNbQk9pGc3NYXWStmlfOaT
X-Received: by 2002:ac8:5d8a:0:b0:535:a5fb:644f with SMTP id d75a77b69052e-55d76aa0553mr74159381cf.73.1795203607290;
        Fri, 20 Nov 2026 11:40:07 -0800 (PST)
X-Received: by 2002:ac8:5d8a:0:b0:535:a5fb:644f with SMTP id
 d75a77b69052e-55d76aa0553mr74158831cf.73.1795203606771; Fri, 20 Nov 2026
 11:40:06 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
In-Reply-To: <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:39:55 +0100
X-Gm-Features: AclHuK9H4NiVw0s83_MGvorjTXUReMbufB4EI0w2slEzgxUMX-65t974d7or_cc
Message-ID: <CAFEp6-3cQXygekbk0wG8AcxqkW8NgbqHq80SjvPF5XnWhXMRyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Jesse Casco <jesse.casco@gmail.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfX1H0rcPbygJnQ
 EBK/EX7g//d8v+GReoR5GNZNK3AEepJlmakYbkmB9jwGzakvVilqqBmbCgfEgRNFwCIpOYNpfaK
 mWPP6YZxiMuBsUC1TSGHsPr/MYtXOGzqjB2tMM5zwyhuub+H/QKQXOcHZWOVyyqdZQhWeo+rb8D
 sKf53jG28zqmByPIsVPaMK/nrXbNtcff8qM3L6cm2RI0oV7re2CGtX7lFvB2oBSAPMNrso3qLV3
 lFn0+B7VFtSRG5o+9j1mofv2m7PZcrKxUW4dKVWOFmkdIISu9EhTJXRCjto3OjFcNWq3p71SQLj
 4RTP9BoIHG32uIq4F9MqFwxQustbh+B6kexCGN+HDGhrXXv0wI80FiMECqOjoPDyKsiW77eqaq4
 j86NphMm8CYl8uPV3KKwxnfL6uDFoUdA6J2nlMEnP0ILjefXmlbh23KJN/6Y3ZT80skHZNdr1bn
 +mNGmV15QI+UX608fAQ==
X-Proofpoint-GUID: 4_FPZduMX8wdobZY3aDhbPQDjuzbGFem
X-Proofpoint-ORIG-GUID: 4_FPZduMX8wdobZY3aDhbPQDjuzbGFem
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfX3V+p/41HUYxY
 WPaAvBnJHB5rHGxiUhPPjbm+HM6BaDy+Agiz1C1mPdFIuzVVOGAAoLI6wFyGrOXa0FUb8nqxeYX
 cCKOjuYzyLjqbZxiZh3WFL0cp4iRiJ4=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b00a21d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=U2zpuFalLylhPs5xVukA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200078

Hi Jesse,

On Fri, Nov 20, 2026 at 6:40=E2=80=AFPM Jesse Casco <jesse.casco@gmail.com>=
 wrote:
>
> CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
> with the CSID's index through parent_dev_ops, camss_buf_done() is passed
> a CSID index and completes the buffer on the VFE of that index, and
> camss_reg_update() is passed a VFE index and updates the CSID of that
> index.
>
> That holds as long as a SoC has the same number of full CSIDs and full
> VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
> only two full VFEs:
>
>   CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
>   VFE:   0, 1, LITE0 (2), LITE1 (3)
>
> so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
> fails to stream with "Failed to power up pipeline: -22" because there is
> no VFE 4.
>
> Look the VFE up instead: a full CSID feeds the full VFE with the same
> index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
> This gives the same mapping as before on every other SoC.

Can you also check there is no possible link in the media graph
between LITE and FULL CSID/VFE blocks,

>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7d9622097..8020b675c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss=
)
>         return 0;
>  }
>
> +/*
> + * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it fe=
eds
> + * none. A full CSID feeds the full VFE with the same index and the n-th=
 lite
> + * CSID feeds the n-th lite VFE. The two only differ when a SoC has more=
 full
> + * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VF=
Es).
> + */
> +static int camss_csid_to_vfe(struct camss *camss, int csid_id)
> +{
> +       const struct camss_resources *res =3D camss->res;
> +       int i, n =3D 0;
> +
> +       if (!res->csid_res[csid_id].csid.is_lite) {
> +               if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.=
is_lite)
> +                       return csid_id;
> +               return -EINVAL;
> +       }
> +
> +       for (i =3D 0; i < csid_id; i++)
> +               n +=3D res->csid_res[i].csid.is_lite;
> +
> +       for (i =3D 0; i < res->vfe_num; i++)
> +               if (res->vfe_res[i].vfe.is_lite && n-- =3D=3D 0)
> +                       return i;
> +
> +       return -EINVAL;
> +}
> +
>  static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>  {
>         int ret =3D -EINVAL;
>
> -       if (id < camss->res->vfe_num) {
> +       id =3D camss_csid_to_vfe(camss, id);
> +       if (id >=3D 0 && id < camss->res->vfe_num) {
>                 struct vfe_device *vfe =3D &camss->vfe[id];
>
>                 ret =3D vfe_get(vfe);
> @@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *cam=
ss, int id)
>
>  static int vfe_parent_dev_ops_put(struct camss *camss, int id)
>  {
> -       if (id < camss->res->vfe_num) {
> +       id =3D camss_csid_to_vfe(camss, id);
> +       if (id >=3D 0 && id < camss->res->vfe_num) {
>                 struct vfe_device *vfe =3D &camss->vfe[id];
>
>                 vfe_put(vfe);
> @@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *cams=
s)
>  void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool =
is_clear)
>  {
>         struct csid_device *csid;
> +       int i;
>
> -       if (hw_id < camss->res->csid_num) {
> -               csid =3D &camss->csid[hw_id];
> +       /* hw_id is a VFE index; update the CSID that feeds that VFE */
> +       for (i =3D 0; i < camss->res->csid_num; i++) {
> +               if (camss_csid_to_vfe(camss, i) !=3D hw_id)
> +                       continue;
>
> +               csid =3D &camss->csid[i];
>                 csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +               return;
>         }
>  }
>
> @@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id,=
 int port_id)
>  {
>         struct vfe_device *vfe;
>
> -       if (hw_id < camss->res->vfe_num) {
> +       /* hw_id is a CSID index; complete the buffer on the VFE it feeds=
 */
> +       hw_id =3D camss_csid_to_vfe(camss, hw_id);
> +       if (hw_id >=3D 0 && hw_id < camss->res->vfe_num) {
>                 vfe =3D &camss->vfe[hw_id];
>
>                 vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
> --
> 2.56.1
>
