Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7023AEF4F
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235624; cv=none; b=K0GAcJqMFZI6VAJjze24V0XmiHFN5UB9AUHe+nD+wg3x/zBVeLn4OSe5NfyHxIKZpejW8NPPJ63MUXIx92wjR6GJwPLT8sMALS0f0cK5v7LEaW37GvVpcvYq0ZcfTigF+GajMgYb5lke8SmlobtPvpjGFCCPaL6sU9PpHMYtjjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235624; c=relaxed/simple;
	bh=bVFAWs8vvyltGPx1Xeyjge00ezM28ti5OIAUO0++yds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIduTp5NvSnBvbApEl4hp1gIRXxbx4gdWGSvKxgDDMgMzR4YSTJxqmceQgLOFTNx6h1E24GPX48F+rJQye19zLtFwr2tWfvRLQgJhf9jCQp8dWB/UqYevfejCAQT/Gs9yXDExgHuehDDPjTGFXW2KK+LBFMclPWB4CAtlCmyXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQD/heiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJqlfSgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQD/heiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJqlfSgR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgXsK2688020
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZSQCjovMoYS+6pEsxEo7tfKm
	+dlRh0HJwKOjEk//Kqs=; b=hQD/heiFUcX5vffC6Pm9LAl8II13oaiJ5REbHxXq
	H5DSEodQspUaY2nJnvOJ8Ih8sWc+a459Bk+Vn7PS4A//DfTk2R7f8+XdHzmLD2kN
	Kq4Fo4kMUevBcbX9F+0FbUttiCnM/Rf5iJRgrpr1Qtu/RDf3gacrnTnggJqc6e/s
	xH9eGfOkgiqlDMD5F7qrfwDz4Y3g5SJ+e98Wi38iP8Q1LpZ7hYFLGGX/vSBy1i+8
	wHCT1fAk3K9l0Ae5miQrb1bKnoY57RlMJNOuNannIOY1n0ZiZSvVePcYURoAEfH0
	Wni6apLgLSX56/ZXU/i4YzVrFMJMh3L2yRuB6Kos/OOfcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7jbam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 10:47:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so54204441cf.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785235620; x=1785840420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSQCjovMoYS+6pEsxEo7tfKm+dlRh0HJwKOjEk//Kqs=;
        b=NJqlfSgRqnMNIQBgIwJSjpYLFv/Xll6q+0TMgKHiP8MwvkhzOTkw8aerV/DKDjRMiy
         K3D8RsVsIzPYpJqy15QN8Q6/snGLYN46Fy+KVmv5Ua4Q3KNbEM+yP8vnk2HBphDFuWfv
         AK8DXhGGQfXLs7M24sgPsDXrTenrEeCYnOLZCxy3fnXyIbeiy8+5H7fcIM+KsoPZTzX5
         CocHZPuLQiOTl7IfgzW4YfgijQi2yy9eI5ID68ycd0xFq9P4Amlko3RhuFWomSta8Epy
         cvy8aS0lXe2ijs6IAA3FoqjQw/V03Cjjz83ZsCiTX7gfdTkRS1W8GKyAuJvYNNf45JZ7
         AMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235620; x=1785840420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSQCjovMoYS+6pEsxEo7tfKm+dlRh0HJwKOjEk//Kqs=;
        b=o4QnXg2+eWWmYI2bPD4WE/ZeeHhz9/be2q5nC/c25ICtdjSogd1CHeNYxldWzMKsYG
         1PMyOvFgOuyWIyUgiE5vGfWcOZPYRM1tPU4yikCkflDSINkhQJo4VrZGEyR6Y3AT5JBe
         1VpFxO+cREx5PjCTNHWY8wT+wZ+eoYypN5WMJ9cTDaaML66BTDhdCL5okfrPfccoSH9A
         Bff4hu2H9jYdofNJhoFyIGTIz62rd7A9z6t09uQJ8CWmJw1E3Q1FdUAT3JRbGJDkc8WA
         euSbkjSZpZxnGFIRwSn1+m4BCsqNMMhbqAu2YVkvrOWdRO+LC7u7N1zJONVZ3dIolDkm
         C6IQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIIXiK1pMv8rLYhlmgPMKWhXnwAwR5bUuCZGAH1ZUIumcBIg59Aq4L4Zezb7TBruKQMZUC1265tMi2oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJe0CbrRQEo0ba4gts72hwQ7t1ARYH5q9zYdCokdqxk8+7Qz0
	Yho196WO71dEMP9Yai2kwS/T+Iu+h/7e8PZ/6hIX5Yv0A4svyjS57xB4K/ndU9YzReLbqVMj+wK
	3S7aOJ6Q70jfiHtt4cYlrtImaEIOMR3Ms9HmazjjmtJKrQkj3397EH7aoQzWQzPe7+Q==
X-Gm-Gg: AR+sD13cMsJXV/ZFH+4zupURCoXVxRIAJqhhWqPogdLR2JInaiITNhxU6O2swDDcm21
	TLihE+3wqo0JBbyzsiKNeAC8aT4t/XNvnpJo73jnaUVLdaVVjp04rNUa6maZrsEVjA7Ih9hjZYI
	mwpPSKHBnkAtsB8tJwsi9mP9RvjVJDW1HMi57pX6b/CcgKZfMQUnaTVdIuircyvk2joa2+M7NPH
	RMb1mN0Zgo6boPRQXPG1u2FXgoRzCb9V4k1Zv4WGu2RZv4Xk6NRYC9D5AvxPPgVOwvG5X+Mv256
	MkCrh6Tyg0cnPjtmnTcoQSPoa0k6hhz187kjX8Xz+NghzX/Hw9o47E/8AaIDFg5DN1BaNUJI5Gh
	aDBeicnN/+DdITk0A9U/dEgGb4ybIorv7xWu3LxktScu49x1XJFeOTZhplHtoY/U2A6SClWJN+B
	IwY/NUnpk0kDHZ9Q==
X-Received: by 2002:a05:622a:588e:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-529d70d7486mr14826241cf.41.1785235620171;
        Tue, 28 Jul 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a05:622a:588e:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-529d70d7486mr14825941cf.41.1785235619645;
        Tue, 28 Jul 2026 03:46:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f22187279sm20379291fa.13.2026.07.28.03.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:46:58 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:46:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
Message-ID: <t2c7lvpp3xyoumd2gdzntkwb6xpdjvhzyp2hllukimzfzbwbvm@fkgwdtcqxof5>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX6COsc4OMgvXv
 CqcEu7numfKtmrUQgE714T76erM08/KAAReBPvUF8FODY8y+w7rmWHfwmBt1BocuDk44I0FcIdJ
 wYTAsoSge0XeFZhIr+I0ZpwlSPb6UMekSEJpbQarsjI8XQNnjvNSDRrDJ9D5a4FdNwA5ubGws0E
 SGantsYxOTFquxGm1+AhymMo/QqR/EtIEixOSfoyBso6ml/n/qAxgPW6U2AGesc/JWZAJ/g8hff
 BnXeZc5u8AHZRxInXQygraG1lCzM1C7zREMi2ocDIa40ZVM+a7iYyEBtLL6up0cmI7dkmAaC5TU
 SGnIU776cW+roRrwaWsS5oZv2ESJQ5qRNvFQw9kpVEMeYgNtQZSEsNUu8cirzflXE6cq0yA3wB1
 0je0/6cmH38x8VAWL7BiOhaVPaH8gCHvHN1K+oxapvkSwh/OwNjTxgHxgW6t7SMmPsM9cij0qFB
 1dW9BWgPZmlQPhw9UTw==
X-Proofpoint-ORIG-GUID: FqxQyTClLj7PXVjaQzRhc2RSUM7dJ9Je
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfXzPhobBE7TBPG
 bwvCu1MnJt8/1GF6VhUYFIK4EFLhQf1e/FUpGkU+pRlPkNBavxUkKqMgJJKNk/SIhTUihBmJ6WF
 F8R4kMndlqvMydCTF6wXntMBPUidEbA=
X-Proofpoint-GUID: FqxQyTClLj7PXVjaQzRhc2RSUM7dJ9Je
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a6888a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=2AomeXgjd0MQctyRrFgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280094

On Tue, Jul 28, 2026 at 10:35:33AM +0100, Bryan O'Donoghue wrote:
> Add a devm variant of phy_get_by_of_node() to allow for the familiar
> pattern of having devres automatically release resources on the driver's
> exit path.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h |  7 +++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index ebfad5325072e..7af24f2f4120f 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -1029,6 +1029,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>  
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns phy associated with the device_node or ERR_PTR. devres manages
> + * releasing resources.
> + */
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
> +{
> +	struct phy **ptr, *phy;
> +	struct device_link *link;
> +
> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy = phy_get_by_of_node(np);
> +	if (IS_ERR(phy)) {
> +		devres_free(ptr);
> +		return phy;
> +	}
> +
> +	*ptr = phy;
> +	devres_add(dev, ptr);
> +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);

Why are you adding devlink here?

> +	if (!link)
> +		dev_dbg(dev, "failed to create device link to %s\n",
> +			dev_name(phy->dev.parent));
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
> +
>  /**
>   * phy_create() - create a new phy
>   * @dev: device that is creating the new phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 71c2e16397130..14b924a88411f 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>  struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  				     int index);
>  struct phy *phy_get_by_of_node(struct device_node *np);
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
>  void of_phy_put(struct phy *phy);
>  void phy_put(struct device *dev, struct phy *phy);
>  void devm_phy_put(struct device *dev, struct phy *phy);
> @@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
>  	return ERR_PTR(-ENOSYS);
>  }
>  
> +static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
> +						  struct device_node *np)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>  static inline void of_phy_put(struct phy *phy)
>  {
>  }
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
