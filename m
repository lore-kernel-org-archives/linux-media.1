Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF953A4F58
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740671; cv=none; b=BHVslatIrqd0R2mU3v9Q68dP5ZgjxPDoHHu43BTiCBqJFW6nivNDcTXmT3aWUp2/Ymv5MnwYSAhJ0pTuok9E4gzHl1EdGDlcX5zW1HXoFeIYgYzU7qKD5fEgEsjN8V+Hbn2jaQGf1IipqdSm5Hj6HlTAjkxNfbjZs+Ce7tT4llY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740671; c=relaxed/simple;
	bh=7jp4yaIiInNnWCBl1LvyzQPH/L22X9GzBbObkkLEsgw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ngS8O20y3cW9V5VW6b7OVN+uec5RWgcooIShvAz6246ajOqAwlPEhjexJ8ErhPZ6B28Ike85hKFT5in1Mh5J38AspUFl6KgMarUbRbBSmKqdwnJgZZeh33DQm0dLVDqco33Osg+xfROZeLLG3yPkdE+PjlV3NQrEyolyMqOIagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQwFRsW9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQwFRsW9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so5893695e9.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789740667; x=1790345467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZDArOD6oUtLoBClWun8adFJ2+P8oUmKoeUV5u5X2Qo=;
        b=ZQwFRsW9wymANcsV7rsB5KhK43DvyocHyiFu/5ZEWAMKuIrIXUM3HROU4hfWsOrmV1
         iZB62Na57Ch22QpbYaNJCKgcbOZ0sv5KlaxGDZMnhrRJYScsf3RnR9fU7kYDq/ArDdml
         zM4MfPSX2mfrYv86mPiDQ6de+oXOt3FC/EuVZ1FQIXAPEx6FxT0H7zZ/SQj041l1hSFl
         gyTPB0O63K9tN6rjWdeI+/61TDqoLX1VSkVGXgzLT64h+r91/L0Eexlpxj/ZVaybPpWE
         keMpC0EOSVrZzx9HxPRfuO1G9gJ0BwMgJbAm3K3X/fIXS24j6m/ZKJ3bzIcHGGysfjAp
         92lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740667; x=1790345467;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZDArOD6oUtLoBClWun8adFJ2+P8oUmKoeUV5u5X2Qo=;
        b=vED1hMey78kUN1YQXiGX9nwM96NFW3Tqv5lmmJG+gX4EhTnRGk9NH+Olx4S/pQzVSw
         Y8yDF9cnLkNzG+GZROBSxFY5iWaOKV0uWkyMwUIMbeQXSc83kayOdlKE3sIr7AZT2fH8
         Hg7bp5gaPVOIHHJVewNzM4cMx2JZdprAR7VL5JGtyZraOL0HseAfxpP/5LnuuhnjOPEG
         G5q4LJuB0UNQ0qs5sbZXRto827f2jZoYuLJjMX47YCx374xZwdENkHsvaS+FUbFTZuAD
         R2AnJIaJBeRsd13s5S1ZsF2+76RD1ApOCa8VuHt2PTOkyuDcrtso1AyHAGAr1olcMNHP
         nJsA==
X-Forwarded-Encrypted: i=1; AKwUvBxZaHCFVyf8XRyQx30vVhl9kybjyMC3QcycluiCBMAXGx5oFe1kYpdM/feTkOgMyI6IIN1secbuptclFA==@vger.kernel.org
X-Gm-Message-State: AFuF++lk0KGfZLgcpUWIacyZaMXuArpmEcfN+xPqLZSAoaB2qv8/yk2F
	8xLw+t4IcjM4D9lYVqVx7fbOxn06B12GVkp1eGtFUzqD7R59qpUjlBydUXAVuScQTLk=
X-Gm-Gg: AYBFou3LYpsob9m4THkTLBnDIUk+ziGTdgCqaaOj/fLlSjXrrSsFYaH/7SwurSNZ7fL
	HCwtSnxXpoKaPkZMSu+tGpEa0/zBOSN9FUqQM8LeMAW+e2b5L6TstO3JU3cidAw31pJT14Gb8Le
	y0+9y3uUWtGgvzyWxcaP6lZHjHqnoTUJpdLxlohgLCWQpUlpeHexfAwhFhiwpm32ho/GGwzvft8
	a8FIZbHSLZ19OHj2BQKIldfjwZTI5eZW6Sh8CUom+bedD9SsbU/jLbi5TNm0UJ673xbuePsien6
	rhmmu5j44I49Fjiv2CErd7gngTPHR2wEDXqpjmqmeWlp6mk0XJWp4F/17zfP2iLJoR9GNKyQ4jI
	7xHxwC7QDZ3FHAYFYGKbwfXArMNCArN9CmfCsMBfJG9SB/4eHe0mn4g2fOGcHOmC45xyD/zG8gz
	03ruv/W5rs003WfDtpjphj6trsPG/rinVgFjnQGurBG+CklVOgsLzf3d4jXcIPIhychedfjKIRc
	0nUmeplq7CI3L+BhocpSXa1iUG65s3b8566qS1eOuf4YF+Ls33s0VVy2X/8I7ey
X-Received: by 2002:a05:600c:3b04:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fc56aab52mr32285045e9.9.1789740667003;
        Fri, 18 Sep 2026 07:11:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc? ([2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm193508035e9.15.2026.09.18.07.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:11:06 -0700 (PDT)
Message-ID: <e93ea498-d71a-4b1d-8064-42cc465afe57@linaro.org>
Date: Fri, 18 Sep 2026 16:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v20 4/6] phy: core: Add missing kerneldoc colon in two
 locations
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 15:56, Bryan O'Donoghue wrote:
> Correct missing colon after Return in kernel doc.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/phy/phy-core.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index f0d2b50d1c76b..597e6b234f5ef 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -643,7 +643,7 @@ static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
>    * @np: device_node for which to get the phy
>    * @index: the index of the phy
>    *
> - * Returns the phy associated with the given phandle value,
> + * Returns: the phy associated with the given phandle value,
>    * after getting a refcount to it or -ENODEV if there is no such phy or
>    * -EPROBE_DEFER if there is a phandle to the phy, but the device is
>    * not yet loaded. This function uses of_xlate call back function provided
> @@ -681,7 +681,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>    * @np: device_node for which to get the phy
>    * @con_id: name of the phy from device's point of view
>    *
> - * Returns the phy driver, after getting a refcount to it; or
> + * Returns: the phy driver, after getting a refcount to it; or
>    * -ENODEV if there is no such phy. The caller is responsible for
>    * calling of_phy_put() to release that count.
>    */
> @@ -797,7 +797,7 @@ EXPORT_SYMBOL_GPL(of_phy_simple_xlate);
>    * @string: the phy name as given in the dt data or the name of the controller
>    * port for non-dt case
>    *
> - * Returns the phy driver, after getting a refcount to it; or
> + * Returns: the phy driver, after getting a refcount to it; or
>    * -ENODEV if there is no such phy.  The caller is responsible for
>    * calling phy_put() to release that count.
>    */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
