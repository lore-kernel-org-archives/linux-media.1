Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ADC3B058C
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069574; cv=none; b=dna0hnQuzyf1zouXyI64xG+GhpFdK07MyD/GqWOg1EbfPLUTdFuJwkLgm9MSVMx8GkndqU5VhF+iN++i6rAl3SXVw9zzrSWp9bUTCiO+cdCkrqCvOqGCpoTKV09mzD6hZQ90nVOJiP0AXrab4w5lF1toybxBejta2KVd89Df56A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069574; c=relaxed/simple;
	bh=6EFsmK47u2Ztk4Al6azIfLDN90HRCEzNFYRGukx1bNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+HhQcV46Xvv/vR6HC3KeK+YJDE10eZcthAHhlWjW2dX2dTtWpBvWy2xmyrYiRCjnzcsgnyM9Oacviiywg3r8gz4fSSERxEcWEVol4aaQQkZwbOiP0CRPIh584qyDHeOFU9+aHeHIOAXq+WxkG1gRfort9preGXjbW+lxUViyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7E/v13u; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7E/v13u"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c254f6c7a56so462229266b.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790069570; x=1790674370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Ab95yjg47UXgu4IRFT2olDtzGqxsEpvIhJOJgfomKI=;
        b=E7E/v13uMZI1pN5bLzyZmpLEyuV6+kJKuwTq+Ftuno24pR000BFZDn7OMQlpTVBqhu
         qPTpa3HdO5es9YubMuDjXSv6yU5KVRYdoozAEYf/4Lz6VrW1BajtTXewA5Q+85uJuVEW
         84TEmE1WjVFHNxUpFvVq7Vs4Y/ZV+/UJDnDNx9dBVD0dCP6RDbl+sZnM3eM9zXY7kb/1
         s3uhy6d2Pzt7aXZlsmtFNYiO5rBXd5Dev6MwL0bxawbM8DIYidUxEVisWW+CZCXIeX9W
         rOhFgbeuJ8wqCj/0b9Yupewc/XpGoZaOYm91/WD9boo4l+XOpCnKh8q6oNyWZ+VZ7RvC
         QG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069570; x=1790674370;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Ab95yjg47UXgu4IRFT2olDtzGqxsEpvIhJOJgfomKI=;
        b=t30W+qz3SyNOSqLVnIBfdpHqYcEiLtOCVPOQHiL/EwHPj/3vq7LNf9lntV9JiwCTcF
         yaZJ7cZnHM95H1/DxbhNRGHRhdF2feP+i1Th6z3JVEOlxVh7XwlA6yZEsoh/3NKK5mUw
         9uXkr7X/3kgABf5UKeeUxWvADBzE5SRheP+NdOP9qXCGR/4FEltJnlxEKsxXgW8DVGcu
         W9K5HpSNMJjA2j/DEM7xEIkoSelGNWoZK3Kn9yjLaJPnCwublskwidEqiOj+OnXWZkaZ
         p3ATU2ExQn6trdwLPy5FqZW3kFVXN7RVBAWkta7tSAeow4Ld4hi3FFm/MU4er1Wh6z8d
         ICQA==
X-Forwarded-Encrypted: i=1; AKwUvBxvfa5uGGGul0cZXOkN4NQT0dhac/Dk9doDW1vYC5gKFtiqn93DOeDE/PGQlDOKW59P7hxcg22vLceidQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nijTwUyIuV6KVHpFaYv6VMV5P8jxjfm3eEmdzr4Mz4/hl1pXsB
	NvMOW9VtlsF4igqbuvnytWj3k24UhFekUNhep8JLJMt5jZlEED/MvIJwgK0ByPLe9Ew=
X-Gm-Gg: AYBFou1Ltj5xGHCyapAnWpGoFuMcJ9pFnoLCM6LH/Yi9wmcdnFT3pJevM0jxgvC7yM1
	zV5PT/aDvWon1tEVrhi+5THnjeYSK+34BcgSYkDEgqTSr3qfp22kET6wEXntLU+hhyfv3wMeN0m
	Osx2/r8eZlbtfVl3KM5rrXboVMQ/Qcy9mwbPFGum1F3aTpv2x3a7PSYcvciG9C9fA3WFTB9/J++
	CdtRRE1ijaXRe1olpSm4rdD7gs49Ui/idAU1B3hzOjQoxoMf8BKEyk2zwBsv9VTCVv8i9rKZqcY
	1kkFWbCGJsKNH6L9zbcf84VFieofR9dkfeNXkjjzYBDcpZ9YEVfrW5CuDzGDxa5NJ2PAYNzxlS0
	KemCR5qzf0Z5a4v5Q/kTUVroNDevUGk/BerVEqchpmQ5IxtxoKax/1bjhbhy9KLN7bTup+pFPsA
	8W3G9fPN3WpCCF0reHW+ZvHZh4TSeUI+ARynUM50QB/wC+9v7Mjo8Oj5SE0vZ3gL8l/MmqFd/oH
	B2aUi6GUXY=
X-Received: by 2002:a17:907:d11:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c2a1578a505mr1126569066b.7.1790069569625;
        Tue, 22 Sep 2026 02:32:49 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.71.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5ec614sm54010366b.45.2026.09.22.02.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:32:49 -0700 (PDT)
Message-ID: <61ab6356-874d-4a05-87dd-4900d826f02d@linaro.org>
Date: Tue, 22 Sep 2026 10:32:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
 <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <eefde985-c807-4905-a33f-616a1898ad72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 10:15, Konrad Dybcio wrote:
> On 9/18/26 3:56 PM, Bryan O'Donoghue wrote:
>> Add the ability to use a PHY pointer which interacts with the standard PHY
>> API.
>>
>> In the first instance the code will try to use the new PHY interface. If no
>> PHYs are present in the DT then the legacy method will be attempted.
>>
>> Acked-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
>> Tested-by: Oleg Keri<okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> This and the following patch conflict upon applying after:
> 
> aedd77ea8168 ("media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code")
> 
> Konrad

Thanks for the heads up

---
bod
