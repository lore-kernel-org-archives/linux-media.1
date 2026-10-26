Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793029434;
	b=f1avzdJ/oXgE1LPX8GdJGzkh+DP6wuYkorkbvzYPLYH4OTR0U8ReR3cn1mSkjsMUUDp+
	 8Vwn88lb5TrVQKB/ECKcjHca/JSdnPN802tUO73zQIP74pRBNxYiuu+v8kYfQ0tiwhz94
	 D5R8luc1CWanrvWnVwtPQTxQ3EuhK2KQkLo+RtpBSwYW2qpGHgpJawbiIOxYuusKTY0gY
	 CKB/smzkAJ79v6iY/TWaq2zKNaCkwu0vRM3oDJp1jriF5QdpOJ+fMl8dlCGVCd126PoIg
	 iV3F60fMoqlxes4lKwYaJ+3f+tjPOCVlsnltDNyc3lP4uTgAmuZVNgbElhBBBc1PBhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
	b=PA9mayBebTa1x1H5Va7fHDNxLNYrdMyooIXRehyBtB7R6UsiPX08Un/jC4srd5O63SjD
	 rL6gD0bSc5jo7r6k1qa48LbGeIHib1ytmOgnI96JpdoKzfnCZyx8oPvuWbv5Z1XbOMEpn
	 us7PFcZbPJP/VPUMPiizAj/F+rtXfyqon5AicGSkyydScyF5PvJQrZAN0XZigLLedgjdJ
	 Z1siWIMMzR7VbfJFU5xYmyCtzlMOZYUzsYvHtaWrhh3zO7BxfmQYdxJr3BH2gY2PnMv5E
	 JeDopEgigAguYcpLRpPfpV9+IjTp+UCHsulniLfdAPuQv759aunVtEUhFQr3IjKyH5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IkEjWRiy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xg1TXosB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66580606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66580606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IkEjWRiy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xg1TXosB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvwkO2707742
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=; b=IkEjWRiyOlxCruq0
	JSnKKu+BpfsO2rKdWcRskAEPFbSQG3Q4Mp5lY6t9F9TEes45H0uJuGoPlYwO3buv
	09SFvIlRflSdiV8tut4gJSuRe8B/scZ+nZH6o2KrOAdn09mEoWvFkLx7Spod6Gms
	UVlnZjwZ2XwtiQgTazE1DWWnWOl3jcEM7jTwdcD3ukhHC7pVkBGk6Pf7uQCwSiw0
	1Et66oHUd4Qj+wCwFVGpyYjn+2hGcvXDAZxqB6pMuqI+iRuYOhp4oNp6OX5RpuTd
	IVI4EiLkFswG/1xOHPpzl1l6tCfGXP7ZsuHrrlitGe4Zc3uEGPXRKMoWwfaVplL4
	3uJjeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u61h28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 15:43:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso661802485a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 08:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793029432; cv=none;
        d=google.com; s=arc-20260327;
        b=Owu9tFr1ilcw11MHM0+e1mbmY6QZXTWs/8JVxt9u7LYfbAqKPHmAsiSsm0VCuElZS6
         HgfCTG9oouFv0C4JDN2hDr3eUEgFRzm+caEHuyyu7hSIvhp6t4Ow3qCgTJ6V75+b4Zlc
         R74JVmXdO62T9pOmVYKB/VVQ7qycSxPZzF1yDCkYAB+JI+p7RAIDLjMWKF7bzpIg9cS8
         WBdR3/9JMTF+j62g2SAP/omwDtBhbnKSR6T3/jijvCU+G875Ou+reXwD8wFGdvMHgPLL
         8BiYJy8L5IW0JJd06Ts1hF+jyrBjBWpN8IsrxxrB+ExjDjr2fiWFB88cfIyfYEwyCJHM
         3aFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        fh=/fhS0oL3CLgkGJj/Z+PfvTBHJ30+UrCMx83LkDxdRLc=;
        b=cCIW9YWHcNFHisZZrkdyHcef4ffcfm1/i7DTfJtUUqZcLlysKnLnuCTsRsSMx8Xja1
         S/TNEfPJKNZLufkinis5RiAusMOCdaXKcVUu+7Z1+lI9CVc/eMnqlwTqzQ8foMcVcLfE
         cRD8jjD0SuDDIVP2iLr8suwjQ/6xr+RGcvDyS8GDUuFz2NjV2xixWIw4PbgFRjzHiDLe
         YvutQkQ1wNjovg240vkptmgd+SV6qnsutobkPKsBBWy/z/vO6zYMUlS1pHWStx06dg7o
         0u3MebtSJv37L83WLxNawk2y3l7+ntWdyvkltgPvTm6MORtEXyCdOCOqC3IdjuWp88r3
         tH2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793029432; x=1793634232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        b=Xg1TXosBjRW85fX0l4iKrvf4WQTSKQNoTq7GSWklKx3Q8Ihe/dvXc+JkT5RzY/CQBA
         F/gCiMtZ6LgtYWezTHAdlUsX7KmaD7KgyGJho1uNkb2W5AUDQrZRImlHzRzZXxwNsVlg
         fUShX4fGWYMiVZu1cZuBcIOPsQLJbfap8oD6WX2O46xrr8bfeYCaNcWfEuS4k+z6DSLf
         0dHIsFqkBd7fH5Ik+RDDLxJYalzZYtSjjyuavCULOb2sJ7whJHbdHBii/0r9Dhe32h/h
         3TTVcV8L8gmLQRk+lJNmMARWTk8AzR8Ay60V0g8MJNWjKravwsslJ35Ha3qK4aYRzsg5
         M+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029432; x=1793634232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        b=oRh9pQN6lBd7AnkRp/fbOpg9v4DuH/0S6yw+hj2YlgHTG8qvOULVxxJB8d3nbYlnYu
         fMAjV4N7yuzwZYz/6oBcZ/57nZbe77b2L0wHUwsbdp08QHnDTpvQ3hDX5ibj4sLitvYd
         OujFoHosyTRp0Z2f43FPM4ea4SwSGZ8CgyC+AAYoJNQaOAXxEy4YV+Lp+ZhRiP0xPrJD
         W7hyeJ9BGQpBNv5Z8K9+IORKRqP5wdaJFRCZYYUy3bPVPnLFDWlGM2UUykb/sakGn7IY
         EW9kTVu7RGUQTl8Luemd3QIvDjtblCvQa6YxbACtQC19RBapBbuUJAEy72Xy0KGstmOt
         Q2EA==
X-Forwarded-Encrypted: i=1; AKwUvBxVbHGbpOIAgwVYGP/KGJt0+a2qgAC8DbGP/fOAgHPIU4RmdKdlMw4dc9fR5E/W7PztSFrarhe5+cbbZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJg9BRWcf7SeLHKGJiZEP/Yk5hoV/Zm14W1kDHMjQA2uDZSBu/B
	/gDdP1OHQCaLsZwY/2zBNIcpttr+HBR4MBB4qTxOIGngZisyj1YMxs7B3ltzKkpAqcxJiFPA4mJ
	nFKIkxHDZ4pQYku+wFIfwZ/1O7deSas9RpAhfKb/QFS1axBxbmhhoEEh/tRT3l/ft8K5J57e7p0
	WHT/JG+aHn7FjpGPIoC+iLsKZ1z5ZFttZTYpGUb7kT
X-Gm-Gg: AYBFou3pfNvSyHG24I9rsECwG9E8R0zNOmmu42k0ISsOI1Egr0s41DYjCbuqzoq7kZW
	bHdTlJBi6kS22E1TRPJdH3aHcupi+1qO0/tM3SI+Rmbi/U5YkzgrYs/AhhK8omkoVtXP2s4ft9Q
	qVuGnjuHCpj4G4Ei0jPfgw8eJF8qtkm7tnt90J7FpSBxUqrj1FSMoKbTcnYqJH2km12Sgi8vwLn
	7VF8zES7Ys3My+MLetOzyHY6eWJEy0YgN1yJyi7/As3yJrJPOeW8fjTzEYqW/XRTfD3EgaFulPR
X-Received: by 2002:a05:620a:2849:b0:93b:d79a:c45f with SMTP id af79cd13be357-940ef980fcdmr1135318385a.55.1793029432373;
        Mon, 26 Oct 2026 08:43:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93b:d79a:c45f with SMTP id
 af79cd13be357-940ef980fcdmr1135312885a.55.1793029431821; Mon, 26 Oct 2026
 08:43:51 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com> <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
In-Reply-To: <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:43:40 +0100
X-Gm-Features: AclHuK-WG-4gcISyaPUABijXSKs-Maj7Gjbye3YNiujrTyxXvxIZ6qWwMAmUkV4
Message-ID: <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rT3mslyBPc50QaN-EGYmbc80dsNdh1dV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfX1avEGTNNM1j0
 VQcZosOPKMHdW9jFsVFcIaQVpT84+Y2FvJ7Ur69Nzi2tVKi4fXBT5rBfWh8F6P3+qZQBa33Qkee
 cb7xczmcpTFEqI2x21h8aYvCwK7umM6m1P8ITfLx9mN3pFVfTW1+NNP4bPWcyTAZoQlDI7Q6rY2
 hQYxjK6UzKBWrv1oHfhCJ1w3ukfQGRoTrqVHkqurwyJhnvgMcDhLFdsbS8wj3T8sqBcSiX3mYJ4
 svTUuGK3LnpMTzPQ8O+FIQBaoz7ygx7vXP6I2+x88w/db76rsxoz2XHusxeHu2sWQXCKrf6e+ql
 Jumebcgu/KRlvorrbDOh48AaLNBzdgU0VvI8VY9SX21GAdK23a1iGnWy+YxRiv5YuWNxTAxuMFw
 kWMMcp4cO1koMmVAsHVdYf8bifutw8GnTFiuwmosX/EhsER3q0gdNpWFFyQ5zH11uxylLd88SCl
 sjHJ/E9+ompv9eY3MKg==
X-Proofpoint-ORIG-GUID: rT3mslyBPc50QaN-EGYmbc80dsNdh1dV
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf7539 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XjOppi-FBbEB9_Q7RKoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfX3QbFhSWubEDY
 0D6HI6gbu063BAQnuN0x0ePcYRD+wbpEHmScWTgSPfXa+8rR9iuN0tCU/rk9KY+XQjO82ZaWKru
 Jqve9kczlRdvCBil4NulV+zFAtSonIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260062

On Mon, Oct 26, 2026 at 4:24=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/10/2026 15:03, Loic Poulain wrote:
> > On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
> > <atanas.filipov@oss.qualcomm.com> wrote:
> >>
> >> The VFE fails to power on when the pixel rate exceeds the highest rate
> >> listed for any of its clocks. The rate tables of the VFE clocks are
> >> independent and need not have the same number of levels, so a clock
> >> with a lower top rate than the VFE core clock, such as the SC7280
> >> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> >> still supports.
> >>
> >> Clamp each clock to its highest listed rate instead, and warn that the
> >> pixel rate exceeds it when the clock lists more than one rate. Take th=
e
> >> clamp into account when another line powers on an already running VFE,
> >> so that a clock running at its highest rate does not reject the
> >> request.
> >
> > Again, we retrieve the pixel clock to derive the required VFE **core**
> > clock rate. If the VFE cannot sustain that rate, failing here seems
> > like the correct and sane behavior.
> >
> > What I don't agree with is applying the same logic to other clock
> > domains, such as AXI/CAMNOC clocks. Their frequency is not directly
> > tied to the pixel clock, but rather to the aggregated bandwidth
> > requirements of all active clients and data paths. As such, deriving
> > their rate from the pixel clock requirement feels inaccurate and, in
> > my opinion, is an abuse of the existing logic.
>
> camnoc_axi and camnoc_rt_axi are matched by vfe_match_clock_names()
> today and have been for a long time so excluding them would be a
> behaviour change.

Yes, and we're adding one more in this series (AREG), so I saw this
patch as a good opportunity to raise the issue and complain ;-)

>
> Perhaps warranted but that would be a different patch for different reaso=
ns.
>
> Upstream:
> return (!strcmp(clock->name, vfe_name) ||
>                 !strcmp(clock->name, vfe_lite_name) ||
>                 !strcmp(clock->name, "vfe_lite") ||
>                 !strcmp(clock->name, "camnoc_axi") ||
>                 !strcmp(clock->name, "camnoc_rt_axi"));
>
> Also - RDI path computes
> pixel_clock * bpp / 64, which is a bandwidth estimate, not a pixel rate.

Yes, although the PIX path clock requirement will likely always win here.

>
> > So I think the implementation should either handle or delegate to
> > separate functions depending on the clock type:
> > - Set the VFE core clock based on the pixel clock requirements
> > (typically vfe_clk_rate >=3D pixel_rate).
> > - For all other clocks (like camnoc_axi), and until we have proper
> > aggregation or voting support, a simpler and safer approach would be
> > to select the highest available frequency.
>
> That's a bigger change - this patch only changes the top of the table.
> Setting to the max clock by default would burn power for no reason IMO.

Fair enough, it's already an improvement.

>
> On the core clock though I think you're right; if the sensor exceeds
> what vfeX can do then failing is the correct thing to do.
>
> @Atanas could you keep -EINVAL for the VFE core clock and clamp only for
> the rest.
>
> cheers.
>
> ---
> bod
