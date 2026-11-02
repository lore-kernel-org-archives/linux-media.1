Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793609507;
	b=FejT2qHs73edwJBPu05cjzUQy4RFgluXE3wPpKSpYLzwTlx1SafhmaJssF/WaQBMDvd9
	 +g0Akco3h/ZfmRWV/CbLGCFrkiu2d9T2ndiSpAD1EORLKVlKh9HJby+nkbZiK4T8kyeaR
	 dWqRsogFo78oLPz9MHxwta6XcdyqJPOI+3d7J2TZAwMKg8zXhAM7lMurosogm+5VoeaaO
	 wF6kK9BHn4JFMRIhzFCJI/+S/t/iQ/U0yqWQBHiVVf8DlDERq+kjSPUH33IQGWHhW8Jpj
	 zDEUyo744W0jRIrHyRNXAi+mDVKknhphfdaajg31tYlPhalj8lJAHGAvbTrKUEQ6dHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
	b=2bLFAo7BlwMAbYM8siAJ7DDrmCbbISU1JKIpoDjTZpyaaIV4PCW2BhpSed+OT6z4nwGM
	 I0YFMWwCEcb/ZIXKJJjRnb7Gc5DHcWfxZ6RX3r/UCFFhWw/vHfP61JeLWXP1+NXC070YX
	 zQNqwesy7MjExPvoWXO0uRvU7roliF/0BW7iszkva3Ek0tk1lu01+JmAX8rYgqd3ZqxPB
	 sSFQtzD74lpRaPJp+cIcKGxGtLfuT0mINIfE5oS0xtIqpLhEPZSOwzK9nxujlK1oJTKEH
	 g1skum6wOJemnWd8eZHRMJ2CDFkoQ26Sasc82X51LIWobzM6IsGhHwXEYE5PDpksrEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XReDPP9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcCp9OM+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4BA606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XReDPP9D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcCp9OM+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vVVq2192546
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=; b=XReDPP9D99nIrwZ0
	yotNp0bmeTYK7gdFNJbZWdLk6ND9e/WfJeEZ31tdc3XvoRbX8cL7O3X+qQUov+ZB
	yl9Orz/hsy8h1PQBjrQghdjRTQw/9dDaU0goyswbeGLrVN8WWLlD/GJK3N3Fm5ue
	9tPNVj/wGVNYkRfpVKjTkFZ5jSsphgGdqyLDq+gxOJresz5EeS0H03i667kCgyCr
	o+zKPjG4nrn9Ml2Vd7YneU6bGAiQ9UM8dJa7lMzoduhwaCRB/xgEfctglN589pZH
	BdP8acUyhm0Ca5r54pQ47R8hb8s0PbH2aaJ6tiRzvZifvMH/Vi6ehQmcl7KnntGV
	F+x1Pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93envjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 08:51:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so513919085a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 00:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793609505; cv=none;
        d=google.com; s=arc-20260327;
        b=qsg2/qgh9b6e/65C3Ae2YrcCC+8dpb8DTp+op3yRaetzG8RqbvRBDoBjgsoLUSF8qB
         ElPAP0v00IAd2twnYbh/x8NQ6STT/YqHQafaVjcUplnj8/hQgtKC9VEDMc4U8nr5AR80
         M8Rinq36O3Z/M+Jk+7FP4PC+WZUwfKO3i/eaD0R6DbHkV37RkJu3UNTJXs6zRbXbaSSj
         fd9Fm6+Mhh3J7j1PEGDF2ZKn8Q4tE0HrYE0+4QnJOAbO1qQ5JRjCwN2VpCinPKJ07FP8
         StJiM1G508HzxES8zlfPj2zBNkdzXpwOUbdlIfqdjq38qkCi7uc8XMscwy3LFQGaKVg6
         dkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        fh=90wQeQwNDCKfn06FJiklV4Yhv7tU4GnahgYYLfHzkdI=;
        b=OT8Nr4MWVpCZEN+r8rCTPMvoGxLs53nhHgnHmothW/obY3finfpGDq+EAv0Em5NohA
         WthkUaagkYTUeZAAchRa1d2bNlBDnbAaPpM0mpc5cFuS7u51JG7uM+D77apnC3x0wzMf
         lYf5BVqCr4Fe2SIYxwQxOgn7+/3b9fC6KiJEwEnJCBldh/1PjG8R7JrbLTqQE7y2O9Mo
         Zcrqp1g7P5+NPSSoY2TRTD54r/Tw1jpUR4oBoxxRhTSm/kJ2JXrmye44k3ILrSE3AHCD
         leUB8mShNLlRvxGSuUa2wcb2GxMWZGgUprwEUF3K7XCd0kJtTN/Cv5JCS16RSVqUegVU
         06mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609505; x=1794214305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        b=dcCp9OM+WqesPeKJPtsCJlDxgF8VmMh5jbak7eRQF+iarusZmVzN09l7P4zckz8YCa
         DfGAXuJ4sflHeN8o/HVvcJHAzTo7gryGlOaZvU7lh1dFTOlXSOldnqYAFxSjY5ElB4k+
         1c96Q4dQBEACQiDjMT3s4D15on6EfMijweyXs0+WnRR2yr8iUTum106CkjmuCUZNW/CD
         koZAmeEQUg1EDC3r9PBFHpEFx6VyZ0NdIOhKIiTGQeK7Hl/1hWRzNRxD5QGb5ztr6/Ex
         MUUdjrxRAnggdK5WDsSz8GPc/lzncFE7U7W7/9ZvW4gr9kQCMt3Fet4VpxC/XclQQXLX
         Nudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609505; x=1794214305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        b=TvlffpTldqeJFNrXPJl0OOjzfxOUeHLuK4Taq1NQDe0GxhBvlzDyMdVPrx2bh6v82c
         ai9g+JU5CYRm+T1up/hoLisQVsEPW4ovXPBtomyuRUg949/01pdKZeAiOBOpI63st1/j
         6juKWtQHe45dv8Vj9qwpXGyTY88WuwGwvn0lxp/NhrWm6ApT+fTJb6GCpT7lsVvmrSrh
         uD+aLLOtkWZT8fvnVicLutpSoz975w8L8D7V1cl6hxneZHkfU0qt6Yl/2HcCqg6VCOKF
         vwBLXZSox6ttQd+G9wXAO99W3K4hjJ4In/Le0OnYYX9MEWAdZrnl/vRP50XsxTk6tW5j
         V2gw==
X-Forwarded-Encrypted: i=1; AKwUvBw9ce4nCbdQ78KsR/vkazAPbwmP1qBXqnmrqHUxKm99r5Qh+XlDrmZ3y1UKdksXTA9bcGEHEFioM1ye9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgPO+x5zcdzxJsixwtKo8XQcIIefXjI/kINeN6jRT1K/zrKLGt
	7TXczLj4/2Ct2b1crmG0N3yv/Rs+Gbu1uTyV9IeKw6yjRo4lZtl9SqxW6rLYZ/cMMcpMu1yuv7c
	SNuvlK2S8MBd5oNRwPc7t81kcESlMLmDlGl8B2/q6eOMufpzfV2u0XlimdWkONbv8t5qIV04VBC
	IuHa1JkSAxpdvUsTlgL8okCTNBB7cNhZwJMwyiwhdk
X-Gm-Gg: AYBFou1TWMNpYiNnKID4SOVL3d0cIK8rdSsFMjkX8FODIdCONTYy3RngB+bvN3RMmnU
	eGgOiWDnw2ZPDud9/X6INvDCKkG9qXDoG+HoHSs1G7aZSkUOs3e280/CNkxHJpTQN7eKtZYEP2s
	2cEDqVUYXin2SbQwVM264Kv9UQcy6IWL2cEpIUZ6InODYTcFjgiGop/DvTxnPL7hfGhnuhxED1j
	hE+9VCyqzTdRbXki0ZjXunZ+bGc+ms3lxsKdekkuIDEs5EwxHTI+Yz/zpb3EvJDAFtAguojSv8=
X-Received: by 2002:a05:620a:2b9b:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-944133f0eb7mr1861959085a.39.1793609504825;
        Mon, 02 Nov 2026 00:51:44 -0800 (PST)
X-Received: by 2002:a05:620a:2b9b:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-944133f0eb7mr1861957685a.39.1793609504418; Mon, 02 Nov 2026
 00:51:44 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
In-Reply-To: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:51:32 +0100
X-Gm-Features: AclHuK-EJcKoQq8ZTaXsIzEoJvTlXhA2-TZ0zFrIKuJnpNWnR6DDxucUMC3DkOg
Message-ID: <CAFEp6-3KgeKHEFtbyuZRd2PW5uiy=ofWP9z_FnPaqJo4qDL6sQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX+8qwme2/X0bC
 32+gpwuJNX3vwqEAVWC9PrMkk3X3cC4vU6mqrZCbkbSqesqvb9bhHFQGjaNqh6qPlS+FscI76mF
 S039qinW/sjKVjKYAPCM/PIVUvhi5Pw7JIRJbO8Dt9eStNqxcwt7COaYIOoS4MwyD0G7Av5e0nC
 CF0A99nPCrgf7kdxQp9k+0UchwZZX+cmvB1H+lMOdPsBnwihQPV1KFCpm40+lHIU7n9lzoGmgc+
 Dy2uh56QjdI7ZPOYkgeztGT5Z7jRLCsZY637wPJszU+TXa+Q0O/3fACr6nd3F65G3NyL6iPSMlh
 eZHWCGDFZMauFSh2e4Sb2XsN44Y19xZNnZAZLVoEnugXagkXlMikBpYFI467Qsfsbzl10B6NMvk
 YW4Q5M4NsnAnoKaA9PcHLuxPbzcWOEctsC64PaSBxvalTprVOZPnjIU/H3wJGqJUm8OxogCYyuq
 egvh+YwdGn7t4/LBfHA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae84f21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=dZbOZ2KzAAAA:8 a=LO7QhAU4TRSVvaEUstIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: w09Iyn0FdDhCeoqRK77yE5bomfhzFe2F
X-Proofpoint-GUID: w09Iyn0FdDhCeoqRK77yE5bomfhzFe2F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXzkSbMRNi27AP
 MTHJS5vmKcNrGSA6iTL+RJfm1IqSuqz96/p4i2mBT4hsXJZTGkNwvDBKQw3p09Wq8sH2y3IEOSW
 mTv1koPpzYwLExppphJgpyQ1XZANCZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

On Mon, Nov 2, 2026 at 7:58=E2=80=AFAM Shuai Liu <847807867@qq.com> wrote:
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
> Select GENERIC_PHY_MIPI_DPHY, matching the other MIPI D-PHY consumers
> such as rkisp1, mali-c55, cadence-csi2rx and sun6i-mipi-csi2.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9..b18ae4405502 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -8,4 +8,5 @@ config VIDEO_QCOM_CAMSS
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
>         select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY

So do we still need to select GENERIC_PHY?

>         imply PHY_QCOM_MIPI_CSI2
> --
> 2.43.0
>
