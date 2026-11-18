Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992542;
	b=S9D8+oW+gBEsdDaP/v2JCKI7XWkvUlDzJZmybxHA/+FAMlxsonRRKTHoSjLKouFc60It
	 cwjIpJle7lgRVN7Imv67rvq9SXlCknPmbeJHlnlJmmMD0LylCsoo58WsvNaWlv+DXgUdN
	 /yzJdp5CVteE2btNlhGVKJhkmcv6OaLdyz1Iu5xL98aZM0zNyFxazwK6ej6vS5EG2wIEs
	 hx7/iA1ZEHAHj43i8p9MRPDaVaoHr6+9m4xWFGYITmtx9XWlr6LYcLsAuXNiZ838aPEXA
	 uRalvnXhsBm1wZXirfLq2YfsIfGSxeXodWe9CUgV1YnCSEi7pbd9F+TK72wlzXs7Usw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
	b=H2IBZz4M4Cy/DIqQu8rE7ioP+BlPmw7i+unx9q5f2BKnm/en4RmGr4cFC70bqCRbQkke
	 mg92S7hvbd6KmDrZQLWPoBOHmTLeFKnRLgnsux8wR16hRTuf9vztqu7BB468kf6q3qiLM
	 yCR6ywJzMeTn8WnQzSZrwO6ipCWq/WLHibv4WHYuO80hdnxyxyD3LRV3hxDICJqGvdNrH
	 naIkyKR17txtpoVci971wO+yvHZvuBb1sARtoGTP17A32dfwjHnowNxo1CUYbdjJxM/8u
	 tmNbKWSeQy8X8Er3iMZa0tXIEgnt8PHG/MJQRJPiGod1U8tKgbVRZPwIKgqbgU1ETyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fa/9Iryi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/qJa7Vs";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7059606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7059606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa/9Iryi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/qJa7Vs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8CR102602430
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yyZLaNLsFBfc0JqArcrGxcWE
	FwZyPv7YYEvEtfwd+rk=; b=Fa/9IryizRttAHlUczN/6wai6NYxknNzBYBuBmRe
	NDt4VFh45iJ7hI+MPeJ4R2GM9riVStt4nxDR4y7MF60N1Ilg1hozREdZGUO/fea6
	FRVcg/9sS6c4ubwFp60b1dTvcV7OO09I89EJoCIRlrBZ0+ZFgUyV9SbuDmcZSYYo
	rzmubtC6D0DlMC9+7Ql+yf8bUi8vhMzgK4fl0sJ+nkqlv4xYprIv+z6ZrM0V9DBK
	mP4Pr19Ez5j2LwV4H58BGr/7PMfNz48w1KDCre8iWrNi1C0KtSXiJOvjs05senUV
	px8XfQEY9nsOAUQGfpxynRuWxEeFTTKo2d33wfGYtWyGxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv727x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:02:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so203410685a.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992540; x=1795597340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
        b=R/qJa7VsEeZkDq9aUm5JDwLdXSB2zBjyBAeM6nnrtbt7+a0tzhCn8Adn5HF2LlMDX+
         8lo7VNmtzMYSjsGU6IgxZ/Xkrg/+m+Epjx4Y+FTgy3wS4YkNx2dJ5woG/5sSoE5pxLEc
         oeVzuCBnZXq0KjHxEUqbqAVIUPjcjzmEoqZwfwkNvZjK+HeTiXdrpfxX/52dTQxzd+Si
         TDhKfpSmKdbXMBXzuE9ZjgXlAH03xSRYxGW1GAxo8b/PYdhrayQ2U028fqdYNGxnqML/
         NFKhP2N6Bcmo8VkeAkV/mx5d4i1UzLq6YfTsV7NmAfaFM6610SE4wO2vXoztAvqkLHjR
         Unpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992540; x=1795597340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
        b=jPQhgcsh2Ph+al99ydQYjNZZgGKMqMWysWzNAA1LXXVBOYTn8vSiwbEMJP6WEWwC5b
         La8m/4mYXFaqfMM5FTLC3HP8cBAElsU6ealYb2zX6MhNshPliGWww3elv2jnQX9vxZ7h
         sW2V9I/MZ9nR3de3hGEAzruCqinFF98DnUkbrZrdxEGnN2OEztnRbLPbtA+JEHJVqZr6
         Cj5GbgZEZxrmOaRYw77oE5Xsqyz24AFUMxhyB5nVfYqi9SPwxmaKPVJkd3aYw3gP3XyX
         AiQY/UMTyYt9z8/OBPhqn3WoAzB8A29kKZesn4KrlZoa/YeE1yPUVssnpOx2Gh2/BEgL
         7aDQ==
X-Forwarded-Encrypted: i=1; AL+hErEVTYmQKRp5vbMJLIOueOMXCEMxMqF+xUw77dZe+sgqLH1rCP0wXfq5k1iJCvN/BskpWmoCKsgjIVcS8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nCjZ42C8awyOfKFrhPDRYSx8LLd9AjlZRnuKg5YVKgh2xAbM5
	n9h4xt69gTySr8ngpIOY2q3KQRms9bjy3L+7ZhWWuRVj9oYMs+D4IJZWG0X4pSte0UMPDYVQm+x
	crMvcvFYvNtjr373tL5ayDznjeRQKv/VkmA2QU8aL3F6DQcj/1BZE+9A5AkrK69MKkg==
X-Gm-Gg: AYBFou2mqLfFBy5m/NdrvTvARQJFVZDlrLPSBPvtJs1/jNHwokiU/v3pEW/kZdiWK8z
	mebT8wdGXKs0xO2zeS7gDfTjJbRDFRXbThvaaqcjwkMtVjC6U5MH7t4ZDppklCbZ+nNE+/+3utD
	zFDr7oxvXSC0BAIafP3KRQM+tBMjS4J8eTes6nSGePH1Or4XhLzfoQw3j7mHe0WRx656qb7MeVM
	wck6ElwJeeE6L8FOZgdY59iPlLtVABu51vZjGV1P7wwU2X1KfLrq1X9PxivVWOw3h0TFxdSUX9q
	SktQSyG2aEmIeKjhSbTeIvpKeS+MkIDYIM0SQF+eRcOgsFGFxdHhfVH2mUgbgE2Fzn+yusIgorS
	sDJHm8wU63FKh9WSviCfTtqNiCE/cDrCoKRZeRZlGDAsFngAQHfHs9mAlU1buex6zAbLo6Mm9Wg
	LP3RPVaLPhrmjC7jaWCSfhslONlNWxLhvi5SRjcOMJU7pG1yxbN78gnALDOSB1Aw==
X-Received: by 2002:a05:620a:628b:b0:93f:2c95:658c with SMTP id af79cd13be357-9499957e6famr377684285a.14.1794992539406;
        Wed, 18 Nov 2026 01:02:19 -0800 (PST)
X-Received: by 2002:a05:620a:628b:b0:93f:2c95:658c with SMTP id af79cd13be357-9499957e6famr377675585a.14.1794992538630;
        Wed, 18 Nov 2026 01:02:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae67b429d7sm4551491fa.36.2026.11.18.01.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:02:16 -0800 (PST)
Date: Wed, 18 Nov 2026 11:02:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
 <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
X-Proofpoint-GUID: ts1tvIv9nHOtpssNirw6CR-sj5Vc3ti8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX3mlQS3eVw6IK
 t1swcmv+vvro3pMJ0Aw0wgirOLmdaejo8Y2ANA2LdeO9E70F/ybTTCAP1GMZWY8qjUx17aiAaHB
 XsaSAflJ+T2RTYMM5Fp9NIfpx9g0Pdo319bGxaewJX6MERkmptRGl8OeWU2YMPxykFYWyqhl8X9
 Fp0QawppZOfLq373kDIPt8wERuWbZJP/toFmjGQGlzCQWvvDvROa8cvWqADAGlbMJios6t67r7X
 l7GGqqeRbkcGyf+k1lCxDrtw5tCRsoCviy9qlFc6oO/3qoK13IH+6FoU17xNncSFdPabcaaRpoZ
 kTLSD4XhsmKAFEjYoRbhA8ELXIqcg9DHB/3yK+rYqbqCH3IlI8Cj/60+Giyoon9WK2YI0IcXfNP
 UNCWESrvQNwu1usWhO9aXJjVdDRAuSo1322AY927D85hzqDlqOnJVU6legV0s9nHsq8VNU+L0Uj
 2lA2xVIPOoqSJJ6AxAw==
X-Proofpoint-ORIG-GUID: ts1tvIv9nHOtpssNirw6CR-sj5Vc3ti8
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd699c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ypECYpogRKzTefqxK8cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfXwVFXgbZDteUz
 c8g8RMwjL1MNji4VpDnuiC8ZS0FUnoooFkI/UKqzAt+u+51tBYxkdqKYDp3euJ6rBft7q2PlTih
 UzALHmUbnHr31Iuih70HXryGxLREYoc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035

On Thu, Nov 12, 2026 at 07:10:38PM +0530, Vikash Garodia wrote:
> 
> On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> > > The OF_IOMMU code relies on OF address parsing helpers, but the
> > > dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> > > of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> > > annotation to handle configurations where OF_ADDRESS is disabled.
> > > 
> > > Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> > > preprocessor guards and __maybe_unused annotation.
> > 
> > Why? What's the problem that you are solving? Why is the current code
> > bad?
> > 
> 
> The commit describes the problem as "The OF_IOMMU code relies on OF address
> parsing helpers, but the dependency on OF_ADDRESS is not expressed in
> Kconfig"...and instead the code had checks for config or __maybe_unused for
> cases like sparc.

What is wrong with this approach? What is the problem? There is one, but
please state it in the commit message. Something is wrong, otherwise you
wouldn't be fixing it.

> 
> It was discussed in prior rev
> https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/

That's fine, but the reason must be capturedd

> 
> Regards,
> Vikash
> > > 
> > > The only architecture supporting OF without OF_ADDRESS is SPARC, which
> > > does not use OF_IOMMU, so no functional change is intended.
> > > 
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/Kconfig    | 2 +-
> > >   drivers/iommu/of_iommu.c | 4 +---
> > >   2 files changed, 2 insertions(+), 4 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry
