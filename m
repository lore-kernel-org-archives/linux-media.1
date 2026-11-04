Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793780292;
	b=TCmzO93PXnBpUhK/Qo2XvHmYesQDqJBSl8YSDy1znqMqrESOEy/haEt0xMIlHxGuC9AU
	 qGXDOk9ovRnGgNqCO+7eevYSBmsLv++L3vU5t57cfId1rxvo9Rds55cvV2IgJdm0/XkvE
	 ZsRIv2ezZOKqOySFRT4D/He3pwigXqMAuec3LEzqV8zEM4cHjxGYXTBDrTxdakJ9a5rjX
	 dEkGyR3RJjkgGnrO5Mq5Rh/jVhOQnlKs+AvPX8vqSafILZH0OB6OUAlv7GqPZs22dVXIM
	 dN8TzkwRrW2+2cZ3d2BFOt4yjZcxl05zBRxUCKufUVxfFA/EYmx3GCkTgwqv671ifeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
	b=1DbV4YkwaZ9kfo9qYOM9VDN6vdNdEXTikksQtgMKWGMz8k0PdDETmgbtzyRokRc3fdhz
	 oF0meOmDg3gC0f0cQdnvTsy1sIXO9hF916z0dHOZ6Q8/zIEhS3Nwk3TqAzG7MWLCL7eYe
	 D4DBrZhmZCHPwhPASS+ZHBKpmZq/BQhwryskfiSRY5ocaSDYdBsuxA68Az7JzfAzIossq
	 oacl+wj+lh7NRj8GSwC/+Y7TYvpOaV6IkD5YbdRilCKjzYJHnw/1RE6CPsGGlAcM0heI7
	 mjT3m9xVT4l9eUr23qAQmd1aGiroQDIZZToj6SMpmCRTvZs1Y3+ONY/Hp8C+WWptbtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5u3hIUd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BhKbR0mE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52B606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 08:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC52B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5u3hIUd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BhKbR0mE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43U4X13728789
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 08:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=; b=n5u3hIUdh9tyMmgH
	EBPfvo35b0YoB8wAK5FR8KfCGDl/1s6Waa+0+99NNkvFaWCNxYp2v+DSfZMjZsF4
	2wIg61Gcd/vmtuotHs7DLyxJI2dVLetHtsY9rNBVBqfZ3JsHRwnDsgSvdSrGF8Z5
	slBxw2XaXu0VHco37of47Zg6KRpP+SQuZpNtklRuV8qrJwW+ctwXBpcj1MYJE2js
	RlLygiZGofsJd7Wt88P7Z6RkZVEACtSQ5NpNWN25/kPMliC5aWdeJdGayFVLjX4K
	1BgjxVOlMrCEwkCnMnD0FjrSa9yNSZJCcTxrj5qPwkYqFPhDuexmW7UycmfU60DQ
	OgpSLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbtyu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:18:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533928ef33aso4613051cf.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 00:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793780290; cv=none;
        d=google.com; s=arc-20260327;
        b=dIVibxnRy3yX+pjJWh1iamJJeTPhvg2lc1v1QX5gmTNhTQn86KPoc1f3rEL4PRQbZT
         NEDZbtbwiw+wsWt/+ysxGUQEel625hNUkzEqCCA/HU+NeW9EL9z23M4DrzJYFzlJ++Eu
         dmvxSk8Sxur/yepMrZLN6RsLI2nucXqpck9VyExY1wMo7CYX+Z5at+Bcm3LkHRUULAsT
         PHiBw7sbpzIFEN+muzvA6qGGbw2c+qv6r7vdSuNlo6TDgvSIRh6B6+Nov53AobbvG4t+
         58kCPNwAwFDEybQ6Zx7BdH51dNVeW09njwVGnr3rYqcB+g7KV8cqokiqO3dwbJ11laFd
         HmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        fh=el5YWA2FLP5dYY4Xclg42CVPcuBitRgv5kH2suppOu8=;
        b=WxnH0F9gzdSBRWkgyeXkpD3Ewb9txnIp762JJl+gLwXMco7mT0EzJtyzVpYQnGG4G3
         8gbNdqIkKh/WXM1bnF6ifJFVeH4VsK6gK4jh/X09eJnggu2tYHbbJEF8MZ+lstFehaEt
         uBiruV0o2Ay/tHkNKNEPmdl2hXTyjaxRLR4XpR+MjxKmKUVEMq5GklL6vQrxQfZG0JhO
         roUTo6WDIobFuqQQwMGFWgX0Xndom7Ui8wmCZWJmjYkoQjt3mQq2SQiUqeXB023pHPf4
         U8M4Fb1Ln2zrNqI09qoeHsetATvTSFLwe3iUBbucO5vg4y2O6vRhnP9nFJ6dqfDQhrmQ
         1ZTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780290; x=1794385090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        b=BhKbR0mE4y8j3ie6Rt/Rf8T/h62PcswhCh+4CSzAIgiftoUlC35oc1auCIJXww0nvV
         OTNMafJB2seIX/eXDNW8/eylYRixBnSREMe8JOaFXSSBg4uZcnc2+HJ9Z/uhb910FsoW
         nWu6rWbWiAxs4yblVWKirif4d1113Falhw/vHckZgqWs/mTbVdm7DklRhlMgkA4p4NZU
         q5T/kK/kukt219DAmoJB1ulVBAG2jV3r18pQ7FlxKzMv5rnOvC6i7ZlsrYfqMkv/vbF4
         C6cl1oursdXPbAMKXBhKLTg3RbAhdDIViaUB/PZ1mAT9IBP9uKwh5Oobby/TvcvbI28y
         dCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780290; x=1794385090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        b=0U685NXpz2eINXA83fCxBxAjDOjj7+Iv7oJcbFFZLucaASwZNEcPECTZs0zqJT4wnU
         KwJriPBMbdrh3OcNUTL0Bq6sI6wfH3sx8Yo3TJhPPEK9yw0/EuQcXzKkrbylnyeJxcye
         K3EU2JYs/jmagVVSkbHRzWhvGnF+O77x2Ex0MZ0OmQKHYkhHG7OTm9iuPJtT+5FPaS9r
         MVgRA8cmtmJwbPzAGBBXiaUYBgubZ4ziBE5pYIzA9t1/r4Px4j+d3GM2vOJEjGTLifuo
         9tTvOImBHS5p3fmMnYXBUmudTD/J30zcITOLbnf/xdzVOrtpcWR/eWg29ae3FlU1v3oW
         C84g==
X-Gm-Message-State: APuU4Z/Z3IvSfudTRU/uB20qC8Z+s6c8Y45Hq1VpZzkXuavc5p4pSok1
	mG6fCoPmH3xZScBj+xIJLtXoDUZfPTxQYgok/5ZKkygCbfCfPMFwWmR1kRp31uPxKgIPD2zbC3h
	hvyWqqTMLt5cTVvYpLGXcnJCtELmUvVmUpsV3FHc4DPffLEZcrV9ErYTMoOa1MR8d9N/i+P9scb
	aD18w2uqFe0keZgn2wDoxhDUPavBtloV34ajLXCJQU
X-Gm-Gg: AYBFou2rFLaAsE1n+3rU7KHjuzq310Z0l+gd4X0I+zEpAKetjzO0pPK22+ay2Yzo0Sw
	liilwG0cWUFTz9x4isefXG9MNZ7M6T7Ptu/3zGovmhoKHfNwwCeOeQZ2midw40VRgQeoqvYj9E2
	zz044KT7qIVEeybY1cEZFA+5ao6YX5krfaUqtiyDNPfT/n/RnWnlIkkoSm8jgZFmfX9pwccrVb3
	G3t28iBlSQwFy/Qx7Dn2Y9UGPL3D8JGIaOiGSNgK8FFPPMthx9YgM/BIya6JFoEjKue0yPBeLg=
X-Received: by 2002:a05:620a:6406:b0:93e:7944:b874 with SMTP id af79cd13be357-944216ebf09mr2346221185a.33.1793780289950;
        Wed, 04 Nov 2026 00:18:09 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:93e:7944:b874 with SMTP id
 af79cd13be357-944216ebf09mr2346218085a.33.1793780289422; Wed, 04 Nov 2026
 00:18:09 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org> <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
In-Reply-To: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:17:58 +0100
X-Gm-Features: AclHuK9lnpn5o-AYyo6W8Av-ZNEtQ8ukw8wc-Ki9Jr4kBT3RqAwz6_m1hfJuGpI
Message-ID: <CAFEp6-3iLYqvYqCrdf0ruQvuV_PKkpe+zdqFS6X78bEXroXF=w@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hF_Ic0f6OSOlJtGO7MrubZOcgmbLEB_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX3JNu3fon/giJ
 VqDpssA55XrTZEVUcuY2tVzKbvjiEVCfklKu9KglupvzZABS0xpm7sC0a9pBTMMVBF8iu85PdLv
 m3vi0jfzYGxZwhBMQkJNYlt8PQJ8lzgPYCR2B0AsayHGpTKTEaQxWpH7gGNVb7Oq1Hzj3BmiMwM
 +I7A59XujmVcrL8hpA2d9tdwnlThSDCftOR/93nuXFlXu9rGlChZ+ZA/UhYlUmlxNp0yiC5tF2L
 89s5LR1RzLcOR+kBz5MoXJ+R2H8W5wqEOjZx2Q05L5lgVtQ+XFl/F3Qdr/8vpa12Ljebc17aYqo
 EZKAMogSgxAHBslpfWwwxB1EUvPrM44zQMoIiQ336nGpFERMrTHvcotr6GPb4omlLAhHMq5Zmgv
 8TtIpfTnGBdhG4vFQhufE2DDWkGDjZRp5KsdUANVF8IL7Fwz7mBiae9CbbDNJQY9yHvwrUvf53d
 WUozWvCvljqE8dobCDQ==
X-Proofpoint-ORIG-GUID: hF_Ic0f6OSOlJtGO7MrubZOcgmbLEB_h
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaea42 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=dZbOZ2KzAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JbTdJk7eOsX8aTkAOlIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX8I3wqn9Ti6Md
 59nRDf/Bd+wfbOmL6l9Rx0oUluPNBMNOYShfZqBKhWU79E6SgpF/aTG7H0z6c7ISd0RK28AjRof
 C5WCyLsLGfvOHDATrdH3J1rkGNBR7sw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

On Wed, Nov 4, 2026 at 2:11=E2=80=AFAM Shuai Liu <847807867@qq.com> wrote:
>
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
>
> With CONFIG_VIDEO_QCOM_CAMSS=3Dy and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
>
>   camss-csiphy.c:(.text+0x51d): undefined reference to
>   `phy_mipi_dphy_get_default_config_for_hsclk'
>
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Please do not submit a new revision solely to update tags when there
are no other changes.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Changes in v3:
>  - collect Reviewed-by tag
>
> Changes in v2:
>  - drop the redundant "select GENERIC_PHY", as suggested by Loic
>    Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9..e0cef2cdd0a1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> -       select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY
>         imply PHY_QCOM_MIPI_CSI2
> --
> 2.43.0
>
