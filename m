Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA23C3447
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542278; cv=none; b=pshOYHljzfdkTN1QkcDx+7gLY3QQY3reeo3MKTN+mlpE7PgbbCvNdqVDdxosY3ERIyGo4LTaNnL7bSgeRluT0f1WBdh3HuXdjNMQfo0TVC2wsEjaGqlX1o9Ug4KtMQpUESY/6KRhYjw2KpYtDVsmXLTMywMo8ANIXwGdOvdxkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542278; c=relaxed/simple;
	bh=tx0TCDRy13709548VbK+NVplX+xG8JpNeA4Y2RAEjCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLyNYPVNGaA3pl8q7vXKySuj+nmd5DPKXJGx2QgF9E6xyn5FBxyoRHvagWeE7hXKzZfJK2JKfwUihtbkFOrIMo3vRwzS/FlX7bB4xLU5bUiaeVWg6+XoldMDi1YFjRbn164mjoMOriNqG3kjulEptxdoB8qd4POY+SGlWaVJaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8Kos9Oz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8Kos9Oz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso6577651a12.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784542271; x=1785147071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bW2kLeFTDvip1n3U55k/FG9Uzjne5JKdejrzOvSO5zA=;
        b=M8Kos9Oz7wzb3V8f2gulEXZgcptfMj+1MLXhD4bDhEx8iYHhbWWiTCmtp5ynEvjkh+
         rDHJLGMR5F1iFfjNwuxAyo0PNA2S2WgTnkwlrOIDFucRkUN/iPu/DDznO7TSRf5b8XdI
         damT3SxOOEa5AMvItX52tw8m+MeNhMl9m0Z/ocdNksiAXkhx/pKp8S53J+sWQ+eQ+WF+
         Kc3KEWw9zbWPshneyj2CiB+rONvVON39CR0zuszgsWlf4UAWAywjsmZD2w0AKw3RuLvI
         kojkJm3gCibdaBaoieKc6rmD+GE6I9eZ00pXxFRc7WEgtl14SQSHhbPbXOfj8Ci44tET
         NA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542271; x=1785147071;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW2kLeFTDvip1n3U55k/FG9Uzjne5JKdejrzOvSO5zA=;
        b=ZKm5kRnnZ/yXY57bgagW9MgF+pgQ6iYiBVqZFBbmDjtqkXZf2gppDq2jxU8LuuoB+N
         MG+Lv2rIh//Px/ZhsthBpfrW7O9L5Cellqr252puSPk5/F/f1wItyeS97PPloDFH1/oU
         vTsEfPbkaWwfS00kPMbUvhtPaPi/YEtaGAyBCOqrRb27xHSi13D34bbZ/o+lGOOykAO1
         XTAI4jD88OXcW+mgRzLk6r9/C2P8Y7iiaU175oW90cjTjSgDKHnmJGa7j+SwwY1Fhl5i
         e0cvEdKUyCm7E4W71mg7FGg5QRO4tX0JYIjXQVxkHbQ4eaCS/BjvlbcdID+2TtdLjjU7
         olgg==
X-Gm-Message-State: AOJu0YwBK6EpW7PYr2kiFO3k/gqsYQt8cM844M2u0ujjnJXHOqa2l/MX
	240h5oHUeyE1PcBki4RFEOVzQcvNX114bkc/tFWKAEwBX6tUwulRr/PJ2HT+QnOQdZM=
X-Gm-Gg: AfdE7clhiV9zxJgXA4/GmAsuokWumaE22ZMllkaDjGtMjC8DD/Wstk80ah/AJRCuiML
	IZE2MiEjT9DX24RsLG5H7Wbgx12hrqrrkPQeij1uiCIxKiYCpdN+kDxy9q01aF/R9waQvd8Bh+2
	+b6R6Vd3D1bjnGJxwF3lC3LGo+YIgH1qKfWVRzTh/Xu+nue5mgvlx6LhszNKCeS0kLSoxuSV7+e
	h6Rdzsc4L/7hnl+Tn9tuFBwMXdetxPSISKZu0PkSicPJ1ctQcSFyfuNrRfT3X3jVnjKhDYzZHeW
	DwxQDEjUPphZ8FVRkkBA5dm1wW2+jIGd/115lu04f+DFEA03SNVrfUZi9+VQBglrVoXWz/et4f1
	JkJy5/qDEDzoGvLkuQErCFcUa6GnuTDQYPvbCkY6l2EMPxdjfStLDQ2y09IL/Nv9RqAink90INm
	cbfGT756fWFHpkjg==
X-Received: by 2002:a17:907:9722:b0:c15:f26a:3438 with SMTP id a640c23a62f3a-c16b46decfdmr557526666b.24.1784542270781;
        Mon, 20 Jul 2026 03:11:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm431493266b.43.2026.07.20.03.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:11:10 -0700 (PDT)
Message-ID: <99c019b5-bbb3-4bfe-9237-cc768027ce1d@linaro.org>
Date: Mon, 20 Jul 2026 11:11:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-2-7ed71fea95e8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260717-camss-version-v1-2-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 15:20, Loic Poulain wrote:
> Provide the required CAMSS PM clock descriptors for the QCM2290
> platform. Register the top_ahb, ahb and axi clocks so they can be
> managed automatically through the PM clock framework (they are part
> of the camss-top group).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6a2bf3373e8755805c8cd0f8fe5037b788d68fa2..04b5601eb0b53110ce1b94248323dad1c08da9ca 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5589,6 +5589,7 @@ static const struct camss_resources msm8996_resources = {
>   
>   static const struct camss_resources qcm2290_resources = {
>   	.version = CAMSS_2290,
> +	.pm_clks = { "top_ahb", "ahb", "axi" },
>   	.csiphy_res = csiphy_res_2290,
>   	.csid_res = csid_res_2290,
>   	.vfe_res = vfe_res_2290,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
