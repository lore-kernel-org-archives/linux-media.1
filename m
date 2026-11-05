Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793872442;
	b=zJdxonB4LtobhplmuT9dWbWmyT3qHsbHmKPqDSJ0uQCtNu+Ha4yQ5xGCdNL9m4d5dURN
	 JHLc7VJYJTjZdqxxk5XsMhOyOQJhJ5E5L4XAhq7jsacI7/vrNHqKenu3tFEgIJmzhm65O
	 2qaxvXFza5rRkaGbguhMdvZvgJM3I29WD9JPoHHAgqaIpKT2SAd9GbAlNu2nTIzjeOWCw
	 M6EgUnb4xGBlpbZpjtnR+7P1xDaME/qsXTLdEDwgNUkll4YegBwAtKwzmXyuVv17s+ljB
	 e8pX9orgLbXKl5kOZ/CJQXK1YdBHpKafEpvg2+ZKtMPNk36pG/RqMsExx65KucUfs+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
	b=DzAC9jiluTATVCjTMMzpL5smt6/Pmecuyo6V2jBywP08SVC5UpqIUqOGeyITGYG6EpwR
	 r3aPvrIqfTV2FMd/IUXfMN0iUFh6KJnqWHmcn/y3zuJWKhHIHsF7Y20QIo58ZPrkHwOJd
	 eFuedQeiIjf39fhpAx9zDdPFKvAa2amQXf3zJylhIfFIKUs1RlnNWlaSBqutUQsW05ogj
	 mQK4w11iJOf5aUatlHnLCCW5nFGtI/h3dFsnebri2soUimmoSbnF9Bu+297Zt5XG56UC4
	 Z98qVD9o81HQl2DR2BEHiQma4M/stCXxLYgNU04EkqtqFlugiSRYDWnAA4Fk17rHACg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0919606CC79
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0919606CC79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U7gb3073677
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 09:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=; b=PdS93n0NNgqXZtEt
	R57dBU/Xr1B99fPEJdtDFmIU0VEwhIhsMe9LL9F1xyNed5u37biEgI7O1Xv+9542
	mtaPlbXp+PhrtKqdh8Wf9I62/m1pdaIUoPcpoB47n009CjqpwnzuNDr5idqiKaxX
	EEnFtRDdw27M7UlyyBgr5wd2DLhNb+KlPJqTuAMVf6MKkDhxYSEcWS1lq6bITnhu
	/fOfD0roldZjH4WsIl4d2BO8R7lnZIlDcOggr5g8CcktrZjFR8Q6ofgU9/1AFquB
	hwtr04M67SU4ZItU+DnKIDjlRtVqXYOuPzns7acCvaovHbdrhk+dJ02JtIa8j9eT
	1AfF9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq90wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 09:54:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so390779285a.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793872440; cv=none;
        d=google.com; s=arc-20260327;
        b=q21O3yjD0j981smCh8wsv2IrYh80NK21LT9djDM+YtzHNYsCRuQdrrL+q25Tr4uGu4
         cdQxyPXS4x/KQF+INaP3KLZVE/RHHcXLgeW109anGwkDVvRCk+TRL8Vd91cEWqUhwrOA
         UtbTB/rhRKkzYi5YYYG4/B5VTNF4lUEq9S2wt72sLXkB73hneDZX1zV4wH59zR7r3DvT
         vrs50n1aXG2KgGIAuE4kOK4eTNnLKVyZW71qDhFdbIyyjP5qTCMG4N5RKkNGJMmV0sBr
         G489wlBxohPZCZzDqTfiQMuMSjU6t25bodHhjmXSngEW/BqMy9qRN/6wlqhglPqhZdTv
         OTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        fh=ne/JfqDZbfCO+wdLMWPLcnh5vBsu1TSE0i0lVZ03CqE=;
        b=Tbyg18d6Xn5v2sw7tDfM3cL1r8uGpN5WyRU5VxCriDPhv90/nyjarC3wwdukJiIvSB
         u/gRm7kPGKrAxKa3yEERRr9/sxpjriCYa8FR926X9ZZ8UOUPrIemZxO/Xy/r+jVvxLpy
         ZpDMXkc6dM1qAfohqjc0uEeBAbam4ymbcWU4AwxDov10xZoDFVtdJx7LvXgLpI6QKxps
         V7AGEeRyfKzb5iaPj6TbhhrqHcHUgTtqwEWh7y/EkkMXZ61kN8nH7+8/4GGlIzW8UbIW
         GiRTCRSkk381t4pgAI9qKSm9/OzexizUGPPECH7tGNBC6YlkRd3yDLaMEj1HbSZ974Oe
         Jseg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793872440; x=1794477240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=BwVxTQ+P1kukm4ZK5AN8CpaHVyt0nkzFV21eOEUi1UdmI1cnfPrRf2Dus/7xz+/5wn
         l0aUh3/IPg+UT6m7LAnh22DL3XNlj0FJieUFCFQRlF0UzNI8EvWo40M0ITejx3PfDuMh
         nLTSmPSC3Mm2T3Q2fi8LPkdlefer6BL14Fp9OlbzQaWIucSmzyRzJIBIkh8rwfRpiRQs
         VP6d413BRPvH0ZhANSo4i/1fmafzxfR+ZRyU+ybruG9F4DIKw+NVkpM0VfLrPMy3Mqu1
         0OFeB2BHCUq/lv6El4uqJiHFcnUaebQNK7HxwD7HhTTT5OqrHjIqAQRvHmelGJ6hLkQf
         1Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872440; x=1794477240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=awanKwsVVg3bk4UNr9aFmOCoOHmNy/KDIYG60zchg3agEDIU7BCY10EuQsn5q0isjD
         umn+1uwEyft8lrYTY3A/f5TemAocjPdTS0vlCjTjy4LEy5AdH2t7TnQrNaANv4dpF/ZM
         cEXVLlUvg6JXIYKNOuhbWSvjdykSoXI8UExInjIDjPsYHrhhGEN1zapG3ZoPGy/oyg78
         rbbjU2QmxCOwMeXfXmtWxNlxEHSx0jdFuTiL5oAm43z+4k7zyziVKJT2ywc1sGnwKpMa
         YzMV3iWOlgnCFMgV4vB5syejq2SisFgYhid6rpY9FqhbteYx0WcMSvThJHc3cHWGQYVJ
         JInA==
X-Forwarded-Encrypted: i=1; AKwUvByYMi/7hu99UnzX86FxcuXk3EcqoP310XP2yHmkBbGjcP9FyFX4WbSxeXBa2ckmCVgYqapmDlDWdVPUoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kYfS7rqcRp+MwOO+eKAouwOSsNAVMEvrMNeMcsLQyITJnLk/3
	Di8VrLmnz3qhUwx4f5FSMK2I7qTHr4QAOICJAfqJ6DSGW5RvWfvB6EO9rSRZuxyG+dpAaiYaLO2
	+4iloZvw0VsfR9UtlFBiWcj1KAcEO8oTRPRLMquYc6htvJ+xsGox7eJQutayH/6nq+1kdvct0Oo
	PC05Hj3lfo6ka1lpgRBLsnsTSqXFPuN7jNQsLKx0Ff
X-Gm-Gg: AYBFou3qvHZpD+0gGiJEENu+BFp6hpsco8aVNNMszS3aiQCfLIZcfUYmSNlItCaPnZc
	mdTRFxm8mdIdWzsBGXnh0pourhE5Uv8jl8WFnZzyAIUAJTnbQjSA9FA1zYh7qfj9bHeLLvNqXzS
	S2SN7Hu6u7ImFqK53BtjSVMqcSHjXTgt8C3mcGXrh3ZsHfirA/3uvf7aWTk93G8Q/0cWBSJMfu0
	YZMYOwOqFqXqXzSmo6Ylfx0POY21TCor3wXFgmn0eMmVBkGpn9QCWgkF4i11u0CtN+odkPH7d4=
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id af79cd13be357-944217ef445mr2800703185a.54.1793872439947;
        Thu, 05 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id
 af79cd13be357-944217ef445mr2800700985a.54.1793872439407; Thu, 05 Nov 2026
 01:53:59 -0800 (PST)
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
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
In-Reply-To: <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:53:47 +0100
X-Gm-Features: AclHuK-5GKF2Bn_LCpwzmtoIhVOQ6DcYBmDOLa-YjfFfGok3ouqIdaX7kcvwdAM
Message-ID: <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX9Vf2Xi/8tDEt
 fD5uI3xzZA5g0BuPoWuq49bOxhoHjWnHMnlt9sfyfi2bHXK76LkfR9eXtC1HnfqnJlvKMy449+A
 kHXKuBOYak0F0ulIoMg5q3GQECeGUcBB/GNzbtqjnG+XYX+4e3Te7TiHiwh2N5eyvftEnunXd4l
 sjB3Q/e71uN2iXKX/u6u+dcpG+kCwmXHNt89xtUWYu8ccKZk8f3edsHdXTzZh0oVXqt11NBGQGf
 G27tAZHbo2Sru82c1wQiH/Q9Poi53sUgTq1qP2J+r7lpXrOdK+HDI3IFdBvjmurTgkUKbgPjZ3R
 SRLtKDdHf6HpiV97kPq0tN877S4cQSdeT1PaaRqG1T0fBilOlD6hhR9LKgjUGswKBnRWz57aIm6
 FleDEDwz6BKRfCwSnuONLtSfEIJZbpPsaJeuN2BFPgg+P5N75NDWLFZUdu+UxTEZ9Oc0/5wqDvi
 TPiM8e1vb2fzSwsFsIg==
X-Proofpoint-ORIG-GUID: dOxIH5Cmv44LfZYFhsELCL_0dcLZ6dwc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX6Mm15itkEFyp
 dLjO2bx6p/2hvC/3z9KFGmkx4LeKKytOyE19flHFIHTAFbuIInbRrfGrRwhmZ6lAJ0z65gb33zO
 35jRK7hGvTX8Ykn/eb7rYq3yUI9JTdI=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec5238 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=pbMnnzsb4hIrvCsJLMwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dOxIH5Cmv44LfZYFhsELCL_0dcLZ6dwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050039

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:18, Nihal Kumar Gupta wrote:
> >
> >
> > On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
> >>>> What is the problem exactly you are solving?
> >>>>
> >>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
> >>> graph should describe it as port@4, not port@2.
> >> Nothing like this is explained in commit msg.
> >>
> > I will update commit message to explain it better.
> >
> >>> The previous port@3 description only worked through the X1E80100 reso=
urce
> >>> table indirection:
> >>>
> >>>   port@3 -> csiphy_res[3] -> .csiphy.id =3D 4 -> CSID selects CSIPHY4
> >>>
> >>> New standalone PHY path:
> >>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID sel=
ects CSIPHY4
> >> Then this breaks existing users, no? Anyway, what stops you from havin=
g
> >> there proper mapping?
> >>
> > No existing upstream user should break here; this is still part of the =
Glymur
> > CAMSS enablement.
> >
> > This follows the earlier discussion that CSIPHY4 should use the
> > CAMSS-side interface index as its graph port number:
> >
> > https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+=
gBT67AdQ@mail.gmail.com/
>
> Should use? Since when? Do you have DT maintainers ack on that?
>
> >
> >> Did you find any existing practice of numbering ports logical numberin=
g
> >> in this device, but some other logic coming from datasheet? Where?
> >>
> >
> > Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are n=
ot
> > present on the SoC.
>
> Then CSIPHY4 is basically the third (so @2 counting from 0) input port,
> no? Not fifth.
> >
> > Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY=
 mapping.
> > port@4 describes the CAMSS input directly and avoids introducing separa=
te logical
> > numbering for Glymur.
>
> Seems you opened a new can of worms, so this needs proper justification.
> Again, do you see any recent preexisting DT review which would help to
> convince me? I know I usually ask not to use poor existing code as
> reason to do the same, but here I actually want to see proofs of current
> accepted practice.

So some chipsets share the same IP blocks, with some block/phy
instances disabled. As a result, we need to decide whether we're
numbering based on active instances or on the actual hardware instance
index/offset. If we use active-instance numbering, then yes, it should
be @2 (CSIPHY4 being the third active instance). Alternatively, if the
port numbering is intended to reflect the hardware instance offset,
matching the register prop, then @4 would be more appropriate. It also
has the advantage of directly identifying the underlying hardware
instance, without requiring any additional driver-side mapping. In any
case, @3 is incorrect.

That said, since the bindings have already been merged in its current
form, we'll need to preserve backward compatibility when addressing
this.

Regards,
Loic
