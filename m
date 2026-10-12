Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD837AA96
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812847; cv=none; b=rQrRpFzdxvdMqKhLedlBuGw5H0D2FePscJWxjALXbwY8KD8vJyd7HSiGJDAx9Vo8hrRE7S2xg6SGf7mDfEHyhHM95N33AQB/e5UpQpkQ4AnXKj8msqMuV7H8o9G0EAcRi+dm2Ql1aatlUfN2KkRM6ZjpSpdTZSi2SmHdoY7JyH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812847; c=relaxed/simple;
	bh=mvoMyMEF23qiE7YbRO+z3EFZlH5bVE9dBQLlox9zVQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPN/NXocxDKt/4nSc/80QSNk75BDwH8KQKOMYrFA5eUXh76Z1tyzueTMqla30AcUbtCV8QIIr8urVaUfzkUlXqq6LqhAjcb4UU4lE0MNqyvmmwUQd0qCYp6NrSvmCidWq9HBtITwt/Me42tgYo7jsojwnulMRarQc7Ii6zqLoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXJK4xXy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXJK4xXy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso576764a12.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812844; x=1792417644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDpmXyGOWYzIAfqCmBiCkL6X89MoKxiD5dfOJNrnyDY=;
        b=TXJK4xXyKL7Z0gzdB/vtTB92XHZWI2Uz19d3O20VRCVjGux+32YW9jqNhDWN/LWmCe
         jMInVfAdf/YVMUp+iqg2HAf9fMWlEvK4aqeMq1nNx3f9hgWksXbBUZfh7pEdkhga1wH+
         Cb7VunNJ1+XXn+Yf0Z2qUy3S99fbeF8jjOu5/gZNRcvp0Usrtrq6Ji4u/wlbIlCB3CGJ
         r1acUFcyEAzJ0eaWo7R0/C05aq2TEFEEEcWg7lUgRtHkOrl2zdqZ4haxBPNYB6/+PXBQ
         57HjBM/w4/fb0SRzkYFv1KiDS/iJC8k/9SQBVfYkW4AUBu6rktSZtDujCjvZA31EOz8A
         6sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812844; x=1792417644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDpmXyGOWYzIAfqCmBiCkL6X89MoKxiD5dfOJNrnyDY=;
        b=KYEfqSTP2P6xck4++PI2gU9K1y783AhLlSA3jAjvF+0T/syyHlJ1XByrepvLdgoGF9
         KvB+ItZYVYFngT0Wmi6an2xAEOvkE7NqvLHB3RaAKiYzI6Vo2Yld+nfLjJRU4aDtxEXC
         rBPdN5w1ZzZcSRYZS5KWOtDWkE19v1eQn5C/zHGBh+i4FhI10KcP4BDJGybf7DqacibJ
         KPAOg5Tsx2sr2stC03PGecBcW0J7HJ2x/WWFyU9K6IMJj9PecQ930TCN/jSobpLQA/64
         adz9WH/w74wickFCxmBXKLu1FTg6NfoLf+JTic5RKzMe02ZQiPDoJV38eJpwJcXtyMIK
         Ec3w==
X-Forwarded-Encrypted: i=1; AKwUvBySfx/KnxBRHB7XNr2PtXUJicxC/XCYACUBYnw/NpOG46WAFYaDdxMWa+6+oOXKtfr+P2Sws8P+xS3How==@vger.kernel.org
X-Gm-Message-State: AFq9FYK9HxdCEOfAthp5E0KLgs+Km9GKXHmnjWVh/sDai0Z50WvyvK0l
	NvIOeQuRpQiP4sCBus7/htV/tl2yoXp9CnFHxhXHr7yibj13Y8SQX4ngOVY8m8NhxvQ=
X-Gm-Gg: AYBFou28rK0/ZdsN/B9v7Yr91FA3ur3lwHu4H7GO3pxUkg9RCw3mf3f7eFrgasXg/ko
	Lv+CSDZU2/hQkoRCFIZU+kh+GzmnBOoziY159LZC5c+s4kK9dUhTVr1y7HpDEtukj11cWo4ROAJ
	oC99T2VKdx3KD0O/4SMi0P3FE+pU6KsEXqkD+G1q2wCOi/8fNSwIy42aL3iv1uwldCzxmhm/NY0
	DKZtKDZM5gYKLGcVoaJ1w9cOEPPQBpTVQKukmCiXV18XC+YeOZEwXntI6btlE6lNmJ1HM/UK4Gk
	dnCnzBSROy8MdXmh6ALvYxV/rfCHDlqOa0d1xW0lMlpmE/17K15xB4bEfXVU1Rb8Ca8afqDm5dU
	zp66aCY2l2WFsgJyR731dgO04vtYHgz/8cuZMqjymRJgSlh7MGKyf8alUKXeuFps6y6oV0DF0IV
	MN3GIGfNEXG5IYUQhntI8FXistPgAeRQ3iF+u0hOcD3zUl/UL55tBMCZtB8E0qugAb+OYiUXYqk
	aBnNpEmiUcE+vxIJarQDA==
X-Received: by 2002:a05:6402:c4ce:20b0:6b1:dd07:8e64 with SMTP id 4fb4d7f45d1cf-6b1dd079bd0mr624426a12.5.1791812843956;
        Mon, 12 Oct 2026 06:47:23 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm1350124a12.27.2026.10.12.06.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:47:22 -0700 (PDT)
Message-ID: <66eaf57e-9023-45ea-9c21-737304f6d1e7@linaro.org>
Date: Mon, 12 Oct 2026 14:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: qcom: camss: csid: Match the current
 set_fmt pad op signature
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, atanas.filipov@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
 <20261012120542.1140157-2-hitesh@ebytelogic.com>
 <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2026 14:46, Bryan O'Donoghue wrote:
> On 12/10/2026 13:05, Hitesh Patel wrote:
>> v4l2_subdev_pad_ops::set_fmt gained a
>> const struct v4l2_subdev_client_info * parameter, so
>> csid_streams_set_format() no longer matches the op it is assigned to
>> and the driver fails to build with -Werror=incompatible-pointer-types.
>>
>> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/ 
>> media/platform/qcom/camss/camss-csid.c
>> index 2559ebe98..991275398 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct 
>> v4l2_subdev *sd,
>>    * Return -EINVAL or zero on success
>>    */
>>   static int csid_streams_set_format(struct v4l2_subdev *sd,
>> +                   const struct v4l2_subdev_client_info *ci,
>>                      struct v4l2_subdev_state *sd_state,
>>                      struct v4l2_subdev_format *fmt)
>>   {
> 
> Please add an appropriate Fixes: tag and Cc: stable@vger.kernel.org
> 
> ---
> bod

Ah my mistake, this is a patch for Gjorgji's streams series.

---
bod
