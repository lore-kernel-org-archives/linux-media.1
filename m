Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E53D6488
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507945; cv=pass; b=RekF/Iz55pdDnMLqqHyxqGgs4S8w59nC7cOyG2ZvsKxTgpw9hQZAmcpBCHBk9f9KDUSFXoWVtZZgYdvyBpKm7IZE4q27IzI0Tx0JjRuxM1WTB9A4Crg91ebpfaaIRB+lgc3GL0dGDk1Nm9OWogH8v1l086YcCTAfRM6p/HXve4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507945; c=relaxed/simple;
	bh=U5ApS72uEjKEs5mPiYz4Sb9WyBZ+8Xb3wknNXul3qjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWVWLGEw3FUbzg8j3MQfpMbXCb3oBBo3LhZLChQ9MPZqofoatrQs7HLMRA6k7GtsDjvgyjiXKejjk/d6f9YS+ds7dx3ffks4kjqYH3nBsc6wCx/xOzZqBf0qcbqRRWdOgrh+17KODqXCNdqHMP9vVYpowgtO5y6pgh6yPRjPwaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBgs5nlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6Aullbr; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBgs5nlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6Aullbr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684638ou2125698
	for <linux-media@vger.kernel.org>; Fri, 4 Sep 2026 07:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=; b=CBgs5nlb0vyHXZHE
	CfDIHz9bdopunyqpjuPfCJiVyzLGJTJSSuXdV5NOM/FWd3auNC77Od7xTOIObTxX
	m2AK68aaHGeFD/nMxdZQPcoTxmfAgXD1XVPahvQoV4XeooE131fHZ2nYRLedLXSb
	7O6Zsqly7jU9cIKtCQGjyVH2YNWzIgdW8AOnOQJrn4kK6Gw+x1jO9+ahwAVPD14p
	3sSuHwykqgQunS8swd02Ls+1I0iMrbcN//Hu9iW86cjEGa2VgLR9JIEsH947YNxp
	5V9ZPGk1e+q7i4k7WGR0+I3zs7LL4SAbQ0ODb9LzNfWiDpePeRGGGPU2T8JaeZz4
	xA+raQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgrxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 07:45:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so122376685a.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 00:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788507941; cv=none;
        d=google.com; s=arc-20260327;
        b=DqO5UjZygdngBRbxJyoY+cRcsf9XOdGKoU+udSTWh+/JKP4zSM3cgeqIQjoGD8gS/f
         2nP5hicF/5Nfx27hzgoKCvv8zm2XzRuxczghRZzBIYbiE/eM92ILm+kZmQ13eVQdt8Mc
         WMXOL1KJNAH27pUuyd8rFkb4VuQrzE5PJy0VJJdkR46e6APupeLVkpQ4hbn+02LPnoDH
         FBgI0Tz3QXLSJTP2wpncVBlaWEPo19YgOnc+nBow+w93VAnZ01Bu9QVr8icg4xpWBLr1
         23exabekLq0RKHD5+oGmjvssx6b9DSA6lhpZkTRoHm5naU+YBUR2V/z42Kf4wIpgHWCv
         +ivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        fh=ByTIRadlCM9IRkxoEBWroGWGcVoTLcikfKuyYvl2R0Y=;
        b=se+QcpsBzHuNTUXRe2hdJQMORxfOG5hszz1gzXdbCjFlI0PyQwTzBLojJKxrcacVye
         doN9JKnTL9XKuERyh5IFPJXGwnPyxpEP9HuB8J8rC1JLD12D7e9ouzh2lAmx3K4lyum4
         KZz1ugrHJn9hUU0cj50HxUnrh6akjYMV1ooIXc76bV+Kj2vF4clJtc1KqYld8YeXBAEu
         hJ0FhcregLAyoCoBrPnhNswhD0q71t0jYn7d0MD3VfE0YOZtsK0t6BBWeqL24yrDXktb
         v8dTA2DEQw99Pru/7B643Bl7cfCLZZFGYhI8HIezcwUU+nRucfJHEYtz5k+M93nsdsDD
         +6DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507941; x=1789112741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        b=D6AullbrfQiasS7lzSqRVaXsKOzCh2zeEySlTnwnUhTNOKq6vkZRaVFGtWwDOTJp4R
         Q+yK3w89OM7KTYUsnbsynJU/cH0qtIvXN6zGAbe905KD08CA5v6rNgLQhrVgIC028AxS
         kvPcbszGwSpscKirwyhQMJ8HCKI1nYxS3kJOA56SfU99Zpmjw0srNqxXA6zoscTAVz8L
         CHfetgs5EydP9gG2bjQZCMwkURGlpJfDFvSxTV7F+nQuBU4VT4RHhov68IXM/Xi3fnW5
         n/zyboDkq7ZwaCruPVYMuaz5RDJLHOoUnBaEwcluh21P+4VEjhUkUIHpUYYgVLCU6WcY
         pLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507941; x=1789112741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        b=Z8yTooN/daJLzBK3yungr/LV8XxYPsh9PSoxeB6QjaOcHys57878P6bEcDo5EDw6AA
         8DUPKCkXgDHlmK3UY9K+B//imGFv1ysdqAcyiyl+7yVZfLQamp7kL5N894HgYHPvvjQL
         3ZOEFSeRqBxfRxK4kEV+ATS2N0lCW+sA0lBsBgdT7fAIJrNcRa/VpZuo/vNyaVQh3KuI
         vq3JFT6uPTaYnlmQQ+yHZOY6Kh3lieJ7kxaZKTcNxpuFIdvq90IT5KIgBmipY3NAalbZ
         QTqJG8YiN8OlL+m+arDIio9/rQRoCg49fRLhesqrMRhvN3cyNPuRIpTV9GeB6ACycrg9
         psOg==
X-Forwarded-Encrypted: i=1; AKwUvBwsfkt8HG8H3nhkh19imy6hO6uzUZ9Us2y29iYHvB/EPZwQEz7WCBgHVcXOMoYnWnVKOvh5RhLcAFTzdA==@vger.kernel.org
X-Gm-Message-State: AFuF++mrIaKYCiAMd5vd6eY9uGdGbvSIM1GSsl46A0XhiBuTvLZDArG/
	rG55oPGVyPdRsh5KR2GbrUHEw6SKaVbu5qgJ7Aiq09gZTEMBdle+0BqU2GrY7zjnAuD1+y1PmH5
	JCgtf9mMpZZb7920zvALIDsljhM5nVZjN8M6EPxkppR2OHXWjGQ/SOeJ7Kvq4xCCSZK6BxAgSXs
	RAvQJTbrft1fpJVmxaJn5yzFQOMr7oLSz/Uxt0SfVv
X-Gm-Gg: AYBFou1ZSUXpPKmXeTGXnrhRfbUWnJwJ9WxSJt1IkISD3UTX3nMts/DHzp+R372+iwg
	cWMnw2gma8bAulEWTtGWhqLwPVjbXNF8biH1tsdW4W6PjQsbcaLgplqvXnwoyasmDlHwbEIM5BY
	yPtzK6Qyw8lrqneSLNHf2EFFY+iO2N27XzU4z+KpfvdYY/qpxLRzllydX8eUpUGQbtjQyD9lZHK
	JrY6oe/rqzFSsl1+GToZ7FGviFABnsukF2ORYuDn3yfzOJY43lB3qEiaydC42mGfRA4SXbgg+7H
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id af79cd13be357-9396e0e1302mr1054102185a.21.1788507941436;
        Fri, 04 Sep 2026 00:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id
 af79cd13be357-9396e0e1302mr1054100585a.21.1788507940986; Fri, 04 Sep 2026
 00:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:45:29 +0200
X-Gm-Features: AcwNN1WWU5FRzvZrK5fq_LzdAaGftwm82SLjDwjNGTlCYX8Fb3yJIL48uBH_wr4
Message-ID: <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a7726 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=j3EoGy_XDV5ESBrvTGYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mlivRqB6SafSb5vj96qkb7CCh8wyfU7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfX+tIXeaW4t8Nf
 2vUHTaRqfKEiW82/U6eT4OvkBwyjR5gueiCPBON7hJjceg4Klgbw78wGaEai4smimB0ZgCypG0G
 zRJUT7uTGWV7/ppC4/x0a2qQ9gqzuig=
X-Proofpoint-GUID: mlivRqB6SafSb5vj96qkb7CCh8wyfU7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfXyPitu/P4k0os
 oZTbnjtWJz2V5cfr3yzgf47Pqbf9qfy6hXTPQb/429yDVw4r71jjqPsSjeO42ravDibhbXprMYM
 o3fvAU2EdvktdR2fXDB4I79Q842PEdJmhpLnHBWZ3w7IxbjVa2bpXiVoIaVv8ms84ol5oIEJPKd
 Pbz3fQLdCxAL0j9kPOaTsaZrFVOIQBcMnIDYYkAqV2+6oYeGA9FE0K7ODr+2iQJpNMgOkJ/XVim
 nY7WUoKAmDwY1ZH9NxEJ/2Wg38LJzZ5jR8onoRH+dPA/oOfcjq5pc0uo2JSO18MzPOVVIYcT3sK
 U/ojSVgfGdc3+ymyEH/xzh1hgHr/91BZHO2sPID9g8Rpwy8YlAURGBoIVz0ddD57jZ3/1KUidsA
 t1a7x8I9elMhz7lqnCcOG/lb4kYrzN+Hyw7F//dTZnsh+N20iXZhl0af/BrcfFi3chw3R6MBmLE
 /kE2ztjMQxU20lImcvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040070

Hi Bryan,

On Fri, Sep 4, 2026 at 12:59=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Sashiko asked during a patch review if the existing usage pattern had a
> race condition; specifically in of_phy_get() if it was possible between
> returning from _of_phy_get() and running try_module_get() that a module
> might be unbound leading to use-after-free.
>
> Looking at the code this appears to be so, there is no linkage between th=
e
> phy and module under a synchronisation primitive.
>
> Using the phy_provider_mutex in phy_get() will ensure there is a link bet=
ween
> the returned phy pointer and the module_get() bumping the module referenc=
e
> count.
>
> Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
> same usage pattern.
>
> phy_provider_unregister() must take the phy_provider_mutex so amending
> phy_get()/of_phy_get() to take that same mutex guarantees there is no
> use-after-free.
>
> Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/phy-core.c | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..cd9ace125567a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -124,13 +124,11 @@ static struct phy *phy_find(struct device *dev, con=
st char *con_id)
>         const char *dev_id =3D dev_name(dev);
>         struct phy_lookup *p, *pl =3D NULL;
>
> -       mutex_lock(&phy_provider_mutex);
>         list_for_each_entry(p, &phys, node)
>                 if (!strcmp(p->dev_id, dev_id) && !strcmp(p->con_id, con_=
id)) {
>                         pl =3D p;
>                         break;
>                 }
> -       mutex_unlock(&phy_provider_mutex);
>
>         return pl ? pl->phy : ERR_PTR(-ENODEV);
>  }
> @@ -635,11 +633,10 @@ static struct phy *_of_phy_get(struct device_node *=
np, int index)
>                 goto out_put_node;
>         }
>
> -       mutex_lock(&phy_provider_mutex);

Then, now we're moving the responsibility to the callers, maybe we should h=
ave:
    lockdep_assert_held(&phy_provider_mutex)

>         phy_provider =3D of_phy_provider_lookup(args.np);
>         if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))=
 {
>                 phy =3D ERR_PTR(-EPROBE_DEFER);
> -               goto out_unlock;
> +               goto out_put_node;
>         }
>
>         if (!of_device_is_available(args.np)) {
> @@ -653,8 +650,6 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>  out_put_module:
>         module_put(phy_provider->owner);
>
> -out_unlock:
> -       mutex_unlock(&phy_provider_mutex);
>  out_put_node:
>         of_node_put(args.np);
>
> @@ -678,15 +673,21 @@ struct phy *of_phy_get(struct device_node *np, cons=
t char *con_id)
>         if (con_id)
>                 index =3D of_property_match_string(np, "phy-names", con_i=
d);
>
> +       mutex_lock(&phy_provider_mutex);
> +
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(of_phy_get);
> @@ -786,6 +787,7 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>         struct phy *phy;
>         struct device_link *link;
>
> +       mutex_lock(&phy_provider_mutex);
>         if (dev->of_node) {
>                 if (string)
>                         index =3D of_property_match_string(dev->of_node, =
"phy-names",
> @@ -796,15 +798,18 @@ struct phy *phy_get(struct device *dev, const char =
*string)
>         } else {
>                 if (string =3D=3D NULL) {
>                         dev_WARN(dev, "missing string\n");
> -                       return ERR_PTR(-EINVAL);
> +                       phy =3D ERR_PTR(-EINVAL);
> +                       goto out_unlock;
>                 }
>                 phy =3D phy_find(dev, string);
>         }
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> @@ -813,6 +818,8 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(phy_get);
> @@ -961,15 +968,17 @@ struct phy *devm_of_phy_get_by_index(struct device =
*dev, struct device_node *np,
>         if (!ptr)
>                 return ERR_PTR(-ENOMEM);
>
> +       mutex_lock(&phy_provider_mutex);
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy)) {
>                 devres_free(ptr);
> -               return phy;
> +               goto out_unlock;
>         }
>
>         if (!try_module_get(phy->ops->owner)) {
>                 devres_free(ptr);
> -               return ERR_PTR(-EPROBE_DEFER);
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
>         }
>
>         get_device(&phy->dev);
> @@ -982,6 +991,8 @@ struct phy *devm_of_phy_get_by_index(struct device *d=
ev, struct device_node *np,
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>
> --
> 2.55.0
>
