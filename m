Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880307;
	b=FC5HoQ4LghhhbuwcXzV/ovMBar9itHdL1EcGXYBhZCV7bI8n8ZpgAW5I6gcARWIEdNuX
	 4kmn2AzeTGz8GO7/1O4MKXkEwhgrWfsneDqZJ7K+oZf5ck4pBCSp4mw6/OL0l2sSDuJLI
	 Dn7TTJVZc+vyCOO2ccvjQ5qlU4UD2ZRVBlwibHkFtLk0RxCOo4F9mRv/a53LZfQ/H1zIx
	 XxKZtv0/OYZbNBlMcX8lxVDLB5SY1Dk8PsQGgn/ybFNOg29/oMn/LAKcNCwC72q94manR
	 j++TC44gBlrRIKvJ6T9MkzAs73sk2FdKWRTchT8647Tha+Vtv7YFFtBVz02RAdk/icA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
	b=B7CiCHheC2+lbnn+0YkpiL/UP4rR9EW0rmIijvJXKMupXKDOSl0j44IuMYllriM3rFcc
	 XLTmBBPf9zQg4U/S33nNigMIJ4XF4EEuFsanqfSnGfN6LXYqsHyW8WsoCU6Na+tZWtlzC
	 ZK/PofBfrNFlYN5I9m9heXkXtLNaySSs1ob2DQvlsEX2fwOk5XO/Bmg9acHV3saHqbBpN
	 A14os096nd7e7rXrZynC+CHZht3Yz6vtKSyQsbRfcabFClesanctkisPjfv60IqhyfJ4N
	 k1MUFwG+JEByGaUbRPiCRZS3k0u/e9N6GO/5bDe9KKO4DK6MwIBrfsV6/hbzz8obq3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B71606A329
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 12:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B71606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1RGx1416479
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 12:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=; b=E4jv8heEUFra4Irx
	2LpEY24X//cT4epKu4S0xpuQ2kL7vX7QChcNDd4SpgbJqeNdKyWI70uhpcK45GgG
	7r1F2PjO0bCo3sGRvM2Ut8K6CWSyOknJGwbtZC407BmD6L7i7MnrYy6NZmLat0WD
	QRTvUQdd9Gapuv5R+XW9TnUduCh21r3t27gSSIU4wVkRE1axYYJyLPeuGMScyIBI
	5QYoR9oIKL8OT8Rmto3DfNH2mBe8t28zgYst0BfQuD0ZbCcOUtKESMh2qRHcTeXQ
	civAjC1WRh2sDqqDhLd3dPi9vwXJlWYsSiJCLocxz3O0p/KlAtGjgAAeHTXMsxjQ
	gGO+3A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0g7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:05:01 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso2375481b6e.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 04:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880300; cv=none;
        d=google.com; s=arc-20260327;
        b=IxNPQmAbxmfUm2gxEtNIXCq1PqK6YqWgWWxPjbNwIHbjN1v8y+qzb+Xk31s2gc0PWk
         bAWLHD5ehYprXP7eDm2bNg8vjF1y1hbW7hNbQpB5qw+B9qecaxjVM8FDQ7OSuGjGgzRt
         XxZ0npl61H1CisUS5BX6HcfZOmHk1Ye6aXcy4iiwzUWnt9+Fq/AIheF4P9AhPjjN+5I+
         IZW93Bdj81X7e1Ptjp80bAKWH3fe8ePoF9SXX1hxMpxLVh40GqK/tmHyNMcQcOUniG/4
         51tm6Az5Xpo74hZVFfKjedi4n4ZNxcKJW7leRG6dvI/mbFSl5LlnXWNhhcvGUZ6eGHOM
         peZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        fh=ZiNoSlTLfpNFERGtgSQs1PIl360nH2WKv68X1Nxs7vg=;
        b=HvWJLP/rC2+0yLO7fTDX/6IDBQ9SmAakdAiUWHzPZY2frkCLgpq47A7ppetrEpxtmM
         YgNB03WnG8h4cKWiWqG2GI0PxifLg3b24HVXZ8lLG60jnmOnZLz+Kr0IocETf3aRZVTs
         W4hcPxlgtnC7J/oKwv255HWUn9E38iw1YYfswmQLt6gcKr7l+MrLW+CWn651ZPvUaU+O
         y/PqKFSsuN6eAWZuYS/ABHsSKUnwkUdfmmjrXv9cQrrGgDuuk5yMzCH8pF52riMXsoeu
         feA9cEJY54ya2kTneF+gEuxhjwek1OMxPpWwEr2ePv1O987BQVOkGGo9f/UJWcJSgeIG
         ofvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880300; x=1794485100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=KqeK6u4b9wES1D9XLtYAwi1N7O1h1xQ8YegbJvwQ956ZQlvjfeUOtxAclXTs5RzNRl
         /hv8h2wqXL4bj/PX9Hupo11wrGhR3xIQZu8E6br/TYREXTH+k3ooaAeWRfMdRexcUQC5
         2A5zjP5QF2QtX+oQpDBJD7WLE2x4zGHXodmkPOTuOR99JbhPKD9NrRshremKiJKukDee
         flQmdIczu7mCQwlcyUK89ruBAp+VulEK82a9oNG2j2Kt62IbIxELcHvd4vU/n28qRy80
         BLx5jJoX6jFIxr3rtJXV4Q8EQaXqlfr8iGpuFl84CVmD8Xuu8RjJN0wUrTSoD1iWLARU
         40pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880300; x=1794485100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=xKGUQGW5X2sTcmToqi73JzZaIRTy5CrwCq78LvEvNUVMQeY2n4i+ZHPNPrWdx3joes
         pAo91hsziVcOxwT1EJ8BdnIGHq67WM96UAf+0U8PGFL53BJ3MtkoC3Ut6QW/wpKRJaQo
         6V6D68Cl3fAnWdwK+SLMhSypEPxnXeTWHQ8pKYALsErOtvjicLhvqE8yGH4pc3+XSTKL
         uba05Y5MUw99TBqe2EyHvmaGQFznu3aHEZ6HIZ0bGG4kkOtFj/E6+KVV2cJYnMKLwXfg
         yarnD+rDvNU/J2+3DgotjrX6wdGOOBBQ1oYzQeTLHCt9km6eSuQkgSp9+IMdgIwr5XNC
         595A==
X-Forwarded-Encrypted: i=1; AKwUvBw8FqFEsd44z6/y/YInG8XRWHBgZpiPka+zMRVkI5iuZ/87xbk8BBrDTSUQ98e5nYzIk0/bwv8xxjFGbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZAG7eyMe6Fn8+v4GJtjBy+hyE2aXTcOBX5ahgjkGRaJmEYl78
	JineXSTNSs2Oil/2trXrI9zEYD2f/Mv/PrQE7lsmZcUm8xfmsSxWF97fSbNe+v+gIYtOydyOEdP
	TfAw/uv3c6+fGL4iUwD2uwfNWgEx1Vvfy+1oCyS1u1nA6U+nMp+tSXnc6EItf6IX8fpk+iF+65J
	C5PF933rSpibJXFYdb28LnNO+DeVJu3H+GXeBDYTe0
X-Gm-Gg: AYBFou2SZKhd1MmPtdQGK48vwTAP/izjJ38xgTCm/cjNUKwYV5qZZ4etgcSaX8LbZ5p
	A2siTj5p3v2sdURUpmv8MKxSB/Kqet5wxv18pPtqJQDWpsGAUnArJo1JT+WVj4bRNCgvuSVTyBo
	wHzVcpxMMWsIIvZHiaakj618DWIf2XwQS+fbxtvPyaso01K4/WFTp8uEC2WDHNmxVB2fmm3+PVo
	Hggzrk6OaztGRWw5yhK4vn1FGxj7+DvdxkeKHgGgfAN7k8aLHPbyCdv8iOyPT9xuQ2eYTXGLOs=
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id 5614622812f47-5640e09d416mr12461362b6e.65.1793880300249;
        Thu, 05 Nov 2026 04:05:00 -0800 (PST)
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id
 5614622812f47-5640e09d416mr12461323b6e.65.1793880299813; Thu, 05 Nov 2026
 04:04:59 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
In-Reply-To: <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:04:47 +0100
X-Gm-Features: AclHuK9rhmN1T5uyjSFVpg_P5DvGeB0710y7iKzLARDbFg21rI25jjD--irSqx8
Message-ID: <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX/01hs1XTxEYf
 EKUNzZf9c/w+0hHDKBcf4tbcH1EG60JKGRh2HW3nIEE3L75oA7raMSOsbonINx+RNxJsgY0pC1r
 JnKlJoii4IHapHkWByPksWMvEP8wRbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX+PbOi4OMc49w
 4bcdqm6UDMrsrJXpyTHlezF9sIKLd4S9Uuy+ZMsCL/rUYoEpacwdHMz0it+EBgIUhueeMsQGMMg
 urHnFkv/fx1PZS6hEE9S/zBfPJrRtVizSzkDY7niEgoBjZvIjgRgJA71svvqkSOCMO0OHRuqBly
 d/BSYW01Fep856ZXVcLVnY09WhTmD/LlJLI09MLpYk4Qb1oyT/V/hdkZLDTF8/orEyYJK6i/ilf
 6CbIaoDZg0GdhS1PhzHZBj6RgR18zKGMwXzPnuZEExUt/03HnV+W5pQma9HqtkCwEvl+uXhk5mo
 heYJepcxh+NmxqbrDE7ksLDgVbA6yIVNxHWcGZskVOwxOK4XzH7sQ7naHCMFZVNjjUsMsVY9huJ
 en8IZzo65/OlpJmBk8RPHaVHIObKm8gktKf0V0V2AeekPKXwJt8APrPdv2uPLsZMMxqw7noOFph
 +7bACwwdhPdTjFzg09w==
X-Proofpoint-ORIG-GUID: 9Nx7ktrW8B52-9-Yl73KvG7pabyC_PDz
X-Proofpoint-GUID: 9Nx7ktrW8B52-9-Yl73KvG7pabyC_PDz
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec70ed cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=gMKTrDL_i4-E7wsZRbUA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050048

On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:53, Loic Poulain wrote:
> > So some chipsets share the same IP blocks, with some block/phy
> > instances disabled. As a result, we need to decide whether we're
> > numbering based on active instances or on the actual hardware instance
> > index/offset. If we use active-instance numbering, then yes, it should
> > be @2 (CSIPHY4 being the third active instance). Alternatively, if the
> > port numbering is intended to reflect the hardware instance offset,
> > matching the register prop, then @4 would be more appropriate. It also
> > has the advantage of directly identifying the underlying hardware
> > instance, without requiring any additional driver-side mapping. In any
> > case, @3 is incorrect.
> >
> > That said, since the bindings have already been merged in its current
> > form, we'll need to preserve backward compatibility when addressing
> > this.
>
> This is the input port to camss, so how is it called in camss, not the
> csi phy?

The CSIPHYs are connected to the CAMSS input ports, which can then be
multiplexed and routed to different CSIDs. The mux identifies its PHY
inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
connected.

Regards,
Loic
