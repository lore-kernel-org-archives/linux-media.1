Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027044;
	b=fSQDl/2Fo2cEE8pLKnF2Ipi7pJ4VYots+AvioRKy6zcZbqJxdFGGdQ0VHi1bHqPG62Po
	 3yn87SoDlIdkqXM5xHXETsoXUWpDA/dMDUybavazSzNEhT5WgBRu7sOpMqylRf03N0eix
	 cVbxon0ceVLgvD/KjuK2ZRPQgGlwYePNAKuLptDvG6GcaZWS6GS7tECEl1YVGH1Ls6aLz
	 BSxF73ViiLPFsEo9rTxUDYdBD1xEFMRLOVfOdKUmi1nHr07oO8I63IRkSgjzpkKYWuomz
	 +pz9VhiUTg7wQuZyayOAbzJQOvRJLSxgai18fV6cpQa//UsWevKIL4iNBMqeIvfzk2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
	b=yf6z7zx0lcjXc6PuYJNMXhkFnpJGl9Ju9K206QcqyYLACHc6e6I+4f7nv1RmlWluq1nV
	 hiA0ez0AmLtmBPpZQMUYJR2+dvyNTWWIRgWVAUUJpDcwD0SyQj2eNqnz7rR4wlN+j6/Cb
	 VKzebmUAmsW1n8kjQ7xbWn35B6WxJrzTlVXZOklA5CMS45WMXwY3iUqQU6CPjdxRL4wwy
	 IUzsnHgOzZY/rUxWB2t+nwz2onn3+DSumDx8BpHNKZ6mUBebKcNiWKIuQlSIg9KjG7g72
	 y46WflRrh9aU0XPjhSYM07Lw0WB94s/nxCWJVf0T5C9m1QO+4NU0X6f4BJZVckXASFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRnrH7Yl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFw1sUL6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD5606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAD5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRnrH7Yl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFw1sUL6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvqEX3268464
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=; b=LRnrH7YlLzqodBMg
	yxqpuGzqQq8Q+euwWRdQtyDNcUIySFG8F9zmv8NGcKlOMD7GqO3sLmobBcpusyLw
	hAafzOtoCKGc3IOwRid88cnftNjX8iWgcWa5bZG4iN8BTaXWDU5YpUTdKIrYIsMx
	jz2zp4l4PUROJv6vAScl6Z1PRDIXkXdb24Wjc+u4vTdgHz34IUUDejKb4l/pEUP1
	1qeMgd+zvI7EUGnJHyCi73hU6I8nrI3ZAntX4wQWrQswQCITWakYhGazTQj01boq
	1CpKAT8r40wlBGfd+lROJmLfyQEgQ4WT4ib9U+jqmwArA3y/csapGiGCiVmh9PKe
	HViSeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp98ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:04:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so414476185a.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 08:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793027042; cv=none;
        d=google.com; s=arc-20260327;
        b=rYeISKVZ1wEkNblEDnBvVWtULhhTjN5bfB4VvscEIjTAeBj+sHQHjGkPP2zNj65BCn
         zOEbwSmQptJ6JBiizdscyCtScRuSS6/ylKlOFSJArDUSgHpb3fjbeZXFfw0m0DOcl+3Y
         eaLF7NIqFS8YY4EVlFUNLuoAzU2yJM64BaZbDmSJvvkJgNMsGOJ34TwyR0hqmfhVKw27
         pzfGnEX8SgCAEKWPOSbGsUcHcDF2U1E1AeFOUPnQJfMohvGtE7ezJtR3ssTuLYiapGQJ
         c5Ro+5yDLicrkZWGvX3GsIjx6xEWsH2c2YZ1Nw1jGvVrMZ+iD8fpbf6a5q4wTB0DpDA3
         ffzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        fh=2qW+ciIPzH/CcQT73FBp+KlJgGhh0n13bpKXETzelrM=;
        b=gjhyL11nH9fWKeo8qR7LaqJci555x6Atl1vp7Xw/LWI75z4dMQUaDLO3M8/q/iUCXQ
         dDkXEYpcozhm8fBuR3TeQii1Niw5bRnKnJKIP9DDl8A6EnmCnJUDnD422pRxBHIA46AS
         inzwOJCnd9WqgwA5SQC4iOWMRRBrV9S9flU4grK8q9gc0KBQ6ZV0KHm6qTaPXUuPfj/4
         MFL4DupgIBPrBw5dEbS+SSvgaIy6xbABuPmKePW3yP14nOoXZqsY/F+zLm4bqIi03A+b
         yWW42F2OShOwUfEqhi3lSL+83/ofVCznZHlDglbevvH7N2l2llbCsI6Xah/5EVBsbDPe
         oo/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027042; x=1793631842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        b=FFw1sUL60zbI0K/HWDTIThcZcM0/RSAAwCI5qTe/8RYQK8JHh/cAKVaxOBiJjy8dLs
         E8F5JQntFHa4UhzVGnXCIV44wTKq22ituYeQ5jFqXI8CuapWcWbxSwirzG1VOsv78H9j
         x79Nl9Nzbvs1LjgnG8ZvE+liYARKtiUFjivzVAOyBZoX+3fczSTmE43kBn6kjW4UBzH9
         G7afRkAUi1Xr8BnmhrKGFNUqfFt6GXKHaPfbJ0vN3coA4+M8X+RPi5za82/QcQoHRgee
         He3halYLlQRFewpMoau8cLKS9A8bZOLgFTLN1gZFzvE/0+biCRkYT4picLADVhmCB23d
         zT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027042; x=1793631842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        b=vSbsgCGS9FX7Y8q7SqolxbndFVXWzNrLOC7rgi7e2i0rRxlEU2KwejHAt6fI4iRay1
         XVbTLLUlY1KTm/jOHQK21Ucc5DMqX05bfR4WR0A9Su1SOefiFbxH8mGup7E6ax8WeHkT
         1slJIJ60I8tY45KPmCCmoS2b+IbO+dc2dqgtj5Ij50aSlkSQiMxdaC7G7pyvHUHyThMi
         467LtxWi+JGvYzElBxU8zmWX+2DS7E01NWXKML3/+ylwSq9FSXi72fG2fb+ViSaURwaL
         yvbDx9iKX+Cpj4dcko+uwLt+n+0ufOCFbLEEXPXctu8FxjfQ5L/AqVjA4v5/pUgOJWvo
         X9wA==
X-Forwarded-Encrypted: i=1; AKwUvBwfzTcueIDoUKNOGbjz2zYhIi3nzxxr2l12e1iTtbu77KzBLUVV0V6EllwOMJPuZ3cVGRrghqqgfdP+Dg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLaD40irXr3+KNvHvKAnQZ64cigjXxlrJkl3O3IC/Oijr//QE5q
	mZB/KsEASl1b7fpvco++a0aW9UaZrtJBFOwZGejSeHur5LgQ+HlpvoIabSEN7dUl0c8ugrlJiCW
	4ptwGWOHvcya+uEUCB6lyVvU4ZzvqrfqMwL7368imiFYuckkJWAyOk2XSxZNlWgJDthNPTp53WU
	Rr0/xdzMgBQIvGbY1g2hDUhGAwY+YfmqQSLZXrqHpx
X-Gm-Gg: AYBFou1MKL2mPZ7yff+lxWpyWr2SmtGcaQs7MpGeF0JV8MqyR3Y8OTQuCDqqquT0ToG
	I4XA8ruvJNZLbrB9/UbsNNUiHjSAB8V5SAEycE60ELRUTS0xUs5wb0lvJvPPqZCZz2TEhXSd+RX
	0S6YK4HLCmx+dqEyTeIfmYM8PnlPvLNQD1jlw63HsTQVRvCAqDW8RBHzg20vQUPrL+DUkKdLvXj
	yBphQZUGb9gTJUO/cScprXRek77JDP8mBUnoPe3noBMoC9sUe6miSy/IAaesoUT/LN8dpQql55l
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id af79cd13be357-940f2d96196mr699037685a.6.1793027041587;
        Mon, 26 Oct 2026 08:04:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id
 af79cd13be357-940f2d96196mr699032985a.6.1793027041023; Mon, 26 Oct 2026
 08:04:01 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:03:49 +0100
X-Gm-Features: AclHuK_TvdBINMSWsq4YF_lka7v-QqzNFebZNni5byyx9B9emy8t2ESfOBOR4AQ
Message-ID: <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX1cUSoyxCRc9b
 QqGi3StZX57DcDFNLmsgkmjg5fsZX/hUafQJj+EbMmpZmhElCpEHgJNPHODJNZ98wW33mgen3lb
 3FE0TNouIPsFZtOfBOZ/v8vSgxXBBtFglYop75uoiGVEtDvStfAEKuAmGU37Uzlaxn1m/Fh+/i+
 uSMACFEtmy3Dw+qC/ouYilbykizPQrFfN3SVHKwTyVzsGrzye5RPsGhTWpLCYjbC59gJIJ/JV/1
 O/I0Y23R5w0oMVt0wzeI+ggLI0AJznEfSRKUc+8zWUWLZRUeOWOtTUOStGZLpcpG4RRW+LmjlYz
 hGFH37U5Wx0tSFfuVIuXrLySEUvaAYUz5cQ3euqa8dTwrLMuRQiZYoaksIKThY4tReVjqgEsqpF
 621kxjqDImE3hoX6fkN3pnyy8p5WcBO/GJVY/cGoOxzHgFLOQJWp8bwuk3Bw7lt4fVzuvs9mAsG
 4s6bhY4aTThwHHFxyvg==
X-Proofpoint-GUID: ePAnCf7-e5TE3gfayh5ySaMdt0vngGX_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX9b7aA5iiFUXs
 Vl+rRDDr2bvf0Ugj83vLP49kg8qJPYxkoI/dPLNcjvmA9JwTiDKZRLTHBDfVTx6pTSc9fh7vPcg
 ACt8q3tkjK7/ZgiZEslGSOFl0HeI3aw=
X-Proofpoint-ORIG-GUID: ePAnCf7-e5TE3gfayh5ySaMdt0vngGX_
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf6be2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=xfkO0-JmZNjxaItLvQwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260059

On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.

Again, we retrieve the pixel clock to derive the required VFE **core**
clock rate. If the VFE cannot sustain that rate, failing here seems
like the correct and sane behavior.

What I don't agree with is applying the same logic to other clock
domains, such as AXI/CAMNOC clocks. Their frequency is not directly
tied to the pixel clock, but rather to the aggregated bandwidth
requirements of all active clients and data paths. As such, deriving
their rate from the pixel clock requirement feels inaccurate and, in
my opinion, is an abuse of the existing logic.

So I think the implementation should either handle or delegate to
separate functions depending on the clock type:
- Set the VFE core clock based on the pixel clock requirements
(typically vfe_clk_rate >=3D pixel_rate).
- For all other clocks (like camnoc_axi), and until we have proper
aggregation or voting support, a simpler and safer approach would be
to select the highest available frequency.

Mixing fundamentally different clocks under the same rate calculation
does not seem conceptually correct to me.

Regards,
Loic

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..359b5942df89 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         long rate;
>
> -                       for (j =3D 0; j < clock->nfreqs; j++)
> +                       for (j =3D 0; j < clock->nfreqs - 1; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> -                       }
> +                       if (clock->nfreqs > 1 && min_rate >=3D clock->fre=
q[j])
> +                               dev_warn(dev, "Pixel clock is too high fo=
r VFE clock %s\n",
> +                                        clock->name);
>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         unsigned long rate;
> +                       long max_rate;
> +
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
>
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < min_t(u64, min_rate, max_rate))
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
