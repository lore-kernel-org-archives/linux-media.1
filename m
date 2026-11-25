Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595083;
	b=scJkWByKRdQWr9cFmgkhOmJ148dSftsBwbO22ITblvxNL+pLOdtyiBs0yydGwWISJKGm
	 /wUkQOWiyqEy/4dQBWsoXCV4lYSMjS8ActSoXD/O2MRlq/0EO7CSdfRzlYWdPy+KBHeir
	 HOfcSOAAUcaXgH2j/3KIHx7ex3wzpjb1f17z09ETeBQbrChSMLBe5aCTuV2SXXt+qr5au
	 U6eD76y27G+nNLvn/SG8t1psqY3FdXc8m+J2uGM5ZdXJzRT1fzIlJQuGHyskIyjbAHVep
	 pnhc/RdWv8YM2r+ABlUsXONbNSKBgh1flmEZxN14kG9J7L+Wjnq/0AtwHT+pF1oQZJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
	b=zaG+xqjpK93bZVmbYsA/hWPRUGdtR5/VKd3tJ36tUI+JIuCl6M2DjAvtnUY023KdZbW2
	 grNW+4rPIJcyeBj/ojeKipmoE+G1u314fQri2oVUb5MiNqlDw70YzyxRg9OBlkPejRRPn
	 MdNCKfo04qyv/tnQxTH+e92sxennIm7ggOI7KoLCeaitvnS+k1eWvkg6XQohDo0Rk9lk4
	 Xo8YE9OmIoCWjqLUXdZfiNnSa7Hm5Sj/8TxLf4hcy2q97YACfEZipQvdqNkAB8XIlplBZ
	 n5F7Q2QVhL7LDbo1R115/6Suqv19/i8cVKoLZVxRzPg1rVn1Sn9w8ivWHbT6W8T6t6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92D606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A92D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP694oS3261861
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BdM9Q/xl5hWaDb0Py4CsOxN1
	/hp7PbnoEf6nigrne8Q=; b=O2h9MJoWV/AfAtR5tRhLdiOCEPlZIjiYRe7I4wFZ
	nq9SUokANCf223aBkVUE3agc0E88bGY1LEAtBMpFPh8GWQkWyuvI9UP3p7bDrzfL
	X55ukqheYvA3VMcRGr41rL/17jFLe40l4Lp2dH2r3Olc6aXp9fT6EtFKOnnGBEI0
	tvgn37zO8/0lG79RX1c1qvTJ5ninhyiNGwIWy/4xUZXBOujXn5CteKLRFngfRWVu
	FYpP85RYCAbHxXfHN7CAW/rLDcu6kiqCRozmU0pi75yAYB+fWcz26PUHpla//phZ
	uE5vnGA5KEKmc2Mury7FKdGlJHwPfQSAWRXB1wXCEjK+kg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsb6bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so273359eec.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595081; x=1796199881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=iCGSPVEdUzQgFEinM+9YpBoWPAecyxV5EmdXArzqiwZfQgvF1BRD1B9IQy71e1+QJl
         YT+xjLDmpoj5aB15NRY2KYoEK6aNc690JcKbaTQ8MiGDlb2CaOEROzSIYlW/9UFLJWQi
         Z0d+Dru0YoaR5clZ1QgCJFwkbV+OernHAZraMhK9s773cVulKiZw7ZIGlFE1Jq/p9mIo
         EraLUHo+/oD6TkrTlA1P8f7gXHO1fWmLzkzkvTlZ+7guRv/Ko6vvR3sJkU+aNfTvtArv
         cI4O3qjIdqpnbYnEf784SmB8swWtLZDcyjdTOQnadcadvw46XozbLsNDVEpRY6f0pcdO
         Bm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595081; x=1796199881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=XAx7mePTONl6Pq/4H66IHQ/Fc1i8cu/9NcoWXiFkFwk8CIDwjnIvSZbAuGX9NlJJg4
         KKKwsFAgsUUktftcqfpKhG8UkYC5mVFZWP3sVlda9ULHTgK5IHLWFN5cunNEPI1W+ql+
         khIqIK3t6CAOR8fkhZPdWazlh7XKiy3JoOWx7w/JSS6lp7Lw2OudQ42K7iXcwxBqB1i2
         UOW9uxqAKZlHLpYoNAIIPkc5Gox+x5aL+858JaRM2Zz8tx9vBLaIOMp+OAKsN8x86EfT
         /3HpWalHINS/o0iQ9VFn7GF174IyaphrX+Cm/Iy/LeLoTHUKKBWh1mpdMlKi+L3rUKyQ
         TepQ==
X-Forwarded-Encrypted: i=1; AL+hErGgl6KG0BnijAzQ7P9VV3xgIlq8ARM+IxKMZoJtZsqZJnB8iXzlO4cDkEZh7v8gcFULawykAsefTTyntw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lTro8useHhrEyaS0PBNgQgwikTmEKMUu9kEVRw5vRvqAzQPtW
	1+PXnoD4y1SE9CWrLs5j+CL/HSsKWV/vEg3p6DqUTYF7ec7N8lx9itGpj+zOuOidIAYr2Jx1OLF
	zDcqvzB1SshC77MDXg2wilJQMvUNyUYHqjRAiKL4KW5o4dVJEJU9Y3Oo0EnhhOkDSKg==
X-Gm-Gg: AZFdTZdN2CtVJVDkm+z2Lp19CCTVgssTZ3P6FPjLaRFy7etPtRTH/nU0a1vyrxgvUMV
	OVJeY50uta44XqXNOSQhufXkrs0In9NlLTWKFLks62pviZYI83/xJKzmtQJcn88VXUZaf/gZkfG
	5xdGKEwycLyAVwsneaipMYKwzYTevSO7cUn+zE+HfJNV+PSzqxxI7i+0IllKFJu+7LW2P+cxHYG
	tmqNhAJgRx4ZVz1PPvJTmqSn90lq18+x4AL6cXSLqZ6ZoJyaKGiXBbM4ixJQeyIX9ZabhZy0dF9
	PRWMhFanF2DuVoWzf/2DzUEBWgJFg0h31039Jj+l4hCrVaLL/lBfePU0zCVh+wYt2mZ48qxzuv4
	kc963QvL55FrvWnMYLPLwkEeyHi2IdzxnP8zl9/evcqj6XZ4BIJFFrx0HXbOef9m41/tvnCnXjH
	oq
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029647eec.34.1795595080884;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029616eec.34.1795595080217;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm48573083eec.16.2026.11.25.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:24:39 -0800 (PST)
Date: Wed, 25 Nov 2026 13:54:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
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
In-Reply-To: <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX3Rs3IhA0C/qx
 wC4vHLtr0N905NOhtCxoNgthi6vMJzSSvZWehfFsu6UFXtJ/DT5CpUfcnl0ZYDZb9cECZAQXYMq
 I3b9iQm+yLoVUMx2ukz55ubZgdqBpOHvlz6xqjGhUyq9UUasGWd9xui5H1WJOFOUUDXG341dhKl
 6N3c7szvGtIv8Ob48yruV16Y/835v2GIOMpwnRhutC3iyY87VjzAK7fTI3aLnyNwRO7aVon1hBQ
 GYMFjUBMfnoSI/HLWWe8wWhiTp2DPCLa2AlBcdNUbbhvR9/ujSZOJ60SRKUhJIlzQ1JMSaM1wDQ
 i2n2tNxoPo9IAjK2nrknES9sBVTFs8VuZb8JatEdjUhHrB88lkFnaFR5Dv5tQ/lNUi4DPwR1cOB
 gndVuclFxJNMhb0Joepxi8RvxFysTHIdXe9kmZg7EIFOQaYwZvx9mBJN38WPrayDTEgsFQC6QgK
 a9JzGAVKjAktEVghwzA==
X-Proofpoint-GUID: OoJyYh2AWLGY-g9oGWQaTQ_DjN-OoS7l
X-Proofpoint-ORIG-GUID: OoJyYh2AWLGY-g9oGWQaTQ_DjN-OoS7l
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b069b4a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hsWotPrWWJX8LXFSPeoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX5/I5ZcW0Plp7
 p94tDJ0O3TnqMz32o2mTMiPLOhNHTQDAbt14iBT6S5fdummEMAe00CtpfBxeBkHcGW+dBHdhBUa
 pKspLplBBotqjOcj2fPrN8NhV3MVh5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> On platforms where a hypervisor is present, all Secure Monitor Calls
> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
> authentication SMC to TZ, and upon return maps the PIL region and
> triggers the co-processor bring-up sequence:
> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
> 
> On platforms without a hypervisor, Linux drives these steps directly.
> The SHM bridge infrastructure required for this is already upstream [1].
> To isolate firmware memory in its own Input-Output Memory Management
> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
> is specified via the iommus property of a video-firmware child node in
> the device tree. A firmware device is created from this node and mapped
> to the SID.
> The presence of the video-firmware child node is used to detect whether
> a hypervisor is absent: when the node is present, Linux manages the
> IOMMU directly; when it is absent, a hypervisor is assumed to be present
> and these steps are skipped.
> Extend the Iris driver to support Secure Peripheral Authentication
> Service (PAS) on platforms where Linux manages the IOMMU, by creating
> the firmware context device and performing the necessary IOMMU mapping
> when the firmware device SID is present.
> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
> @oss.qualcomm.com/
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Looks like it is almost two month after which you posted this series,

So, I posted a series to move every mdt loader user to move to new pas load API.

Please review this as well.

https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
