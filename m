Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002E4FECE1
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648338; cv=none; b=C9sBZj8qB2YOCqTyeAxU7H4RFbCX1dH+ZIpjSkXT8pUceykguAi//+gIDg8z9YJ7pqG1UBR5Peux1Vld+YalrfIbcdQnRQFhlSfk3zjOxKWJYIv4c0EXzbCwtXWZ+oNP/v4QlVcoKelLg+fWOeEdjUpQvojChWlRuR52elVWgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648338; c=relaxed/simple;
	bh=3w1QO9RRjV2P//77/vuGY3t+8liMQZidimN+GXQ/Shw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ke7n7ZjBKl1ThpGZBwAnK8Ucq3hJz50KGnn/2P/xFJEz73FSvu6J6tlWTJbpLXhCslKm0uFVwN3u1oEjULoxQjIUF694NJvVG6Qc39CeJjdm9OUF59uQiHPWvbC+kSLHcU7osIbySZ3uMe/ixcFv7pRaNw7z7WkHkQdCjKg7Ag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/fiuBNL; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/fiuBNL"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1368990a12.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789648323; x=1790253123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ls/PIdXgwRaJNqkytOniziANCA/o27n7uKp1MTR7az8=;
        b=e/fiuBNLG4E9oZeVsqDRZUNO6JWwxgCRIyimmkUghYQJnr2LhxsdxwaEvvpCdtStT9
         u0Cz2Xeowdpk7x0SKOZbSgxmJN46MGJE+ZFeQA4S0wBM2uZZOay4bh6EJXPcol3DYd18
         3R5++iHttO7Zp/N0uoYJpa1OgoCbiUlY910aXYyOd9O+/k2FigozCEmn99+I4rxW16Pm
         5jJb2ROGGdfsyeOU0SbAxG1m5vwxLm5/2LltsV+9RpfJ0C0ZHu8hdflC1XRtfZsm4NDl
         FSGDOB+UXLIQ9DORzJDy5aF0EkLB7fkm27qqdP9LAku2yBqxmD0HhyPYTiLjfpMu831F
         vkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648323; x=1790253123;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ls/PIdXgwRaJNqkytOniziANCA/o27n7uKp1MTR7az8=;
        b=Wh3GLpF0CMj7xDKF1mIbIcpGR/g8Hupp/Sv33sN6wc3cy8VKNi7G/zI+H/RPEKzR5S
         IEe0dcbw7FHKl7W0fTQHFIrwGR3BqfaeMlDUkNTLDeXDWIPuyMFyLhMdV5UKHl3RmZgP
         8yGPkZOu7j+qSgqH+0h7Nvf5iakH6X2afv0qglM8rb+5n0rBzjxEHvm1H2GbCzCKj9Vv
         SEtu9dBPpYEKHHV5Zs+qpilMtqwF/03IS+zc7Q3OlH0kpZWH5IUaJu/x7iGlh9XtOqbW
         UA120VlZWoQs7TBf2X1zYwM7wvH37OHNyvN3Q6mvkWZDFNCu398gZqvVMSxbcD7940vW
         Cj8A==
X-Forwarded-Encrypted: i=1; AKwUvByLQ7ZaYrDDlx4Dc2u2Hj/UhWAyvpHjjKg/TdWlRb7l1fUTESJQFVIPPCY5YwyUD4QyKWqEFjMVOnwoIg==@vger.kernel.org
X-Gm-Message-State: AFuF++mJAcTmt4jjuol3JCsL7DFvtBTlM0X9y8svzH9rrhPNlcfevn3P
	rf/doDFDMIjXCr1eL4AeorfzTIIx4xATvcJKowom7e0T2w4IzNvdSiRxoyGNi1Y2KAk=
X-Gm-Gg: AYBFou15nJcVjcbfh/Z/V6CdFah5b9olUqBIo8aDGY+GTDqKMs+jOBlHMe0u1ILu18q
	28nFa0EnXCJImKBrVLl3obNTbPmJxykU1KE3LvaBVEAyU7hbJlq9oP2tYKSrfo1gHn1QsdfYWSF
	Ey/NPVn0jb4K6QGIw1BcOYpGiC4jLNHxh+jMHrUFHLBytQry+WKFqzFniWmfFbLt9kqgHJrPI/N
	fQ8aFlBQuAwEhYcmPZkriVxPRGw/qjXryDfd2wMAy1050UcU1ERfq0FlldNmWihQ3//6j77FLx2
	d9HHuLHTqOnKgCZCvbxGQUhdcEIj5bqKPbDbfer3GgeH4gGpI0/RS+r+JMYUfyDiVq51GjcDoOn
	im/myGUeF0Aq3aTbTn+v779DLh379/p5IhXgvt9Fr2dNDymYhd8m5t9ReXx+XejnrQORwDJvm6+
	MDFvgfaz0e25/Jn8Nz/S+wPS+KaihO8sNDRkGEyTzLGK+EpCTyMTUa0UoNNIQxatTEfYtUU1MNt
	bCkuc3ABpg=
X-Received: by 2002:a05:6402:3242:b0:6a7:f25b:d281 with SMTP id 4fb4d7f45d1cf-6aa22383344mr3922846a12.13.1789648323558;
        Thu, 17 Sep 2026 05:32:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2ab4ebsm3576964a12.30.2026.09.17.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:03 -0700 (PDT)
Message-ID: <8bed3f8f-52dd-4ab7-9ce2-cc756724893d@linaro.org>
Date: Thu, 17 Sep 2026 13:32:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/5] phy: core: Add phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
 <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <a06040ea-4af1-4083-9b69-7f62be7c9bce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:29, Neil Armstrong wrote:
>>   /**
>>    * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>>    * @np: device_node for which to get the phy
>>    * @index: the index of the phy
>>    *
>> - * Returns the phy associated with the given phandle value,
>> - * after getting a refcount to it or -ENODEV if there is no such phy or
>> - * -EPROBE_DEFER if there is a phandle to the phy, but the device is
>> - * not yet loaded. This function uses of_xlate call back function 
>> provided
>> - * while registering the phy_provider to find the phy instance.
>> + * Returns the phy associated with the given phandle value after getting
>> + * a refcount to it; -ENODEV if there is no such phy or the phy is
>> + * disabled; -EPROBE_DEFER if the phy provider is not yet available.
>>    */
> 
> Why changing the comment here ? You're not supposed to changes the 
> _of_phy_get() behaviour.

I have no real memory of that change probably seemd like a good idea at 
the time.

Will drop

---
bod
