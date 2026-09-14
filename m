Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD56B3D566E
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383496; cv=none; b=UdxdCFHC1LJBHwUR35S+WL48F8pUIbzXJPq0JTr7qKa1EMAaJO8WNj7AJbNvZvGXQK5paIh7Foe7PbMyBbsFpV9+lhjc0NTDD5xNNC2NQ/lv9WmYD9NxnGZcxLKUe5LMosmpA7xXKRNuqeKIE5SRPjGpRCafM2wAp+QMdqxsiF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383496; c=relaxed/simple;
	bh=+vtA1uDQ+/rG58w7XlemXYJEpmpQZDCeOVCsaAMQmVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgnDEWsh6Rfn9iNng1YdWy1PX6o4Dippj7iKrhDVPhKioUBtlconmGa6LEfKYkzG2yoBjANBojBgBwvYxtAzWmvylFoWFMms6f0npN1B4BITVV01hvEXF/4YzTzpvm6RV3SFc/Id212M6Mb0ww0DWNWzIB7726cWCrhocEkMsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0oYtYy+; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0oYtYy+"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so3384829a12.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789383490; x=1789988290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O13ZSeCTw7+8uyM8SwrGz7R3CfCjWVxwzkvMyVMvohI=;
        b=V0oYtYy+xnY8Vt3TvhPYOux8fOO2H7SkaZb9FuYTXc+wNym33nMi08b4vkoSnAX79W
         g7cLYakYMozupVJBvAgffDfYhSBM+PmDbqAX8UM8dfKwc8cLobPjynOPQD1t+DPu00Fz
         d4k+Pua2ErYuDagu6RhqATgHsQMrkWSrqGLMBi3tHinOFwxfDPHqHjpJSoVeAact42Gi
         z4hQJaCXFM6ONVWUuqUDMexqE64w/r63VKR5hjpaBvs69+g1OHRjCTQSzN68bkQ+3mRb
         t4qrOM8EWDPg7/aPaICOpHzHVfAhUC0JDb3WibFoVcWuznks/U6zjjF+DJMr/QbOdATf
         r4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383490; x=1789988290;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O13ZSeCTw7+8uyM8SwrGz7R3CfCjWVxwzkvMyVMvohI=;
        b=p2h/tIhahxS2jx3pn4QndNF+S/igV1ft4/pQ7Ttjzix2kTudY9hOk0ePOXcObvz0Hh
         oNIHcrQBHrl6+cfezMKHsiQKogibuWZSosI9AtamTRNxOC7xkUqsjxOaM4ABApJ43StF
         QzQMOs6/KuIJT96ikuYVflV8uYSYjcu7d2URfor9bGrtc7LMuIiUum9a/R93vyvOiSk8
         jfz6RoOsbMd+55UoyKS+GO4fLhH0UhqN3iqLtgwVeM9G9+sbJlhwO52tTEt6U3e2Ws/0
         H6/w10SF2wyzllsil6j2rCDHQy1s8vc5YHf515usRRII3dzeBvvRGDIt9/Z3J97XTAt0
         2qUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkaaZMlZQWhWZeGqNugNGo75/1pVhL2830mQCUD5/az8VUtbTG8c8+7oTqENboE0tUIhYA23xM4V9DnA==@vger.kernel.org
X-Gm-Message-State: AFuF++k0ce7JD09gNvmgOqug8d7DPSo0AU1i51kktYxRe+kEkQowcwce
	D4N8qQwBM4KJ5qcakUEMaCzdhEDOljAOCX4OWzlCzskT8Mrj1r3YpEeYFETVhhtdYu8=
X-Gm-Gg: AYBFou1VumgMzQ1eTLv3d3FHWV+lJw9zRXVmTSnSP16CzOoADwrOcQ+q2NHF19c5YtX
	7fnizUyCDRUDvGjn6xvouRfR1gaJAw5J4EGOOqoq44kKt7VjgiBnVUheUhE+TAJnrpkpw/x9plz
	j+96x3Nsk0yD3DS+vKB4/ydY1VOSvyq26w5oVqxpz5vWJWOIboiHESIZDR0gWO8ky/pulJcoIoF
	G3V6+24HN57Z5NslSZhEb6JrhKfDNKMyJscCe5PcmAVw5KKfs5FBccGJkTC6MisSMQGs97PAkyt
	k93sLP8EanMLJETR1QgMQ858aQSOwx5V48CbDy+yHn92ILEYpj+UDCY+7Rzl/WltN/XluY3/FNx
	9cp4WiIq+Lt7+p2MKbFPDIgt1glF4y751to19PJwwNLflDyH8KF2mep562qiuoHB6Izgq+/Q7IR
	g7X8R1Wo42uUTNaWNSbX+USpKm23CnrvDqyjhKcQOm8aZ+CbGgRjSfukTypJewd9vGx6cXr0u96
	TuH8rQeVQ==
X-Received: by 2002:a05:6402:428a:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a9f625e94cmr2804901a12.10.1789383490072;
        Mon, 14 Sep 2026 03:58:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5963726sm3888113a12.28.2026.09.14.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:58:09 -0700 (PDT)
Message-ID: <0c5c7e2b-0dba-4098-8a3a-7ba66adaf108@linaro.org>
Date: Mon, 14 Sep 2026 11:58:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
To: david@ixit.cz, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260914-csiphy-sdm845-limits-v2-1-622db5a6ebf0@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260914-csiphy-sdm845-limits-v2-1-622db5a6ebf0@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/09/2026 23:04, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The timer clock has no such relationship to the link rate. Both the 2ph
> and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
> where a faster link makes the settle count smaller, not larger: at
> 269.33 MHz the count converges to 16 as the link rate grows. The vendor
> driver pins the timer to 269.33 MHz for every sensor (it is the highest
> rate in the SDM845 clock plan) and streams this exact link with it.
> 
> Clamp to the highest listed rate instead of failing, the same way the
> unknown-link-rate case is already handled.
> 
> Solves issue on sdm845 that caps the link at ~1.02 GHz,
> so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
> Pixel clock is too high for CSIPHY
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Tested on SHIFT 6MQ with sdm845-next-20260820-9.
> ---
> Changes in v2:
> - Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
> - Fix the check in camss instead: clamp the timer clock to the highest
>    listed rate rather than failing, matching the vendor driver.
> - Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1-d360bf7cd38f@ixit.cz
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..f3d17ea0ab515 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -157,25 +157,23 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   			long round_rate;
>   
>   			camss_add_clock_margin(&min_rate);
>   
>   			for (j = 0; j < clock->nfreqs; j++)
>   				if (min_rate < clock->freq[j])
>   					break;
>   
> -			if (j == clock->nfreqs) {
> -				dev_err(dev,
> -					"Pixel clock is too high for CSIPHY\n");
> -				return -EINVAL;
> -			}
> -
> -			/* if sensor pixel clock is not available */
> -			/* set highest possible CSIPHY clock rate */
> -			if (min_rate == 0)
> +			/*
> +			 * The timer clock is only the reference for the
> +			 * settle count and does not need to track the link
> +			 * rate. Use the highest listed rate when the link is
> +			 * faster than the table covers or unknown.`
> +			 */
> +			if (j == clock->nfreqs || min_rate == 0)
>   				j = clock->nfreqs - 1;
>   
>   			round_rate = clk_round_rate(clock->clk, clock->freq[j]);
>   			if (round_rate < 0) {
>   				dev_err(dev, "clk round rate failed: %ld\n",
>   					round_rate);
>   				return -EINVAL;
>   			}
> 
> ---
> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
> change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
> 
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
