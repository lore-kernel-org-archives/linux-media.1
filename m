Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B721375AAB
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438449; cv=none; b=jT6NqjZfFsJAGRBiMpN97J6BPq/F2pO6drhJ99Jyrt8x+mIg127mjqwfTExEJ5HLp6M0ppu4/Ns69KITxlS6LxJYp/mYs8R2+Ab2N+7g+J8fnnqZrYpMLQ6epqShfAiFbJLeShQI7/oAzU+JI19qkNkuGsk0Qz5CwRYWI/iqywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438449; c=relaxed/simple;
	bh=AKxmpzI5wH9I9UZcIsNESrl/eKnb5r5nsYZfUB/Ku6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/MJmWXaQxuVEw/s4weCpKiCYQ5aKWD+FYSSuX9fNvOQtYwDHaMY6FMn7cTANYz4QFiv+UbbPU5V5Nl9aoB2WFVVgmmZRGz+Cb/z+qcgW07TBvmT4f9Pij3Qv6Tqevnb0DnVo8uLSn1+ssH7dINCTT/pqGTSLbDmCewTNqMg9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYct3THR; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYct3THR"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396745b9abfso3734521fa.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 15:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438447; x=1781043247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM8Sf7FodSx2cPHTZjl3hS8JtasGDXRm7zk3IkDqzNA=;
        b=yYct3THRY/kWpfS5Rq/CqRl2eej+YGTBDtCDGC4f4YqnWmoeekjCmQIl5KCHGZIzPt
         gzGDs1dV80ma/CueoK803YzRvPUrRseByF6R23DTopRHBeC0I7srHOR+61QrtBeS7sma
         VnySkcA3tIErvDx7LkzmpgswRfJ806lh6g4X8efmqln8WMl1/jVOPraWmBmNzMqs//2h
         kyJ2o0i++zwhrHwXWfFRRNDWGCWIoNHiebC5ur4ZCtUAPh9ko6aJFzEmjDe4vG4k1TnB
         FFP/pltZuXeSfJqmcnpHEemBwGg7rx4fw/ORu6dbHlT120Z0E/yQYBi9i33FmBVFr3cd
         t/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438447; x=1781043247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uM8Sf7FodSx2cPHTZjl3hS8JtasGDXRm7zk3IkDqzNA=;
        b=Q+nWdVP0yybN48rQY5pE8PEyFOM+dJ8Z59s2MPeKS0wNMYxZwQzZpP4vwoyCjbHfCo
         XIn13fwOCHa57RLXaMV00Ej2nqcbj2gnzAFJmy/8s+AnjnboflPfjAD0JDMQ2PFkA/sY
         PQ4V6IOvAbMileDdj1/5ZPARVzg3Iuj16hkVyJt5fRDmPtot936HWc0Z5y0AvVHRXaF5
         RlBEL0CboBgORk5H7/Ny4jqe9mgRXX1FCb9H7iH/I0DOZNVHJ0l/YQ8gu0hyp+Wygssp
         9NOOt/ZBBcaNyeyliXp/ZlTtJXoTFlIYTA7IZq8sTOGSqJF1Y2h3kS36mYCNQKNEu2OZ
         nxYg==
X-Forwarded-Encrypted: i=1; AFNElJ8iEQBJDgOjnaZotBhEEaen5TgAUqCh7KDLZzWbw8VURRSJAekOK3ArxiTfexEYwgkyobiGTfFekFPzRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVBO7uulC0JbBjoV0bSAJIVzyTqBYh4fGF3rhbSzIdosha8HcT
	+mCOs8/LZcoCVIqlefGxjNd/hx59eldHYTFuCzL8YNnDaFUnbtPP1xz4FPqO9tZ5Vfg=
X-Gm-Gg: Acq92OE06jPn6G40mLZg0mXTUqZT8YRyDDP1yYB86ZByqgsgGDorE0Z0Y+WF1GsCIDL
	747KkFkcWs0bFcmr8bTJw8kyB1Mmlr9jzCadA7LgftsLUqhax1G/B6sjmnGZbRHiF4InpFAS6FV
	MjuR6YR7mSVw3DTygMIYDPRhuYUeyIdbGyq8DsNVLY+iTPuq9fjC49EHT2C+Oa6bbfusUA63Pzg
	2IUPIrPyLvkqLJCrR2oAve2aB+hFr2oJPY7CfBH0WF5L+cLL2ml4ASAI9ZhzdiyUSSpEGqFwCur
	sC3pk+qrjaOih5wjNvCadk19fG5hnocPSbtB3DzdNlj9cwhKdHWHDT154emr+a5nVMsTQMSVl4b
	fc++nSgYCb6F0d9FaAA2E5hW2WSUEY/ScgVkJiL4GDQ7Gmoq4hzDoemnrjGo0P09orP/FLh1OoD
	k8GijxkYDj2D/mKwVQZGp6LUbyPlJe+F8yqhWUO7eohO792Q/5nTJaqt9CgvN0RBFoXlrgexcL4
	C2Mbjh6cTtCYIE0
X-Received: by 2002:a05:6512:1316:b0:5aa:68ca:7aff with SMTP id 2adb3069b0e04-5aa7bf55528mr141785e87.6.1780438446511;
        Tue, 02 Jun 2026 15:14:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985a4esm209129e87.56.2026.06.02.15.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:14:05 -0700 (PDT)
Message-ID: <92ac522e-e8b3-4257-bd4a-24b9cea8b6da@linaro.org>
Date: Wed, 3 Jun 2026 01:14:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] media: qcom: camss: Add Kaanapali compatible
 camss driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
 <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-kaanapali-camss-v13-2-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 11:05, Hangxiang Ma wrote:
> Add support for Kaanapali in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9335636d7c4d..ffaeeb9d1797 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>   
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct resources_icc icc_res_kaanapali[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5102,6 +5116,13 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources kaanapali_resources = {
> +	.version = CAMSS_KAANAPALI,
> +	.pd_name = "top",
> +	.icc_res = icc_res_kaanapali,
> +	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -5316,6 +5337,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919..2820c687e066 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -93,6 +93,7 @@ enum camss_version {
>   	CAMSS_8550,
>   	CAMSS_8650,
>   	CAMSS_8775P,
> +	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
