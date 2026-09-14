Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC1390CBA
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413377; cv=none; b=fSzBlZaIGGRIbKp7u46WN+JDxxhyEMI2Jqvc3M9c4n85YNGCNKR7O0MvWKled/3RPNv/0foIa/nDZlEjSsV9Emepj5BbC/Ufxhn3gaEqskMwSM5abzZwJ+e55kwG99x/7nXzu+2KA96DWVQEO1SfO7RgwwjLvx6+Pw7C4tD5xR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413377; c=relaxed/simple;
	bh=ONhMYUvE1AYozDi9rjskj51lOvdoeRzP5ph8TVZxPSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sB3Yl3sl6ChOGBp5YslziDlCxhcrCj40fVhEcQfXAyptNqfOpC09aHLo6o/VXAhMxn5yRegpXP+m/CMubV1ODN3T9P90BayiNNwDKqF2mS/SDkp2TVLzIGobfKyar3XFDQWnK/9IkzDyuUqCfsCFjPzZTGs42LCEC0h3gY/bTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cX9u8qFX; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cX9u8qFX"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso169641366b.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 12:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789413373; x=1790018173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6MtyxxEqlr2T5M/hPkFqK6tirGQWgQ6HId4VdLZRKM=;
        b=cX9u8qFXYhsEWGdimKxyDNjjbjRxWsrc2w5QNXPYOM9Qy7YDF5eEuely871k3EHcgC
         RKWnwzc0+A55M+vN8AEytSYgNmQgYz7cLc4waIpHVi6ZupRw6o9qpC4tbQEgrLmxNmFZ
         NuwDRJ+0i4k2a2Vx3KNyc4pNejWikhQBtX5+9sRlFpa8swUj31ptIcRe3cZsVf6PhRqN
         /kD7zLjqeLs/gJJ397XXcpiMnBaITn7M+PQ964HPIQPXycFDRuNyF7zGYo3s0YixWfDs
         yz8h5n7Tmek22+JAcrv5TJGcV6gfV6SzD7wHi4YKMnTxhwuxZsxhTp6pAgDvElNl7C55
         kLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413373; x=1790018173;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6MtyxxEqlr2T5M/hPkFqK6tirGQWgQ6HId4VdLZRKM=;
        b=a1z7u7DHUkpfTl/wNrfJ6pNGK4uxsmrSOAXzIdM5bbUhrsmPqfJbliVpmUO4MCl8bV
         r2bAkJetycbGUABBjgJvT6TIjxeScmIZXbTKe+CIsVde6sTgWXBxU2jiw9Oibp0wj1MW
         p+ouDlz/sq/KxdNVwT1XnWMzxBsVrgxF/++t0pyo7lUUi6+XwfOJG3Mlw090O8is+ECp
         8Y42iZbjZ0Rn0oQNUZRwX+gLFJTjUSQppweNHdXo0KWWFCd3LGCvkWGV8V8BnzzJ4sv0
         lz5h8iZnsjpbmZcIwGeVQtIOA6IqCaX7V3xwjAXYaxd9RwhwiUWsK6dimIe/cx5zTJFb
         v2mQ==
X-Gm-Message-State: AFuF++khdwK3yWXCsIECGXOOkpD2DizI6O2v17Yytu20/ShHEpOXUV+A
	6Xp0amGcW9LDzR7AtE3qBpLmIeVLDxzqUVyGBjIKdYGaTeXSgVGbmN1xRBd1RFKeFcU=
X-Gm-Gg: AYBFou3t4W0PhkvmPkef89MnyzY7oqsS4mWRFLhyJpXRVCJUFfWEX3z4g8J6k1Yde4f
	YMJHvcPMVppDYbOmYECwDvIS43wnOPFxfKnBe36dGV/GhHvkg6+3bsa9e/tyLZvDlRMS90dwsb1
	iziSoSY4Wz3fK1yR11JrIo+lrLkvVo+YNSJUPAbdMTug+MTBhLf+LctBaZuT7wtdVjZaGZ+NqVb
	dBphB9lZ92/LdIiA0TekvI+XHme6y5B03Mpm46kEV5+F/zy7rP6a5MzRFzNq9LbD5uDoUrdSMi+
	1yiyAfUREwcSvkO/7/CwjpbOPRPGvyPPK9DS2y3Q0RfPV3++kXdYoeO/oP0Ux4k7rybJ8putUhB
	t/L5+61YkrDnx9f0zmalD8T7uaMM8p2Cdc2c/RpaJ0ArY9GmQinMnF2hgDDuoOCAtXunVREJYDx
	bMJs0lz/PjoYxUfWxaaTt2XK+1UuKElU4S761oeWBvKi3ZCqgIrgcISqSfUHiy2q+lhu9SiauCA
	TqZEn7szyk=
X-Received: by 2002:a17:907:c16:b0:c08:580e:899a with SMTP id a640c23a62f3a-c29c89cfb88mr58253066b.10.1789413373242;
        Mon, 14 Sep 2026 12:16:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296601f4ccsm470075666b.20.2026.09.14.12.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:16:12 -0700 (PDT)
Message-ID: <f33eacd5-2770-4f9d-817a-9b21a8b5330e@linaro.org>
Date: Mon, 14 Sep 2026 20:16:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: qcom: camss: drive streams-aware transmitters
 through the streams API
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-8-hitesh@ebytelogic.com>
 <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 16:57, Loic Poulain wrote:
>> Subdevs without the flag keep using video.s_stream exactly as
>> before.
>>
>> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> I would like to point out that Gjorgji has recently posted a CAMSS
> stream API series [1]. Would that series address your use case, or are
> there requirements that it does not cover? It would be good to
> understand whether there is an opportunity for a common solution.
> 
> [1]https://lore.kernel.org/all/20260911062213.195007-1- 
> gjorgji.rosikopulos@oss.qualcomm.com/

There's a fair difference in the volume of the code in both cases too.

---
bod
