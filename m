Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C644486437
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399693; cv=none; b=FXvDGia++aqNyYki13AEWtHpUNDfA1X7TXD78JTOm4lqsMVAR/VHaabOWTv6ylkSe/54rW1kbGyUNkvvDkamXqRl3FQZZk8eq8A1fM7ZZ2V0ZyOM9t6oTcXPdIyT3cQ6NxWKuwwY8NuADCW7ogQfnkFEDzyi2ep1/wkfcaihJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399693; c=relaxed/simple;
	bh=+d8Oj3p5oshm7ntJAldurnbE3ACbEUbHyyX2UN8meL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrZCfYm8ry0flD6NsQypb5u3J3O1uw4z8rFl/YHhi4xN3sGTiEb5nieSHRuHWgGbwNao/o1yFsZuSQJ5KfEsE8B9X1sh98WKuYonOnCe0KaAkGvS7huHkg/xgvZgfPO+MEsrHrf1aM4+YlPLgc6xcS0YI/ie+fVvH5JCQ2t7F54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyA6XXU2; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyA6XXU2"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9c4c3e3b2so2692933a12.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789399689; x=1790004489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=usjdH/oMD5uW30baonZ+kYj9XHMcowahynwuwBsx2ZI=;
        b=cyA6XXU2lxEEeFV1cGdspGqGbWMpXYqJtOj2OS0zzPVSmMYEtTfaLRU+RJTlU8n1pd
         HT+tYzvgXjKOR8vslqKQHAosefSNW+XS2GOh3m9EE18HNBjLutdstpDz+CCADPN8haUP
         7sOPLenLrLmjVpQ8mtGZz94PoVYQvYdZy8bKJKvVc1uQdwb51GPHZokh5x70iTD0X+QX
         CFQKTI2YTErparUiSIGFP4b3mMuM6wGRxK5dgqICuW2d+53R2wS9gcX8RLb/SxkTHZ/j
         GAenF3API9Nimiz9zGf0GVuszfatSsZa58b5QziB0wTXT7lf+kwKOT+CWkdlNKmjAgIa
         4pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399689; x=1790004489;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usjdH/oMD5uW30baonZ+kYj9XHMcowahynwuwBsx2ZI=;
        b=aPOICFA+zkHwZkbqeaQ7LLBy12Fso3z2KA9RAm8bM0wjBaWBqCkbQGVQOfqxl68RgI
         toR7H+2aYqYcbN1iq9JlYNuJ/NtuNnUjC4Lzq3VWsdwOg0YA3qCCiChhwBTqW/OOkDFB
         /MqYxZuPdgiDHDtk42pdyVlWywy7c15SVuNCSH0xjDWYfXA7hPcHE1jhmGv7hXbfZ+WT
         9TtPrO4otvH3MfB4O2hc10QVpea9Qlr3RiZKHeaBqpjDKZnB/EiKvZSUJz6K5MVbyEYc
         2H1qMarisJtn8ZkDDjHBdssuiwDeoG7T0rYbKtCCpw67Xg+sHYShsZk8g3o9rut4klJO
         m2pw==
X-Forwarded-Encrypted: i=1; AKwUvByIqkPCXwsYV2UwaF7ly8tbJ3iShG7Ub1ZeBjrfIdMD4ZzmtYJvBGS8wk1xoloEGQmh9dhqi+aPgvYUlg==@vger.kernel.org
X-Gm-Message-State: AFuF++l8jc2FZSd+ftNQpsBw3fIyLUj0aVEHyjPeDTo0IDq7Ybz+QzYq
	1sPBmWFYZnbSZ6uqvrP9nkqZ1vcyW+4Gn3bqcxVldTrbfi4nRLcuUvm5326pivNFgSw=
X-Gm-Gg: AYBFou3QPwOEhzS3+hBiJAM9Wj7p+iK1ikl9u8F6L6cb8fTrzjyxDIUKsKTzSlpglnw
	EJm38E3PGNNbHbRfURP6LshIYpjFDdaOc6N1/eQ6qkbtJ+F+PVJVH757AWpbdfOCClJPLbpblfP
	uF21m0Nu9tL6foxJIpR3qgrEz092xfH+ikNi7xpxhGmULAb9rHHJ09YQqpirLBBjz/pyzj+6b2W
	YgqLg/JCFX/6bv9Baa8LI6S5fY7s8uEknYu5O61x1IK3svwoLpTueqgRvVyHGxZu4qmALEnoqF0
	/tsj/xDv0eiLHQzPSDYdkpwhL9m2j8NckifrmK7DgX03wxHHeA280FNIl+f3Ry4HIOtPOdKTAdC
	KwvjiPjztMJG5rmkEhVbBs7fsWzUHAOid0XKje+fbl3B8a+76YRjzAKGO53dpAv8zJCxgtuXx3W
	heVhkkaY6w5Jxz+8eo3Dhko3zBD9e7XZ+Y2P3jQpFp0hpyp7sJRljzCRL+JfGlN3hK1QW6apxeT
	G8VrM2yx2c=
X-Received: by 2002:a05:6402:4286:b0:6a5:f4f4:5c10 with SMTP id 4fb4d7f45d1cf-6a9f61e4e94mr4922390a12.3.1789399689224;
        Mon, 14 Sep 2026 08:28:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5920f4asm4385120a12.16.2026.09.14.08.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:28:08 -0700 (PDT)
Message-ID: <01fd3d46-2588-4d54-a131-ffe8d16e5dc1@linaro.org>
Date: Mon, 14 Sep 2026 16:28:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: qcom: camss: vfe: only reset the VFE when its
 last line stops
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-6-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-6-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> vfe_disable_output() stops the write masters of the line being
> disabled and then issues a global VFE reset. The reset is not scoped
> to the line: it resets the whole block.
> 
> Several lines of one VFE stream at the same time when a CSID
> demultiplexes virtual channels to different RDIs, e.g. two GMSL
> cameras aggregated by a MAX9296A onto one CSI-2 port, each on its

You can drop references to a particular part - all aggregators would do 
this.

> own VC and RDI. Stopping one of them then resets the VFE underneath
> the other: its in-flight buffers are never completed, its write
> master configuration is gone and the block is left in a state where
> the next reset is not acknowledged, which surfaces as

"Stopping one of the streams/VFEs/RDIs" - basically we haven't defined 
what the "it" in this paragraph is "its write master configuration is gone"

What it ? Define the object instead of assuming the reader knows what is 
meant by it.

IT: a spider that lives in the sewers of Derry Maine.. [1]

>    VFE reset timeout
> 
> when the remaining camera is stopped or restarted.
> 
> Only issue the reset when the line being disabled is the last one
> streaming on this VFE, as tracked by vfe->stream_count. Stopping the
> line's write masters is sufficient to quiesce it while other lines
> keep running. The single-line case resets exactly as before.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 319d19158..9cdf26671 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
>   	struct vfe_output *output = &line->output;
>   	unsigned long flags;
>   	unsigned int i;
> +	bool last;
>   
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   	for (i = 0; i < output->wm_num; i++)
> @@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
>   	output->gen2.active_num = 0;
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   
> +	mutex_lock(&vfe->stream_lock);
> +	last = vfe->stream_count == 1;
> +	mutex_unlock(&vfe->stream_lock);
> +
> +	if (!last)
> +		return 0;
> +
>   	return vfe_reset(vfe);
>   }
>   

Other than the rambling commit log - looks like a valid Fix to me.

Again

- Fixes tag
- Fixes to first
- Fix in the patch title name

[1] We all float down here.
