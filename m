Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74DE41DE11
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041216; cv=none; b=Fw5Id4Pc/0b11ZrkJQMR6O/2atIjbZC7RvfqJk7rCbk3B2p6DdUJek0Nd5EbTHZdIHRHpb7I4eXqJgLWAlLdJU2HnhKuPBTHRViwzgBRa+BlR0V7SZgq1dSIAEC4ddVd9Qy5cfnI07ZPaMlN0R9eS4Ho1yUxVOrF+u/YE/TEJD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041216; c=relaxed/simple;
	bh=ycovQT/558FlnXscF8m7zxc9zLWWsuZv+tlyiAi8cKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqVs1heAmFwx59sb1Bd4zaFzOSG+ZbKwh7yLk8mZNwlHWUWJSz0ewI6GUoAKHpq1FLhsxsySgH0kuppIplw8LtIgTAiHnF4rBaHes2nuJr0S6QnNBCAavTsgMv48rTRVhPQ0G6csTMUo8rtKjuXZIqUieOUbli7O/ecPnwkcB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMhLpZWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rk/Dh+KU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMhLpZWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rk/Dh+KU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BImD747777
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S1i9yeznsxYEHXqB0fIApER1
	x8xqRjP0230BnDCm118=; b=lMhLpZWNqmD3WPWL4aYj8Xq0MKgo3kKIX7AiyAbz
	0Mq1Z1SwYNka1cX2xOUg6H9XaexhQU5W1g5i/nHptNOkHZc0rbZRzM3dPkid80ED
	+e80UEaTXPm1Z804gd0wNoYrNTxQpDzkbyZXIi9pE0zq8WNtj7faIjW6rMAHRghT
	9aG6ibjjQZVndnPz0Id3Vi0amNqpsWNzHL8tSwf6x2fMUqdrrGk1tvgHEUU3AJF2
	bxo43gjnC6NraQOczXYG4mGiPfjFGC5LaaRlIJXp1/m8tAgSHfP/UE4lo+lT1y9R
	nmGOPWDKorGdyEF1HARP69JpRX+8+nFPi0nTNVQf5aRk3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0tpqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:20:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so54723581cf.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787041213; x=1787646013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1i9yeznsxYEHXqB0fIApER1x8xqRjP0230BnDCm118=;
        b=Rk/Dh+KU87vZv7JskT6DAxlqQ5xbTctGTn5E2uRLoUmPW56AkOOrV/SSv+at+36All
         Y3o2T1Ma9/Ba+d/qPxdQjCHhwjMfL/Jzm5QQA39QKA06WRQCN0+x/q25T+Umw6C1G8CW
         MlEQ6IUC2zENksfGVyv2iIpyA84VCxeBNhvKrfiwd7uw/87rUH898O05ly8QeST0imfX
         x0AeH0zIEoG5yTL69Ni2VDLIPcnYUjGXd3l5SAHnwXTAn1C7ZnTfeO9ptmoQTx/KZMBf
         aSR3pyxx6g2UcvHlWR4/7EjgZNSTM0mhADMPVasyMNcvoC6uRM2iTU3ydBjwin69oq5t
         f7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041213; x=1787646013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1i9yeznsxYEHXqB0fIApER1x8xqRjP0230BnDCm118=;
        b=mo+c8+uZK0ZMxuwqNmo/btiqjCykZciNmEDPmX+ku9HAFrDcjhmpwlgervCL7cptnp
         M6EMojb78QhH+JgGeX3a+HIUPDhS0nsbDo4aO23UiAPInQmKrgupPpfjR5uzZKQWcQub
         KL0VaHKJQ/GXUaZrr+iChY7jV58ZOK6ACviWLsXb3QxsETd4PPvaDnXaAqJJICGIvUok
         DgU8rEQG/B+a/L/A5CbYU7GLsubT48umA4Y7QiT5ahljfgOCFKTspPzKaFHrguzVzZ7m
         GfyIwL0aws2ZrwZ6nax8yQkIDwXO6ERWQCJd2QV2WNO6PsZSdmJQ/LrspcJY6ccjUJUR
         /2cg==
X-Forwarded-Encrypted: i=1; AHgh+RoEJ5uD77UueRk+ErlRxhlwONJvakKvLaUpfjSDTtuwQNWbBBgFXyRcqPCSCoErk6Txtu1ig3EOHNLm/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyulqPkXvAecgr8k8YTeemUhR4HQX9z/at79l78bX8JoecpkJXQ
	xVhQtM70frCwHsWB1LdN94c25X3X+z4FJcJ10GsvtrsKM5gmjv8LkUso2uhnQ3S258V5d/dwoWa
	MgaQSnwZnreF/fVbJw6AvfZYf9PVCfZbE+POZ43Pb3A/O8oVKLbXtA1vzaN8xDFQy0g==
X-Gm-Gg: AR+sD10OdYGkvjKyj546uNi7WOVsKSbMOzEpRFRscdDcxqCGcSWdAaisphb5OdYIV+V
	KAbYzPJLczoU7ha8PJrh1GpeQIRtSUY74gTuFFERWqVBVwajskm+FWm4S9ylFGcktmKRX1QmvvR
	MegDd4aA72+QX1qwzBSKoPHYEM9ON8djPxqq0c0U7y+xOcHKluvA28aFNMqBZi7oah1KL2dX8hf
	afg0kuOcQ/Q4coIz4z0ZW1zY+n2SgIWzZNHNwmdujUmyAnMhkioJtu2MQSzXUPelxQOGBWLbqFt
	Dr7z7RGw5i7LMNrNHSTjlGsYDweFp43x9rW9+eI/e32rJHkgk0IwZvHic2gFQDApV91KW2hM5Yu
	1UkR4pJ28ZN/h6IEak33dU9Y6Sg3oZiDSeby/JY7v+yTDCVpitrqHW8AC7fGxPl7DvTiIOyOgNd
	hXbbiPgMMXQoMZ
X-Received: by 2002:ac8:5f8c:0:b0:517:8470:2d2d with SMTP id d75a77b69052e-52dbd71dacdmr55780681cf.29.1787041212948;
        Tue, 18 Aug 2026 01:20:12 -0700 (PDT)
X-Received: by 2002:ac8:5f8c:0:b0:517:8470:2d2d with SMTP id d75a77b69052e-52dbd71dacdmr55780501cf.29.1787041212387;
        Tue, 18 Aug 2026 01:20:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e55fcsm9764021fa.16.2026.08.18.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:20:11 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:20:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: Fix iova allocation from restrict
 region
Message-ID: <jf2zzsnwe66owxs4rgpugbipaztw2xxeejz6q7vjvnttq3lnz5@spdh5ylsqggp>
References: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
 <20260812-reserve_iova_in_driver-v1-2-ed62f801275c@oss.qualcomm.com>
 <hzu33hharafxhfdnr5tr23ti2tmtjhls3iwbvmtfllwcv232m5@nvxemt5ijf4n>
 <8a9b417f-11cf-4dd8-af3f-494afa38b868@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a9b417f-11cf-4dd8-af3f-494afa38b868@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2MCBTYWx0ZWRfX+kW5acJEgdr8
 CsZ1YVYAuyQsmgHFFu/hTBkd6Z6usaONp3JcgP7a3gnVjvBsiRn3T1UCHdwU2aaUb1S2R5SXFDS
 OKvHKG5ywHjJfuJSPX0FBD5OaMf/Tu0=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8415bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PHneWq3mTtEDJPo0Y0MA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: I1FNFigQucjinGy3aGCD68THdc-UE5bb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2MCBTYWx0ZWRfX5SlBLXfA3YyY
 n+OU/lFCY+VBROAVoao/Woe5ti/P9RZ1z8mZlq45oplBp31xNSPMsshoYhxyCWdC6Y5mWHQP6s2
 KM59AoixQ0cpXhp97TQxehNCcnEwxtIkepq8QIW7KaX9dGvOMEUrbN/bTez+9+k5n8+FX578wLx
 V8JYVNon/01STB5r/yG1jQAzzTaipWgnPOgG0C9obi4n5Fwir5s3FJSRyyK5bvttJgHUAtPa5yB
 yQFnGSoWvICpHblSnKTJjUn6h5pIu5kSG37vWnYRZ7Y7qjGDPxKBK8Xg7SeLhQ7cM4lHRJNpXh9
 SAovHQh5IW85qam5+Xff0Q40vb78G7m57/q7pgSUsGDwKo1OYtxZTExUY9vQki0AoIr3YxWUF77
 0G4gRM7zIgM29Qk8nsOBVsrN7HCeM8e157an1Byegi+MdYckIUyjSpxm41u5/dJLgU7XW5d+JnD
 c0EjqH8LYeyYSzlziAw==
X-Proofpoint-ORIG-GUID: I1FNFigQucjinGy3aGCD68THdc-UE5bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180060

On Tue, Aug 18, 2026 at 01:25:58PM +0530, Vikash Garodia wrote:
> 
> On 8/18/2026 12:34 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 12, 2026 at 04:25:59PM +0530, Vishnu Reddy wrote:
> > > The VPU issues DMA through several SMMU streams, and the hardware does
> > > not give every stream the same addressable range. The non-pixel stream
> > > cannot address the low 600MB of IOVA space, while the pixel stream can
> > > address the full range:
> > >      +-----------------------------------------------------------+
> > >      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
> > >      | 0x25800000 - 0xe0000000                                   |
> > >      +-----------------------------------------------------------+
> > >      | pixel stream addressable range (0 - 3.5 GB)               |
> > >      | 0x00000000 - 0xe0000000                                   |
> > >      +-----------------------------------------------------------+
> > Does this split apply to all generations of Venus? We support MSM8916,
> > for example. There has been work to enable MSM8974.
> 
> Yes, applicable for all VPUs

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
