Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB54772B9
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018225; cv=none; b=OW1BfrU27cXjdn+iPNeX5vAendfcTlkC2AY3trlYPtx7BjnsNN9VcXtvjKsKyy8b6QqwTlGJ2NVTlQPueBDHkXJp+Qxbq//BMt2Muhu7Lu+iQ9uaYFbueLw5y5zaN/AyC1TfSV2WLi2XfSRqGh1T7ngSwsu63rE8XOz5EGGw51M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018225; c=relaxed/simple;
	bh=epfdEmdQWF1LXChrd7bCh2YxTWsAOg+WkUubgRu4MNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0tk6dwFKpCajbZXtFYaE+NFM8YcOWteHmyI/15xVg9mHkQrmHDI5/P5derDua4ubkqEY87bHHbz/kA7zlhtnmLmjwJK71IQqcrMM6xkbimKKLBCe/nQHTiGqWG6kWW9nW4osocNcS4reAVfmHgMeSzppbD1NkDgW+HwdByCa1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+hgvKNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+0Iy3y5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+hgvKNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+0Iy3y5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ns4K1278138
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 12:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rEBv5mbQUcmm8dCs+CeVZBi1
	W0eLFbJkEKta6P6jcRM=; b=R+hgvKNJFn/qo6+lLddsRTcAHQIOHY/RCzW82gto
	/AlTj5Omt20bsLW/TOfBZMHVcEfZkis7bC1XwME2vl2BvebK9nQgb0UhB3oQ3y6k
	QkryNJtAn0iNxdgKBgHGrogLlSrtIxqJHrZGR/pG01BC4PADEQJoEFWp0UZXBAGC
	adFDJ1mV6QZVGP7GBfilAl5dbXLE2zOZl0CxFYQBrXYL6gYCXZ+lAHMosY0hYu4+
	BRlWBsfIY4vX3IRuRtAUNGWhGwwtR+pZrNWtEGCl5GshVHkhWcTO0yWJUlk3Jdy1
	H55FLsbjZmiDqAew3t9NeFI1SZKldklHD907u9qstCEN4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuej1p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 12:10:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso22671231cf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 05:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018222; x=1786623022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rEBv5mbQUcmm8dCs+CeVZBi1W0eLFbJkEKta6P6jcRM=;
        b=F+0Iy3y5C0+Rvj1drv6puE2w4U3pxcwOHTsuL0xcj6kuK/PkiruHwfnsnMgsVnrpWk
         CWxWQU9Kq09j71tlpEQFSZZNG7JTeSbkvAq7CCmutf0gzt8RxS2rhaAq0xCcMZl6ux9I
         u2iZwh9Kwk35PX9xSbOwgksy5RbwTB/PkcqvG9a0O/AesrptpSJHK8SDiPI54k+rk4Y2
         OWmMVpKYD8YsA2W8XvI1aie5bbdnet2al5ox74OnTF/VyxI99LCvicxevHI0GUPAHzzN
         TlkUYJwbiGwJz45x8AAzp42dzIn/ImXPA9tBj/KlovHJYlPegCSQs8u2Yvr1fKPs4wHT
         /2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018222; x=1786623022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEBv5mbQUcmm8dCs+CeVZBi1W0eLFbJkEKta6P6jcRM=;
        b=QdcK3xza4J06mI/4Mt4T4GwrJolyGKMHz5tFZeAuz97JWk2RpsForuiF66bcHf91lN
         ZMgsezs/j2bNe61W9eEWAvFz8XOxX5ysDiAqkNTDj5klhkrT8gjNFhyqWMKH7prdBrU8
         Mjdim6NLq0No5B7YamNQyGSvdvcdpD0Hd+0xgLMgjiSfW5aEVz1eDSBU0MJhGuvJo/bI
         OVjSLLFEfAkjjmyhM7kxohrhgBHGjlQvosOY2PCS03rxP2WDLy186BComv/YJoiGw0/s
         vT6oxn2EhgSp/a8gpORxRa6E3+QPiGBoPKAEHKIr0r+Hkcz9VHBVZ92k5UX6I2FtSYRx
         vOtA==
X-Forwarded-Encrypted: i=1; AHgh+RplsIHdzskAEWaPhAYvkQ5BKQSzsfn4+rNsrGzqZ8g5kJwMW8kwM7dF4R8HXEXEY4L8r2kCykhfSB3SiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRmR10om/eMQNWy/8du6HpPhFGl4oeYOHZldMrQVpC0kD5U/d
	P9t4/kS0TyAOYNOD4jyiRW25vQS4EO2L1wJV3bWvioEXefIvI5aGvKgBzhVpo5LhBikz2CQPVca
	j9BkgyiC38SXNN+bMD5AHu8a+Om7u8iO1KnScWs9xmRJMT9q0DRpNlDaK2s77X2mLIQ==
X-Gm-Gg: AR+sD10NyA7UQdgJW1i5cjZeUEb0D1qV0ID+NJWmFvqO+Pibw3dXHKztbN2Ux5jMuYL
	xJJqUe2u1z4R1ij0mcrW1VhZkq41BBvEhYEPh/+OuMoKf3yrIypE2ZomnWXsyI3iSSsX2XvAMhL
	24GR0xTleLgxlHg7hvRdx96NarFOSEWBKUkHzGzDD6B0tXBp/Pe0rafhWGZsSPpuuJgjdzcD4IE
	aEnHGALYJcrl8LDlUn8GTFpl1hWI2YMkOAOWkCzg7S0hyRkOPaZa+6qjYjMSSWdtEA5o8HC8Xkn
	p56/WuSYOgd/ZNi7SmXTVc6ZdPDuClKtaT266o6fR7t8tq9jAoZWKnKKYCjhdNcu5+xPVIJX5cy
	OW2drkgQaG/clzDw58W1pEvk4p5yKqn0MkFYloHo5HQoigdT3mv7qhuHvQ2WmLbtQeJyPEvpomp
	U+64EhDFZMn9F8SQ==
X-Received: by 2002:a05:622a:1ccc:b0:51c:9b44:c59e with SMTP id d75a77b69052e-52ce60d3fd2mr155473531cf.22.1786018221986;
        Thu, 06 Aug 2026 05:10:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1ccc:b0:51c:9b44:c59e with SMTP id d75a77b69052e-52ce60d3fd2mr155472761cf.22.1786018221498;
        Thu, 06 Aug 2026 05:10:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62af4d9sm675938e87.49.2026.08.06.05.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:10:20 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:10:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <dpyynzha2vkpbzmhspeinfe3yhl5j76vrtlf5vhf4dbm3tluzh@36qp6slwsfsq>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <20260805-dark-voracious-jacamar-6aae4c@quoll>
 <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
 <m4rccl6zsdzmkzntc3njv3uczcppva3passjr5ukmru5q6rylx@wlwha7ydttfp>
 <163c24ba-6b78-44bb-afe9-3dcbb4d47475@kernel.org>
 <zqpgl3esozn4dgnm7remmwmquxasyc4qpyh3fgcdfblmn2xe3g@vhp5umdahvmi>
 <9921567d-4b3a-43b6-bf5e-eb0e92102e34@kernel.org>
 <npojagmk7x24wpbqcmzg4mijscqz63aluh6lj5uaciztzl53wl@ld342uighqaa>
 <d0dfd058-f0a0-41e3-a7ad-89eccd0571cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0dfd058-f0a0-41e3-a7ad-89eccd0571cb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a7479af cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=9BINTe81hO8Yagh1QJMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2Ga7BGKK2V-arLYiKGHkXMdAZDAHka5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX5CK8+apLIWM6
 VW/yiaSCZ5UJ62gpSf5bCrl00+32VWuVK/QY770RmiQIWLPkd+e6WANIepRR2hB3Ubl07k23z7Q
 NZqikzoU3JqTA0HAbtOR3w1E7GRkpin8Z8LVuds6CM5M5//O2AuFrCZq3qNgUwQ+6Q3ePJWplb+
 OrUSbSoJWdpiAhC+tMfypW2QC7Y/kAo8mLwM2CjfyhieM6yU3WlxsuA2CPpgaaqVqf1q2kWJbS/
 US9JaDjhVq8qewKBYHJ8bFBtB+mRBuTe03y9dxrGtliwo2fpUVYhGkH7jyb87ha8PL9Vcjpuepj
 pzyPVRIJ+b/2UxsFbxgRVwd6qNaWCkikJ9By00CnMnVm5ySdNnz6nRscJvRp4qipV7BG2sy//wD
 pbt1TFy9gFHXUn7j9jQZ+6OQwkVkdK7J/fZ6UNOcMfyCguUyG+nQigprnKXL+Hr95tnCetTvmWD
 98nR01aDZMUgzExmKrw==
X-Proofpoint-ORIG-GUID: 2Ga7BGKK2V-arLYiKGHkXMdAZDAHka5D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX7xJ0T4bB8Bno
 hFNMA4BbcDvkhs0wlJqQYSmCRRt1GO3V9iZDCqXUaXo9jnwTU0tzOeRumYS3FGDhrZhz8n91Ewj
 EhUGTwvBqrf04zP1Zv6/MFEM22EjORw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060095

On Thu, Aug 06, 2026 at 05:26:51PM +0530, Vikash Garodia wrote:
> 
> On 8/6/2026 4:05 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 06, 2026 at 11:36:45AM +0200, Krzysztof Kozlowski wrote:
> > > On 06/08/2026 11:22, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 06, 2026 at 11:11:09AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 06/08/2026 10:46, Dmitry Baryshkov wrote:
> > > > > > 
> > > > > > > dma-ranges tell how this bus - so venus/iris - performs DMA translation
> > > > > > > in respective to parent. Address/size-cells are obviously also needed if
> > > > > > > this is a bus with addressing.
> > > > > > > 
> > > > > > > But there are no children with addressing, thus what sort of bus would
> > > > > > > it be?
> > > > > > > 
> > > > > > > It looks to me that having here both:
> > > > > > > 1. dma-ranges + address/size-cells
> > > > > > > 2. children without bus addressing
> > > > > > > is some sort of abuse of the DT syntax. It is allowed, but does not
> > > > > > > really represent hardware.
> > > > > > > 
> > > > > > > IOW, dma-ranges alone feels okay, although unusual, and it states proper
> > > > > > > DMA translation for this bus. If you add address/size-cells, it means
> > > > > > > this bus HAS addressing and thus YOU MUST use addressing.
> > > > > > > 
> > > > > > > If my understanding is correct, then solution would be to add addressing
> > > > > > > to the children (so unit address and "reg" property) or drop
> > > > > > > address/size-cells as Rob pointed out. [1]
> > > > > > 
> > > > > > Doesn't dma-ranges require address/size cells? In the end, how can you
> > > > > 
> > > > > I think it does not require, at least how I understood the DT spec,
> > > > > unless you provide actual addresses to the property.
> > > > > 
> > > > > IOW, this requires address/size-cells:
> > > > > 	dma-ranges = <0 0 0 0 0x10 0>;
> > > > > 
> > > > > > specify the DMA address if the device doesn't have addressing at all (or
> > > > > > MMIO-style addressing)?
> > > > > 
> > > > > Yeah, that's why having here children without bus addressing is
> > > > > confusing. I would interpret it that, children are not on MMIO bus, thus
> > > > > the venus/iris is some sort of proprietary bus with no mapping between
> > > > > parent MMIO and children nodes.
> > > > > 
> > > > > If there is no mapping, then we do not have 'ranges' property. But I
> > > > > could imagine that such no-mapping bus still provides access to system RAM?
> > > > > 
> > > > > Actually this feels like a huge stretch, so I tend to think that the
> > > > > only reasonable option is to have children with MMIO, which would make
> > > > > it explicit: Venus/iris is a bus which provides translation of both MMIO
> > > > > and DMA addresses to the parent.
> > > > 
> > > > But there are no separate addresses for those subnodes. Would you prefer
> > > 
> > > There might be some or maybe these should be the addresses of DMA?
> > > 
> > > > them to duplicate the addresses of the parent node? Or would the
> > > > 'ranges' be enough?
> > > 
> > > I made mistake earlier - 'dma-ranges' without values is not described in
> > > DT spec explicitly, but should be treated as 'ranges' without values,
> > > thus direct mapping from parent to the child.
> > 
> > Documentation/devicetree/bindings/iommu/iommu.txt:
> > 
> >    An empty "dma-ranges" property means that there is a 1:1 mapping from
> >    IOMMU to memory.
> > 
> > > 
> > > So it also requires address/size-cells, just like 'dma-ranges =
> > > <mapping>'. And dtc checks/reports that.
> > > 
> > > I think therefore now that the binding is unusual (because no bus
> > > addresses of children) but actually correct.
> > > 
> > > > 
> > > > Or, thinking about it, if Venus / Iris have 32-bit addressing, then
> > > > dma-range should probably define the limited DMA range.
> > > 
> > > That's another point which I also raised to Vikash already - mapping
> > > should be restricted to 32-bit if this is how the child devices operate.
> > 
> > Souds so. Then we need a non-empty dma-ranges.
> > 
> > 
> 
> based on this discussion, below works for schema check and dtc
> 
> schema:
>   '#address-cells':
>     const: 1
> 
>   '#size-cells':
>     const: 1
> 
>   dma-ranges:
>     maxItems: 1

If this works, then LGTM.

> 
> 
> Now in the schema examples, soc is added to match the reg/dma-ranges of
> parent (iris)
> 
>   examples
>      soc {
>           #address-cells = <2>;
>           #size-cells = <2>;
> 
>           video-codec@aa00000 {
>             compatible = "qcom,sm8550-iris";
>             reg = <0x0 0x0aa00000 0x0 0xf0000>;
> 
> DTS
> 
> iris {
> ....
>   #address-cells = <1>;
>   #size-cells = <1>;
>   dma-ranges = <0x0 0x0 0x0 0xe0000000>;
> 
>   iris_non_pixel: non-pixel {
> 	iommus = <&apps_smmu 0x1940 0x0>;
> 	memory-region = <&iris_resv>;
>   };
> 
>   pixel {
> 	iommus = <&apps_smmu 0x1947 0x0>;
>   };
> 
> Please review if anything is missed out.
> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry
