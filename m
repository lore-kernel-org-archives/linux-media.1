Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470785;
	b=prFV0WGutsMmXuZx8CZ0/OHhh/8Ez1ofqrUWFj7gQ+0oLE4uLlX7I1074qSiLZrr81SI
	 Lpz0OMh2THgo+rJ+J2Zv0yLePKCqbryKrDKg3nWTo0BdHudIkV3BweOSXac08r+qqBujA
	 Z7J6urjkWCmkhnELueMqv3/uvWGwniS315F4zcpj8/8mB3WXGGXkhiI2INNwG6bRbloOS
	 AFXc4OciWtGGm2BLOND3JXCz2aXJR8SnE8PA0JM/ugE28gEsa4O7DbOBuOJn3EULL9a2A
	 BfsE2mtW3PALpuAgkksz9GQgFjLg4ihljrWw6waxC7p8MS/u6F2DSI7uOxSpW74oCTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
	b=CvdO+Jel+Cg8vRMYdjIquK+eSPEabdk9/FiXdLpjPOF9DyG28pWefj+vbjR5yHmYmG/0
	 VJFgo1uC1fjXpky0SIDl5Wttfz4mQzZ8mxHhUwcX+WtjxNx54wF3Dj0rH1T2EBfqXRMNz
	 2HJGyBmLe0+dE6GNJKalMarOucn2JgnDkHWX5EwsXVrAFGMZxNygBOz64g5fX4qO+Omyi
	 SyFhNowz10ue1RcyqnUolCKaewXmNy7gd6rqJuV7S2K4D2J4mBUj2P1YnnodCGYqIuuWX
	 Yq9KSmVNm6q4A+q7XRd+SeqiftjY1QXwsSgBomgdPfDobGJgl5c9Z6SRZwaP2q5nLGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEi9Scpq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25A606A321
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B25A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEi9Scpq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZWp42514154
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=; b=GCMGHbPBHiZjGm45
	eihsbjjHclEvPKwF0SXIHt/hk+pqn5tdeALQ5qh+MCit3sAPOuZ4STlimn9hCr1y
	9qBW984mW2+DAbuu5V8aqW5b0NLDQpKF5g6WZbf2KVnaVPMDQvSEP+KObioQpjZP
	ErNVr24Jj0IHJT8vLn1X2Ghh3w77iwaWO6lr2SzDh/CCBVFPzj1GIOuOTGcwBnXK
	4c4dzoiEWBrDa9oUqJLUbvwhqtNbGB/hdkD+Rk0u2CpDiiTiOrWeFRf+//wnQ5h3
	0CXfLJDT9M92fgXuvBh78Vs/QT7Q2BBTxNjJIENM9FvUQJ/V7V0eeZ1S8ijWsaCI
	6z3hJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tkeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:06:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so76236485a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 00:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470784; cv=none;
        d=google.com; s=arc-20260327;
        b=a0D+g6OojbCpGJhSi6XcjEGnn8jucmEjlmHdOV/S3QWSu41fNOPy9JLMaGQcdKeRn4
         lUhjRTyqr+g+lTY9Jtqh/fMsDR+bkM3mcnExTNrc9YZpqAzUyL+/HTgnLSz/YjRk228P
         Z3JgQ4wj0QgvHsrv3z/vHzU8kG0nN17Gq9U7Sfo2rwF70Db5J8Jh6Mq6yXVB81EjgNuN
         Wmv7VculmN0HAo1jR0qwugpAkyAbPqjmcJNmtwaboDEpqYpcXdlG3XZGP203ubJyddcp
         yAzEKW1+UvR70d32xdtrjBv9xDs+B+uM5bXQXtYf2Zvwe4TkbPQIZ7/FXTpjpxgGB7sr
         ZUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        fh=kw//iH8ycpcOQ73ABtBttP+yNlw3CODqhlJY0vJWMT0=;
        b=BDNbyNDCxvqUQNiUM7ofNL0BX3BETIonb7p/+Jl0OX7Elh4WsZs1fjuf9BoLbyHiyz
         UqrQxE3BdWwltm8RINtDxEP727rqGH0abz0ZHKSImvwQ49P6LzTP5lNo4o6tgupRfJ+Z
         KoqQ2z2hr6R7FYbEHrmYikxRnFtub+w4AJUz614PKg6S8L936a7X4of6uRgp9MX8paWx
         S8jSxT/xoCo3CsjDIxFGTkelcWgDRWBXxq7Kj3TkY1cEVV/6G/PShF0gcx6SenqDHtNc
         7XLO99GYyXrzzAG+smYS8hqug664FuOrVQ+jK2qyGXG4bCXKQOcZ3ggsoYE9d2AfGZw4
         I11g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470784; x=1795075584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=eEi9ScpqVbXsNKE6X8r36/Kp4+RSmNKyJJARwpu5l1bzx8vXjG082QCz7lt9/HitVm
         dTGXkdB53fEyYlTGbm6Du+TNhf4lPBh5u8czaVFQwNPRbr/DZyAmqX1nHilwvGqo7Be4
         9gpPf2YR0PQ0pK+vPorG7NlzwRVHVSc+vQegcp1Ta40lOcmkDfdyltN/9LCKHrSG3+kv
         bhAVnlRgnmRFubtMwXRulnIswWJvPITgbftgLyBbO6Ylh18ZMFfjc/fNVcvY1qEeF4ba
         pXWdOPTBOnyou2aYbHSbB7F2jkhLQ27SdhQZ84ozDi2Wv3X/HYgrXa36E/VF7UmaI8YC
         CAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470784; x=1795075584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=EWZO0jfdE7st1O+XKZXcuH1iGgg3DJhAmQ3pTTLMLGqBGoWlvT+JBtxVCLmPkW28gA
         K4twGjR9UgoXaKBNNTmVbsoEDrulIB8WdMvk0CIL0YFPtxNx0O8muRLefo0tHz6O0iQx
         muVHQbDXnvjlBPgW1QQfI4tSv/q9mDvJsPYMvt6eoeKdO1WtwPuktRPYVzuyLuEjEVft
         HlVUVFWAg8o4qr+uDT1338Uf6E1tA5/B5IY7sEibdLkFHoE412dp5UaybE1V9fcjhgPv
         ngxuFVWjxv9OIzFKsIreS6h6e9BuKz0RGn0HYTc09HO2qL3GfOUNC0ta/ApepoNaVRIG
         8dFg==
X-Forwarded-Encrypted: i=1; AL+hErHtsKVFjwcM7tYKzTvUpn6iLKHfR5Jzeh1aT/9F9h+tpRjydvU0nFCysRckHz/+OT3Mg3hr69tTum48Tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z83kWEDVi/KNXYdmMmnwVbxdU1ytT2m35P80xNZyTsXrsy0AEbV
	Or5zu308/xkBQwkJImsh46w3gl56XMoO+bSSgs1XZx65ZCPW1tbbq92FwDGi9x0aWwyEr7DRrTr
	UPWAi+p4WBLU7SZ7ntN3hsJY2vDFu+UOrRkryjq71+FH/GdcjV4ENbfzEbYVwttxErDsiueJXdD
	kXG7DH8fQ/6ME1UF+2I927ij2kyWFZrg872FLyVtEQ
X-Gm-Gg: AYBFou0XX1+FnK2yZcOiGsBArHRiNVRxBtjhGcQwZcW+Y0CE8nXwfpuIWsb/25uw9zm
	Nm4070YIip2Y1/DnJGyHjTFoNDzr22LAhC9qasVhDcH5c27PoxrSucjvajTefGe+2TbcqlUOrQV
	F6CZ7gp09W56Xc7YRiXUKdQkC2rxpEtFevFmKrg20zZLnIx+ZZpUEvL5LwCX7xzlWLJl5xIGLIt
	m4gUl9BIVf+KDfWcWwYKXN7wyQ7Hp9e60T8n28CV/pd9FC1gR6jQtG2CLFUA6lKcbQzOa/Zo20=
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id af79cd13be357-947aff88abemr902865485a.37.1794470783627;
        Thu, 12 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id
 af79cd13be357-947aff88abemr902862685a.37.1794470783206; Thu, 12 Nov 2026
 00:06:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com> <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:06:12 +0100
X-Gm-Features: AclHuK9LrNxyKqjXo9lhssRniwpPC4kGf-DKVNvzPuscWH2E16tSx8OTAwPwjUg
Message-ID: <CAFEp6-0EXr=rWY5M=L__KU9eL3UDA06q_vmPWdd+CKxR4iEYdA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7 bits
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <Frank.Li@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af57380 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=zoG6pt3vYd9LuZ-_mncA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: grdhykswTcvxgpa-w8io9YCDaz73p14Z
X-Proofpoint-ORIG-GUID: grdhykswTcvxgpa-w8io9YCDaz73p14Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX0iSspJwOiBOq
 fdZ0EhLBdbETJYkLdtsu81HOHMrJX7slSL7rvIg5EeNGck8NgxrcWzP/t/yqns9L4J4XoNh+c5D
 nudcNZBiTU4HBYX1v0JxHype9LXBRUiWZto7Q9VNTFUR9bY3g1GO/ta/m4ZJ/550D4TWB3OMzIV
 LVAPTu2/Kzh16gRC5Gw3Ev+ph2Nr8Bli56Gh8uq8tiJ4RQKdOvfkDCanet2pWilGw3aumXN+xF6
 g5z99u8t5Iq8hkvG199hlDo5u9Mr9aQJ15YHHAVDI4rX6DBBuR5ZwFeE81QBjPRrTuRUn/Ndc3J
 oIXF1j9kWYrbyXg+jyIil+SSfiKZUm8b3Z7Y8dVKAYKUgx6KISvMwpNL8dmbLqnyW8Snr8keZo/
 v+hveYpMKVEIQEudZA4/SdIKkmo2sK8aPGEaUbjq8MKHIHg0ikw7IP6pr4CRv++ZH4wB9jCXILA
 AMMpaWShW8QZ06BJ9og==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXzxmFLx9tjZzG
 guyaNQTcKB+HJRooserHlgOd6+Td2FxfRDGBGbieObHmtMVvAY5FCtbUpRjgco7vD/W4NVTvXWn
 RQ5vzC+QjxH5WqNElNcFcxwkG0m568Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120032

On Tue, Sep 29, 2026 at 10:48=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.c=
om> wrote:
>
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL                                          0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)                                        (=
(n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(2=
9, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(3=
0, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888                          0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888                          0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888                          0x02
>
> --
> 2.34.1
>
