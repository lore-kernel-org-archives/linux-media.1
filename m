Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C043BFAF7
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458280; cv=none; b=UNLDxSlorY1Pl06LwMHqy7OWV2w8UMRyLMunWdfsAsVjFHOepeKEaXRYYbqJXRgjxif9Jk8RbfzOExzbKFPyxRIjvIaW8shcZ9vqAiiQTm15dCdvkA35wP7B4e6B7uS5Fgkn7imCddYEJniIelFLJpKdyn/gbVhjuRUsUMpE9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458280; c=relaxed/simple;
	bh=LyMzg7YKQMASVJG4mwz+gptKLgC1GDcEvOr8VsXAlMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwCUEUUEl7k99bdRpWhRHqRA1P4a5a66n+oO7T8I+8K1oUaFlqpTiHTq28KuvFEeI4JcILWU07fxvXGIOwCQ3qLaEQMjU/FRy0u26Xt0uuunoXkAz6Nm0GYL0ydWo96AHkKOx3JyKBBVn5OhR6E1vJAMxWe8Z8vkrcKRn0OfV7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCKgXlJ/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCKgXlJ/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so8673596a12.0
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791458277; x=1792063077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1iIMM2/9oEWCDjb7vfvvfhGUocGkO9gnJc0I/wSGwI=;
        b=rCKgXlJ/4s3YM+4dh41VHIpn4tDK2Nz+zJCpgLf8hfnvIa3kl3JA51EV9MS1rEAISV
         6/7SkhYZTOwXpGDQeKYLPKb0sslyDDyB/ldJMuEES4u3sy6Y4jdBWysi8WSxn86Nwa5Z
         wd32hOYw+8/ykbW3drOg8fyghxwQQ/cprs5hASu4jOTAl1txaVzWijvKKliJGb4dqAAH
         VE6nBEZ5uOrK5fvTdkqfK5ZRUwrsFigQ77/k8upYi+qrv4jt9IPYN/HO8J6/ymIbCyat
         VsTklbo3nIaruwPAL/XQLLQ5c0iO/u3JV4zEI/Z0lS5JrbR4oQBQnKVAH5ZVOX6/Y56a
         TphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458277; x=1792063077;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1iIMM2/9oEWCDjb7vfvvfhGUocGkO9gnJc0I/wSGwI=;
        b=BSldaVSnJMddXuIEkdNg3VDy1n71GuegaXDnE5DFJvNtWJ92FhhK1gcUzVDkttJCgb
         M4I9GE41MU4OjToejXtbFUjopUz3Ea2mclWT/cQwMFMHSlp6c+b+Edvhn0iFjIf59H19
         g2YOy0YXoSzhy9/LiP8Nll4+5jYNdGH7vu+3rwr4bb8xRfTwQOfIuyCqbT30UuU6YSk/
         VhmRScQ7wUac/btq1WoRb8YSreJbIyHX0Mtisgir5zATSUgJn56B8kRi1tRowOahJyCP
         Y7W2Ih767IyHkSsnHE4YnXWjkrNSLY6ud1SIOGU29AmCdcUospOO1q2eJVouExl6M54p
         TH4Q==
X-Gm-Message-State: AFuF++kmb1ZqEWmpdmbgxL/jF6L9OpazOl+KXx874y8EsuhEdGbXFD49
	3WZrjzAG9VU7u3C6Rg2oqoo2GYDfRjMU6inGPPN8ZCY4aBteKxRrDytXd0i9DSB2B80=
X-Gm-Gg: AYBFou10GkqZZMuwejJ/0037byahmH5iTTq9PDYsWvkQSnveUYSklrHVtL7cYczJCbo
	8LdGbSXWBaNokQyZE/ddR0tUxOerH2moUcwRcUoXJoX3ao51Qfl9LWNaO7ZlcoI6RDOoCP8PSwe
	JKPF8Dq19vs9NgwifkmJMynIpnqkVZDiY+zoYWyUxx2RamkGO99r45kjsbUgpiM1Y48zykFK3u8
	bpWRfvoJQAUNEcet4hw+0r0LWHsn0aQIQQIm2AhF/hp3m0vpvJ6sB29LxGhgspq5dZBwXlLivLr
	Lp+JEXKn2Wo7097+pYJTqUuApIxHAVOPTY57m2Y4yll600nMXJTYMDzds4Ia6nWmIxKVvHqxjEa
	pZ7JqV/0ziKXvdUugN9ZJrW8Wq0KYIrI5pnRJ/NueVqSRj/1aFj7PmUMTO6J7xFXAGGcukSFZnP
	oh7ODmOuRzTVVftRCXuPiQVGkfdAygA+j9EuqiOxv7oNq71JGTkiMN7HqfFfa3Pf9xZ8EtH4v08
	aqbSEorCZITU7dhkpPzHyk=
X-Received: by 2002:a17:907:a713:b0:c2e:2b49:e596 with SMTP id a640c23a62f3a-c317bb6f8e9mr504049366b.1.1791458276716;
        Thu, 08 Oct 2026 04:17:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317bdb2a24sm205664666b.2.2026.10.08.04.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:17:56 -0700 (PDT)
Message-ID: <0d1c5d19-68f8-4d44-9efd-f7d1aeaa7b32@linaro.org>
Date: Thu, 8 Oct 2026 12:17:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/74] media: qcom: camss: vfe: Define output based VFE
 controls
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
 <307f12f9-8805-4b3c-92d7-422d994fdeff@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <307f12f9-8805-4b3c-92d7-422d994fdeff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/10/2026 06:55, Gjorgji Rosikopulos (Consultant) wrote:
>> +
>> +	/* Output based API - new and shiny */
>> +	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
>> +	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
>> +	void (*vfe_output_buf_done)(struct vfe_device *vfe, struct vfe_output *output);
>> +	void (*vfe_output_update)(struct vfe_device *vfe, struct vfe_output *output,
>> +				  struct camss_buffer *buf);
>> +
> This also deserves good commit message, this is exact copy of the other RDI API with other arguments 🙂 Shall we migrate
> all existing drivers to this api in respect to use other deprecated API but having both of them leave in vfe file which
> creates even more confusion and readability of the code?

Ah but that's the point.

You add in a parallel API which is 1:1 but which can be extended to 
describe completion groups not WM indexes.

WM indexes have always been wrong - limited to RDI and we have all sorts 
of spaghetti code to work around that indexing mismatch.

The fix is to stop doing that so yes, implement output / bus-client / 
completion group - with wm and planes described in the output layer and 
then move everything to that new interface.

Including new submissions. The only real barrier is finding old 
hardware, making the changes and ensuring nothing breaks.

Since there's no DT dependency its "just software" - easy.

---
bod
