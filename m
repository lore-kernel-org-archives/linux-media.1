Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273473CB2DF
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740616; cv=none; b=lXNQusH9d6BI0HpnYq5BrVrN1BaGVzUE5JORx6RQLkzaHB/+jlQXX9EqhWdKF00vqs6n0xffFcwJUxthgjV938cywUfG3t1/fDq7psnYaTE3+rCf0e8pqg/TYSckSutgJE5roy9mm7HhimVyQLUJ1l7VDo3xQKVJIV1TaoTP57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740616; c=relaxed/simple;
	bh=DJYQqymdXqCqT5qhMewJwHsJPNWyuG7FI40siUka4qw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B/3NyjogRfottm/9cVpHRVMBMh+gQ0Ci37xHMCfDZE8fu/hu9B/OOS7c8ydI7IG1GKFwWQ80+AHuw8zgXfkPwsOe5zhNAoQKFmJ/7HirataE92M3ZHQOcw6rsV668rOBpCn4bFh0uGJCAhiVqwg63GLrYL1a2+Pjd30gL+RgBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnfkuFhE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnfkuFhE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so5924275e9.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789740612; x=1790345412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sFF3r4DRhx7a8tyTsw515wTIKdus61vqFEq2INSsxk=;
        b=BnfkuFhE7yWPccTs+wxLuoEMAkP+i+wciN9fcts+Lfu0XQ599zm0T+aBCcEKj9TgMq
         qXDXx76TBfIJo6eavdCgpPCUR8KBAZ15JXlR1fnYON7gRtHDO9dPtfKxpgQVZl/6QEqt
         0AwL9035Rq56loFtEK0aK0MDFBiFBiOfbUfK9LuCUYeU6vey9Yu/hj6Ykp1MoctcgUrY
         i66z58XtN51uiph9RYAgW+Qzl5yYxWSAKSoFhesfBT/NRmPCru117qRaEHKdvJ8I8EHt
         eVDg8GTJFcHJdKlsODw6Ky9SwwRbbgggnd59fFf7Ll/DZKFZG2RICft4XIRR6v9SLzn3
         cKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740612; x=1790345412;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sFF3r4DRhx7a8tyTsw515wTIKdus61vqFEq2INSsxk=;
        b=Kvt0jGmT0MVuqNEokqxEIe56d2M+Wgch8QC3IUz+hGfrDubwy8LHZye1X7ucOgh8N8
         myPE9bemXdqUujDgYFFRFiXAOx6+YglCyLdw8pZQZyncdaOiyP/snrD0wCt9YFLkjqeX
         xYZJCKPWD9NWWcq+9oi3pUvLJalsmSsIu98DCfyqq62/yZnkxL5z/9O+ejyKfB9/rIJw
         KLxHKAG+moduyFpeG0lQ6/l/d1T7wj69xfxhthbdQ5Y37zRsp9qSnsnzhb2/daIetmQm
         yvaFylNknb7coCOyt9svJpGXSW9zSPC22SFdUT9syMHIuURug+EfDtVez3q5UnGbK0hX
         SGlg==
X-Forwarded-Encrypted: i=1; AKwUvBx3VY78BfOxh/Do1JZeKuTZtZduZn0B9qE2lyiBRe+uLrlMkb5VjhbiDiAGpTx1Iq28YQ+kYW5Yn2Xqaw==@vger.kernel.org
X-Gm-Message-State: AFuF++nCofF2IzNNSXa2hd/Ik9UUOKDfmaX5x9LuOrXXAEY90M3qtaCD
	e8KqgYjdu/8lG+haA2HS2zEo3piA/r9zitvZdE+CQDOBEE70L3WwOZk6neTIFZFXvhM=
X-Gm-Gg: AYBFou1J8s2sg+g/A/CzHp58ZnlzPYUsAWRzumXU7xSKIhDkyJp1ht+IdleVQkulRbw
	fKioe4ezivyT8v/qORLMxdTPDvXCLUm8jcQcll9/7auGQiGw4nYq9xEXaS5Sgvy+ohMudTMaKt+
	8Iq1bt9NCa8/P2AIY8vF8ppjaSrIFmd0MITDddM+lz7C1I8CGaOx0UYgjyr1xFTRhcA91CoVlre
	nrjVCVRiM41xmGzsdW+i7vDIov9lb18H/KbvJEwhf/q/dfL8BTZZr/4YH/BpcXuXyN2zmyhJJM7
	IFFfHmXw0h4mFO25aCekn3VclSdIiUXZ3HRRlVX6NtTMId7QT8T6k7C6k97Tz5muea0LmFPX+tq
	ZGmOoXPwKEBXvDXV9cxnroKl46p/Zvb/wAGVPzJrAbZ/jFOAovG5gruxG5HxxnPAzEbRTcwIZgZ
	ctytJWWVzyOS48/pNBwu1c9E+j11KBMf2+JTyIUXkiV7uN0WFOBvP78cQCgaoyjkWtdv14LXFgH
	qGdaijO62KGSD7m/VZVhuRXk6e96Zi4XLhtr2Pe1g9q/+BScG3HFHA=
X-Received: by 2002:a05:600c:354e:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fc56ef4fcmr31999545e9.15.1789740612196;
        Fri, 18 Sep 2026 07:10:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc? ([2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216028sm158229625e9.7.2026.09.18.07.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:10:11 -0700 (PDT)
Message-ID: <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
Date: Fri, 18 Sep 2026 16:10:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
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
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
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
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 15:56, Bryan O'Donoghue wrote:
> Add new function phy_get_by_of_node() allowing lookup of a phy by
> device_node. Separates existing logic in _of_phy_get() into an internal
> helper method _of_phy_get_with_args() to allow for reuse in new method.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/phy/phy-core.c  | 83 ++++++++++++++++++++++++++++++++++++++-----------
>   include/linux/phy/phy.h |  6 ++++
>   2 files changed, 71 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 89addd732bff3..42c27a2b45159 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>   }
>   EXPORT_SYMBOL_GPL(phy_validate);
>   
> +/**
> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
> + * @args: of_phandle_args to the phy
> + *
> + * Returns: the phy from the provider's of_xlate, -ENODEV if disabled,
> + * -EPROBE_DEFER if the provider is not yet registered.
> + */
> +static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
> +{
> +	struct phy *phy;
> +	struct phy_provider *phy_provider;
> +
> +	lockdep_assert_held(&phy_provider_mutex);
> +
> +	phy_provider = of_phy_provider_lookup(args->np);
> +	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	if (!of_device_is_available(args->np)) {
> +		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
> +		phy = ERR_PTR(-ENODEV);
> +		goto out_put_module;
> +	}
> +
> +	phy = phy_provider->of_xlate(phy_provider->dev, args);
> +
> +out_put_module:
> +	module_put(phy_provider->owner);
> +
> +	return phy;
> +}
> +
>   /**
>    * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>    * @np: device_node for which to get the phy
> @@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
>   static struct phy *_of_phy_get(struct device_node *np, int index)
>   {
>   	int ret;
> -	struct phy_provider *phy_provider;
> -	struct phy *phy = NULL;
> +	struct phy *phy;
>   	struct of_phandle_args args;
>   
>   	lockdep_assert_held(&phy_provider_mutex);
> @@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>   		goto out_put_node;
>   	}
>   
> -	phy_provider = of_phy_provider_lookup(args.np);
> -	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
> -		phy = ERR_PTR(-EPROBE_DEFER);
> -		goto out_put_node;
> -	}
> -
> -	if (!of_device_is_available(args.np)) {
> -		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
> -		phy = ERR_PTR(-ENODEV);
> -		goto out_put_module;
> -	}
> -
> -	phy = phy_provider->of_xlate(phy_provider->dev, &args);
> -
> -out_put_module:
> -	module_put(phy_provider->owner);
> +	phy = _of_phy_get_with_args(&args);
>   
>   out_put_node:
>   	of_node_put(args.np);
> @@ -1001,6 +1017,37 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>   }
>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>   
> +/**
> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
> + * @np: node containing the phy
> + *
> + * Returns: the phy associated with the device node or ERR_PTR.
> + */
> +struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	struct of_phandle_args args = { .np = np, .args_count = 0 };
> +	struct phy *phy;
> +
> +	mutex_lock(&phy_provider_mutex);

I don't really understand the usage of lockdep_assert_held(), but why
does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
like before patch 1 ?

Neil

> +
> +	phy = _of_phy_get_with_args(&args);
> +	if (IS_ERR(phy))
> +		goto out_unlock;
> +
> +	if (!try_module_get(phy->ops->owner)) {
> +		phy = ERR_PTR(-EPROBE_DEFER);
> +		goto out_unlock;
> +	}
> +
> +	get_device(&phy->dev);
> +
> +out_unlock:
> +	mutex_unlock(&phy_provider_mutex);
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> +
>   /**
>    * phy_create() - create a new phy
>    * @dev: device that is creating the new phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288ae..71c2e16397130 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
>   				     const char *con_id);
>   struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>   				     int index);
> +struct phy *phy_get_by_of_node(struct device_node *np);
>   void of_phy_put(struct phy *phy);
>   void phy_put(struct device *dev, struct phy *phy);
>   void devm_phy_put(struct device *dev, struct phy *phy);
> @@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
>   	return ERR_PTR(-ENOSYS);
>   }
>   
> +static inline struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	return ERR_PTR(-ENOSYS);
> +}
> +
>   static inline void of_phy_put(struct phy *phy)
>   {
>   }
> 

