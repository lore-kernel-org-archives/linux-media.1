Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B847ECC5
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081149; cv=none; b=hKH9gqe2WkZKfqxox642bi5R9F1moGLDs9n7TD4XNAq4orR/ZAiGC3qiLX4ydXCOL8cABD6xyQ2zXXKOTOnSUI5JYVAdyYH4TqbOTBuRDD4RPVC+pE2Sggc7H20rlHE73IzYIS/4W03Yg+d/nGETcJuFubajBto8EbSrkQjwL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081149; c=relaxed/simple;
	bh=teH5ei3MBK+NMl4BXDarhxXz1RAQj80oEkiGD43HreU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqlNEK77rPsPRQkQx7Dg0PZDq7omzKZVpZLun7ltVlA5EHjyB7ZYEI0Wf/BWBXWaFAAkTl/KZhUu8+WCh1w3r/b0kVYJztR2nabh96hwdy1OH1Tre59pupAGGt5JPftZuMN1HteCZyHxkr8tbA+NwSA3xJSTou99ut3v5FBcMEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBeoOfbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ut66vD0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBeoOfbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ut66vD0P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPDP9620047
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2oXXnZSchD/J/9BfqsyDFGm
	NEvGeY7Is7L4w+xWaQk=; b=GBeoOfbfqUnEl6W4jGX6cfFGk31pY9sW9+sYL8HU
	1UZeijE3YYgWODKmIfFkoYD5arlMe5XkMx3i85xvlTemN3PNEgQnC/xKMcwaMUvQ
	t+HbZzQSIHlavc8y74o8tocgQiZweVeGKL+dUKMYCWLN1Jp73IPsLw/5dZVIWfIH
	tVzHPx6fipIh4kDy0X6Br/aDgwQnxJ/YNm4wSxPFp3eFTzqpu2UTvkBHAP8MPpI+
	m/8CTY6ysvjBe/XCExRLJdT8m1FGgHGuYKTKxQ0y6RtKPt3ECo4nTrWbSYkuBLUG
	0OCp0t5zzJcFaQe5dtR+kfTnviJ2neYOYjZhinb2OH0V3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5t78d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so4896287a91.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081144; x=1790685944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=Ut66vD0Pz2e9UJsuEBemmgA5mgiwZp1eXCpBJo9kImHL7qTYyWip5KyzK5x4+x4Uir
         obaLJsfE9zatxvMtEMwC3ED0C2ufo0d9BJpUZ0Tun6Ln8If4vdIGyZwE/+8aGeegJS9v
         1Oh9dgDsgr+XPj+VG3Mq2Q9UNd8o4WMpawChtGlwjWYKKdBR/1zMRuzIRBnqXMbVgwpE
         1hmiZuWaVgcTdIDwWp8jEA1CqHx3elGD64q7hSlpr8vLPyj2mYpgoG31bxOODpqBtUEa
         HiD/LTKlE6uMieSrVl4vmDIBc2hbfWki5gcujm2Gmdq5s8/v7OQq3UxWA2HQZ4gvDxhD
         UKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081144; x=1790685944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=S5joT0Vs2l2bDkH3PgOtGaR5Tegq3CpkEKR4vDz1YlktjSDFDX0SLsrtACkDYPxIRS
         A4VdeTidPrRymtB4li1PkBu/zi5jcoWam0EKoIfAzLZ0K2VL5nLSoWIsbzvmuo4V8u5G
         5gTDjsLabKJnWEiVwcWSQSdWnbh8q2SEQqrZbSqz5yn5TE8NTPWi6PU2ZoMRaERNqZCD
         CJEJwo06S9bubppnDBRxTNwTnZ0QRdtERGvJZg1cetQSppC3nCh0QwbJqQKWnIgHBzr0
         WFpsWLVt+drMaj2tUcNiazrnmqjJTftOJA0AnxXHK25cyG2/283Ho+Z6sSpxh/EpvDvE
         wXow==
X-Forwarded-Encrypted: i=1; AKwUvBxk3bGZPY7k/QcaDifcP46T8hSu1/Gv1jlFp9SKxt5Pjy/j1A8+DueNireWDWjQ2KcPBktu6mCJZ+Or5w==@vger.kernel.org
X-Gm-Message-State: AFuF++l8ULo6oMN9VL8khJlem+mneUxTk8XFtybg/YkisSlu2CTh8rk4
	C9XovabuADOg1pJP6mreDmnQ8D7s5e1icWs4RbgsPVnlzzJHs1/pi0HPM3HQ6e3E+RubovvvHwe
	gHZVas7G9bA0fCGv2G2m6DSDMgc1FO6h+84/UGCFZvKeo2GJurvxv2vcCGY3ufk2qgA==
X-Gm-Gg: AYBFou3uIA8aNR5GZ/HG6fqfIVRuU32Sp59Njyxxk50sLCU/ESgYmsBRQO92arbk/v5
	lt1Lgo6umVf8cXr7ydUm9XVcl8d0EUZgTU4pskzfPcFMLD45l0Iz+jV/wky00YIcW/+SjWE1Zd3
	KMNYc+mBrxrbZbSe4BxW/U1xklNL0K3miMRyCkERptGOkhSpO3aZmSG+w10eqiE6rhbCrPaBL4C
	5h5fN21fCUKJ35P3z0//pkWHKfGiD7+WYQuZPrkcSZEuVvBZXi11eMhn7osmajpy+7eeAYNymeB
	xWAIodT+NozkeSG0uCdmdkBVINnwiOIgskfrpq02aJgjuh9OLPCBw9lg8lb6MFOfdfr37F0Unzk
	BJVW/446z6z2KJpno9A3rRHykaS/7Z7RKzE5yKc9vWw==
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852095a91.44.1790081144002;
        Tue, 22 Sep 2026 05:45:44 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852079a91.44.1790081143453;
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574b5esm3204533a91.7.2026.09.22.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:45:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/9] media: iris: Add support for glymur platform
Message-ID: <arJ4bUn7ZG5y51DA@QCOM-aGQu4IUr3Y>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-dangerous-illegal-honeybee-cf479a@quoll>
 <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
X-Proofpoint-GUID: jepScQJwW6vPJy711s1bEsk1keCkVJCW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfX5X6/z6juchDQ
 +NvdqeoqO3YrHyzClsKRGlLdq6zYtA1eJFLWfl0qJE4FOzHA2/HjKpmtfJuT0NzctzUDHPYTGIC
 d9spOFY9xT7plxzSFwG4h3H1ZTeTcp8=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab27879 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8oyx3DkIhJI7QqzJRcA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jepScQJwW6vPJy711s1bEsk1keCkVJCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfX+fuPKF7WuQf+
 K6vZI6w55NkzN5wGG6cEZ38EXE4neI6s0zc+9VhDHzekMXxlEizFuEo2953R79X2HHGTscVfzik
 RBWTkis5F9rdXnr+PI8f9wZP+lynJzTgF/ykaacUM7/3rikE0A4fQaf25q2VMWnGLdCWw41jyXw
 eDRIBhuzoFZHYU9/GuNnWPnO8azKMxmQjUjAYUwWL0R6CzE8Kvq7+EtmiRZB3ucNtSw3ahHB+/k
 RunyiWLE/MpICmFkxGAfDBko1lJY2UmH+NiW53h4V9k7k5ogIaCymR9DeIYBZipbMKqNR5WBaTO
 swx9PBagbqVZb0ZW2gK6SXdP54S2XFdvjugtlhd5VIAj4zMGwh8u7yvzyBkHc9RGn7ICoZaCsE8
 vKEZfnJit9PTGwBXG4/RgMvJLfkt1T3y0vzb3ZVr28LaZDVxDStoKdvHxkYvJagaqrVUrMsKppH
 QzwlJU6Wx/cjsah4/iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220185

On Thu, Sep 17, 2026 at 09:11:50AM +0200, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:09, Krzysztof Kozlowski wrote:
> > On Thu, Sep 17, 2026 at 10:30:19AM +0530, Vishnu Reddy wrote:
[...]
> >> ---
> >> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
> >> change-id: 20260917-glymur-627d049900e0
> > 
> > Look here:
> > https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com/
> > change-id: 20260601-glymur-4fcd4d832ecc
> > 
> > so now does this work?
> > 	b4 diff '20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com'
> > 
> > No, it does not. You are sending bigger work, multi-version one, part of
> > even bigger work, so please get the process working correct to make
> > reviews easier.
> > 
> 
> And it is getting even better:
> v6 change id was:
> 	change-id: 20260515-glymur-6e69bc258fb0

It's funny that b4 processes the change-id in your replies like review/ack
tag, and so they appear in commit log of every patch that b4 shazam
applies to my branch :) Something like this:

[ commit log ]
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
change-id: 20260601-glymur-4fcd4d832ecc
change-id: 20260515-glymur-6e69bc258fb0

Shawn
