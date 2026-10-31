Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793459674;
	b=t5m0NELuZD2RaL5lQpbD0dGc8HLpw4829+I+w8iYJb52RS3IOkJF68CYm36+C6GWGfTq
	 z9jglUmFBmW2X2rF6QFlJ3Cg/W9kXuoiC3AmgTW0pmzxGiql5KeBObM5QCmRJhnwrTJYq
	 XtGdv4lDfilSWa9J9cBOiusxXp+xDF1oB+Kql+XVpi8voRhgT8ygTKahTFvP46hzNFgnc
	 dBnTQxYQaPRdPq+R6Z0mUU0rjDZSG/1KfgSSnlHDeJYDhVxyWIkkGpxwo/80wSf+hqEvC
	 MxjGOsGPmvqQpTT44HBfLz/o8XGbZiivvJw55Wh3uQwsLX27QhdudAzQuwEv/Y8yxyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
	b=edrCdscNB9+oDrOZHsPcIvMraYLbfjL+ql5kHwuDsc8Kdhp7BHmh5eLiJCDpog1yKbl2
	 WrEbFRsuFFbD/oaMy2+u+jf3k33VW5dW8Q5WC7EDGB3QVhDSM6Gg3cZfcPCkfZIGNnnCb
	 Fgn6RDgBP5jY4jJL7e9xrW0WPZZxe5VoCk1XI1U/uI0Gmd2WON+BOPL+X5qafCwfsOXah
	 afNNHeytjuuB7bQor6bjROt3B0ahWLX2vfxm7BrJQlWcPXRQHUxxmXU4s38EC96U03Hcl
	 TDiSm9iXqWhrWPNdWvB47Af4EYH7MSY/QwX0rxB43L8BlZ5cn2ID8QnmNG55TnDOCxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmRcFMjy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icrygu4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF7606A31C
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 15:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmRcFMjy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Icrygu4b
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD01hX2765833
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 15:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=; b=KmRcFMjyc09Fr1mV
	R2JSZmSE1JACLEUT0r5i6anZ39bgy4cdQ19Gny8Kk1gs4ICBLnRy8Pe+NJ3rNJ1K
	SKV8/JWZGw8iz4L4muMlk9EXC6zlNq5CkkkPTPMyBvjXU5ULFXfY+Y/3AjnM6eZn
	gjFFze8o2IpVs7BVUaT8eTDZvP2+apCBt4rlHypzXGL+2J6mdE323xL+UgNHAo1F
	XBBa/+olVNQZMwh6Jf8b/8BS+0qlYdJ7X1poxUsTwBxMj2r30qe5pTBCTmv8/SIJ
	V+Sm473iQEgzh++hD4cUyt9SDQhwcrY5dA1VQT7dFoK++NJPdHx4zkH2QX41p8yB
	/s0wAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hg87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 15:14:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7c7e8becso49030656d6.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 08:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459672; cv=none;
        d=google.com; s=arc-20260327;
        b=pp5hSrHMILMbQ7bb4ocruEi1AXj8n40FnNLYEXob0Cy6hcdUgOqeMWG06/c1WfKquR
         fhtomXhhc64r5O7bKzxk+XGRT0QechoSlezHn44DYRbySHj1yFSR/9YoNztlWqaBLqOw
         /vYesag47fLXGEv/34/QWY5SEUIBNm9Kxsw/RmZQwn7SBa002ageFU8OEMRD0KXeiShw
         p9UusksAuKL3XhAn9OnY2HeWBG0Zg6B7ea5sUY/RTAXJ+hCBZ1dWYq8aZD3F0a7wg11a
         oaJBRimJlXzy4sfTxd5euUhhUA0ICmz1rcxY8YcfisUGSQ3F+fzUZr3nLk6QpiD4VrPb
         73QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        fh=bhHN5yAFvolBq7zLy5IIZa3TqKWEF4TTX4R9JAWPmBg=;
        b=OKQx9KPQxObGnL/u3rTHDv6ZHXWy7ENfG7WXO/rKTFZJ9xsWNN9LgjxKNG5iKPRio9
         vZdjc4iCrjjbBNCZJsmKQU7ej00OlLHhlCxYQape/W9Xg8l9q4i0sLtFDN3iEfX3vZvj
         Kw2cfXHPNESH/j5+rBV/g7bEdX9WdbAy5sK0P2COiqCGRZonpOkhWPu9zA54vM8WwwVg
         /vYnHqYb4+AWyg8t2j944hqlB7IOPoPRHCzvxJ+bPLW+8cS/hI8CH9A9zWlVMhrE60/F
         oXtfO+7354oQ2DXxjueeMh2rJJzVGqXaJnI72DMltfRvPeu18D4gpJOSIP/eaqVFdqU9
         e6Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793459672; x=1794064472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        b=Icrygu4bBIsC743hEnKOye9lPLOFl8OG1nYpZlSUtnfYzxnGdMKvlJOxwR2UBb2DwS
         NdcCW93Q/MTOYxqDR4WFGBvP96+VSErHppCA5LMHOMBlY/2n8VzbBn5QxmVzf5GxY9lp
         3XvCSRbHAPsynBgxaq1blrmV8XJGao+mw/cUNInqgtQ/SFNyDhDlM/4A7pvGVG9j91uD
         3owvMMN2Ii1a0VF0V6BiK2lQZyGoY8w2rmtyHVnn3qasKCUr56wMv8n6yfoPYUOSuJfM
         JB60zjM05at/Qg2WfCuyDV/F+qi1ebImVPD5ALTC+tqMXQcy+6jB2TqkRQzg1IKXMWrh
         rqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459672; x=1794064472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k45bIyRIivpuKqlpXieCA/zT+pO2wRBh0svmv0CAixQ=;
        b=IUnz6JAs26lvcdtZ2yQm+TPQBRdqz9oOCcF+Rz9YDLrRvr2/r85hqiDNIe8wB9hnhB
         jAQZJut3Olki39y8d+O11gQ386VxIprW4M8pFJrevE3DUq2aa882KG0AryJrEF7995X9
         bnLGy4We4hR3MNVOur0mMslUT7x5XDTQXUcoPi1C6rY2H+vFON2Ug3thaI96fl3sV0fD
         zySmBvozxZjVbdTG642Sja9GTLbfShIVES4oMOi0vNpD/1dU4x34hDBIaGsfX151CZxq
         XOwy125fvQEv4VCTV9HLcJ2KKnbHwFWwcw9rMJRDTZGhSfVBSnhwBzWTaGSC5v2e9wDC
         kq4A==
X-Forwarded-Encrypted: i=1; AKwUvBxgNnC2dgfHDzjy8t/9I/PQkOVhKl6sTPzDwDi9k64zwrJwiXKOKS6YKehmwRyiUT0+97S9QWGYYMvkLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKov+/UyWPYhEXpyph6K/C3nEgHjfInUetzR71V5I3c8F2AJD9
	qWWZfP/v/GsTURfBB7Zy64HvrxdxQ0dt51c4f+5DcrUYqC8HQEEi7bog3Mo5VbAakMh5XFn9zF6
	xPCQiqkErK9XRrjMnvKxnsWLHAVgswJHoOMQvmR/43TUb4512vg58yThoB7yVs4cHFqQNsOX500
	Sy8YTyuYxNqExBFCezMdqafes8ESIvYl44Jbq6Vpz+
X-Gm-Gg: AYBFou2Y5ej5Gt9NoSV/8UC7oGcY3z5LxGpAT7kdQDjj+caPdZZDD/2+GZXVd3aBvLg
	NME0Flrb7KlzqU8zM+EX/UdUQVcrK3Vn/o+TmJ6Ipg6MYAWqUMHIzlNjcYyGhEQ9yuc2arixBGi
	9HlykMbMCN/SLEwtp5yYboCjCJMLiw0UKjxp3SQjQuIYPt4/kDUWvNkkBvgI6240HaRFfJ4aeej
	iem0aF2k0sTbcuneRaJEX4mBnkLCWFRXc1CJcCmQQq1W8+goKDOU5kLff5/jTq13F1eZ0Fk6sIF
	/pr1vMRmBxLBgc1tQMBwqPSyxfNU
X-Received: by 2002:a05:620a:6ccd:b0:93e:9292:1b96 with SMTP id af79cd13be357-94421585b68mr926453385a.3.1793459671821;
        Sat, 31 Oct 2026 08:14:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93e:9292:1b96 with SMTP id
 af79cd13be357-94421585b68mr926448885a.3.1793459671340; Sat, 31 Oct 2026
 08:14:31 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026224957.1115370-1-vz@kernel.org> <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org> <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
In-Reply-To: <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 16:14:19 +0100
X-Gm-Features: AclHuK-O47xt6538FuV-XMWFTsdZCSR3ExRvh49zm5hewMSlbd2irNFZ3_KkfeA
Message-ID: <CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: fF6mVNBfWXIP3BjynIpZzoa_LBLWOWjW
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae605d8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=J-ewYRROhU9zWjNAoAIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fF6mVNBfWXIP3BjynIpZzoa_LBLWOWjW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MCBTYWx0ZWRfX9vzI77/s9Ykm
 ZW3NNKazhau1rKnwBaM6vhl+BGksotFYUqkfHxCEpbxTG++jZWw1dLoyMHFH7uMrPuttJdPOVOk
 yIgfDO7/mpWH5HoGTXN4xaZEHnDF958=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MCBTYWx0ZWRfX8N6x11IM8qjx
 vlpsDTsKXJQj6EeS6ZS4aXzceuyACIFytlckAtbEVNVCRA+E7btkIHZpOEJRDQRUVb03UQswdeM
 +7Q5SK2+ICpO4HJEOAbJ06MKZ8d0FK1/A71vX0Qz7QoEY4UOt2FTCksjJMQ5NGXsk70YEJHcVO1
 8CBaVWasJPxLOTUY1xQ98WFGjZ6hMVanydsje7CGWpzk5pVvhXkXXlD0MD9qYwnNOp1xZa0ek1U
 jt2AMf7ol6wcWaNsvDWVM695Mb8qQpI1lIe0d5po78GueZ0potWbR1ZWC0aHAuk7o8CKGgoXp6+
 r2Z3QtDxc7bp+GXK7xQLSBXh81m1ho0ARXnKGmgQDHHFXLZCGlj29fvr+YugF7jYBV0aBJHbRch
 1OCpo3X99AfoZs0Czc23GG8A28yIAJLZavF/TTjYYWloapZQpXW5kbXtzBtVWoTJnvyuokyR2qN
 gQiiXx+5vKy97Q1TjPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310060

On Sat, Oct 31, 2026 at 3:14=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 27-10-2026 22:30, Vladimir Zapolskiy wrote:
> > Please note that 'csiphy_res_phy' was introduced a few lines above
> > by this change, it's only purpose is to provide the needed supported
> > media formats, and this is unavoidable.
> >
>
> Right, agreed. Glymur uses the non-legacy path, but that path still uses
> camss->res->csiphy_res in msm_csiphy_subdev_init(), at least to get the
> CSIPHY id and supported media formats. That is why Glymur currently has
> a non-NULL csiphy_res even though the actual PHY programming is handled
> by the standalone CSI2 PHY driver.
>
> > This change follows the assumption that pixel formats from all
> > non-legacy PHYs are SDM845 compatible, that's true for this platform,
> > it is expected to be true for the most of approaching non-legacy
> > platforms, and on demand it may be changed later on.
> >
> > The current form likely is the most compact and the least invasive
> > change, which gets to the point of supporting CAMSS on platforms
> > with no CSIPHY resources given in the CAMSS driver.
> >
> > For instance, note, the recently proposed Glymur CAMSS [1] references
> > X1E CSIPHY resources, which is actually incorrect, since there is
> > no "csiphyX" I/O resources anymore for Glymur. This change can be
> > reused for Glymur as well, and its reference to X1E CSIPHYs can be
> > dropped, but any better proposal or improvement are welcome.
>
> The intention was not to describe CAMSS-owned CSIPHY I/O resources for
> Glymur. This also follows the earlier suggestion to reuse/fall back
> to the Hamoa/X1E CAMSS description where possible:
>
> https://lore.kernel.org/all/lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s3=
3rogi@ndnf7zrtu5ex/
>
> Moving Glymur to .csiphy_res =3D NULL is possible, but with this fallback
> the CSIPHY id comes from the CAMSS port number. Since Glymur uses
> CSIPHY ids 0, 1 and 4, that would also require Glymur-specific driver
> data and DT/binding updates to describe CSIPHY4 as CAMSS port 4.
>
> Bryan, Loic, do you think we need that change now, or should Glymur keep
> the current approach for this DTS series?

I see in the following in your Glymur series:
port@3 {
   reg =3D <3>;
   camss_csiphy4_inep: endpoint {
   remote-endpoint =3D <&csiphy4_out_ep>;
};

Which CAMSS pipeline interface index/instance is CSIPHY4 connected to?
If it is connected to interface 4 on CAMSS side, then we should use
port@4.

Regards,
Loic
