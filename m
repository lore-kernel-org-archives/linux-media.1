Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800675;
	b=FrbJKwT3Wq41rn1kiS/FUPVCuJbIs91PiDyUkvirau//dOQthJFVmKLSFbIgf4EGH6I1
	 rXHwmOe/Jg6eJ3bzRq/VYbcWTAklm9v5Xq45HMucPOw6bunmPs6YfB9pP0C2FdHmSEakm
	 X3fW9+bIwx+OVp8GijtOOAzfCihx2m7b7jl/cehl2kl+1P13vWI1u6Qnk7hWYM7J6nCVb
	 WJ3elPc/xmCqBk+HhuBlaxau/j+dbs3zwTHpEuM9ZgU4AwOUjze4TujWFwHgUl03q09Lh
	 Qx8zX76W6cRRH/Hd5T2YQRcgKSr8TP3uYvg3eEL0cCTpm8bEwtg8r8rpl3P49MJE6wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
	b=GYrnxRWG04e5N3ac4zsBkyuN30/tlQKA0KaAcIzTRsBbMPl2aA4MVyGkj71cP3mTZsPY
	 3zGVFM5+0FxgiUUaIr7K3WWH06dgg85e229+pMCUt2jkzSFddm9T/+IBng/AuIB614XOc
	 gzoJjC2Hws/erDmgo3Zo9is5EDMK4MpYkybBvJ9oneeon9DJu5gbJapqY3Ev2u+zLjYgD
	 9USGrS88tZfSyQwljYmBZRZPSWFz02E1Y/1sO4sbKnCzaC7wlUDT/LE+VdihD98N+VDGr
	 d1Pmv0BW66DU8DiqLhyurQDiStvj0zEmt0AEIu9o9SsceHjzY4MIqc12FHNuSDDlp8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ouSU9uHv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl5XKwUe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3089606A328
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 13:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3089606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ouSU9uHv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl5XKwUe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZmK2739122
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 13:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=; b=ouSU9uHvNZjQS1Jr
	sQUCLJFq6u+PlZrMTmWeVKcsBBmt5x2KuhKwsToZG6Wt4Cq/tzQNdKH9pSb/2t3k
	//eo32LQ7PnKeMo5ujtTz+NmICBt/b3mCmC4h8KYd62dY7xQHhozPjvG3/zPsd3c
	hxG7jW0kCWhNLLRRQ8ifJxMmnBn+K9KgmNffr48IHrciMRQCNWmOCoB+rqsbXI2y
	ZKriq66QRAwIcEUIHiDOJf8pZtn/qPJ5Innx5hQOn7Tz1DPJEobd6Z/zr6IawIhl
	M+GOzVeNdpPhYCA7v2oYGhu/VwoFx+YEqwCnEDAQ7UjUGSkgf4Ir2EWInwWtJcE5
	8KOSOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h9md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 13:57:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so170817185a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 05:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800673; cv=none;
        d=google.com; s=arc-20260327;
        b=oeMH5Ci1unetXHDYo1wb8MUGGjfAwjRpM8VDtSrRnlyyMIwYEsLDKEvvwHJAz1urfi
         ckfUHtJOXiEvuY18iGEvoVvfPNXtBvRqRG//7zIPl8T8HmisJ1KVufiNg0M4cDDnxugY
         CV9Z2UrezDfcSK7ynmMmjQfHBcANU3J5kdy7GTMlmtZa62hCv1uHRXwXVRQ3OW6qSZGF
         gxtfUGDF1OnwBmOhXKfghub7S9FpQEZ5iEdY3TV97ILLUm/3b+UHLfhDlbmw0fcvpqf3
         5MQGgUOBTPBJeo/XSdSJlxh3SHG2DpFLDLsxIov6leMesYxkvB5eXWp7yzeLPSVxF8X5
         Rccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
        fh=2LrBLJI/vGacifFCt7Z3NWdZJTGTRJbP0pNmgjguYz4=;
        b=n5m7IBz0UYdafLpblw3Cf1UjKMp/vOdMK84u9DuX/N221NOFDbV3jDHG80hcQ3C2Qx
         IyWbaMqBinvfIHmrZHSNZHqQwgtdO4p3Xgu3SsHGDWR5gojRa2Tf4zcJ7f7k/saZPCcP
         G8m3Ur/JlBV9aGi37vv2/BlIJpx7SMU/IBSmzQCbRAx/yDZQVZfnqxU9SUug4QtLJz8o
         qIUjFezQdijb9kWsNv65Ti7N85i/YDP0U0Pa28SnAbCv4bA0SAJ+crkplSFZsNfKS/pe
         yz+EjzrmeGLtS/mknDNdW518RGpTK7nK633oWGIMZxwRnOTKIA4T1q3BhXdV8KDO37ns
         aTmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793800673; x=1794405473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
        b=Kl5XKwUeAgK4qYtKwpTiCjS3fGGMAyYG0PTFruvZka7Kt0rw0anIgdV7tVeUk1a+Eb
         fEhMMypBubv+nbeMFBarsNJnnmhpYauv0clVN8KreitxBMrdXPFg/1QODE5QqgiTJrmi
         ImzDrogK9RyWDgSmMvIxQWC00kyfnsR3SHz4XyQACEPcJAT08C9XESFBxfn2403vAqH2
         DK4kRDeGN2h4N00EupZ3Ed8RM+7UmdjYuVAfmMSJa6J+6kyc/Kz8CbFltEnJZXLhsO4i
         K/nXhrgkuLP4EyaCv2OQMzWW2BODhPyS5SINvVcVxkgWMpuIZF+eguE28VophWqSae2j
         cNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800673; x=1794405473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsmq8I157M+eH5CTouHOFEo3ct+wpK0ZTD/DNHgwyr8=;
        b=wigdGb7iHAmqOLaOyDfxscSYNCfZdG8X9szVqrpX2HZ/GqAttZBJpHocNjHVjP/PMK
         k/SuA2RFlnC/J+mejJVO57rj44xy8weFDP1vRc8IvdYvD6VTPC9i9BXU0Aa9b83rKv5X
         PwpnqklzBmUPng9qi7Xbw8PGschXtmBOmRP85RlDT6Gdr0jauCBXhSTXor6eNLQiKQU5
         lXCSIBAVRBSudt6+WSO+QOJePMKCQ2CplhpXegpE6BP95eI//Q6YoM3A+LjZU8dBRyPk
         qqFSZOUPA8L+L4uovRvKVW5aHkcTt4TOrlpUgo/WGz4pQZ/2gWHiHdpH5eXrldB/id+K
         AusQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHocn3UXdZXDwMTyBf3MEO1K9IgdVl7n0cYoTgPceiuzTT7CZIfCgBER2NccczJkUKpEdQdx4rfqu47g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/grK1owgocpl9k5CRs9EybzByesQ9r8f7BefwjOyED05FQ417V
	wSk+xT6fKWvBYmF7sE7wRc6RksdAVui3Aon6CneArT1l+yE4Y3MwB8+1tkvLmpHDmXEIVItO2kG
	zpHbpXhP7Uk8iIPNH3zpGAjXdr4YRyCRXO6/UjpAMPzVtPmL90pOEFwI5jsJGLMRYf0lRudC7GV
	eXjURj7hG7BqZ43gRxaSJa3BOlcHcLgQS2km3A951X
X-Gm-Gg: AYBFou3STskKSIKVORP6zhQNPN/7tpOmk06TnmydNxTcebim1UumU3wimSkt4OX5yGi
	96C9JLO/M3OqXmy70CRugGV+bjBbGiLhSn7ycvEkj7OyinrNpWgxJpkkYr3czQj/R6QzIFN7pXz
	gU6IDqbcQOhbfYdoaH3kxlBe2JjBnbA4KM1suVwb1P1h3ZgI9pXXxeeer4RgVST79pYOahoGxxT
	cdBaYwLmXm6KAmv/OACq1O1aZ5ExC+FU39jMs9E+V5DBbSDFh/YfE82ZUI6NnUMhp0keZMC40k=
X-Received: by 2002:a05:620a:2a01:b0:93e:c12c:f136 with SMTP id af79cd13be357-94421824e76mr2728034485a.81.1793800672820;
        Wed, 04 Nov 2026 05:57:52 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:93e:c12c:f136 with SMTP id
 af79cd13be357-94421824e76mr2728029385a.81.1793800672357; Wed, 04 Nov 2026
 05:57:52 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org> <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
In-Reply-To: <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:57:40 +0100
X-Gm-Features: AclHuK-mOnSyKW92DZCotO3CUp-jOUZ6ay6K91i6pN1VBE85x3DMOn0QvWx972Y
Message-ID: <CAFEp6-0-PzDSgXykYaZzUocLkRyw8e0e4=jMu-aoodsJJ7UC9g@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Frank Li <Frank.Li@oss.nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: BaM0NlI5IRjTPnLBkzq3CFVNOl2dPL1I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX5DhRuH8EtU9m
 3+gEV+7NRvGvWv+D1mofmc9pMpzoPZm+Eaf7mVYAfOY7eReKxc4K39lOzvGPvoybV1sAWCZ+tOt
 sm7Qd8XC/Qr/lYyrA8CIwnCsn1FYmOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXyogwglUbxjvC
 f5chen0vTJsm+0GmUCxxSZkBUetRLDCTOwvFoGaXTGCXEn/h7yiVmH0K2hIlWX2G6rUMF4Jz7Sh
 e2uVVhz3aUGFytZflvijdskCHyjG3RusjILDdr9DrgxcUUC4ddmJl1ZvQsGIniUHdZiDmH6IEHb
 pRI1Lg0uK3bpd7LLX3HP58imlfqwS6XD4s4H1HTDwapEHS7NkiM1jRhOEdze20mG4EdTkv296je
 2Td5bAmVuhg4e8n7YNxXVEIQAyGKWQTt3r12os3gjxLrbF1A5GXdmswiU9NY7AxySuzpLex6fTk
 esJl6x0KWyFn937lrhe4lwWl5KbbWIYLxzbTMtTFLtRLNlHD9vfa2jARUyrWXpZqsl2dslRzZn0
 fZbFlnSdFpG3wN5JJs+NXPVIgi0RTe9mXeFH5u3U09Ban6xOf5MlwxNzvoARul1NE/Aw2ZP2sbN
 yUcpDvrBpPReDJ03Cxg==
X-Proofpoint-GUID: BaM0NlI5IRjTPnLBkzq3CFVNOl2dPL1I
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb39e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=d51twBc9FUXZIZCEJ00A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

On Wed, Nov 4, 2026 at 2:46=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers=
/media/platform/qcom/camss/camss-csiphy.c
> > index f99eea2ef228..dcc005674d8a 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 =
port)
> >       csiphy->id =3D res->csiphy.id;
> >       csiphy->res =3D &res->csiphy;
> >
> > -     snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> > +     snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csip=
hy->id);
> >
> >       return 0;
> >
> > -- 2.53.0
>
> I'm 99% sure this is a change that was made @ Frank Li's behest i.e.
> that csi0 is how most other systems do it (true afair) instead of csiphy0=
.

But we're still using msm_csiphyX as the subdev name, AFAIK. Is
csiphy->name used anywhere in our case besides internal debug/log
messages?
